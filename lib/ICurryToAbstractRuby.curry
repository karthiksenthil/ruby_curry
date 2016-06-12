-- ### This program is a stub under development ### --
-- It transforms ICurry into RCurry

import ICurry
import RCurry

execute (IModule name imported_list data_list funct_list)
  = let constr_list = concatMap single_data data_list
        fun_declar_list = map single_funct_declare funct_list
        fun_defin_list = map single_funct_def funct_list
    in RModule name [] constr_list fun_declar_list fun_defin_list

single_data (_, constr_list)
  = map single_constr (zip constr_list [4..])

single_constr ((IConstructor qname arity), index)
  = RConstructor qname arity index

single_funct_declare (IFunction qname arity _)
        = RFunctionDeclaration qname arity

single_funct_def (IFunction qname arity stmt_list)
  = RFunctionDefinition qname arity (map single_stmt stmt_list)

--------------------------------------------------------------

single_stmt (Declare (Variable identifier (ILhs (n, i))))
        = RVariable (RILhs identifier i)

single_stmt (Declare (Variable identifier (IVar j (_,i))))
        = RVariable (RIVar identifier j i)

single_stmt (Declare (Variable identifier ICase))
  = RVariable (Unimpl identifier "Unimplemented")

single_stmt (Declare (Variable identifier IBind))
  = RVariable (Unimpl identifier "Unimplemented")

single_stmt (Declare (Variable identifier IFree))
  = RVariable (Unimpl identifier "Unimplemented")

single_stmt (Assign i expr)
  = RAssign i (single_expr expr)

-- branch_list is [(IConstructor,[Statement])]
-- the constructors are in order 4, 5, 6, ...
-- strip them away and convert the statements

single_stmt (ATable _ _ expr branch_list)
  = let constr_branch_list 
          = [(name, map single_stmt bl) | 
	       (IConstructor (_,name) _, bl) <- branch_list]
        all_branch_list
	  = zip [0..] (default_branches expr ++ constr_branch_list)
    in RCase (single_expr expr) all_branch_list


-- if expr is constructor rooted, then return it;
-- otherwise, recursively invoke the H function on it.
single_stmt (Return expr)
  = RReturn mode (single_expr expr)
  where mode = case expr of
                 Exempt -> Done
                 Reference _ -> Check
                 BuiltinVariant _ -> Done
                 Applic True _ _ -> Done
                 Applic False _ _ -> Recur
                 PartApplic _ _ -> Done
                 IOr _ _ -> Recur

-- Unimplemented statements from ICurry
single_stmt (IExternal _) = RStatement
single_stmt (Comment _) = RStatement
single_stmt (Fill _ _ _) = RStatement
single_stmt (BTable _ _ _ _) = RStatement

--------------------------------------------------------------

single_expr (Reference i) = Ref i

single_expr (Applic bool qname arg_list)
  = Application bool qname (map single_expr arg_list)

-- Unimplemented expressions from ICurry
single_expr (Exempt) = RExpression
single_expr (BuiltinVariant _) = RExpression
single_expr (PartApplic _ _) = RExpression
single_expr (IOr _ _) = RExpression

--------------------------------------------------------------

single_branch ((IConstructor (mod,name) _), stmt_list)
  = let case_stmts = map single_stmt stmt_list
    in (mod++"."++name, case_stmts) 

-- These are the 4 initial entries in a pattern matching case
-- They correspond to the following matches of the inductive variable
--   0 => a free variable
--   1 => a choice-rooted expression
--   2 => the fail expression
--   3 => an operation-rooted expression
-- Each entry is a list of RCurry statements
default_branches expr
  = [ ("VARIABLE",
       [RException "Handling Variables not implemented yet"])
    , ("CHOICE", [RHFunction (single_expr expr), RHFunction (Expr "expr")])
    -- next should be a global fail, not local
    , ("FAIL", [RReplace (Expr "expr") (Application True ("default","fail") [])])
    , ("OPERATION", [RHFunction (single_expr expr), RHFunction (Expr "expr")])
    ]
