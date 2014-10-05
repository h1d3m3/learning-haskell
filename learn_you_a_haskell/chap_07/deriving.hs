data Day = Mon | Tues | Wed | Thurs | Fri | Sat | Sun deriving (Eq, Ord, Show, Read, Bounded, Enum)


{-

--Show
*Main> Wed 
Wed
*Main> Sat 
Sat

-- Ord and Eq
*Main> Mon > Fri
False
*Main> Mon < Fri
True
*Main> Thurs `compare` Sat
LT

-- Bounded
*Main> minBound :: Day
Mon
*Main> maxBound :: Day
Sun

-- Enum
*Main> succ Sat
Sun
*Main> succ Sun
*** Exception: succ{Day}: tried to take `succ' of last tag in enumeration
*Main> pred Sun
Sat
*Main> [Mon .. Thurs]
[Mon,Tues,Wed,Thurs]
*Main> [Mon ..]
[Mon,Tues,Wed,Thurs,Fri,Sat,Sun]
*Main> [Mon,Wed ..]
[Mon,Wed,Fri,Sun]
-}
