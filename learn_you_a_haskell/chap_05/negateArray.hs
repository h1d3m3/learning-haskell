-- takes array of num, returns array of num
negateArray :: (Num a) => [a] -> [a]
-- each element of xs, abs and negate
negateArray xs = map (\x -> negate (abs x)) xs


{-
*Main> negateArray [1..10]
[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]
-}

negateArray' :: (Num a) => [a] -> [a]
-- Same function, now using (.) function composition negate(abs x)
negateArray' xs = map (negate . abs) xs

{-
*Main> negateArray' [1..10]
[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]
-}
