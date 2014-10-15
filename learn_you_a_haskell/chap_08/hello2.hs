 main = do
	putStrLn "What is your name?"
	name <- getLine
	putStrLn ("Hello " ++ name ++ ", how are you?")

{-
$ ghc --make hello2
[1 of 1] Compiling Main             ( hello2.hs, hello2.o )
Linking hello2 ...
$ ./hello2
What is your name?
Joe
Hello Joe, how are you?
-}
