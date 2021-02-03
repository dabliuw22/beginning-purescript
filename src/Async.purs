module Async (async) where

import Data.Time.Duration as Duration
import Effect.Aff (Aff, delay)
import Effect.Class.Console (log)
import Prelude

async :: String -> Aff String
async s = do
  _ <- log ("Init Other Thread: " <> s)
  _ <- delay (Duration.Milliseconds (1000.0))
  let
    name = s <> "+"
  log ("End Other Thread: " <> name)
  pure name
