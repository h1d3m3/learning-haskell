import Control.Monad
import Data.Char

main = forever $ do
	putStr "Give some input: "
	l <- getLine
	putStrLn $ map toUpper l


{-
Ok, modules loaded: Main.
*Main Data.Char Control.Monad> main
Give some input: sdf
SDF
Give some input: sdfasd
SDFASD
Give some input: ^CInterrupted.
*Main Data.Char Control.Monad>
-}
