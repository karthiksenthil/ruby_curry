module PPRCurry where

import RCurry
import PPData
import XFormat
import Utils
import Char
import List(intersperse)

rcurryToRuby (RModule name import_list data_list func_decls func_defs)
  = format "module %s" [FS (capitalize name)]
      ++ ppImported runtimeRubyFiles
      ++ ppImported import_list
      ++ ppData_list data_list
      ++ ppDeclaration_list func_decls
      ++ ppDefinition_list func_defs
      ++ ppMainFunction func_decls
      ++ "\n\nend\n"

ppDeclaration_list [] = ""
ppDeclaration_list func_decls@(_:_)
  = "\n" ++  foldr ((++) . ppFuncDeclaration) "" func_decls

ppDefinition_list [] = ""
ppDefinition_list func_defs@(_:_)
  = foldr ((++) . ppFuncDefinition) "" func_defs

ppFuncDeclaration (RFunctionDeclaration qname arity)
  = ppIndent 1 ++
       format "%s = CT_Symbols::Operation.new('%s',%d) # \"%s\""
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
      ++ format "repl(CT_Expressions::Box.new(CT_Expressions::Application.new(%s,[])))" [FS (ruby_qual qname)]
  | otherwise = ppMainFunction rest

runtimeRubyFiles = [
  "src/runtime/function_N.rb",
  "src/runtime/function_A.rb",
  "src/compiler/expressions_include.rb",
  "src/compiler/utilities.rb",
  "src/compiler/repl.rb",
  "CT_System.rb",
  "CT_Integer.rb",
  "CT_Character.rb",
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

ppStatement n (RVariable (RICase identifier))
  = ppIndent n ++ format "# var%d case selector" [FI identifier]

-- TODO: abstract name supply for free variables
ppStatement n (RVariable (RIFree identifier))
  = ppIndent n ++
       format "var%d = CT_Expressions::Box.new(CT_Expressions::Variable.new(CT_Symbols::Variable.new))"
           [FI identifier]

ppStatement n (RVariable (RIBind identifier))
  = ppIndent n ++ format "var%d = nil # to be bound soon" [FI identifier]

ppStatement n (RAssign ref expression)
  = ppIndent n ++ format "var%d = " [FI ref]
      ++ ppExpression expression

------------------------------------------------------------------

ppStatement n (RReturn mode expression)
  | mode == Done
  = ppIndent n ++ "rhs = " ++ ppExpression expression
      ++ ppIndent n ++ "replacex(expr,rhs)"
      ++ ppIndent n ++ "return expr"
  | mode == Recur
  = ppIndent n ++ "rhs = " ++ ppExpression expression
      ++ ppIndent n ++ "replacex(expr,rhs)"
      ++ ppIndent n ++ "expr.H()"
      ++ ppIndent n ++ "return expr"
  | otherwise
  = ppIndent n ++ "rhs = " ++ ppExpression expression
      ++ ppIndent n ++ "replacex(expr,rhs)"
      ++ ppIndent n ++ "if expr.content.symbol.token == CT_Symbols::OPERATION"
      ++ ppIndent (n+1) ++ "expr.H()"
      ++ ppIndent n ++ "end"    
      ++ ppIndent n ++ "return expr"

ppStatement n (RExternal (_++"."++name))
  = ppIndent n
      ++ format "rhs = %s(expr)" [FS ("CT_External::"++ruby_unqual name)]
      ++ ppIndent n ++ "replacex(expr,rhs)"
      ++ ppIndent n ++ "expr.H() if expr.content.symbol.token == CT_Symbols::OPERATION"
      ++ ppIndent n ++ "return expr"

ppStatement n (RATable expr branch_list)
  = make_case_fix_part_begin n expr gen_expr
    ++ foldr ((++) . ppBranch (n+1)) "" branch_list
    ++ make_case_fix_part_end n
  where gen_expr = make_generator branch_list

ppStatement n (RBTable expr branch_list)
  = make_case_fix_part_begin n expr "dummy"
    ++ ppIndent n ++ "else"
    ++ make_if_then_else_case (n+1) expr (zip [0..] branch_list)
    ++ make_case_fix_part_end n  

ppStatement n (RException msg)
  = ppIndent n ++ format "raise '%s'" [FS msg]

ppStatement n (Recur_On_Arg arg)
  = ppIndent n ++ format "%s.H" [FS (ppExpression arg)] ++
    ppIndent n ++ "next"

ppStatement n (RFill i list j)
  = ppIndent n ++ format "var%d%s = var%d" [FI i, FS path, FI j]
  where path = concatMap (\x -> format ".content.arguments[%d]" [FI (x-1)]) list 
-- rfill %d %s %d" [FI i, FS (show list), FI j]

-- TODO: fix key when BRTable
make_case_fix_part_begin n arg generator
  = ppIndent n ++ "loop {" 
    ++ ppIndent (n+1) ++ format "case %s.content.symbol.token" 
                      [FS (ppExpression arg)]
    ++ ppIndent (n+1) ++ "when 0 # VARIABLE"
    ++ ppIndent (n+2) ++ format "bind_variable(%s, %s)"
                            [FS (ppExpression arg), FS generator]
    ++ ppIndent (n+2) ++ "next"
    ++ ppIndent (n+1) ++ "when 1, 3 # CHOICE, OPERATION"
    ++ ppIndent (n+2) ++ format "%s.H" [FS (ppExpression arg)]
    ++ ppIndent (n+2) ++ "next"
    ++ ppIndent (n+1) ++ "when 2 # FAIL"
    ++ ppIndent (n+2) ++ "replacex(expr,CT_External::FAILED)"
    ++ ppIndent (n+2) ++ "return expr"

make_case_fix_part_end n
  = ppIndent (n+1) ++ "end"
    ++ ppIndent n ++ "}" 

make_if_then_else_case n _ []
  = ppIndent n ++ "else" ++
    ppIndent (n+1) ++ "replacex(expr,CT_External::FAILED)" ++
    ppIndent (n+1) ++ "return expr" ++
    ppIndent n ++ "end"

make_if_then_else_case n expr ((header, (val, stmt_list)) : branch_list)
  = ppIndent n ++ format "%s %s.content.symbol.value == %s"
        [FS (printable header), FS (ppExpression expr), builtin val]
    ++ foldr ((++) . ppStatement (n+1)) "" stmt_list
    ++ make_if_then_else_case n expr branch_list
    where printable x | x==0 = "if"
                      | True = "elsif"
          builtin (Rint x) = FS (show x)
          builtin (Rchar x) = FS (show x)
          builtin (Rfloat x) = FS (show x)

ppStatement n (RComment string)
  = ppIndent n ++ format "# %s" [FS string]

-------------------------------------------------------------------------------

ppBranch n (RConstructor (_,name) arity token, stmt_list)
  = ppIndent n
       ++ format "when %d # \"%s\" => %s"
	                [FI token, FS name, FS (ruby_unqual name)]
       ++ foldr ((++) . ppStatement (n+1)) "" stmt_list

-------------------------------------------------------------------------------

ppExpression (Ref i)
  = format "var%d" [FI i]

ppExpression (Application bool qname arg_list)
  = format "CT_Expressions::Box.new(CT_Expressions::Application.new(%s," [FS (ruby_qual qname)]
      ++ foldr ((++) . ppArgList) "" [arg_list]
      ++"))"

ppExpression (RPartial miss expr)
  = format "CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[CT_Integer::make_int(%d),%s]))"
           [FI miss, FS (ppExpression expr)]

ppExpression (Integer num)
  = format "CT_Integer::make_int(%d)" [FI num]

ppExpression (Character char)
  = format "CT_Character::make_char(\"%s\")" [FS (printable char)]
  where printable char = if isControl char then toHex char else [char]
        toHex char = ['\\', 'x', hexDigits !! div (ord char) 16
	                       , hexDigits !! mod (ord char) 16]
	hexDigits = "0123456789abcdef"

ppExpression FailExpression
  = format "CT_External::FAILED" []

ppExpression (ROr expr_1 expr_2)
  = format "CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_choice,[%s,%s]))"
      [FS (ppExpression expr_1), FS (ppExpression expr_2)]

-------------------------------------------------------------------------------

ppArgList list = "[" ++ concat (intersperse "," (map ppExpression list)) ++ "]"
