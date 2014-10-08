filter1 :: (a -> Bool) -> [a] -> [a]
-- right to left, do step across xs, [] is accum
-- step gets x (head of xs from foldr) and ys (accum)
-- if p(x) is true, prepend x to accum
-- otherwise return ys
-- remember that what step returns builds the accumulator
filter1 p xs = foldr step [] xs
 where step x ys
 	| p x = x : ys
        | otherwise = ys

{-
*Main Data.Array> filter1 (even) [1..10]
[2,4,6,8,10]
-}
