require_relative '../src/expressions.rb'

class Color_symbol < Constructor
	attr_accessor :color_name

	def initialize(color_name)
		super("color",0)
		@color_name = color_name
	end

	def show
		@color_name
	end

end

class Color_expression < Application

	def initialize(color_name)
		super(Color_symbol.new(color_name),[])
	end

	def show
		@symbol.show
	end

end

def make_color(c)
	return Box.new(Color_expression.new(c))
end