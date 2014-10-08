-- simple square of an array
square :: [Double] -> [Double]
square (x:xs) = x * x : square xs
square [] = []

-- A different way to do it
square1 :: [Double] -> [Double]
square1 xs = map (^2) xs

-- defining the function in a local scope
square2 :: [Double] -> [Double]
square2 xs = map squareOne xs
	     where squareOne x = x * x

{-
*Main> square [1,2,3]
[1.0,4.0,9.0]
*Main> square []
[]
*Main> square1 [1,2,3]
[1.0,4.0,9.0]
*Main> square1 []
[]
*Main> square2 [1,2,3]
[1.0,4.0,9.0]
*Main> square2 []
[]
-}
