-- define different functions
myAdd :: Int -> Int -> Int
myAdd x y = x + y

-- a could be any type
myTempAdd :: a -> Int -> Int
myTempAdd x y = y

-- a could be tuple of any types
myTempAdd2 :: a -> Int -> Int
myTempAdd2 x y = y

-- type class definition
class BasicEq a where
  isEqual :: a -> a -> Bool

-- Bool instance
instance BasicEq Bool where
  isEqual True True = True
  isEqual False False = True
  isEqual _ _ = False

-- Int instance
instance BasicEq Int where
  isEqual 5 y = False
  isEqual x y = x == y

data Color = Red | Green | Blue
  deriving (Read, Show, Eq, Ord)

main :: IO ()
main = do
  -- \$ used to apply a function to an argument
  let a = (myAdd 1) $ 2
  print a

  let b = myTempAdd True 4
  print b

  let c = myTempAdd2 (True, "Hello") 4
  print c

  let d = isEqual True False
  print d

  let e = isEqual (5 :: Int) (5 :: Int)
  print e
  print Red