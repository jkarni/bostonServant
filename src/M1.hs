{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module M1 where

import Servant
import Servant.Docs
import Servant.Client
import Servant.JQuery
import Servant.Mock
import Servant.JuicyPixels

import Codec.Picture
import Control.Monad.Trans.Either
import Control.Concurrent
import Control.Concurrent.STM.TVar
import Network.Wai
import Network.Wai.Handler.Warp
import Lackey

type TheAPI = "anint" :> Get '[JSON] Int
         :<|> "anint" :> ReqBody '[JSON] Int :> Post '[JSON] ()

instance ToSample Int Int where
    toSample _ = Just 1797

instance ToSample () () where
    toSample _ = Just ()

api :: Proxy TheAPI
api = Proxy

baseUrl :: BaseUrl
baseUrl = BaseUrl Http "localhost" 8001

getAnInt :: EitherT ServantError IO Int
postAnInt :: Int -> EitherT ServantError IO ()
getAnInt :<|> postAnInt  = client api baseUrl

mockServer :: IO ()
mockServer = run 8001 $ serve api $ mock api

apiDocs :: String
apiDocs = markdown $ docs api

jqueryClient :: String
jqueryClient = jsForAPI api

rubyClient :: String
rubyClient = rubyForAPI api
