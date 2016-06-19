require 'pp'

module CT_External
  
  require 'src/compiler/expressions.rb'
  require 'src/compiler/symbols.rb'

  # ------------------------------------------------------------------
  # Example

  # This is an example of external function declared as:
  # -- argument is the duration in millseconds
  # ring_a_bell :: Int -> ()
  # ring_a_bell external
  # The calling program is in curry_example/my_external.curry
  def CT_External::CT_ring_5Fa_5Fbell(expr)
    # we assume that expr is a literal integer
    # otherwise, go by cases.
    value = expr.content.arguments[0].content.symbol.value
    printf("   *** Ringing a bell for %d msec. ***\n", value)
    # return a value (the only one) of the declared type
    return Box.new(Application.new(Prelude::CT__28_29,[]))
  end

  # ------------------------------------------------------------------
  # Equality

  def CT_External::CT__3D_3D(expr)
    abort "ABORT: (==) not yet defined"
  end

  def CT_External::CT_compare(expr)
    abort "ABORT: \"compare\" not yet defined"
  end

  # ------------------------------------------------------------------
  # Evaluation functions

  # -- Only for internal use:
  # -- Representation of higher-order applications in FlatCurry.
  # apply :: (a -> b) -> a -> b

  def CT_External::CT_apply(expr)
    # partially applied boxed application
    partial = expr.content.arguments[0]
    if partial.content.symbol.class != Partial
      # Here is the case where the partial function
      # is the VALUE of the first argument
      partial.H
    end
    raise "External apply error" unless partial.content.symbol.class == Partial
    missing = partial.content.arguments[0].content.symbol.value
    # build the application
    new_argument = expr.content.arguments[1]
    arg_list = partial.content.arguments[1].content.arguments
    new_arg_list = arg_list + [new_argument]
    xsymbol = partial.content.arguments[1].content.symbol
    new_expr = Box.new(Application.new(xsymbol, new_arg_list))
    if missing==1
      return new_expr
    else
      new_missing = Box.new(Int_expression.new(missing-1))
      return Box.new(Application.new(CT_System::CT_partial,[new_missing,new_expr]))
    end
  end

  # --- Evaluates the argument to head normal form and returns it.
  # --- Suspends until the result is bound to a non-variable term.
  # ensureNotFree :: a -> a

  def CT_External::CT_ensureNotFree(expr)
    arg = expr.content.arguments[0]
    case arg.content.symbol.token
    when 0 # VARIABLE
      raise 'ensureNotFree: suspension is not implemented'
    when 1 # CHOICE
      arg.H()
    when 2 # FAIL
      Box.new(Application.new(CT_System::CT_fail,[]))
    when 3 # OPERATION
      arg.H()
    else
      arg
    end
    # this return is necessary
    return arg
  end

  # --- Right-associative application with strict evaluation of its argument
  # --- to head normal form.
  # ($!)    :: (a -> b) -> a -> b
  # $! f x = f x.H

  def CT_External::CT__24_21(expr) # "$!"
    arg1 = expr.content.arguments[0]
    arg2 = expr.content.arguments[1]
    case arg2.content.symbol.token
    when 0 # VARIABLE
      raise '$!: variables not implemented'
    when 1 # CHOICE
      arg2.H()
    when 2 # FAIL
      arg2 # It is already a fail
    when 3 # OPERATION
      arg2.H()
    else
      # nothing to do, arg2 is already a HNF
    end
    new_expr = Box.new(Application.new(Prelude::CT_apply,[arg1,arg2]))
    return new_expr
  end

  # ------------------------------------------------------------------
  # Arithmetic operations
  # division and mod by zero return fail.

  def CT_External::CT_prim_5FInt_5Fplus(expr) # "prim_Int_plus"
    arg1 = expr.content.arguments[0].content.symbol.value
    arg2 = expr.content.arguments[1].content.symbol.value
    return make_int(arg2+arg1)
  end

  def CT_External::CT_prim_5FInt_5Fminus(expr) # "prim_Int_minus"
    arg1 = expr.content.arguments[0].content.symbol.value
    arg2 = expr.content.arguments[1].content.symbol.value
    return make_int(arg2-arg1)
  end

  # --- A non-reducible polymorphic function.
  # --- It is useful to express a failure in a search branch of the execution.
  # --- It could be defined by: `failed = head []`
  # failed :: _failed external

  def CT_External::CT_failed(expr) # "failed"
    return Box.new(Application.new(CT_System::CT_fail,[]))
  end

end
