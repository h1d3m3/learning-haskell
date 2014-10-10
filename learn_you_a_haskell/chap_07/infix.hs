infixr 5 :-:
-- the List data type takes two possible values
-- 1) Empty
-- 2) a value 'a' with the symbol :-: and a piece of data that is of type List a
-- :-: is infix so we can do 4 :-: Empty instead of :-: 4 Empty
-- The confusing part (for me) was understading how the list was being built
-- The chain is building natually because of the nature of recursive structures.
-- (think nodes in trees)
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

{-
*Main> 3 :-: 4 :-: Empty
3 :-: (4 :-: Empty)
*Main> 5 :-: it
5 :-: (3 :-: (4 :-: Empty))
-}
