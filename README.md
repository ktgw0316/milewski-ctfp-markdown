# milewski-ctfp-markdown

An *unofficial* markdown version of "**C**ategory **T**heory **F**or **P**rogrammers"
by [Bartosz Milewski][bartosz github], based on:

* Original [blogpost series][blogpost series]
* [PDF/LaTeX version][ctfp-pdf] by Igal Tabachnik
* [epub version][onlurking] by Diogo Felix 

## How to build

1. Install [pandoc](https://pandoc.org/installing.html)
1. `cd english/`
1. `mkdir build`
1. `cp -R ../images ../base.css build/`
1. `pandoc -d ../defaults.yaml --to=html5 -o build/index.html`

[bartosz github]: https://github.com/BartoszMilewski
[blogpost series]:
  https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/
[ctfp-pdf]: https://raw.githubusercontent.com/hmemcpy/milewski-ctfp-pdf/
[onlurking]: https://github.com/onlurking/category-theory-for-programmers
