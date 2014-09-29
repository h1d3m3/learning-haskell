-- takes an a array, gives back an a
last' :: [a] -> a
-- left to right, no init accumulator
-- we don't care about the accum
-- just keep returning until we get to the end
-- last item is the accum (final item in list)
last' = foldl1 (\_ x -> x)


{-
*Main> last' [2,5..100]
98


And as an example....these are the same.
*Main> let f = (+)
*Main> let z = 0
*Main> f 3 (f 4 (f 5 (f 6 z)))
18
*Main> (+) 3 ((+) 4 ((+) 5 ((+) 6 0)))
18
*Main> foldr1 (+) [3..6]
18

-- And this works because addition is commutative left or right)
*Main> foldl1 (+) [3..6]
18
-}
