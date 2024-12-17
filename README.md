# CUHKThesis

A simple LaTeX template for CUHK thesis based on [CUHK format guide](https://www.gradsch.cuhk.edu.hk/pgstudent/gsinfo/research/Chapter%206.html#Chapter6).

## Main features

- Support English and Chinese fonts for `Linux`, `MacOS`, `Windows`, and other platforms.
- Show titles of chapters (odd pages) and sections (even pages) in `fancyhead`.
- Support `glossaries` and `nomenclature` with automatic compiler `latexmk`.
- Support hyperlinks (`url`) and cross-reference (`backref`) for bibliographies.
- Fast compiling.

## Install

1. Download or clone this repository.
2. Install major TeX distributions with [XeLaTeX](https://www.overleaf.com/learn/latex/XeLaTeX) or use [Overleaf](https://www.overleaf.com) (recommended).

## Usage

> TL;DR: Run command `latexmk && latexmk -c` in shell.

Edit the corresponding `.tex`, `.bib` files with your favorite editor and compile `thesis.tex` with `latexmk` command. Then you will get the [demo](thesis.pdf).

For **fast** compiling, set `draftmode=1` in `.latexmkrc`, this will skip front-matters and Chinese fonts. For **final** compiling, convert to `draftmode=0` (default).

To clean up auxiliary files, run `latexmk -c`.

### Directory structure

| Directory   | Description                               |
| :---------- | :---------------------------------------- |
| `add-ons/`  | abstract, front matters, and appendices   |
| `chapters/` | major separated chapters                  |
| `figures/`  | the suggested folder for inserted figures |
| `tables/`   | the suggested folder for inserted tables  |
| `settings/` | for settings and commands                 |

### Settings and commands

- The fontsets are automatically selected in `settings/fonts.tex` for `Windows`, `MacOS`, `Linux`, and other systems.
- You can change the formats and styles of the thesis by adjusting the settings in `settings/settings.tex`, e.g., change `backref` to `false`.
- The commands for fast-typing are stored in `settings/usrcmds.tex`. Users can define their own commands in this file.
- Usually we don't have to modify `settings/cmds.tex` since it only contains commands for outputting standard pages.

## References

- Main styles: [CUHKthesis](https://github.com/zfengg/CUHKthesis) by Zhou Feng @ 2022/12/15
- Spacing: [CUHK-PHD-Thesis-Template](https://github.com/lixin4ever/CUHK-PHD-Thesis-Template) by Xin Li @ 2021/04/10
- Bib-styles: [acl-style-files](https://github.com/acl-org/acl-style-files) by acl-org @ 2021/12/20
- Fonts, bib-styles: [THUThesis](https://github.com/tuna/thuthesis) by TUNA @ 2024/07/01, v7.5.2
- LatexMk compiler: [Overleaf](https://www.overleaf.com/learn/how-to/How_does_Overleaf_compile_my_project%3F)

---

> Any issues, discussions or pull requests are welcome.
