-- data a `Pair` b = a `Pair` b
--   deriving (Show)

combineWithSpace :: String -> String -> String
combineWithSpace s1 s2 = s1 ++ " " ++ s2

(+++) :: String -> String -> String
s1 +++ s2 = s1 ++ "---" ++ s2

main :: IO ()
main = do
  -- break example
  let (a, b) = break (== ' ') "Hello abc World"
  print (a, b)

  -- a `Pair` b = a + b

  -- infix function example
  let pair = "Hello" `combineWithSpace` "World"
  print pair

  let customCombined = "Part1" +++ "Part2"
  print customCombined
