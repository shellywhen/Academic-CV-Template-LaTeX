# Academic CV Template [![Example](https://img.shields.io/badge/Exemple-pdf-blue.svg)](https://raw.githubusercontent.com/shellywhen/Academic-CV-Template-LaTex/refs/heads/master/cv.pdf)


## About
This project is an **academic CV template** built in LaTeX. It is **based on** [**YAAC: Another Awesome CV**](https://github.com/darwiin/yaac-another-awesome-cv) by Christophe Roger (Darwiin), which itself traces back to earlier CV work including Alessandro Plasmati’s template.

This fork extends and adapts that foundation—for example with `awesome-academic-cv.cls`, section files, publication lists, service sparklines, and other tweaks—while keeping the same general spirit: a clean, sectioned CV and a dedicated class file for layout.

If you use or redistribute this template, please **retain attribution** to the original **YAAC: Another Awesome CV** / **awesome-source-cv** project and its license terms (see [License](#license) below).

## Quick start

- Clone or download: [Academic-CV-Template-LaTex](https://github.com/shellywhen/Academic-CV-Template-LaTex)
- Compile with **LuaLaTeX** (see `cv.tex`: `% !TEX TS-program = lualatex`).
- Fonts: place your font (and adjust `awesome-academic-cv.cls` for your setup) under `fonts/` if using `localFont`.

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

Separate multiple jobs with `\emptySeparator` if needed.

## License

- **`awesome-academic-cv.cls`** and inherited layout code follow the [**LaTeX Project Public License (LPPL) 1.3c**](https://www.latex-project.org/lppl.txt), consistent with the upstream Awesome Source CV lineage.
- **Section content and documentation** in this repository may be used under [**CC BY-SA 4.0**](https://creativecommons.org/licenses/by-sa/4.0/legalcode) where applicable; always credit **shellywhen** for this fork and **Christophe Roger / Awesome Source CV** for the underlying template.

## Further reading (upstream chain)

- [Awesome Source CV / awesome-neue-latex-cv (Darwiin)](https://github.com/darwiin/awesome-neue-latex-cv)
- Original Alessandro Plasmati–style CV resources are linked from the upstream README (Scribd, LaTeX Templates, etc.).
