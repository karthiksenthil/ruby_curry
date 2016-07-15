require 'pp'

module CT_External
  
  require 'src/compiler/expressions_include'

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
    return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__28_29,[]))
  end

  # ------------------------------------------------------------------
  # Equality

  def CT_External::CT__3D_3D(expr) # "=="
    left = expr.content.arguments[0]
    right = expr.content.arguments[1]
    loop {
      case left.content.symbol.token
      when 0 #VARIABLE
        # TODO: instantiate to the generator, but we do not have it ???
        # idea: create an equality for each type and dispatch on an object
        raise 'Handling Variables is not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        left.H
        next
      when 2 #FAIL
        return left
      else
        loop {
          case right.content.symbol.token
          when 0 #VARIABLE
            raise 'Handling Variables is not implemented yet'
          when 1, 3 # CHOICE, OPERATION
            right.H
            next
          when 2 #FAIL
            return right
          else
            if left.content.symbol != right.content.symbol
              return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_False,[]))
            else
              arity = left.content.symbol.arity
              if arity == 0
                return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
              end

              # array to hold equality expressions between args
              args_equality = []
              (0...arity).each do |i|
                # left.argi == right.argi
                args_equality << CT_Expressions::Box.new(CT_Expressions::Application.new(
                                  Prelude::CT__3D_3D,[left.content.arguments[i],right.content.arguments[i]]))
              end

              result = args_equality.drop(1).inject(args_equality.first) {
                |accum, x| result = CT_Expressions::Box.new(CT_Expressions::Application.new(
                                                             Prelude::CT__26_26,[accum,x]))
              }
              return result
            end
          end
        } # end of right case loop
      end
    } # end of left case loop 

  end

  def CT_External::CT_compare(expr)
    left = expr.content.arguments[0]
    right = expr.content.arguments[1]
    
    loop{
      case left.content.symbol.token
      when 0 #VARIABLE
        raise 'Handling Variables is not implemented yet'
      when 1, 3 #CHOICE, OPERATION
        left.H
        next
      when 2 #FAIL
        return left
      else
        loop{
          case right.content.symbol.token
          when 0 #VARIABLE
            raise 'Handling Variables is not implemented yet'
          when 1, 3 #CHOICE, OPERATION
            right.H
            next
          when 2 #FAIL
            return right
          else

            if left.content.symbol.compare(right.content.symbol) == -1
              # left symbol alphabetically precedes right symbol
              return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_LT,[]))
            elsif left.content.symbol.compare(right.content.symbol) == 1
              # left symbol alphabetically follows right symbol
              return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_GT,[]))
            elsif left.content.symbol.compare(right.content.symbol) == 0
              # case of equal root symbols
              k = left.content.symbol.arity

              (0..k-1).each do |i|
                tmp = CT_Expressions::Box.new(CT_Expressions::Application.new(
                       Prelude::CT_compare,[left.content.arguments[i],right.content.arguments[i]]))
                tmp.H #execute the comparison

                if tmp == CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_EQ,[]))
                  next
                else
                  return tmp
                end
              end
              #all arguments are equal
              return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_EQ,[]))
            end 

          end
        } # end of right case loop
      end
    } # end of left case loop

  end

  # ------------------------------------------------------------------
  # Equational constraint functions

  def CT_External::CT__3D_3A_3C_3D(expr)  # "=:<="
    left = expr.content.arguments[0]
    right = expr.content.arguments[1]

    loop {
      case left.content.symbol.token
      when 1, 3 # CHOICE, OPERATION
        left.H
        next
      when 2 # FAIL
        return left
      when 0 # VARIABLE
        bind_variable(left, right)
        return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
      else # CONSTRUCTOR

        loop {
          case right.content.symbol.token
          when 1, 3 # CHOICE, OPERATION
            right.H
            next
          when 2 # FAIL
            return right
# TODO: troubles here.  Variable bind, constructor match.
          else # both VARIABLE and CONSTRUCTOR

            k = left.content.symbol.arity
            # declare fresh variables and instaniate right only when VARIABLE
            if right.content.symbol.token == 0
              right = CT_Expressions::Box.new(CT_Expressions::Application.new(left.content.symbol,[]))
              (0..k-1).each do |i|
                right.content.arguments << CT_Expressions::Box.new(CT_Expressions::make_variable)
              end
            end
            # puts "here, k = #{k}" #using for debug

            # check if left and right have same root symbol
            if left.content.symbol == right.content.symbol

              if k == 0 # return true if arity is 0
                return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_True,[]))
              end

              args_const_eql = []
              (0..k-1).each do |i|
                # left.argi =:<= right.argi
                args_const_eql << CT_Expressions::Box.new(CT_Expressions::Application.new(
                                   Prelude::CT__3D_3A_3C_3D,[left.content.arguments[i],right.content.arguments[i]]))
              end

              while args_const_eql.length > 1
                curr_arg = args_const_eql[0]
                next_arg = args_const_eql[1]
                # curr_arg && next_arg
                and_expr = CT_Expressions::Box.new(CT_Expressions::Application.new(
                            Prelude::CT__26_26,[curr_arg,next_arg]))
                args_const_eql[0] = and_expr
                args_const_eql.delete_at(1)
              end

              return args_const_eql[0]

            else
              return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_False,[]))
            end

          end # case right
        }
      end # case left
    }

  end


  # ------------------------------------------------------------------
  # Evaluation functions

  # -- Only for internal use:
  # -- Representation of higher-order applications in FlatCurry.
  # apply :: (a -> b) -> a -> b

  def CT_External::CT_apply(expr)
    # partially applied boxed application
    partial = expr.content.arguments[0]
    # TODO: since Partial is a constructor could use pattern matching
    # TODO: replacing show with to_s would simplify "missing" expression
    if partial.content.symbol.class != CT_Symbols::Partial
      # Here is the case where the partial function
      # is the VALUE of the first argument
      partial.H
    end
    raise "External apply error" unless partial.content.symbol.class == CT_Symbols::Partial
    missing = partial.content.arguments[0].content.symbol.value
    # build the application
    new_argument = expr.content.arguments[1]
    arg_list = partial.content.arguments[1].content.arguments
    new_arg_list = arg_list + [new_argument]
    xsymbol = partial.content.arguments[1].content.symbol
    new_expr = CT_Expressions::Box.new(CT_Expressions::Application.new(xsymbol, new_arg_list))
    if missing==1
      return new_expr
    else
      new_missing = CT_Integer::make_int(missing-1)
      return CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_partial,[new_missing,new_expr]))
    end
  end

  # --- Evaluates the argument to head normal form and returns it.
  # --- Suspends until the result is bound to a non-variable term.
  # ensureNotFree :: a -> a

  def CT_External::CT_ensureNotFree(expr)
    arg = expr.content.arguments[0]
    loop {
      case arg.content.symbol.token
      when 0 # VARIABLE
        raise 'ensureNotFree: suspension is not implemented'
      when 1 # CHOICE
        arg.H()
        next
      when 2 # FAIL
        return arg
      when 3 # OPERATION
        arg.H()
        next
      else
        return arg
      end
    }
    # this return is necessary. Is it still necessary after loop ?
    # return arg
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
    new_expr = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_apply,[arg1,arg2]))
    return new_expr
  end

  # ------------------------------------------------------------------
  # Arithmetic operations
  # division and mod by zero return fail.

  def CT_External::CT_prim_5FInt_5Fplus(expr) # "prim_Int_plus"
    arg1 = expr.content.arguments[0].content.symbol.value
    arg2 = expr.content.arguments[1].content.symbol.value
    return CT_Integer::make_int(arg2+arg1)
  end

  def CT_External::CT_prim_5FInt_5Fminus(expr) # "prim_Int_minus"
    arg1 = expr.content.arguments[0].content.symbol.value
    arg2 = expr.content.arguments[1].content.symbol.value
    return CT_Integer::make_int(arg2-arg1)
  end

  def CT_External::CT_prim_5FInt_5Ftimes(expr) # "prim_Int_times"
    arg1 = expr.content.arguments[0].content.symbol.value
    arg2 = expr.content.arguments[1].content.symbol.value
    return CT_Integer::make_int(arg2*arg1)
  end

  def CT_External::CT_prim_5FInt_5Fdiv(expr) # "prim_Int_div"
    arg1 = expr.content.arguments[0].content.symbol.value
    arg2 = expr.content.arguments[1].content.symbol.value
    if arg1 == 0
      return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[]))
    else
      return CT_Integer::make_int(arg2/arg1)
    end
  end

  def CT_External::CT_prim_5FInt_5Fmod(expr) # "prim_Int_mod"
    arg1 = expr.content.arguments[0].content.symbol.value
    arg2 = expr.content.arguments[1].content.symbol.value
    if arg1 == 0
      return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[]))
    else
      return CT_Integer::make_int(arg2%arg1)
    end
  end

  def CT_External::CT_prim_5FInt_5Fquot(expr) # "prim_Int_quot"
    arg1 = expr.content.arguments[0].content.symbol.value
    arg2 = expr.content.arguments[1].content.symbol.value
    if arg1 == 0
      return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[]))
    else
      x = arg2.fdiv(arg1)
      # print "#{x} = #{arg2}/#{arg1}\n"
      if x >= 0
        return CT_Integer::make_int(x.floor)
      else
        return CT_Integer::make_int(x.ceil)
      end
    end
  end

  def CT_External::CT_prim_5FInt_5Frem(expr) # "prim_Int_rem"
    arg1 = expr.content.arguments[0].content.symbol.value
    arg2 = expr.content.arguments[1].content.symbol.value
    if arg1 == 0
      return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[]))
    else
      return CT_Integer::make_int(arg2.remainder(arg1))
    end
  end

  # ------------------------------------------------------------------
  # Character operations

  def CT_External::CT_prim_5Ford(expr) # "prim_ord"
    arg1 = expr.content.arguments[0].content.symbol.value
    return CT_Integer::make_int(arg1.ord)
  end

  def CT_External::CT_prim_5Fchr(expr) # "prim_chr"
    arg1 = expr.content.arguments[0].content.symbol.value
    if arg1 < 0 or arg1 > 255
      return CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[]))
    else
      return CT_Character::make_char(arg1.chr)
    end
  end


  # ------------------------------------------------------------------
  # File IO operations
  def CT_External::CT_prim_5FreadFileContents(expr)
    arg1 = CT_External::expr_to_string(expr.content.arguments[0])
  end



  # --- A non-reducible polymorphic function.
  # --- It is useful to express a failure in a search branch of the execution.
  # --- It could be defined by: `failed = head []`
  # failed :: _failed external

  CT_External::FAILED = CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_fail,[]))

  def CT_External::CT_failed(expr) # "failed"
    return CT_External::FAILED
  end

  # ------------------------------------------------------------------
  # Utility functions
  def CT_External::expr_to_string(expr)
    puts expr.to_s
    raise
  end

end
