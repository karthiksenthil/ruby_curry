data Integer = Zero | Succ Integer

less_than_equal Zero y = True
less_than_equal (Succ x) Zero = False
less_than_equal (Succ y) (Succ x) = less_than_equal y x

main = less_than_equal (Succ (Succ Zero)) (Succ Zero)