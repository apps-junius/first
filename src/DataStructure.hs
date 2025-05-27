-- type and constructor definitions
data BookInfo a = Book a Int String [String]
  deriving (Show)

-- type alias
type BookId = Int

-- enum each one could be a different type
data MyEnum = First | Second | Third Int
  deriving (Show)

-- tempalte parameter
data TemplateStruct a = TemplateConstructor a Int deriving (Show)

main :: IO ()
main = do
  let list :: [Int] = []
  let first = case list of
        [] -> Nothing
        (x : _) -> Just x
  let lastElem = case list of
        [] -> Nothing
        xs -> Just (last xs)
  print first
  print lastElem

  let list :: [Int] = [1, 2, 3, 4, 5]
  print first

  let a :: Maybe Int = Nothing
  print a
  let a = Just 1
  print a

  let book :: BookInfo Int = Book 1 1 "Haskell Programming" ["Author A", "Author B"]
  print book

  let first = Third 1
  print first

  let template = TemplateConstructor "Hello, Template!" 100
  print template
