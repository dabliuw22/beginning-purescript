module Typeclass (class Counter, count) where

class Counter f where
  count :: f -> Int
