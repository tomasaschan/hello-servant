{-# LANGUAGE DeriveGeneric #-}

module Hello.Date where

import           GHC.Generics
import           Text.Printf

data Date = Date {
  year  :: Int,
  month :: Int,
  day   :: Int
} deriving (Eq, Generic)

instance Show Date where
  show (Date y m d) = printf "%d-%02d-%02d" y m d

instance Ord Date where
  compare a b = compare (show a) (show b)
