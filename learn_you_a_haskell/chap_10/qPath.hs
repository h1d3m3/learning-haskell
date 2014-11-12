import Data.List

-- structure to hold data (paths a, b and c)
data Section = Section {getA :: Int, getB :: Int, getC :: Int } deriving Show
-- build all the paths 
type RoadSystem = [Section]

{-
A-50-A1
     |
     30 C
     |
B-10-B1
-}

-- An example of all paths and costs
heathrowToLondon :: RoadSystem
heathrowToLondon  = [ 	Section 50 10 30,
			Section 5 90 20,
			Section 40 2 25,
			Section 10 8 0 ]	

-- Possible labels
data Label = A | B | C deriving (Show)
-- Structure for one path taken
type Path = [(Label, Int)]


-- we're building two paths, A and B
-- take one section to determine cost of each route
-- return best path to to A and to B (paths are built here)
roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) =
		-- total time on accum paths
	let	timeA = sum (map snd pathA)
		timeB = sum (map snd pathB)
		-- A - cost just going ahead
		forwardTimeToA = timeA + a
		-- A - cost starting below and crossing
		crossTimeToA = timeB + b + c
		-- same for B
		forwardTimeToB = timeB + b
		crossTimeToB = timeA + a + c
		-- tack on best time for A
		newPathToA = 	if forwardTimeToA <= crossTimeToA
				then (A, a):pathA
				-- this is reversed
				else (C,c):(B,b):pathB
		-- tack on best time for B
		newPathToB = 	if forwardTimeToB <= crossTimeToB
				then (B, b):pathB
				else (C,c):(A,a):pathA
	-- return the result
	in (newPathToA, newPathToB)

-- Given a system, return a path
optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
		-- left to right over each item in roadsystem, accum paths on epmty lists
	let	(bestAPath, bestBPath) = foldl roadStep ([],[]) roadSystem
		-- sum up the cost of best A and compare with sum of cost of best B
	in	if sum (map snd bestAPath) <= sum (map snd bestBPath)
		-- the path is built in reverse, make it normal
		then reverse bestAPath
		else reverse bestBPath

-- input grouping count and an array, build array of subarrays of count length
groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
groupsOf n xs = take n xs : groupsOf n (drop n xs)


main = do
	contents <- getContents
	let 	threes = groupsOf 3 (map read $ lines contents)
		roadSystem = map (\[a,b,c] -> Section a b c) threes
		path = optimalPath roadSystem
		pathString = concat $ map (show . fst) path
		pathTime = sum $ map snd path
	putStrLn $ "The best path to take is: " ++ pathString
	putStrLn $ "Time taken is: " ++ show pathTime



{-
*Main> heathrowToLondon 
[Section {getA = 50, getB = 10, getC = 30},Section {getA = 5, getB = 90, getC = 20},Section {getA = 40, getB = 2, getC = 25},Section {getA = 10, getB = 8, getC = 0}]
*Main> let (Section a b c) = head heathrowToLondon
*Main> a
50
*Main> b
10
*Main> c
30
*Main> roadStep ([],[]) (head heathrowToLondon)
([(C,30),(B,10)],[(B,10)])
-- paths are reversed here.
-- This is saying, best path to the next A is to start on B and cross to A
-- and the best path to next B is to go straight on B
*Main> optimalPath heathrowToLondon 
[(B,10),(C,30),(A,5),(C,20),(B,2),(B,8),(C,0)]
*Main> groupsOf 3 [4..10]
[[4,5,6],[7,8,9],[10]]

$ runhaskell qPath.hs < paths.txt 
The best path to take is: BCACBBC
Time taken is: 75

Main> mapM_ print (take 300 $ randomRs (1,30) (mkStdGen 3) :: [Int]) -- will produce random paths

$ runhaskell qPath.hs < paths2.txt 
The best path to take is: AAAAAACBBBBBBBBCAAAAAACBBBBBBBBCAAAAACBBBBCAAAAAAAAACBBBBBBBBBBBBBBBBBBCAAACBBCAAAAAAAAACBBBBBBCAAAAAAAAAAAAAAAA
Time taken is: 1409

-}

