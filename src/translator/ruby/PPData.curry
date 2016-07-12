module PPData where

import RCurry
import XFormat
import Utils
import List(intersperse)

ppData_list [] = ""
ppData_list data_list@(_:_)
  = ppIndent 1
       ++ foldr ((++) . ppData) "" data_list

ppData (RDatatype qname constr_list)
  = foldr ((++) . ppConstructor) "" constr_list

ppConstructor (RConstructor qname arity token)
  = ppIndent 1
      ++ format "%s = CT_Symbols::Constructor.new('%s',%d,%d)" 
           [FS (ruby_qual qname), FS (ruby_qual qname), FI arity, FI token]

make_generator branch_list
  = make_alter (map fst branch_list)
  where make_alter [x] = make_one x
        make_alter (x:y:xs) = make_choice (make_one x) (make_alter (y:xs))
        make_one (RConstructor qname arity _)
	  = format "CT_Expressions::Box.new(CT_Expressions::Application.new(%s,%s))"
	       [FS (ruby_qual qname), FS (make_args arity)]
        make_args n = "[" ++ concat (intersperse "," ["CT_Expressions::Box.new(CT_Expressions::make_variable)" | _ <- [1..n]]) ++ "]"
	make_choice x y = format "CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_choice,[%s,%s]))"
	                    [FS x, FS y]
        key (RConstructor qname _ _) = qname  