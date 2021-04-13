# Beginning Purescript

## Init
```shell
$ npm init
$ spago init
```

## Install Purescript Dependencies
```shell
$ spago install arrays
$ spago install lists
$ spago install math
$ spago install datetime
$ spago install now
$ spago install random
$ spago install aff
$ spago install node-fs-aff
$ spago install affjax
$ spago install parallel
$ spago install foldable-traversable
$ spago install filterable
$ spago install transformers
$ spago install free
```

## Apply Formatter
```shell
$ npm install purty -g
$ purty src/Main.purs --write
```

## Run Repl
```shell
$ npx spago repl # for project
$ spago repl # global
```

## Build 
```shell
$ spago build
```

# Run
```shell
$ spago run # or node -e "require ('./output/Main/index').main()"
```