require 'json'
require_relative '../compiler/definitional_tree.rb'
require_relative '../compiler/curry_module.rb'
require_relative '../compiler/utilities.rb'

# order of ruby code in DSL
# 1. Declare constructors
# 2. Declare operations
# 3. Declare variables
# 4. Define expression helpers (i.e make_<name> functions)
# 5. Definitional tree
# 6. Define curry module and program


# JSON -> object code approach

# symbol table data structure
# Key : name of symbol
# Value : attributes like symbol type, arity
$symbol_table = {}
$symbol_table["choice"] = {sym_type: "Choice"}
# operation table data structure
# Key : name of operation
# Value : array of Rule objects
$operation_rules = {}

class Rule
	attr_accessor :lhs, :rhs

	def initialize(lhs,rhs)
		@lhs = lhs
		@rhs = rhs
	end

	def show
		return lhs.show + "->" + rhs.show + "\n"
	end

end


# module to convert a string into an Expression
module ExprParser

  # TODO: Extend to parse expression with a "where" clause.

  # Take a string s.
  # Return an expression of which s is a representation.

  def ExprParser.compile(s)
    s.strip!
    v, l = root(s)
    printf("Warning, unparsed \"%s\" \n", l) if l != ""
    return v
  end

  # Return the internal representation of an expression
  # and the string that remains to be parsed
  def ExprParser.root(s)
    case s
    when /^(\d+)(.*)/
      # A number is a 0-ary function application (for replacement)
      return Box.new(Application.new($1.to_i, [])), $2
    when /(^[A-Za-z]\w*|\?|\+|\*|\-|\/)(.*)/
      arg, rest = parseArg($2)
      # if $1 == "choice"
      # 	puts arg[0].show, arg[1].show, rest
      # end
      symbol_attributes = $symbol_table[$1]

      case symbol_attributes[:sym_type]
      when "Constructor"
      	c = Constructor.new($1,symbol_attributes[:arity])
      	c.token_value = symbol_attributes[:token] 
      	return Box.new(Application.new(c, arg)), rest
      when "Operation"
      	o = Operation.new($1,symbol_attributes[:arity],nil)
      	return Box.new(Application.new(o, arg)), rest
      when "Variable"
      	return make_variable($1,symbol_attributes[:data_type]), rest
      when "Choice"
      	ch = Choice.new
      	return Box.new(Application.new(ch, arg)), rest
      else
      	throw Exception.exception("Invalid symbol") 	
      end
     
    else
      throw Exception.exception("Parse error " + s.to_s) 
    end
  end

  def ExprParser.parseArg(s)
    arg, rest = [], s
    if s[0] == ?( then
      loop do
       
        # The 1st char of rest is ',' or '('
        k, rest = root(rest[1..-1])
  
        # optimistically store arg 
        arg << k
        case rest[0]
        when ?,
          next
        when ?)
          rest = rest[1..-1]
          break
        else
          throw Exception.exception("Parse error " + rest)
        end
      end
    end
    return arg, rest
  end

end

# module to read JSON input file and define the symbol table
module JSONParser

	# load JSON to memory for processing
	def JSONParser.loadJSON(path)
		json_file = File.read(path)
		defineProgram(JSON.parse(json_file))
	end

	def JSONParser.defineProgram(program)
		curry_module = program["module"]
		module_name = curry_module["name"]
		module_code = curry_module["code"]
		symbolTable(module_code)
	end

	# function to parse the declarations and define the symbols in the program
	def JSONParser.symbolTable(code)
		
		code.each do |declaration|
			case declaration.keys[0]
			when "data"
				data_type = declaration["data"]
				type_vars = declaration["arguments"].split(",")
				constructor_token = CONSTRUCTOR
				declaration["constructor list"].each do |constructor|
					constructor = constructor["constructor"]
					cons_arity = constructor["arguments"].split(',').length()
					# $symbol_table << {name: constructor["name"],type: "Constructor",arity: cons_arity}
					$symbol_table[constructor["name"]] = {sym_type: "Constructor",arity: cons_arity, token: constructor_token, data_type: data_type}
					constructor_token += 1
				end

			when "operation"
				op_name = declaration["operation"]
				$symbol_table[op_name] = {sym_type: "Operation",arity: declaration["arity"]}
				op_rules = declaration["rule list"]

				$operation_rules[op_name] = []
				op_rules.each do |r|
					# store rule variables in symbol table
					rule_vars = r["variables"].split(",")
					rule_vars.each do |v|
						name = v.split(":")[0]
						dtype = v.split(":")[1]
						$symbol_table[name] = {sym_type: "Variable", data_type: dtype}
					end

					# convert the rule r to Rule object
					rule_lhs = ExprParser.compile(r["lhs"])
					rule_rhs = ExprParser.compile(r["rhs"])
					$operation_rules[op_name] << Rule.new(rule_lhs,rule_rhs)

				end

			else
				throw Exception.exception("Invalid declaration")
			end
		end

	end

end


# JSONParser.loadJSON("../../examples/frontend-sample.json")
# # puts $symbol_table.inspect
# # puts $operation_rules.inspect
# $operation_rules.each do |op_name,op_rules|
# 	puts "Rules for #{op_name}"
# 	op_rules.each do |r|
# 		print r.show
# 	end
# end


=begin
# JSON -> DSL -> Object Code approach
def parse(json_file_path)
	json_file = File.read(json_file_path)

	curry_program = JSON.parse(json_file)

	curry_module = curry_program["module"]
	module_name = curry_module["name"]
	module_code = curry_module["code"]

	def_tree_dsl_code = def_tree_code_initialise()

	# array of constructor dictionaries. Each constructor stored as
	# {type:list,name:cons,arity:2}
	constructors = []

	module_code.each do |declaration|

		case declaration.keys[0]
		when "data"
			type_name = declaration["data"]
			type_variables = declaration["arguments"].split(',')
			type_constructors = declaration["constructor list"]

			type_constructors.each do |constructor|
				constructor = constructor["constructor"]
				constructor_name = constructor["name"]
				constructor_arity = constructor["arguments"].split(',').length()
				constructors << {type:type_name,name:constructor_name,arity:constructor_arity}
				def_tree_dsl_code += "$#{constructor_name}_symbol = Constructor.new('#{constructor_name}',#{constructor_arity})\n"
			end

		when "operation"
			operation_name = declaration["operation"]
			operation_arity = declaration["arity"]
			operation_rules = declaration["rule list"]

			
		else
			raise "Invalid declaration in curry code"
		end

	end


	# write out definitional tree using the ruby DSL
	def_tree_file = File.new(module_name+".rb","w")
	def_tree_file.write(def_tree_dsl_code)
end


def def_tree_code_initialise
	output = "require_relative '../compiler/definitional_tree.rb'\n"
	output += "require_relative '../compiler/curry_module.rb'\n"
	output += "\n"
	return output
end

# change this to command line param ?
sample_file = "../../examples/frontend-sample.json"
parse(sample_file)
=end