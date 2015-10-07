require_relative '../compiler/definitional_tree.rb'
require_relative '../compiler/utilities.rb'
require_relative './function_A.rb'

class Box

	def N

		token = self.content.symbol.token
		
		case token
		when OPERATION 
			self.H()
			self.N()
		when VARIABLE
			raise 'Variable not implemented'
		when CHOICE
			self.H()
			self.N()
		when FAIL
			self.replace($fail_expression.content)
		else
			self.content.arguments.each do |arg|
				arg.N()
			end
			self.A()
		end
		self

	end

end