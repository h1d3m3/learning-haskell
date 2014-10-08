sum1 :: Num a => [a] -> a
-- left to right using step as the function
-- step takes the accum and adds it to x coming from xs
-- accum starts at 0
sum1 xs = foldl step 0 xs
	where step acc x = acc + x


sum2 :: Num a => [a] -> a
sum2 xs = foldl (+) 0 xs


sum3 :: Num a => [a] -> a
sum3 = foldl (+) 0


{-
*Main Data.Array> sum [1..10]
55
*Main Data.Array> sum2 [1..10]
55
*Main Data.Array> sum3 [1..10]
55
-}
