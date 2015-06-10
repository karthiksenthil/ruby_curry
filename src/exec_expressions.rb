require_relative './expressions.rb'

# Subclass to encode H operation around an expression
class H < Expression
	attr_accessor :expression

	def initialize(expr)
		@expression = expr
	end

	def show
		return 'H('+@expression.show()+')'
	end

end

class N < Expression
	attr_accessor :expression

	def initialize(expr)
		@expression = expr
	end

end

class A < Expression
	attr_accessor :expression

	def initialize(expr)
		@expression = expr
	end

end
