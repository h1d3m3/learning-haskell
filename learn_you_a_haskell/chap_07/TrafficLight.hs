data TrafficLight = Red | Yellow | Green

-- implements minimal complete 
instance Eq TrafficLight where
	Red == Red = True
	Yellow == Yellow = True
	Green == Green = True
	_ == _ = False


-- Match for each type
instance Show TrafficLight where
	show Red = "Red Light"
	show Yellow = "Yellow Light"
	show Green = "Green Light"

{-
*Main> Red
Red Light
*Main> Red == Red
True
*Main> [Red, Yellow, Green]
[Red Light,Yellow Light,Green Light]
*Main> 
-}
