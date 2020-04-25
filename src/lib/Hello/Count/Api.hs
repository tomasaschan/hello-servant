module Hello.Count.Api  where

import           Control.Monad.Reader
import           Servant

import           Hello.Count.Count

type CountAPI = "count" :> Get '[JSON] Int

countApiT :: ServerT CountAPI (Reader State)
countApiT = asks get
