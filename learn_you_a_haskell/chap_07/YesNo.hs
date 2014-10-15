-- Whatever concrete types (a) are created of this typeclass, it must implement yesno, take a and return Bool
class YesNo a where
	yesno :: a -> Bool

-- For Int - only 0 is false
instance YesNo Int where
	yesno 0 = False
	yesno _ = True

-- for lists - Anything in an array
instance YesNo [a] where
	yesno [] = False
	yesno _ = True

-- for Bool - id is used to just evaluate the param 
instance YesNo Bool where
--	yesno = id
	yesno x = id x

-- for concrete Maybe
-- anything Just is ok, Nothing is false
instance YesNo (Maybe a) where
	yesno (Just _) = True
	yesno Nothing = False


data TrafficLight = Red | Yellow | Green

-- For TrafficLight
instance YesNo TrafficLight where  
    yesno Red = False  
    yesno _ = True 

-- x must be YesNo
-- takes a value, a yes action and a no action and returns one of those actions
yesNoIf :: (YesNo x) => x -> a -> a -> a
yesNoIf val yesResult noResult = if yesno val then yesResult else noResult


{-
*Main> yesno $ length []
False
*Main> yesno "haha"
True
*Main> yesno ""
False
*Main> yesno $ Just 0
True
*Main> yesno True
True
*Main> yesno []
False
*Main> yesno [1]
True
*Main> :t yesno
yesno :: YesNo a => a -> Bool
*Main> :i yesno
class YesNo a where
  yesno :: a -> Bool
  	-- Defined at YesNo.hs:3:9
*Main> yesNoIf [] "Yes!" "No!"
"No!"
*Main> yesNoIf Nothing "Yes!" "No!"
"No!"
*Main> yesNoIf (Just 1) "Yes!" "No!"
"Yes!"
*Main> yesNoIf (Just 1) 1 2
1
-}
