require_relative '../compiler/definitional_tree.rb'
require_relative '../compiler/utilities.rb'

class Box

	def A

		token = self.content.symbol.token

		case token
		when OPERATION
			raise 'Error, expression to A can only be constructor rooted'
		when VARIABLE
			raise 'Variable not implemented'
		when CHOICE
			raise 'Error, expression to A can only be constructor rooted'
		when FAIL
			self.replace($fail_expression.content)
		else
			self.content.arguments.each do |arg|
				if arg.content == $fail_expression
					self.replace($fail_expression.content)
					break
				end
			end			
		end
		self
		
	end

end