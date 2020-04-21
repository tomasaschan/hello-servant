{-# LANGUAGE DeriveGeneric #-}

module Hello.Users where

import           Data.HodaTime.Calendar.Gregorian
import           Data.HodaTime.CalendarDate
import           Data.Text
import           GHC.Generics

data User = User {
  name      :: Text,
  birthdate :: CalendarDate Gregorian
} deriving (Eq, Show, Generic)
