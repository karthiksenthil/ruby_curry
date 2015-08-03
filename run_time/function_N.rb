require_relative '../src/definitional_tree.rb'
require_relative '../src/utilities.rb'

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
			raise 'Choice not implemented'
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