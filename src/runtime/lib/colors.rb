require_relative '../../compiler/expressions.rb'

$red_symbol = Constructor.new("red",0)
$green_symbol = Constructor.new("green",0)
$blue_symbol = Constructor.new("blue",0)

if $constructors_hash["color"].nil?
	$constructors_hash["color"] = [$red_symbol,$green_symbol,$blue_symbol]
else
	$constructors_hash["color"] += [$red_symbol,$green_symbol,$blue_symbol]
end

# color helpers

def make_red
	return Box.new(Application.new($red_symbol,[]))
end

def make_green
	return Box.new(Application.new($green_symbol,[]))
end

def make_blue
	return Box.new(Application.new($blue_symbol,[]))
end