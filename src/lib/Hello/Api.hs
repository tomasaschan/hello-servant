{-# OPTIONS_GHC -fno-warn-orphans #-}

module Hello.Api where

import           Data.Aeson
import           Data.Text
import           Servant

import           Hello.Date
import           Hello.Db    as Db
import           Hello.Users

type UsersAPI  = "users" :> Get '[JSON] [UserData]
              -- :<|> "user" :> Capture "userid" Nat :> Get '[JSON] (Maybe UserData)
              -- :<|> "users" :> ReqBody '[JSON] User :> PostCreated '[JSON] UserData
              -- :<|> "user" :> Capture "userid" Nat :> ReqBody '[JSON] User :> Put '[JSON] UserData

instance ToJSON UserData
instance ToJSON User
instance ToJSON Date where
  toJSON  = String . pack . show

list :: Handler [UserData]
list = return $ getUsers Name

usersApi :: Server UsersAPI
usersApi = list
