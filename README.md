# milewski-ctfp-markdown
Bartosz Milewski's 'Category Theory for Programmers' unofficial markdown source

## How to build

1. Install [pandoc](https://pandoc.org/installing.html)
1. `cd english/`
1. `mkdir build`
1. `cp -R ../images ../base.css build/`
1. `pandoc -d ../defaults.yaml --to=html5 -o build/index.html`
