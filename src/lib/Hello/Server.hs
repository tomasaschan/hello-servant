module Hello.Server where

import           Servant

import           Hello.Api

type API = UsersAPI

server :: Server API
server = usersApi

proxy :: Proxy UsersAPI
proxy = Proxy

app :: Application
app = serve proxy server
