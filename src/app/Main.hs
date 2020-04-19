module Main where

import           Network.Wai.Handler.Warp

import           Hello.Server

main :: IO ()
main = do
  putStrLn "Listening on :8081"
  run 8081 app
