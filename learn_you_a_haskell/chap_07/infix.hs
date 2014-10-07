infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

{-
*Main> 3 :-: 4 :-: Empty
3 :-: (4 :-: Empty)
*Main> 5 :-: it
5 :-: (3 :-: (4 :-: Empty))
-}
