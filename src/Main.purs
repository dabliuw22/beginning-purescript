module Main where

import Prelude
import Async (async)
import Control.Apply (lift3)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Aff, joinFiber, forkAff, launchAff_)
import Effect.Class.Console as Console
import Effect.Console (log)
import Typeclass (class Counter, count)

data Command
  = Left
  | Right

instance counterCommand :: Counter Command where
  count Left = -1
  count Right = 1

-- deriving Eq, Ord, Functor, Generic, Newtype
derive instance eqCommand :: Eq Command

derive instance genericCommand :: Generic Command _

{-
instance showCommand :: Show Command where
  show Left = "Left"
  show Right = "Right"
-}
instance showCommand :: Show Command where
  show = genericShow

type Person
  = { name :: String
    , age :: Int
    }

getName :: Person -> String
getName p = p.name

showPerson :: Person -> String
showPerson { name: n, age: a } = n <> ", " <> show a

main :: Effect Unit
main = do
  log $ show Left
  let
    person = { name: "MyName", age: 10 }
  log $ getName person
  let
    newPerson = person { name = "NewName" }
  log $ showPerson newPerson
  log $ show (count Left)
  let
    maybeSum = (\x y z -> x + y + z) <$> Just 2 <*> Just 3 <*> Just 1
  let
    maybeSumWithLift = lift3 (\x y z -> x + y + z) (Just 2) (Just 3) (Just 1)
  let
    maybeSumWithAdo = ado
      x <- Just 2
      y <- Just 3
      z <- Just 1
      in (x + y + z)
  case maybeSum of
    Just v -> log $ show v
    _ -> log "Empty"
  launchAff_ do
    runAsync

runAsync :: Aff Unit
runAsync = do
  fiberName <- forkAff $ async "MyName"
  _ <- Console.log "Main Thread"
  name <- joinFiber fiberName
  Console.log ("Name: " <> name)
