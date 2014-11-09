import System.Random
import Control.Monad(when)

-- start
main = do
	-- create a *new* global random Generator
	gen <- newStdGen
	-- pass that gen into the function
	askForNumber gen

askForNumber :: StdGen -> IO()
askForNumber gen = do
	-- pick a rand number between 1 and 10, return integer
	let (randNumber, newGen) = randomR (1,10) gen :: (Int, StdGen)
	putStrLn "Which number in the range from 1 to 10 am I thinking of? "
	numberString <- getLine
	-- perform operation when value in numberString
	when (not $ null numberString) $ do
		-- turn string (input) into Int
		let number = read numberString
		if randNumber == number
			then putStrLn "You Are Correct!"
			else putStrLn $ "Sorry, it was " ++ show randNumber

{-
*Main> numberString <- getLine
10
*Main> numberString 
"10"
*Main> read numberString :: Int
10
-}

