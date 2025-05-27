{-# LANGUAGE ScopedTypeVariables #-}

-- 1. Define the data type
data Wrapper a = HasValue a | NoValue | ThirdValue deriving (Show)

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