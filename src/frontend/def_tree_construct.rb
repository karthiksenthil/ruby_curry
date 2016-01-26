require_relative "./parsers.rb"
require_relative "../../user/append.rb"

module DefTreeBuilder

	def DefTreeBuilder.chaining(rules)
		var_count = 1
		chains = []
		rules.each do |r|
			chain = [{index: [0],expr: Marshal.load(Marshal.dump(r.lhs))}]
			lhs = r.lhs.content
			lhs.arguments.reverse.each do |arg|
				if arg.content.symbol.class == Constructor
					arg.replace(make_variable("Genvar_#{var_count}","chain_var"))
					var_count += 1
					chain << {index: [lhs.arguments.index(arg)+1],expr: Marshal.load(Marshal.dump(r.lhs))}
				end
			end
			chains << chain.reverse 
		end
		print_chains(chains)
		merge([chains])
	end

	def DefTreeBuilder.print_chains(chains)
		chains.each do |chain|
			chain.each do |expression|
				print expression[:expr].show + "," + expression[:index].to_s + " "
			end
			print "\n"
		end
	end

	def DefTreeBuilder.merge(chain_lists)
		puts "Starting merge step"
		# first substep, check if first element in each chain for each chain_list
		# is same indexed
		chain_lists.each do |chain_list|
			inductive_index = chain_list.first.first[:index]
			chain_list.each do |chain|
				if chain.first[:index] != inductive_index
					throw Exception.exception("Wrong variable chaining or definitional tree does not exist")
				end
			end
			# here make Branch node of tree.
		end

	end



end




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