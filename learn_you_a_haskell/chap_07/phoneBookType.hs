-- Add some more details about the type elements
type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

-- makes the functions more readable
inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnum pbook = (name, pnum) `elem` pbook

-- type declaration 1
phoneBook :: PhoneBook
phoneBook = 
    [("betty","555-2938")  
    ,("bonnie","452-2928")  
    ,("patsy","493-2928")  
    ,("lucille","205-2928")  
    ,("wendy","939-8282")  
    ,("penny","853-2492")  
    ]  

phoneBook2 = 
    [("betty2","555-2938")  
    ,("bonnie2","452-2928")  
    ,("patsy2","493-2928")  
    ,("lucille2","205-2928")  
    ,("wendy2","939-8282")  
    ,("penny2","853-2492")  
    ] :: PhoneBook


{-
*Main> phoneBook2 
[("betty2","555-2938"),("bonnie2","452-2928"),("patsy2","493-2928"),("lucille2","205-2928"),("wendy2","939-8282"),("penny2","853-2492")]
*Main> :t phoneBook
phoneBook :: PhoneBook
inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
*Main> inPhoneBook "betty" "555-2938" phoneBook
True
*Main> inPhoneBook "betty" "555-2938" phoneBook2
False
-}
