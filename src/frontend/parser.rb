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

# module to convert a string into an Expression
module Parser

  # TODO: Extend to parse expression with a "where" clause.

  # Take a string s.
  # Return an expression of which s is a representation.

  def Parser.compile(s)
    s.strip!
    v, l = root(s)
    printf("Warning, unparsed \"%s\" \n", l) if l != ""
    return v
  end

  # Return the internal representation of an expression
  # and the string that remains to be parsed
  def Parser.root(s)
    case s
    when /^(\d+)(.*)/
      # A number is a 0-ary function application (for replacement)
      return Box.new(Application.new($1.to_i, [])), $2
    when /(^[A-Za-z]\w*|\?|\+|\*|\-|\/)(.*)/
      arg, rest = parseArg($2)
      return Box.new(Application.new($1, arg)), rest
    else
      throw Exception.exception("Parse error " + s.to_s) 
    end
  end

  def Parser.parseArg(s)
    # printf("parsing %s \n", s)
    arg, rest = [], s
    if s[0] == ?( then
      loop do
        # printf("looping %s \n", rest)
        # The 1st char of rest is ',' or '('
        k, rest = root(rest[1..-1])
        # printf("Arg %s rest %s \n", k, rest)
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
    # printf("parseArg return %s %s \n", arg, rest)
    return arg, rest
  end

end

# module to read JSON input file and define the symbol table
$symbol_table = {}

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
	end

end


expr = Parser.compile("append(nil,y)")
puts expr.inspect



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