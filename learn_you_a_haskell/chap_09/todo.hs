import System.Environment
import System.Directory
import System.IO
import Data.List
import Control.Exception

-- where the app starts
main = do
	-- from argv, get the command, and the rest
	(command:argList) <- getArgs
	-- call dispatch function with the command and the rest
	dispatch command argList


-- takes a command, "the rest" and performs an IO
dispatch :: String -> [String] -> IO()
-- pattern match on the command return the right function to pass "the rest" to
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove
-- In this case, we have a command, but we will call a special
-- unknown command handler (doesn't get "the rest"
dispatch command = doesntExist command


-- dispatched command function, takes the rest of the argv and performs an IO
add :: [String] -> IO()
-- split the rest into the filename and what to add into it
-- append the item to the end of the file
add [fileName,todoItem] = appendFile fileName (todoItem ++ "\n")
-- unmatched pattern
add _ = putStrLn "The add command takes exactly two arguments"

view :: [String] -> IO ()
-- only need the filename
view [fileName] = do
	-- read in the file
	contents <- readFile fileName
		-- array of tasks by splitting contents by newlines
	let 	todoTasks = lines contents
		-- combine index and tasks (n and line) into a single string of num - item
		numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks		
	-- join lines with newlines and print
	putStr $ unlines numberedTasks
-- didn't match a single argument
view _ = putStrLn "The view command takes exactly one argument"

remove :: [String] -> IO ()
remove [fileName, numberString] = do
	contents <- readFile fileName
	let 	todoTasks = lines contents
		numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
	putStrLn "These are your TO-DO items:"
	mapM_ putStrLn numberedTasks
	let	number = read numberString
		newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
	bracketOnError (openTempFile "." "temp")
		(\(tempName, tempHandle) -> do
			hClose tempHandle
			removeFile tempName)
		(\(tempName, tempHandle) -> do
			hPutStr tempHandle newTodoItems
			hClose tempHandle
			removeFile "todo.txt"
			renameFile tempName "todo.txt")
remove _ = putStrLn "The remove command takes exactly two arguments"
	
doesntExist :: String -> [String] -> IO()
doesntExist command _ = putStrLn $ "The " ++ command ++ " command doesn't exist"
