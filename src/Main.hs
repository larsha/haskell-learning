{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty

main = do
    scotty 3000 $ do
        get "/" $ do
            text "hello world!"
