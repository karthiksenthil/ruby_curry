data Nat = Zero | Suc Nat

half Zero = Zero
half (Suc Zero) = Zero
half (Suc (Suc x)) = Suc (half x)

double Zero = Zero
double (Suc x) = Suc (Suc (double x))

two = Suc (Suc Zero)

main = (half two, double two)
