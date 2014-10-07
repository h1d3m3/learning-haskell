numbers :: [Integer]
-- begin array with 0:
-- map +1 function over the array given by the next numbers call which is
-- [0] (so the first call is map (+1) [0] to make [0,1], then on the next call
numbers = 0:map (1+) numbers

-- empty list returns empty
take' n [] = []
-- don't take anything
take' 0 l = []
-- split, keep reducing n and remaining list set
take' n (x:xs) = x:take' (n-1) xs


{-
-- numbers is an ifinite list

*Main> take' 2 numbers
[0,1]
*Main> take' 30 numbers
[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]
-}
