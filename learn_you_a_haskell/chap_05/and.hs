-- Array of bools, return bool
and' :: [Bool] -> Bool
-- take list, right to left, apply && (binary function) to each item
-- where TRUE is initial value and xs is 
-- accum will become false because (x && True) -> accum (t/f)
and' xs = foldr (&&) True xs

{-
*Main> and' [True, True, True]
True

-- The same
*Main> and' [True, False, True]
False
*Main> True && (False && (True && True))
False


-- Nice lazy eval with &&
*Main> and' (repeat False)
False
-}
