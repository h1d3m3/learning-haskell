main = do
	-- The returns here are not bound to any name
	-- and they don't mean "return from subroutine"
	return ()
	return "Hello"
	line <- getLine
	return "Blah"
	return 4
	putStrLn line

main2 = do
	a <- return "Hello"
	b <- return "There"
	putStrLn $ a ++ " " ++ b

{-
*Main Data.Char> main
yolk
yolk
*Main Data.Char> main2
Hello There
-}
