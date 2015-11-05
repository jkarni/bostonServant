{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TypeFamilies #-}
module M2 where

import Data.Proxy
import Control.Monad.Trans.Either
import Network.Wai

data RouteResult a
data ServantErr

type RoutingApplication =
     Request -> (RouteResult Response -> IO ResponseReceived) -> IO ResponseReceived


class HasServer layout where
  type ServerT layout (m :: * -> *) :: *

  route :: Proxy layout -> Server layout -> RoutingApplication

type Server layout = ServerT layout (EitherT ServantErr IO)
