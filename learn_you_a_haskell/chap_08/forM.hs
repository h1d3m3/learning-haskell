import Control.Monad

main = do
	-- get an IO for each item in the array
	letters <- forM [1,2,3,4] (\a -> do
		-- lambda takes a num, gets an input, returns it
		putStrLn $ "Enter a letter for " ++ show a ++ " : "
		letter <- getLine
		return letter)
	putStrLn "The letters you gave are : " 
	mapM putStrLn letters
	-- or forM colors putStrLn does the same thing

{-
-- takes an array a and (a function with a, returns IO ) and returns an action on an array
-- build input letters array, map IO over letters array
*Main Data.Char Control.Monad> :t forM
forM :: Monad m => [a] -> (a -> m b) -> m [b]
Ok, modules loaded: Main.
*Main Data.Char Control.Monad> main
Enter a letter for 1 : 
a
Enter a letter for 2 : 
b
Enter a letter for 3 : 
c
Enter a letter for 4 : 
d
The letters you gave are : 
a
b
c
d
[(),(),(),()]
-}
