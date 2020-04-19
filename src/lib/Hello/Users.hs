{-# LANGUAGE DeriveGeneric #-}

module Hello.Users where

import           Data.Text
import           GHC.Generics

import           Hello.Date

data User = User {
  name      :: Text,
  birthdate :: Date
} deriving (Eq, Show, Generic)
