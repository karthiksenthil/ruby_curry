-- ### This program is a stub under development ### --

import ICurry
import XFormat

icurryToRuby (IModule name imported_list data_list funct_list)
  = format "\n# Compiling module %s\n"
           [FS name]
      ++ ppRuntimeRequires           
      ++ foldr ((++) . ppData) "" data_list
      ++ foldr ((++) . ppFunction) "" funct_list
      ++ ppMainFunc
      ++ format "\n# end of file\n" []

ppData (qname, constr_list)
  = format "\n\n# constructors of type %s follow" [FS (ppQName qname)]
      ++ foldr ((++) . ppConstructor) "" (zip constr_list [4..])

ppConstructor ((IConstructor (mod, name) arity), index)
  = format "\n$%s_symbol = Constructor.new(\"%s\",%d)"
           [FS name, FS name, FI arity]
      ++ format "\n$%s_symbol.token_value = %d"
                [FS name, FI index]

ppFunction (IFunction (mod, name) arity stmt_list)
  = format "\n\n# defining %s operation symbol and H function" [FS (ppQName (mod, name))]
      ++ format "\n$%s_symbol = Operation.new(\"%s\",%d,nil)"
                 [FS name, FS name, FI arity]
      ++ format "\ndef $%s_symbol.H(expr)" [FS name]
      ++ foldr ((++) . ppStmt) "" stmt_list
      ++ format "\nend # end of H function\n" []

ppRuntimeRequires
  = "\nrequire_relative '../src/runtime/function_N.rb'"
    ++ "\nrequire_relative '../src/runtime/function_A.rb'"
    ++ "\nrequire_relative '../src/compiler/expressions.rb'"
    ++ "\nrequire_relative '../src/compiler/symbols.rb'"
    ++ "\nrequire_relative '../src/compiler/utilities.rb'"
    ++ "\nrequire_relative '../src/compiler/repl.rb'"

ppMainFunc
  = "\n\ndef main"
    ++ "\n\tmain_expr = Box.new(Application.new($main_symbol,[]))"
    ++ "\n\trepl(main_expr)"
    ++ "\nend"
    ++ "\n\nmain"       

---------------------------------------------------------------------

ppStmt (Declare (Variable identifier (ILhs (n, i))))
  = format "\nvar%d = expr.content.arguments[%d]" [FI identifier, FI (i-1)]

-- leave ICase unhandled for now --
ppStmt (Declare (Variable identifier ICase))
  = "\n#ICase statement is not implemented yet"

ppStmt (Declare (Variable identifier IBind))
  = "\n#IBind statement is not implemented yet"

ppStmt (Declare (Variable identifier IFree))
  = "\n#IFree statement is not implemented yet"    

ppStmt (Declare (Variable identifier (IVar j (n,i))))
  = format "\nvar%d = var%d.content.arguments[%d]" 
      [FI identifier, FI j, FI (i-1)]

ppStmt (Assign i expr)
  = format "\nvar%d = " [FI i]
      ++ ppExpr expr

ppStmt (ATable identifier flex expr branch_list)
  = format "\ncase " [] ++ ppExpr expr ++ ".content.symbol.token"
      ++ ppDefaultEntries expr
      ++ foldr ((++) . ppABranch) "" branch_list
      ++ "\nend"

ppStmt (Return expr)
  = "\n\trhs = " ++ ppExpr expr
      ++ "\n\texpr.replace(rhs.content)"

ppStmt (Fill i path j)
  = "\n#Fill statement is not implemented yet"

ppStmt (BTable identifier flex expr branch_list)
  = "\n#BTable statement is not implemented yet"  

ppStmt (IExternal string)
  = "\n#IExternal statement is not implemented yet"

ppStmt (Comment string)
  = "\n#Comment statement is not implemented yet"  

---------------------------------------------------------------------

ppABranch ((IConstructor (mod,name) arity), stmt_list)
  = format "\nwhen $%s_symbol.token_value" [FS name]
      ++ foldr ((++) . ppStmt) "\t" stmt_list


---------------------------------------------------------------------

ppDefaultEntries e
  = "\nwhen VARIABLE"
      ++ "\n\traise 'Handling Variables not implemented yet'"
    ++ "\nwhen CHOICE"
      ++ "\n\t" ++ ppExpr e ++ ".H()"
      ++ "\n\texpr.H()"
    ++ "\nwhen FAIL"
      ++ "\n\texpr.replace($fail_expression.content)"
    ++ "\nwhen OPERATION"
      ++ "\n\t" ++ ppExpr e ++ ".H()"
      ++ "\n\texpr.H()"

      
---------------------------------------------------------------------

ppExpr (Reference i)
  = format "var%d" [FI i]

ppExpr (Applic bool (mod,symbol) arg_list)
  = format "Box.new(Application.new($%s_symbol," [FS symbol]
    ++ foldr ((++) . ppArgList) "" [arg_list]
    ++ "))"

ppExpr Exempt
  = "\n#Exempt expression is not implemented yet"

ppExpr (BuiltinVariant _)
  = "\n#BuiltinVariant expression is not implemented yet"

ppExpr (PartApplic missing expr)
  = "\n#PartApplic expression is not implemented yet"

---------------------------------------------------------------------

ppArgList [] = "[]"

ppArgList [x]
  = "[" ++ ppExpr x ++ "]"

ppArgList (x1:x2:xs)
  = "[" ++
       ppExpr x1 ++
       foldr ((++) . aux) "" (x2:xs) ++
       "]"
    where aux x = ", " ++ ppExpr x

ppQName (s,n) = "\"" ++ s ++ "." ++ n ++ "\""
