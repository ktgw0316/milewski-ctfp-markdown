#!/usr/bin/env bash
# READMEの「How to build」に沿ってepub / pdfをビルドし、dist/に集める。
# usage: scripts/build.sh [english|japanese ...]  (省略時は両方)
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
dist="$root/dist"
mkdir -p "$dist"

langs=("$@")
if [ ${#langs[@]} -eq 0 ]; then
  langs=(english japanese)
fi

for lang in "${langs[@]}"; do
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
