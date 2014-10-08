ex1 xs = if length xs > 0
	then head xs
	else 'Z'

{-
*Main> ex1 []
'Z'
*Main> ex1 ['a'..'z']
'a'
-}

ex2 xs = if not (null xs)
	 then head xs
	 else 'Z'
{-
*Main> ex2 ['a']
'a'
*Main> ex2 []
'Z'
-}


ex3 (x:_) = x
ex3 [] = 'Z'
{-
*Main> ex3 []
'Z'
*Main> ex3 ['a']
'a'
-}

ex4 :: [Char] -> Char
ex4 (x:_) = x
ex4 [] = 'Z'

{-
*Main> ex4 []
'Z'
*Main> ex4 ['a']
'a'
-}

ex5 :: [t] -> Maybe t
ex5 (x:_) = Just x
ex5 [] = Nothing

{-
*Main> ex5 []
Nothing
*Main> ex5 ['a']
Just 'a'
*Main> ex5 [2]
Just 2
-}
