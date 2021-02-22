{ name = "my-project"
, dependencies =
  [ "aff"
  , "affjax"
  , "arrays"
  , "console"
  , "datetime"
  , "effect"
  , "generics-rep"
  , "lists"
  , "math"
  , "node-fs-aff"
  , "now"
  , "parallel"
  , "psci-support"
  , "random"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
