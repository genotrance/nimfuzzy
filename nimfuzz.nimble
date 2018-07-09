# Package

version       = "0.1.3"
author        = "genotrance"
description   = "Fuzzy search wrapper for Nim"
license       = "MIT"

skipDirs = @["tests"]

# Dependencies

requires "nimgen >= 0.1.4"

import distros

var cmd = ""
if detectOs(Windows):
    cmd = "cmd /c "

task setup, "Download and generate":
    exec cmd & "nimgen nimfuzz.cfg"

before install:
    setupTask()

task test, "Test nimfuzz":
    exec "nim cpp --passC:\"-DFTS_FUZZY_MATCH_IMPLEMENTATION\" -r tests/fuzztest.nim"
