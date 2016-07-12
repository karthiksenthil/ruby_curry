-- This modules defines the abstract syntax of the ruby object code
-- resulting from the compilation of a Curry module

-- Same as Flatcurry QName
type RName = (String,String)

data RModule 
  = RModule
    String                      -- name of this ruby module
    [String]                    -- name of required modules
    [RDatatype]                 -- algebraic type
    [RFunctionDeclaration]      -- list of function names & arity
    [RFunctionDefinition]       -- list of function definitions

data RDatatype = RDatatype RName [RConstructor]

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
  | RFill Int [Int] Int
  --
  | RATable RExpression [(RConstructor, [RStatement])]
  | RBTable RExpression [(RBuiltin, [RStatement])]
  | RReturn Mode RExpression
  | RExternal String    -- call an external (coded in ruby) function
  | RException String   -- TODO: What is this for
  | RComment String
  | Recur_On_Arg RExpression

data RVarType
  = RILhs Int Int
  | RIVar Int Int Int
  | RICase Int
  | RIFree Int
  | RIBind Int

data RBuiltin = Rint Int | Rchar Char | Rfloat Float 

data RExpression
  = Ref Int
  -- Bool is True for constructor, False for operator
  | Application Bool RName [RExpression]
  | RPartial Int RExpression
  | Integer Int
  | Character Char
  | FailExpression
  | ROr RExpression RExpression   -- produced by overlapping rules
