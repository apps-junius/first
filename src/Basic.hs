{-# LANGUAGE ScopedTypeVariables #-}

-- 1. Define the data type
data Wrapper a = HasValue a | NoValue | ThirdValue deriving (Show)

add :: Int -> Int -> Int
add x y = x + y

mySubtract :: Int -> Int -> Int
mySubtract x y =
  if x > y
    then
      x - y
    else
      y - x

main :: IO ()
main = do
  let a :: Char = 'a'
  let b :: Int = 5
  let c :: Bool = True
  let d :: Float = 3.14
  let e :: String = "Hello, World!"
  let f :: Integer = 42 -- arbitrary integer type
  let g :: Double = 2.71828
  let h :: () = ()
  print a
  print b
  print c
  print d
  print e
  print f
  print g
  print h

  let l :: [Int] = [1, 2, 3, 4, 5]
  let t :: (Int, String) = (42, "Hello")
  print l
  print t

  print (add 1 1)
  print (mySubtract 1 1)

  case b of
    1 -> putStrLn "b is one"
    2 -> putStrLn "b is two"
    _ -> putStrLn "b is something else"
