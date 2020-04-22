{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE FlexibleInstances #-}

module Hello.Api where

import           Control.Lens
import           Data.Aeson
import           Data.HodaTime.Calendar.Gregorian
import           Data.HodaTime.CalendarDate
import           Data.Maybe
import           Data.Text
import           Servant
import           Text.Printf

import           Hello.Db                         as Db
import           Hello.Users

type UsersAPI  = "users" :> QueryParam "sortby" SortBy :> Get '[JSON] [UserData]
              -- :<|> "user" :> Capture "userid" Nat :> Get '[JSON] (Maybe UserData)
              -- :<|> "users" :> ReqBody '[JSON] User :> PostCreated '[JSON] UserData
              -- :<|> "user" :> Capture "userid" Nat :> ReqBody '[JSON] User :> Put '[JSON] UserData

instance ToJSON UserData
instance ToJSON User
instance ToJSON (CalendarDate Gregorian) where
  toJSON dt = String . pack $ printf "%u-%02u-%02u" y m d
    where
      y = view year dt
      m = view monthl dt + 1
      d = view day dt

instance FromHttpApiData SortBy where
  parseQueryParam sortBy =
    case toLower sortBy of
      "name" -> Right Name
      "age"  -> Right Age
      _      -> Left $ append "Invalid sort order: " sortBy

list :: Maybe SortBy -> Handler [UserData]
list = return . getUsers . fromMaybe Id

usersApi :: Server UsersAPI
usersApi = list
