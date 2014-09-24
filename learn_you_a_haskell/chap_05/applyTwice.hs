-- takes a function and some a, returns a
applyTwice :: (a -> a) -> a -> a
-- function is f, some value is x
-- apply f to x, get the result, do the function again with the result
applyTwice f x = f (f x)

{-
*Main> applyTwice (+3) 10
16

*Main> applyTwice (*3) 10
90
-}
