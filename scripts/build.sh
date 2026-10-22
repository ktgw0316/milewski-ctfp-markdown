#!/usr/bin/env bash
# READMEの「How to build」に沿って英語版・日本語版のepub / pdfをビルドし、dist/に集める。
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
dist="$root/dist"
mkdir -p "$dist"

for lang in english japanese; do
  (
    cd "$root/$lang"

    # epub
    pandoc -d ../defaults_html.yaml --to=epub -o ctfp.epub

    # pdf (索引付き)
    pandoc -d defaults.yaml -o ctfp.tex
    sed -i -f ../ensuremath.sed ctfp.tex
    lualatex -interaction=nonstopmode -halt-on-error ctfp
    if [ -f index.dic ]; then
      upmendex -d index.dic ctfp
    else
      upmendex ctfp
    fi
    lualatex -interaction=nonstopmode -halt-on-error ctfp

    cp ctfp.epub "$dist/ctfp-$lang.epub"
    cp ctfp.pdf "$dist/ctfp-$lang.pdf"
  )
done
