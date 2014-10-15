import Control.Monad

-- when takes a Bool, and a m()
-- If bool is not true, it returns an empty ()
when1 = do
	input <- getLine
	when (input == "PASS") $ do
		putStrLn input

-- does the same thing
when2 = do
	input <- getLine
	if (input == "PASS")
		then putStrLn input
	else return ()
{-
*Main Data.Char Control.Monad> :t when
when :: Monad m => Bool -> m () -> m ()

*Main Data.Char Control.Monad> let abc = do putStr "Hello"
*Main Data.Char Control.Monad> :t abc
abc :: IO ()
*Main Data.Char Control.Monad> let def = return ()
*Main Data.Char Control.Monad> :t def
def :: Monad m => m ()

*Main Data.Char Control.Monad> when1
PASS
PASS
*Main Data.Char Control.Monad> when1
ALKJ
*Main Data.Char Control.Monad> 
*Main Data.Char Control.Monad> when2
PASS
PASS
*Main Data.Char Control.Monad> when2
ASDF
*Main Data.Char Control.Monad> 
-}
