
myMap :: (a -> b) -> [a] -> [b]
myMap f (x:xs) = f x : myMap f xs
myMap _ _ = []

{-
*Main> myMap (^2) [1,2,3]
[1,4,9]
*Main> myMap (^2) []
[]
*Main> myMap (even) [1,2,3]
[False,True,False]
-}
