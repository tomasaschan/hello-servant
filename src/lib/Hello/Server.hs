module Hello.Server where

import           Control.Monad.Reader
import           Data.Default.Class
import           Network.Wai.Middleware.Servant.Errors
import           Servant

import           Hello.Count.Api
import           Hello.Count.Count

type API = CountAPI

proxy :: Proxy API
proxy = Proxy

apiT :: ServerT API (Reader State)
apiT = countApiT

server :: Server API
server = hoistServer proxy readerToHandler apiT

readerToHandler :: Reader State a -> Handler a
readerToHandler r = return $ runReader r def

app :: Application
app = errorMwDefJson $ serve proxy server
