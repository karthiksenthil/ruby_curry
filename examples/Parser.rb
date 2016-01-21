require_relative '../src/compiler/expressions.rb'

module Parser

  # TODO: Extend to parse expression with a "where" clause.

  # Take a string s.
  # Return an expression of which s is a representation.

  def Parser.compile(s)
    s.strip!
    v, l = root(s)
    printf("Warning, unparsed \"%s\" \n", l) if l != ""
    return v
  end

  # Return the internal representation of an expression
  # and the string that remains to be parsed
  def Parser.root(s)
    case s
    when /^(\d+)(.*)/
      # A number is a 0-ary function application (for replacement)
      return Application.new($1.to_i, []), $2
    when /(^[A-Za-z]\w*|\?|\+|\*|\-|\/)(.*)/
      arg, rest = parseArg($2)
      return Application.new($1, arg), rest
    else
      throw Exception.exception("Parse error " + s.to_s) 
    end
  end

  def Parser.parseArg(s)
    # printf("parsing %s \n", s)
    arg, rest = [], s
    if s[0] == ?( then
      loop do
        # printf("looping %s \n", rest)
        # The 1st char of rest is ',' or '('
        k, rest = root(rest[1..-1])
        # printf("Arg %s rest %s \n", k, rest)
        # optimistically store arg 
        arg << k
        case rest[0]
        when ?,
          next
        when ?)
          rest = rest[1..-1]
          break
        else
          throw Exception.exception("Parse error " + rest)
        end
      end
    end
    # printf("parseArg return %s %s \n", arg, rest)
    return arg, rest
  end

end


expr = Parser.compile("append(nil,y)")
puts expr.inspect