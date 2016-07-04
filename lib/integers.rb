require_relative '../src/compiler/expressions_include.rb'

class Int_symbol < CT_Symbols::Constructor
  attr_accessor :value
  def initialize(value)
    raise format("Illegal integer \"%s\"", value) unless value.instance_of? Fixnum
    super("int",0,CT_Symbols::CONSTRUCTOR)
    @value = value
  end
  def to_s
    return @value.to_s
  end
  def ==(another_int)
    return another_int.class == self.class && another_int.value == @value
  end
  def compare(another_int)
    if another_int.class == self.class
      return @value <=> another_int.value
    end
  end
end

def make_int(x)
  return CT_Expressions::Box.new(CT_Expressions::Application.new(Int_symbol.new(x),[]))
end

# ------------------------------------------------------------------

=begin
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
=end
