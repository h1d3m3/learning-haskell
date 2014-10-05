-- Polymorphic 
data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)

-- Becomes "Either" (a Left or Right)
-- But there are two value constructors (a and b)
-- Which one gets used depends on the concrete constructor used.



{-
*Main> Main.Right 20
Right 20
*Main> Main.Left "abc"
Left "abc"
*Main> :t Main.Right 'a'
Main.Right 'a' :: Main.Either a Char
*Main> :t Main.Left True
Main.Left True :: Main.Either Bool b
-}
