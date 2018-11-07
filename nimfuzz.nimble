# Package

version       = "0.1.4"
author        = "genotrance"
description   = "Fuzzy search wrapper for Nim"
license       = "MIT"

skipDirs = @["tests"]

# Dependencies

requires "nimgen >= 0.4.0"

var
  name = "nimfuzz"
  cmd = when defined(Windows): "cmd /c " else: ""

mkDir(name)

task setup, "Checkout and generate":
  if gorgeEx(cmd & "nimgen").exitCode != 0:
    withDir(".."):
      exec "nimble install nimgen -y"
  exec cmd & "nimgen " & name & ".cfg"

before install:
  setupTask()

task test, "Run tests":
  exec "nim cpp --passC:\"-DFTS_FUZZY_MATCH_IMPLEMENTATION\" -r tests/fuzztest.nim"

