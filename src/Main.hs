-- Enables automatic derivation of Generic
{-# LANGUAGE DeriveGeneric #-}
-- Allows string literals to be Text or ByteString
{-# LANGUAGE OverloadedStrings #-}

import Data.Aeson (FromJSON, ToJSON, decode, encode)
import GHC.Generics

data Person = Person
  { name :: String,
    age :: Int,
    isStudent :: Bool,
    city :: Maybe String -- Optional field
  }
  deriving (Show, Generic) -- Add Generic

instance ToJSON Person

instance FromJSON Person

main :: IO ()
main = do
  let json = Person "Alice" 30 True (Just "Wonderland")
  let jsonString = encode json

  putStrLn $ "JSON String: " ++ show jsonString
  let decodedJson = decode jsonString :: Maybe Person
  case decodedJson of
    Just person -> putStrLn $ "Decoded Person: " ++ show person
    Nothing -> putStrLn "Failed to decode JSON"
