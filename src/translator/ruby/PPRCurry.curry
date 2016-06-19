module PPRCurry where

import RCurry
import XFormat
import Utils

rcurryToRuby (RModule name import_list const_list func_decls func_defs)
  = format "module %s" [FS (capitalize name)]
      ++ ppImported runtimeRubyFiles
      ++ ppImported import_list
      ++ ppConstructor_list const_list
      ++ ppDeclaration_list func_decls
      ++ ppDefinition_list func_defs
      ++ ppMainFunction func_decls
      ++ "\n\nend\n"

ppConstructor_list [] = ""
ppConstructor_list const_list@(_:_)
  = "\n" ++ foldr ((++) . ppConstructor) "" const_list

ppDeclaration_list [] = ""
ppDeclaration_list func_decls@(_:_)
  = "\n" ++  foldr ((++) . ppFuncDeclaration) "" func_decls

ppDefinition_list [] = ""
ppDefinition_list func_defs@(_:_)
  = foldr ((++) . ppFuncDefinition) "" func_defs

ppConstructor (RConstructor qname arity token)
  = ppIndent 1 ++ format "%s = Constructor.new('%s',%d)" 
                         [FS (ruby_qual qname), FS (ruby_qual qname), FI arity]
      ++ ppIndent 1 ++ format "%s.token_value = %d"
                              [FS (ruby_qual qname), FI token]

ppFuncDeclaration (RFunctionDeclaration qname arity)
  = ppIndent 1 ++
       format "%s = Operation.new('%s',%d) # \"%s\""
       [FS (ruby_qual qname), FS (ruby_qual qname), FI arity, FS(snd qname)]

ppFuncDefinition (RFunctionDefinition (_,name) arity stmt_list)
  = "\n" ++ ppIndent 1 
      ++ format "def %s.H(expr) # \"%s\"" [FS (ruby_unqual name), FS name]
      ++ foldr ((++) . ppStatement 2) "" stmt_list
      ++ ppIndent 1 ++ "end"

-- If a main function of arity 0 is defined in this module,
-- encode a call to it.
ppMainFunction [] = ""
ppMainFunction (RFunctionDeclaration qname@(mod,name) arity : rest)
  | name == "main" && arity == 0
  = "\n" ++ ppIndent 1
      ++ format "repl(Box.new(Application.new(%s,[])))" [FS (ruby_qual qname)]
  | otherwise = ppMainFunction rest

runtimeRubyFiles = [
  "src/runtime/function_N.rb",
  "src/runtime/function_A.rb",
  "src/compiler/expressions.rb",
  "src/compiler/symbols.rb",
  "src/compiler/utilities.rb",
  "src/compiler/repl.rb",
  "CT_System.rb",
  "integers.rb",
  "CT_External.rb" ]

ppImported [] = ""
ppImported files@(_:_)
  = ppIndent 0
       ++ foldr ((++) . \ s -> ppIndent 1
                 ++ "require '"++ s ++ "'") "" files
-------------------------------------------------------------------------------

ppStatement n (RVariable (RILhs identifier index))
  = ppIndent n ++ format "var%d = expr.content.arguments[%d]"
                          [FI identifier, FI (index-1)]

ppStatement n (RVariable (RIVar identifier ref index))
  = ppIndent n ++ format "var%d = var%d.content.arguments[%d]"
                          [FI identifier, FI ref, FI (index-1)]

ppStatement n (RVariable (Unimpl identifier status))
  = ppIndent n ++ format "#var%d is %s. Could be ICase, IBind, IFree"
                          [FI identifier, FS status]

ppStatement n (RAssign ref expression)
  = ppIndent n ++ format "var%d = " [FI ref]
      ++ ppExpression expression

-- A return instruction replaces the argument of the function
-- in which this statement appears with argument "expression"
ppStatement n (RReturn mode expression)
  | mode == Done
  = ppIndent n ++ "rhs = " ++ ppExpression expression
      ++ ppIndent n ++ "expr.replace(rhs.content)"
  | mode == Recur
  = ppIndent n ++ "rhs = " ++ ppExpression expression
      ++ ppIndent n ++ "expr.replace(rhs.content)"
      ++ ppIndent n ++ "expr.H()"
  | otherwise
  = ppIndent n ++ "rhs = " ++ ppExpression expression
      ++ ppIndent n ++ "expr.replace(rhs.content)"
      ++ ppIndent n ++ "if expr.content.symbol.token == OPERATION"
      ++ ppIndent (n+1) ++ "expr.H()"
      ++ ppIndent n ++ "end"    

ppStatement n (RExternal (_++"."++name))
  = ppIndent n
      ++ format "rhs = %s(expr)" [FS ("CT_External::"++ruby_unqual name)]
      ++ ppIndent n ++ "expr.replace(rhs.content)"
      ++ ppIndent n ++ "expr.H() if expr.content.symbol.token == OPERATION"

ppStatement n (RCase expression branch_list)
  = ppIndent n ++ "case " ++ ppExpression expression ++ ".content.symbol.token"
      ++ foldr ((++) . ppBranch n) "" branch_list
      ++ ppIndent n ++ "end"

ppStatement n (RException msg)
  = ppIndent n ++ format "raise '%s'" [FS msg]

ppStatement n (RHFunction expression)
  = ppIndent n ++ ppExpression expression ++ ".H()"

ppStatement n (RReplace redex contractum)
  = ppIndent n ++ ppExpression redex 
               ++ ".replace(" ++ ppExpression contractum ++ ".content)"


ppStatement n (RStatement)
  = ppIndent n ++ "nil #Unimplemented ICurry code"

-------------------------------------------------------------------------------

ppBranch n (token, (name, stmt_list))
  = ppIndent n
       ++ ( if token >= 4
            then format "when %d # \"%s\" => %s"
	                [FI token, FS name, FS (ruby_unqual name)]
            else format "when %d # %s" [FI token, FS name] )
       ++ foldr ((++) . ppStatement (n+1)) "" stmt_list

-------------------------------------------------------------------------------

ppExpression (Ref i)
  = format "var%d" [FI i]

ppExpression (Application bool qname arg_list)
  = format "Box.new(Application.new(%s," [FS (ruby_qual qname)]
      ++ foldr ((++) . ppArgList) "" [arg_list]
      ++"))"

ppExpression (RPartial miss expr)
  = format "Box.new(Application.new(CT_System::CT_partial,[Box.new(Int_expression.new(%d)),%s]))"
           [FI miss, FS (ppExpression expr)]

ppExpression (Integer num)
  = format "make_int(%d)" [FI num]

ppExpression (ROr expr_1 expr_2)
  = format "Box.new(Application.new(CT_System::CT_choice,[%s,%s]))"
      [FS (ppExpression expr_1), FS (ppExpression expr_2)]

-- TODO: look into this 
ppExpression (Expr str)
  = format "expr" []

ppExpression (RExpression)
  = "nil"  -- enables compiling without syntax errors

-------------------------------------------------------------------------------

ppArgList [] = "[]"

ppArgList [x]
  = "[" ++ ppExpression x ++ "]"

ppArgList (x1:x2:xs)
  = "[" ++
       ppExpression x1 ++
       foldr ((++) . aux) "" (x2:xs) ++
       "]"
    where aux x = ", " ++ ppExpression x

ppIndent indent
  = "\n" ++ take (2 * indent) (repeat ' ')      
