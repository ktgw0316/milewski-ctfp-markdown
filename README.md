# milewski-ctfp-markdown

バルトシュ・ミレフスキー著『プログラマーのための圏論』の非公式markdown版（[原著者の公開許可済み](https://github.com/ktgw0316/milewski-ctfp-markdown/issues/2#issuecomment-1494275529)の日本語訳を含む）

An *unofficial* markdown version of "**C**ategory **T**heory **F**or **P**rogrammers"
by [Bartosz Milewski][bartosz github], based on:

* Original [blogpost series][blogpost series]
* [PDF/LaTeX version][ctfp-pdf] by Igal Tabachnik
* [epub version][onlurking] by Diogo Felix (base.css)
* [easy pandoc templates](https://github.com/ryangrose/easy-pandoc-templates) by Ryan Grose (pandoc html template)

## How to build

1. Install [pandoc](https://pandoc.org/installing.html) and LuaLaTeX
1. `cd english/` (or `cd japanese/` if you want to build Japanese version)
1. Convert markdown to:
   * html: `pandoc -d ../defaults_html.yaml --template=../html_templates/bootstrap_menu.html --to=html5 -o index.html`
   * epub: `pandoc -d ../defaults_html.yaml --to=epub -o ctfp.epub`
   * pdf: `pandoc -d ../defaults.yaml -o ctfp.pdf`
     * If you want to make index available in pdf, you need to run the following commands:
        ```shell
        pandoc -d ../defaults.yaml -o ctfp.tex
        sed -i -f ../ensuremath.sed ctfp.tex
        lualatex ctfp
        upmendex -d index.dic ctfp
        lualatex ctfp
        ```

[bartosz github]: https://github.com/BartoszMilewski
[blogpost series]:
  https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/
[ctfp-pdf]: https://github.com/hmemcpy/milewski-ctfp-pdf/
[onlurking]: https://github.com/onlurking/category-theory-for-programmers

## 日本語訳について

html版は[github pages](https://ktgw0316.github.io/milewski-ctfp-markdown/)としても公開しています。

※2024年2月現在、1回目の推敲が終わった段階です。誤訳を含む可能性があることにご注意ください。
