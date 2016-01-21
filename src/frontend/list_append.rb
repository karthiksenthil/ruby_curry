require_relative '../compiler/definitional_tree.rb'
require_relative '../compiler/curry_module.rb'

$nil_list_symbol = Constructor.new('nil_list',0)
$cons_symbol = Constructor.new('cons',2)
