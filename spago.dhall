{ name = "my-project"
, dependencies =
  [ "aff"
  , "affjax"
  , "arrays"
  , "console"
  , "datetime"
  , "effect"
  , "filterable"
  , "foldable-traversable"
  , "generics-rep"
  , "lists"
  , "math"
  , "node-fs-aff"
  , "now"
  , "parallel"
  , "psci-support"
  , "random"
  , "transformers"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
