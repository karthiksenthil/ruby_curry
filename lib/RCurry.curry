-- This modules defines the abstract syntax of the ruby object code
-- resulting from the compilation of a Curry module

-- Same as Flatcurry QName
type RName = (String,String)

data RModule 
  = RModule
    String                      -- name of this ruby module
    [String]                    -- name of required modules
    [RConstructor]              -- data constructors
    [RFunctionDeclaration]      -- list of function names & arity
    [RFunctionDefinition]       -- list of function definitions

data RConstructor
  = RConstructor 
    RName    -- qualified FLP name
    Int      -- arity
    Int      -- index

data RFunctionDeclaration
  = RFunctionDeclaration
    RName
    Int

data RFunctionDefinition
  = RFunctionDefinition
    RName		-- qualified FLP name
    Int         	-- arity
    [RStatement]  	-- function body

-- The H function must return an expression rooted by a constructor.
-- Mode tells whether the expression is rooted by a constructor, or by
-- an operation, or a check of the root must be executed at run-time.
data Mode = Done | Recur | Check

data RStatement
  = RVariable RVarType
  | RAssign Int RExpression
  | RCase RExpression [(Int, (String, [RStatement]))]
  | RReturn Mode RExpression
  | RException String
  | RHFunction RExpression
  | RReplace RExpression RExpression   -- 1st one is expression to be replaced, 2nd is the replacement expr
  | RStatement -- added for unimplemented stuff, remove later

data RVarType
  = RILhs Int Int        -- for ILhs
  | RIVar Int Int Int    -- for IVar
  | Unimpl Int String    -- for unimplemented ICase, IBind, IFree

data RExpression
  = Ref Int
  -- Bool is True for constructor, False for operator
  | Application Bool RName [RExpression]
  -- What is the meaning of the string ???
  | Expr String
  | RExpression -- added for unimplemented stuff, remove later