{-# LANGUAGE DeriveGeneric #-}

module Hello.Db where

import           Data.HodaTime.Calendar.Gregorian
import           Data.Maybe
import           Data.Ord
import           Data.Sort
import           GHC.Generics

import           Hello.Users

data UserData = UserData {
  id   :: Int,
  user :: User
} deriving (Eq, Show, Generic)

users :: [UserData]
users =
  [ UserData 1 (User "Tomas" (fromJust $ calendarDate 23 August 1987))
  , UserData 2 (User "Sara" (fromJust $ calendarDate 29 November 1989))
  ]


data SortBy = Age | Name

getUsers :: SortBy -> [UserData]
getUsers Name = sortOn (name . user) users
getUsers Age  = sortOn (Down . birthdate . user) users
