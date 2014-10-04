data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

-- take any shape
area :: Shape -> Float
-- pattern match on type
area (Circle _ r) = pi * r ^ 2
area (Rectangle (Point x1 y1) (Point  x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

{-
*Main> area (Rectangle (Point 0 0) (Point 100 100))
10000.0
*Main> area (Circle (Point 0 0) 24)
1809.5574
-}
