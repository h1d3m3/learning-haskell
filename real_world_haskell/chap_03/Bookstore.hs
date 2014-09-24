-- BookInfo type constructor
-- Book value constructor
data BookInfo = Book Int String [String]
		deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

-- Creates a book
myInfo = Book 9780135072455 "Algebra of Programming" ["Richard Bird", "Oege de Moor"]

-- type and constructor can have same name
-- Synonmyms can be defined later
data BookReview = BookReview BookInfo CustomerID String deriving (Show)

-- These are synonyms
type CustomerID = Int
type ReviewBody = String

data BetterReview = BetterReview BookInfo CustomerID ReviewBody
                    deriving (Show)

-- Can create synonyms for data as well
type BookRecord = (BookInfo, BookReview)


myReview = BookReview myInfo 12345 "some review"
myRecord = (myInfo, myReview)


-- :t fst myRecord is fst myRecord :: BookInfo


type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)

myBill = CreditCard "2901650221064486" "Thomas Gradgrind" ["Dickens", "England"]

-- Each value constructor matches and returns a value
-- Note that the "Book" is what we're creating, and each named "parameter" matches the BookInfo definition above (binding)
bookID      (Book id title authors) = id
bookTitle   (Book id title authors) = title
bookAuthors (Book id title authors) = authors

-- _ are wildcards to be discarded/ignored (no binding)
nicerID      (Book id _     _      ) = id
nicerTitle   (Book _  title _      ) = title
nicerAuthors (Book _  _     authors) = authors
