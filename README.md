# Academic CV Template LaTex [![Example](https://img.shields.io/badge/Exemple-pdf-blue.svg)](https://shellywhen.github.io/Academic-CV-Template-LaTex/cv.pdf)

- [Preview Example PDF](https://shellywhen.github.io/Academic-CV-Template-LaTex/cv.pdf)
- [Author's Personal CV](https://drive.google.com/file/d/1cYB9J2DYccJAI2GCS5dcuItK9mnL9FBk/view)

| Page 1 | Page 2 |
|:---:|:---:|
| <img width=500 src="https://shellywhen.github.io/Academic-CV-Template-LaTex/examples/p1-awesome-academic-cv.jpg"/>| <img width=500 src="https://shellywhen.github.io/Academic-CV-Template-LaTex/examples/p2-awesome-academic-cv.jpg"/>|


## About

This project is an **academic CV template** built in LaTeX. It is based on [YAAC: Another Awesome CV](https://github.com/darwiin/yaac-another-awesome-cv) by Christophe Roger (Darwiin), which itself traces back to earlier CV work, including Alessandro Plasmati’s template and other awesome CV templates.

This fork extends and adapts the original section files. More academically relevant materials are added, including publication lists, service, etc., together with small tweaks like sparklines. The same general spirit is kept: a clean, sectioned CV and a dedicated class file for layout.

If you use or redistribute this template, please retain attribution to the original YAAC: Another Awesome CV project and its license terms (see [License](#license) below).

## Quick start

- Clone or download this repo.
- Compile with LuaLaTeX.
- Update your personal data and customize through `awesome-academic-cv.cls`.
  - The current font is [Merriweather](https://fonts.google.com/specimen/Merriweather).

## How to use the LaTeX class

### Header

Define `\name` and `\tagline`, optionally `\photo`, and wrap contact lines in `\socialinfo`:

```latex
\name{Your}{Name}
\tagline{}
\photo{2.8cm}{face.png}
\socialinfo{
    \address{Your address}
    \website{your-site.example}
    \email{you@example.edu}
    \linkedin{your-handle}
}
\makecvheader
```

Most social entries have dedicated commands (`\linkedin`, `\github`, `\email`, `\address`, etc.); see `awesome-academic-cv.cls` for the full set.

### Experiences section

Use the `experiences` environment and `\experience` entries (see class file for the full argument list):

```latex
\begin{experiences}
  \experience
    {End date}   {\textbf{Title}}{Organization}{Country}
    {Start date} {
      \begin{itemize}
        \item Detail      \end{itemize}
    }
    {}
\end{experiences}
```

## License

- **`awesome-academic-cv.cls`** and inherited layout code follow the [LaTeX Project Public License (LPPL) 1.3c](https://www.latex-project.org/lppl.txt), consistent with the upstream Awesome Source CV lineage.
- **Section content and documentation** in this repository may be used under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/legalcode) where applicable; always credit shellywhen for this fork and Christophe Roger/YAAC: Another Awesome CV for the underlying template.
- **Dependencies**
  - `sparkline.sty` by Andreas Loeffler
  - `gradient-text.sty` by Sicheng Du

## Upstream Chain

- [YAAC: Another Awesome CV](https://github.com/darwiin/yaac-another-awesome-cv)
- Original Alessandro Plasmati–style CV resources are linked from the upstream README (Scribd, LaTeX Templates, etc.).
