-- 1. Define the data type
data Wrapper a = HasValue a | NoValue deriving (Show)

-- 2. Functor instance
instance Functor Wrapper where
  fmap _ NoValue = NoValue
  fmap f (HasValue x) = HasValue (f x)

-- 3. Applicative instance
instance Applicative Wrapper where
  pure x = HasValue x

  NoValue <*> _ = NoValue
  _ <*> NoValue = NoValue
  (HasValue f) <*> (HasValue x) = HasValue (f x)

-- 4. Monad instance
instance Monad Wrapper where
  return x = HasValue x -- or simply 'pure'

  NoValue >>= _ = NoValue
  (HasValue x) >>= f = f x

-- 5. (Optional) MonadFail instance
instance MonadFail Wrapper where
  fail _ = NoValue

-- Example Usage:
addWrapped :: Wrapper Int -> Wrapper Int -> Wrapper Int
addWrapped wx wy = do
  x <- wx
  y <- wy
  return (x + y)

test1 :: Wrapper Int
test1 = addWrapped (HasValue 5) (HasValue 10) -- Results in: HasValue 15

test2 :: Wrapper Int
test2 = addWrapped (HasValue 5) NoValue -- Results in: NoValue

test3 :: Wrapper Int
test3 = do
  (x : xs) <- NoValue -- This would cause a pattern match failure
  return x

-- test3 will be NoValue because of the MonadFail instance.
-- Without MonadFail, it would be a runtime error.

main :: IO ()
main = do
  print test1
  print test2
  print test3