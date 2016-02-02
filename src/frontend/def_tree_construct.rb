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

	# select_term returns the first unselected argument from a left-hand side 
	# that is not a variable or returns all the arguments if it is a shallow term
	def Chaining.select_term(expr)
		expr.content.arguments.reverse.each do |arg|
			if arg.content.symbol.token != VARIABLE
				return arg, expr.content.arguments.index(arg)+1
			end
		end
		return expr, 0
	end

	def Chaining.candidate_to_chain(lhs)
		chain = [deep_clone(lhs),[]]
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


module Merging

	@def_tree = nil

	def Merging.verify_position(chains, rules, parent)

		# check if any chain is variant of a Rule here
		if chains.count == 1 && chains.first.count == 1
			rule_chain = chains.first.first

			rules.each do |r|
				if r.lhs.is_variant?(rule_chain)
					# make a leaf, add to parent
					l = Leaf.new(rule_chain,r.rhs)
					parent.children << l
					return
				end
			end

		end


		pos = []
		chains.each do |chain|
			pos << chain[1]
		end

		if pos.uniq.count != 1
			throw Exception.exception("Wrong variable chaining or definitional tree does not exist")
		end

		# first node in each chain is similar and it is Branch node
		patt = chains.first.first
		var = patt
		chains.first[1].each do |i|
			var = var.content.arguments[i-1]
		end
		b = Branch.new(patt,var,[])

		if parent.nil?
			@def_tree = b
		else
			parent.children << b
		end

		# modify and partition chains here
		new_partitions = partition_chains(chains)
		# call verify on each partition here
		new_partitions.each do |p|
			verify_position(p,rules,b)
		end

		return @def_tree

	end

	# function to partition chains into lists(based on similarity)
	def Merging.partition_chains(chains)
		# first step, modify i.e shorten the chains
		chains.each do |chain|
			# remove first element(and index)
			chain.shift(2)
		end

		# partitioning code
		partitions = []
		while(!chains.empty?)
			chain = chains[0]
			chain_type = chain.first
			new_list = []
			new_list << chain
			chains.delete(chain)

			chains.each do |remaining_chain|
				if remaining_chain.first.is_variant?(chain_type)
					new_list << remaining_chain
				end
			end
			partitions << new_list

			# removing matched chain_type elements from chains
			new_list.each do |c|
				chains.delete(c)
			end
		end

		return partitions
	end

end # End of Merging Module


module DefTreeBuilder

	def DefTreeBuilder.build_tree(rules)
		# send a clone of rules to Chaining since they replace the terms
		chains = Chaining.create_chains(deep_clone(rules))
		puts "\nChains:"
		print_chains(chains)
		merged = Merging.verify_position(chains,rules,nil)
		puts "\nDefinitional tree:"
		merged.pretty_print
		puts
	end

	def DefTreeBuilder.print_chains(chains)
		chains.each do |chain|
			chain.each do |e|
				if e.class == Box
					print e.show + " "
				else
					print e.to_s + " "
				end
			end
			print "\n"
		end
	end

end # end of DefTreeBuilder module




def test_run
	JSONParser.loadJSON("../../examples/half.json")
	$operation_rules.each do |op_name,op_rules|
		puts "Rules for #{op_name}"
		op_rules.each do |r|
			print r.show
		end
		puts "\nDefintional Tree Construction for #{op_name}"
		DefTreeBuilder.build_tree(op_rules)
	end
end


test_run

# test for is_variant?
# a = make_append(make_cons(make_variable("x","list"),make_nil),make_nil)
# b = make_append(make_cons(make_variable("x","list"),make_cons(make_variable("xy","list2"),make_nil)),make_nil)
# puts a.is_variant?(b)

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