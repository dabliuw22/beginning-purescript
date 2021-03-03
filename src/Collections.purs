module Collections where

import Prelude
import Data.Foldable (class Foldable)

data Box a
  = Box a

instance boxFoldable :: Foldable Box where
  foldMap :: forall a m. Monoid m => (a -> m) -> Box a -> m
  foldMap f (Box a) = f a
  foldl :: forall a b. (b -> a -> b) -> b -> Box a -> b
  foldl f initial (Box a) = f initial a
  foldr :: forall a b. (a -> b -> b) -> b -> Box a -> b
  foldr f initial (Box a) = f a initial
