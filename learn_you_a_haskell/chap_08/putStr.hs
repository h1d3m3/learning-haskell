-- takes a string, returns an IO action 
putStr' :: String -> IO ()
-- empty string means empty IO action
putStr' [] = return ()
putStr' (x:xs) = do
	-- write the first char of the string out
	putChar x
	-- recurse on the rest of the string
	putStr' xs

{-
*Main Data.Char> putStr' "hello"
hello*Main Data.Char> 
-}
