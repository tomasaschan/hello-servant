{-# LANGUAGE DeriveGeneric #-}

module Hello.Db where

import           Data.Ord
import           Data.Sort
import           GHC.Generics

import           Hello.Date
import           Hello.Users

data UserData = UserData {
  id   :: Int,
  user :: User
} deriving (Eq, Show, Generic)

users :: [UserData]
users =
  [ UserData 1 (User "Tomas" ( Date 1987 8 23))
  , UserData 2 (User "Sara" (Date 1989 11 29))
  ]


data SortBy = Age | Name

getUsers :: SortBy -> [UserData]
getUsers Name = sortOn (name . user) users
getUsers Age  = sortOn (Down . birthdate . user) users
