Nimfuzzy is a [Nim](https://nim-lang.org/) wrapper for the [fts_fuzzy_match](https://github.com/forrestthewoods/lib_fts/blob/master/code/fts_fuzzy_match.h) library by [Forrest Smith](https://github.com/forrestthewoods/lib_fts).

Nimfuzzy is distributed as a [Nimble](https://github.com/nim-lang/nimble) package and depends on [nimgen](https://github.com/genotrance/nimgen) and [c2nim](https://github.com/nim-lang/c2nim/) to generate the wrappers. The fts_fuzzy_match.h source code is downloaded using curl/powershell.

__Installation__

Nimfuzzy can be installed via [Nimble](https://github.com/nim-lang/nimble):

```
> nimble install https://github.com/genotrance/nimfuzzy
```

This will download, wrap and install nimfuzzy in the standard Nimble package location, typically ~/.nimble. Once installed, it can be imported into any Nim program.

__Usage__

Module documentation can be found [here](http://nimgen.genotrance.com/nimfuzz).

```nim
import nimfuzzy/fts_fuzzy_match

var i: cint = 0
echo fuzzy_match("ftw", "ForrestTheWoods", i)
echo i
```

__Credits__

Nimfuzzy wraps the [fts_fuzzy_match.h](https://github.com/forrestthewoods/lib_fts/blob/master/code/fts_fuzzy_match.h) library and all its licensing terms apply to the usage of this package.

Credits go out to [c2nim](https://github.com/nim-lang/c2nim/) as well without which this package would be greatly limited in its abilities.

__Feedback__

Nimfuzzy is a work in progress and any feedback or suggestions are welcome. It is hosted on [GitHub](https://github.com/genotrance/nimfuzzy) with an MIT license so issues, forks and PRs are most appreciated.
