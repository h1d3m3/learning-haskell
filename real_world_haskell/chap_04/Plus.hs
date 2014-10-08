-- infix
a `plus` b = a + b

data a `Pair` b = a `Pair` b deriving (Show)
foo = Pair 1 2
bar = True `Pair` "quux"

{-
*Main> foo
1 `Pair` 2
*Main> bar
True `Pair` "quux"
*Main> 1 `plus` 2
3
*Main> plus 1 2
3
*Main> 1 `Pair` 2
1 `Pair` 2
*Main> Pair 1 2
1 `Pair` 2
-}
