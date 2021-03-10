module Collections (Box(..), run) where

import Prelude
import Data.Compactable (compact, separate)
import Data.Either (Either(..))
import Data.Foldable (class Foldable)
import Data.Maybe (Maybe(..))
import Data.Traversable (for, scanl, sequence, traverse)
import Effect (Effect)
import Effect.Console (log)
import Effect.Random (randomInt)

data Box a
  = Box a

instance boxFoldable :: Foldable Box where
  foldMap :: forall a m. Monoid m => (a -> m) -> Box a -> m
  foldMap f (Box a) = f a
  foldl :: forall a b. (b -> a -> b) -> b -> Box a -> b
  foldl f initial (Box a) = f initial a
  foldr :: forall a b. (a -> b -> b) -> b -> Box a -> b
  foldr f initial (Box a) = f a initial

run :: Effect Unit
run = do
  -- sequence: Intercambiar los tipos de caja.
  -- Ejecute todos los cálculos en un Traversable tipo y almacene sus resultados 
  -- en el mismo Traversable tipo.
  let
    j = [ Just 1, Just 2, Just 3 ]

    k = [ 2, 4, 6, 8 ]

    l = sequence j
  log $ show l
  let
    calculation = \limit -> randomInt 1 limit
  -- traverse: convierta cada avalor del Traversable tipo en un cálculo, 
  -- ejecute todos los cálculos y almacene sus resultados en el mismo 
  -- Traversable tipo
  a <- traverse calculation k
  log $ show a
  b <- for k calculation -- is: traverse calculation k 
  log $ show b
  let
    c = scanl (+) 0 k
  log $ show c
  let
    d = compact [ Just 1, Nothing ]
  log $ show d
  let
    e = separate [ Left 1, Right "a" ]
  log $ show e
