module Architecture.FreeApp (run) where

import Prelude
import Effect (Effect)
import Effect.Console as Console
import Control.Monad.Free (Free, liftF, foldFree)

-- core
newtype HardCodedInt
  = HardCodedInt Int

-- domain
program :: Free AllEffects Unit
program = do
  logToScreen "Hello World!!!!"

type AllEffects
  = LogToScreen

data LogToScreen a
  = LogToScreen String a

derive instance functorLogToScreen :: Functor LogToScreen

logToScreen :: String -> Free AllEffects Unit
logToScreen message = liftF $ LogToScreen message unit

-- api interpreter
logToScreenToEffect :: LogToScreen ~> Effect
logToScreenToEffect (LogToScreen msg next) = do
  Console.log msg
  pure next

runProgram :: Free AllEffects ~> Effect
runProgram = foldFree go
  where
  go :: AllEffects ~> Effect
  go = logToScreenToEffect

-- infra
run :: Effect Unit
run = runProgram program
