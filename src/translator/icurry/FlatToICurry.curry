-- This program makes big assumptions on Flatcurry.  These assumption
-- should be guaranteed by Norm.  In a FlatCurry expression,
-- multibranch tables and let blocks are outermost.  They can be
-- nested.
--
-- An expression is found is several contexts (see ICurry syntax).
-- In particular, the bindings of a let block and the selector of
-- a multibranch table are expressions.

module FlatToICurry(execute) where

import FlatCurry.Types
import ICurry
import LetPlan

-- ttable is used to complete and reorder the branches of an ATable.

execute type_table (Prog name imported type_list funct_list _)
  = IModule name imported constr_decl funct_decl
  where constr_decl = [makeType x | x@(Type _ _ _ _) <- type_list]
  	funct_decl = map (makeFunct type_table) funct_list

makeType (Type qname _ _ constr_list)
  = (qname, [IConstructor cname arity | (Cons cname arity _ _) <- constr_list])

makeFunct type_table (Func qname arity _ _ rule)
  = IFunction qname arity (makeRule qname stuff rule)
  where stuff = (Return, type_table)

makeRule _ _ (External x) = [IExternal x]
makeRule qname stuff (Rule var_list expr) 
  = [Declare (Variable n (ILhs (qname,k))) | (k,n) <- zip [1..] var_list]
      -- TODO: is a free variable in the rule variable list ???
      -- I do not think so !!!
      ++ makeStmt stuff expr

mode   (x, _) = x
ttable (_, x) = x

makeStmt stuff a@(Var _) = [(mode stuff) (makeExpr stuff a)]
makeExpr _ (Var i) = Reference i
makeStmt stuff a@(Lit _) = [(mode stuff) (makeExpr stuff a)]
makeExpr _ (Lit (Intc x)) = BuiltinVariant (Bint x)
makeExpr _ (Lit (Charc x)) = BuiltinVariant (Bchar x)
makeExpr _ (Lit (Floatc x)) = BuiltinVariant (Bfloat x)

makeStmt stuff a@(Comb _ _ _) = [(mode stuff) (makeExpr stuff a)]
makeExpr stuff (Comb FuncCall qname expr_list)
  = Applic False qname (map (makeExpr stuff) expr_list)
makeExpr stuff (Comb ConsCall qname expr_list)
  = Applic True qname (map (makeExpr stuff) expr_list)
makeExpr stuff (Comb (FuncPartCall missing) qname expr_list)
  = PartApplic missing (Applic False qname (map (makeExpr stuff) expr_list))
makeExpr stuff (Comb (ConsPartCall missing) qname expr_list)
  = PartApplic missing (Applic True qname (map (makeExpr stuff) expr_list))

makeStmt stuff (Free var_list expr) 
  = [Declare (Variable i IFree) | i <- var_list] ++ makeStmt stuff expr
makeExpr _ (Free _ _)
  =  error "FlatToICurry found a free variable while making an expression"

makeStmt stuff a@(Or _ _) = [(mode stuff) (makeExpr stuff a)]
makeExpr stuff (Or expr_1 expr_2) = IOr (makeExpr stuff expr_1) (makeExpr stuff expr_2)

makeStmt stuff (Case flex expr branch_list@(Branch (Pattern cname _) _ : _))
  = [Declare (Variable select_var ICase),
     Assign select_var (makeExpr stuff expr),
     ATable counter (flex==Flex) (Reference select_var) new_branch_list]
  where counter = unknown    -- later replace with an int 
        select_var = counter -- same as counter
        -- get the complete list of constructors labeling the table
        constr_list = get_constr_list cname (ttable stuff)
        get_constr_list dname (_ ++ [(_, a@(_ ++ [(dname,_)] ++ _))] ++ _) = a
        new_branch_list = map choose_create constr_list
        choose_create (dname, arity)
          = case blookup dname branch_list of
              Nothing -> (IConstructor dname arity, [(mode stuff) Exempt])
              Just (Branch (Pattern _ var_list) branch_expr) 
                  -> (IConstructor dname arity, 
                         [Declare (Variable n (IVar select_var (dname,k)))
                                   | (k,n) <- zip [1..] var_list]
                            ++ makeStmt stuff branch_expr)
        blookup _ [] = Nothing
        blookup dname (a@(Branch (Pattern pname _) _) : z)
          | dname == pname = Just a
          | otherwise = blookup dname z

makeStmt stuff (Case flex expr branch_list@(Branch (LPattern _) _ : _))
  = [Declare (Variable counter ICase),
     Assign counter (makeExpr stuff expr),
     BTable counter (flex==Flex) (Reference counter)
          [(translate pattern, makeStmt stuff branch_expr) 
              | (Branch (LPattern pattern) branch_expr) <- branch_list]]
  where counter = unknown  -- later replace with an int
        translate (Intc x) = Bint x
        translate (Charc x) = Bchar x
        translate (Floatc x) = Bfloat x

makeExpr _ (Case _ _ _) = error "FlatToICurry found a multibranch case while making an expression"

makeStmt stuff (Typed expr _) = makeStmt stuff expr
makeExpr stuff (Typed expr _) = makeExpr stuff expr

makeStmt stuff (Let bind_list expr)
  = Comment (show (sorted_list)) :
       execute_plan stuff bind_list plan
          ++ makeStmt stuff expr
  where (sorted_list, plan) = make_plan bind_list

makeExpr _ (Let _ _) = error "FlatToICurry found a let-block while making an expression"

-- makeStmt stuff x = [Comment ("do " ++ show x ++ "  " ++ show stuff)]

execute_plan stuff bind_list plan
  = concatMap (execute_plan_step stuff bind_list) plan

execute_plan_step _ _ (Pforward i) = [Declare (Variable i IBind)]
execute_plan_step stuff (_ ++ [(i, expr)] ++ _) (Passign i)
  = [Assign i (makeExpr stuff expr)]
execute_plan_step stuff (_ ++ [(i, expr)] ++ _) (Pinitialize i)
  = [Declare (Variable i IBind),
     Assign i (makeExpr stuff expr)]
execute_plan_step _ (_ ++ [(i, expr)] ++ _) (Pfill i j)
  = [Fill i (reverse p) j | p <- find_path_set expr j]
