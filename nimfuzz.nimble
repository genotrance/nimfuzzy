# Package

version       = "0.1.0"
author        = "genotrance"
description   = "Fuzzy search wrapper for Nim"
license       = "MIT"

skipDirs = @["tests"]

# Dependencies

requires "nimgen >= 0.1.0"

import distros
import ospaths
import strutils

# URLs
var base_url = "https://raw.githubusercontent.com/forrestthewoods/lib_fts/master/code/"
var dl_file = "fts_fuzzy_match.h"

# OS specific
var cmd = ""
if detectOs(Windows):
    cmd = "cmd /c "

task dl_url, "Download URL":
    var dl_cmd = "curl $#$# -o $#"
    if detectOs(Windows):
        dl_cmd = "powershell wget $#$# -OutFile $#"
    
    echo "Downloading " & dl_file
    exec dl_cmd % [base_url, dl_file, dl_file]

task nimgen, "Run nimgen":
    exec cmd & "nimgen nimfuzz.cfg"

task setup, "Download and generate":
    if dirExists("nimfuzz"):
        rmDir("nimfuzz")

    mkDir("nimfuzz")

    withDir("nimfuzz"):
        dl_urlTask()

    nimgenTask()

before install:
    setupTask()

task test, "Test nimfuzz":
    exec "nim cpp --passC:\"-DFTS_FUZZY_MATCH_IMPLEMENTATION\" -r tests/fuzztest.nim"
