require_relative "./parsers.rb"
require_relative "../../user/append.rb"

def deep_clone(obj)
	return Marshal.load(Marshal.dump(obj))
end

# shallow cons == cons which operates directly on vars only
def is_shallow_cons?(expr)
	return expr.symbol.token >= CONSTRUCTOR && expr.arguments.map{|a| a.content.symbol.token == VARIABLE}.all?
end


# Barry's thesis Pg. 50

module Chaining

	@genvar_counter = 1

	#select_term returns the first unselected argument from a left-hand side 
	# that is not a variable or returns all the arguments if it is a shallow term
	def Chaining.select_term(expr)
		expr.content.arguments.reverse.each do |arg|
			# puts arg.inspect
			if arg.content.symbol.token != VARIABLE
				return arg, expr.content.arguments.index(arg)+1
			end
		end
		return expr, 0
	end

	def Chaining.candidate_to_chain(lhs)
		chain = [deep_clone(lhs.content),[]]
		term,pos = select_term(lhs)

		# stop point
		return chain.flatten if pos == 0 

		while(pos) != 0
			chain.last << pos
			term,pos = select_term(term)
		end

		term.replace(make_variable("Genvar_#{@genvar_counter}","chain_var").content)
		@genvar_counter += 1
		chain += candidate_to_chain(lhs)
	end

	def Chaining.create_chains(rules)
		chains = []
		rules.each do |r|
			lhs = r.lhs
			chains << candidate_to_chain(lhs).reverse
		end
		return chains
	end

end # end of Chaining Module


module DefTreeBuilder

	def DefTreeBuilder.chaining(rules)
		chains = Chaining.create_chains(rules)
		print_chains(chains)
		# merge([chains])
	end

	def DefTreeBuilder.print_chains(chains)
		chains.each do |chain|
			chain.each do |e|
				if e.class == Application
					print e.show + " "
				else
					print e.to_s + " "
				end
			end
			print "\n"
		end
	end

	def DefTreeBuilder.merge(chain_lists)
		puts "Starting merge step"
		# first substep, check if first element in each chain for each chain_list
		# is same indexed
		chain_lists.each do |chain_list|
			inductive_index = chain_list.first[1]
			chain_list.each do |chain|
				if chain.first[:index] != inductive_index
					throw Exception.exception("Wrong variable chaining or definitional tree does not exist")
				end
			end
			# here make Branch node of tree.
		end

	end

end # end of DefTreeBuilder module




def test_run
	JSONParser.loadJSON("../../examples/leq.json")
	$operation_rules.each do |op_name,op_rules|
		puts "Rules for #{op_name}"
		op_rules.each do |r|
			print r.show
		end
		puts "Chains for #{op_name}"
		DefTreeBuilder.chaining(op_rules)
	end
end

test_run

################# OLD CHAINING CODE ##################
=begin
def DefTreeBuilder.chaining(rules)
		var_count = 1
		chains = []
		rules.each do |r|
			chain = [{index: [0],expr: deep_clone(r.lhs)}]
			lhs = r.lhs.content
			lhs.arguments.reverse.each do |arg|
				if is_shallow_cons?(arg.content)
					arg.replace(make_variable("Genvar_#{var_count}","chain_var"))
					var_count += 1
					chain << {index: [lhs.arguments.index(arg)+1],expr: deep_clone(r.lhs)}
				elsif arg.content.symbol.token >= CONSTRUCTOR
					# case of deep constructor terms
					# try making this is a recursive call
				end
			end
			chains << chain.reverse 
		end
		print_chains(chains)
		merge([chains])
	end
=end