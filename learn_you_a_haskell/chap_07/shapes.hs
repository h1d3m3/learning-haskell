-- Shape can be either
-- 3 construct Circle 
-- 4 construct Rectangle
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
	deriving (Show)

-- take any shape
area :: Shape -> Float
-- pattern match on type
area (Circle _ _ r) = pi * r ^ 2
area (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

{-
*Main> area $ Circle 10 20 10
314.15927
*Main> area $ Rectangle 0 0 100 100
10000.0
*Main> Rectangle 0 0 100 100
Rectangle 0.0 0.0 100.0 100.0
-}
