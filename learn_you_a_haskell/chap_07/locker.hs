import qualified Data.Map as Map

-- using "Either" that is in Prelude
-- data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)

-- State is Taken or Free
data LockerState = Taken | Free deriving (Show, Eq)

-- Code is a string
type Code = String
type LockerNum = Int

-- Create a map using LockerNum as key and a tuple of state and code as value
type LockerMap = Map.Map LockerNum (LockerState, Code)

-- Takes LockerNum and a Map, returns either a String or a code
lockerLookup :: LockerNum -> LockerMap -> Either String Code
-- Lookup lockerNumber in the map, case switch on 
lockerLookup lockerNumber map = case Map.lookup lockerNumber map of
	-- Not there, so use the left of Either to return a string.
	Nothing -> Left $ "Locker " ++ show lockerNumber ++ " doesn't exist!"
	-- Was there and now split the value and check the state
	-- If state is not Taken
	Just (state, code) -> if state /= Taken
		-- Use the code from the map value
		then Right code
		-- State is Take, return message
		else Left $ "Locker " ++ show lockerNumber ++ " is already Taken!"


lockers :: LockerMap  
lockers = Map.fromList   
    [(100,(Taken,"ZD39I"))  
    ,(101,(Free,"JAH3I"))  
    ,(103,(Free,"IQSA9"))  
    ,(105,(Free,"QOTSA"))  
    ,(109,(Taken,"893JJ"))  
    ,(110,(Taken,"99292"))  
    ]  


{-
*Main> lockers 
fromList [(100,(Taken,"ZD39I")),(101,(Free,"JAH3I")),(103,(Free,"IQSA9")),(105,(Free,"QOTSA")),(109,(Taken,"893JJ")),(110,(Taken,"99292"))]
*Main> lockerLookup 101 lockers
Right "JAH3I"
*Main> lockerLookup 901 lockers
Left "Locker 901 doesn't exist!"
*Main> lockerLookup 109 lockers
Left "Locker 109 is already Taken!"
*Main> lockerLookup 100 lockers
Left "Locker 100 is already Taken!"
*Main> lockerLookup 110 lockers
Left "Locker 110 is already Taken!"
*Main> lockerLookup 105 lockers
Right "QOTSA"
-}
