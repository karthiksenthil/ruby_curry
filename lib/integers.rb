require_relative '../src/compiler/expressions.rb'

class Int_symbol < Constructor
  attr_accessor :name, :value, :arity, :token
  def initialize(value)
    raise format("Illegal integer \"%s\"", value) unless value.instance_of? Fixnum
    super("int",0)
    @value = value
  end
  def show
    return @value.to_s
  end
end

class Int_expression < Application
  def initialize(value)
    super(Int_symbol.new(value),[])
  end
  def show
    return @symbol.show
  end
  def ==(another_int)
    if another_int.class == Int_expression
      return self.symbol == another_int.symbol && self.symbol.value == another_int.symbol.value 
    end
  end
end

def make_int(x)
  return Box.new(Int_expression.new(x))
end

def binary(operator)
  Class.new(Operation) do
    define_method(:H) do |expr|
      first_arg = expr.content.arguments[0]

      case first_arg.content.symbol.token
      when VARIABLE
        raise "Handling Variables not implemented yet"
      when CHOICE
        raise "Handling Choice not implemented yet"
      when CONSTRUCTOR
        second_arg = expr.content.arguments[1]
        
        case second_arg.content.symbol.token
        when VARIABLE
          raise "Handling Variables not implemented yet"
        when CHOICE
          raise "Handling Choice not implemented yet"
        when CONSTRUCTOR
          x = first_arg.content.symbol.value
          y = second_arg.content.symbol.value
          # TODO: check division by zero
          expr.replace(Int_expression.new(x.send(operator, y)))
        when OPERATION
          second_arg.H()
          expr.H()
        end

      when OPERATION
        first_arg.H()
        expr.H()
      end
      expr
    end
  end
end

# ------------------------------------------------------------------
# These are repetitive and could be macro-ed

=begin
Add_symbol = binary(:+)
$add_symbol = Add_symbol.new("+",2)
def make_add(x,y); return Box.new(Application.new($add_symbol,[x,y])); end

Sub_symbol = binary(:-)
$sub_symbol = Sub_symbol.new("-",2)
def make_sub(x,y); return Box.new(Application.new($sub_symbol,[x,y])); end


#=begin
t1 = make_int(2)
puts t1.show
t2 = make_add(make_int(4),make_int(8))
puts t2.show
t2.H()
puts t2.show
t3 = make_add(make_sub(make_int(40),make_int(10)),make_add(make_int(20),make_int(30)))
puts t3.show
t3.N
puts t3.show
#=end
=end