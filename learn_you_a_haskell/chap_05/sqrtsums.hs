-- Just returns an Int
sqrtSums :: Int

-- map sqrt over inf list
-- left to right (no accum) map +
-- keep taking until the scan returns value > 1000
-- count the number taken because the next one is over 1000
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map (sqrt) [1..]))) + 1

{-
*Main> sqrtSums 
131
*Main> sum (map (sqrt) [1..131])
1005.0942035344083
*Main> sum (map (sqrt) [1..130])
993.6486803921487
-}

