%% Copyright 2016 Christophe Roger
%
% Author: 
% Christophe Roger (Darwiin)
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3c
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is M. C. Roger.
%
% This work consists of the files awesome-source-cv.cls 

\ProvidesClass{awesome-academic-cv}[2026/05/01  v1.0.0 'Awesome Academic CV' Class]

\newif\if@showLinks   \@showLinksfalse

\DeclareOption{monochrome}{
  \def\@monochrome{monochrome}
}

\DeclareOption{localFont}{
  \def\@local{local}
}

\DeclareOption{alternative}{
  \def\@alternative{alternate}
}

\DeclareOption{showLinks}{ \@showLinkstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax
\LoadClass[a4paper]{article}

% Dependencies
\RequirePackage[english,french]{babel}
\RequirePackage[utf8]{luainputenc}
\RequirePackage{fontspec} % for loading fonts
\RequirePackage{url,parskip} % other packages for formatting
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{fullpage}
\RequirePackage{geometry}
\RequirePackage{fontawesome5}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{longtable} 	
\RequirePackage{etoolbox}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{fancyhdr}
\RequirePackage{academicons}
\RequirePackage{cite}
\RequirePackage{gradient-text}
\RequirePackage{multicol}
\RequirePackage{tabularx}
\RequirePackage{sparklines}
\RequirePackage{multirow}
\RequirePackage{amssymb}
\RequirePackage{lastpage}


\DeclareUnicodeCharacter{00E9}{\'{e}}
% Define default accent colors


\providecolor{basecolor}{HTML}{461CAF}
\providecolor{linkcolor}{HTML}{461CAF}
\providecolor{lightcolor}{HTML}{b7a5e5}
\providecolor{lighttext}{HTML}{444444}
\definecolor{darkGrey}{HTML}{989898}

\colorlet{linkcolor}{basecolor}
\colorlet{accentcolor}{linkcolor!90}
\colorlet{symbolcolor}{linkcolor!85}

% Setup hyperref package, and colours for links
%\definecolor{linkcolour}{rgb}{0,0.2,0.6}

\if@showLinks
  \hypersetup{%
    breaklinks
  }%
\else
  \hypersetup{%
    pdfborder = {0 0 0},
    breaklinks
  }%
\fi

% Setup fancyhdr package
\fancyhf{}
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
%\fancyfoot[C]{\thepage}
\pagestyle{fancy}

%\pagestyle{empty}                         % non-numbered pages
%\font\fb=''[cmr10]''                      % for use with \LaTeX command

% Setup CV sections
\titleformat{\section}{\Large\raggedright}{}{0em}{}[\color{basecolor}{\titlerule}]
\titlespacing{\section}{0pt}{0pt}{0pt} % 0 2 2 
\titleformat{\section}{\Large\raggedright}{}{0em}{}[]
\titlespacing{\section}{0pt}{\baselineskip}{0.1\baselineskip}
\setlist[enumerate]{nosep}
\setlength{\LTleft}{0pt}
\renewcommand{\arraystretch}{1.15}
\linespread{1.1}\selectfont

% Configure list
% \setlist[itemize,1]{label=\faCaretRight, nosep, leftmargin=2em} 
\setlist[itemize,1]{label=\bullet, nosep, leftmargin=1.2em} 
\setlist[itemize,2]{label=\bullet, nosep, leftmargin=1.5em} 

% Setup Array : new column type
\newcolumntype{R}[1]{>{\hfill}m{#1}}

%Italian hyphenation for the word: ''corporations''
\hyphenation{im-pre-se}

% Setup fonts
\defaultfontfeatures{Ligatures=TeX}
%

% Define font to use according to localFont option
\ifdef{\@local}
{
  \setmainfont{MerriweatherRegular}[
    Path = fonts/,
    BoldFont = MerriweatherBold,
    ItalicFont = MerriweatherItalic]
}
{}


%New length definition
\newlength{\rightcolumnlength}
\setlength{\rightcolumnlength}{14.3cm}

\newlength{\midcolumn}
\setlength{\midcolumn}{12cm}

\newlength{\leftcolumn}
\setlength{\leftcolumn}{2.2cm}

% Font Awesome icons aliases
\newcommand{\mailSymbol}{\faEnvelope}
\newcommand{\locationSymbol}{\faMapMarker}
\newcommand{\infoSymbol}{\faInfo}
\newcommand{\linkedinSymbol}{\faLinkedin}
\newcommand{\viadeoSymbol}{\faViadeo}
\newcommand{\mobileSymbol}{\faMobilePhone} 
\newcommand{\githubSymbol}{\faGithub}
\newcommand{\gscholarSymbol}{\aiGoogleScholar}
\newcommand{\dblpSymbol}{\aidblp}
\newcommand{\twitterSymbol}{$\mathbb{X}$}

\newcommand\link[2]{\color{linkcolor}\href{#1}{#2}\color{black}}
\newcommand\important[1]{\textbf #1}

% Create a tag
% Usage: \cvtag{<tag label>}
\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=darkGrey!70,rounded corners=0.5ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.3ex,text depth=.25ex]{#1};
}

% Render author's name
% Usage: \user{<firstname>}{<lastname>}
\newcommand\user[2]{%
  \begingroup
  \edef\fullname{#1\space #2}%
  \huge \textbf{\expandafter\gradientRGB\expandafter{\fullname}{34,127,193}{183,165,229}\color{black}}%
  \endgroup
}

% Render a text with its symbol
% Usage; \socialtext{<icon>}{<label>}
\newcommand{\socialtext}[2]{\mbox{\textcolor{symbolcolor}{#1}\hspace{0.5em}#2\hspace{1em}}}

% Render a link with its symbol
% Usage; \sociallink{<icon>}{<label>}
\newcommand{\sociallink}[3]{\mbox{\hspace{0.5em}\link{#2}{\textcolor{symbolcolor}{#1 #3}}\hspace{1em}}}

% Define author's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define author's tagline
% Usage: \tagline{<tag line>}
\newcommand*{\tagline}[1]{\def\@tagline{#1}}

% Define author's photo
% Usage \photo{<diameter>}{<photo>}
\newcommand{\photo}[2]{\def\@photo{#2}\def\@photodiameter{#1}}

% Render author's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\socialtext{\locationSymbol}{\textcolor{accentcolor}{#1}}}

% Render author's infos
% Usage: \infos{<infos>}
\newcommand*{\infos}[1]{\socialtext{\infoSymbol}{#1}}

% Render author's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\sociallink{\linkedinSymbol}{http://www.linkedin.com/in/#1/}{}}

% Render author's viadeo(optional)
% Usage: \viadeo{<viadeo-nick>}
\newcommand*{\viadeo}[1]{\sociallink{\viadeoSymbol}{http://www.viadeo.com/fr/profile/#1}{viadeo.com/fr/profile/#1}} 

% Render author's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\sociallink{\githubSymbol}{https://www.github.com/#1}{}}           % Github icon + URL

% Render author's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\sociallink{\mailSymbol}{mailto:#1}{#1}}

% Render a website link (optional)
% Usage: \email{<email adress>}
\newcommand*{\website}[1]{\sociallink{\faHome}{https://#1}{#1}}

% Render author's mobile phone (optional)
% Usage: \smartphone{<mobile phone number>}
\newcommand*\smartphone[1]{\socialtext{\mobileSymbol}{#1}}    

% Render author's google scholar (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\gscholar}[1]{\sociallink{\gscholarSymbol}{https://scholar.google.com/citations?user=#1}{}}

% Render author's dblp (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\dblp}[1]{\sociallink{\dblpSymbol}{https://dblp.org/pid/#1}{}}

% Render author's twitter (optional)
% Usage: \twitter{<twitter-id>}
\newcommand*{\twitter}[1]{\sociallink{\twitterSymbol}{https://twitter.com/#1}{}}


% Render author's tagline
\newcommand\resumetitle[1]{
  \ifundef{\@alternative}{
	 \par{
	 	 \bigskip\center{\Large \color{accentcolor}#1\color{black}}\par
	 }
	 \bigskip
  }{
    \color{accentcolor}\large{#1}\color{black}
  }
}

\newcommand\idphoto{
  \tikz\path[fill overzoom image={\@photo}]circle[radius=0.5\linewidth];
}

% Define social entries to print in header
\newcommand{\socialinfo}[1]{\def\@socialinfo{#1}}

% Render CV header
% Needs \@firstname, \@lastname and \@tagline to be defined
\newcommand*{\makecvheader}{
  \ifundef{\@alternative}{
    \ifundef{\@photodiameter}{
      \begin{minipage}{\linewidth}
    }{
      \begin{minipage}{\dimexpr\linewidth-\@photodiameter-2em}
    }
   
    \color{accentcolor}\user{\@firstname}{\@lastname}\color{black}\\
    \small{\@socialinfo}
    \end{minipage}
    \ifdef{\@photodiameter}{
      \begin{minipage}{\@photodiameter}
        \idphoto
      \end{minipage}
    }{}
    \resumetitle{\@tagline}
  }{
    \ifundef{\@photodiameter}{
      \begin{minipage}{\linewidth}
    }{
      \begin{minipage}{\dimexpr\linewidth-\@photodiameter-2em}
    }
   

    \user{\@firstname}{\@lastname}\smallskip\\
    % \resumetitle{\@tagline}
    % \smallskip\\
    \small{\@socialinfo}
    \end{minipage}
    \ifdef{\@photodiameter}{
      \begin{minipage}{\@photodiameter}
        \idphoto
      \end{minipage}
    }{}
    \bigskip
  }
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{#1}
  \fancyfoot[C]{#2}
  \fancyfoot[R]{#3}
}

% Resume part title definition
% \newcommand\sectionTitle[2]{\section{\texorpdfstring{\color{accentcolor}#2\enspace \textsc{#1}}{#1}}}

% \newcommand\sectionTitle[2]{\section{\color{accentcolor}{\textbf{#1}}}}

% \newcommand\sectionTitle[1]{
%     \section{\color{accentcolor}{\textbf{#1}}} % Section title text
%     \noindent
%     \begin{tikzpicture}
%         % Draw a gradient line that spans the full text width with specified colors and a thinner line
%         \shade[left color={rgb:red,23; green,32; blue,204}, right color={rgb:red,198; green,11; blue,76}]
%         (0,0) rectangle (\textwidth,0.01); % Use \textwidth for the length and 0.05 for a thinner height
%     \end{tikzpicture}

% }

\newcommand\sectionTitle[2]{
    \section{\texorpdfstring{\color{accentcolor}#2\hspace{0.55em}\textbf{#1}}{#1}}
    \noindent
    \begin{tikzpicture}
        \shade[left color=accentcolor, right color=accentcolor!65]
        (0,0) rectangle (\textwidth,0.05);
    \end{tikzpicture}
    \vspace{-1.2\baselineskip}
}

\newcommand{\doi}[1]{{\small\texttt{DOI}: \href{https://doi.org/#1}{\underline{#1}}}}
\newcommand{\arxiv}[1]{{\small\texttt{arXiv}: \href{https://arxiv.org/abs/#1}{\underline{#1}}}}
\newcommand{\pressurl}[1]{{\color{lighttext}\small \href{#1}{\underline{#1}}}}
\newcommand{\awardmark}[1]{\llap{\smash{\textcolor{accentcolor}{\raisebox{-0.1ex}{#1}}}\hspace{1em}}}
\newcommand{\yr}[1]{\textcolor{lighttext}{\small{(#1)}}}
\def\rowgap{4pt}
\newcommand{\sectiongap}[1]{\vspace{#1\rowgap}}
\newcommand{\cvsectionfile}[1]{\input{section/#1}}
\newcommand{\lightitem}[1]{\item[] {\color{lighttext}\small #1}}
\DeclareUnicodeCharacter{1D54F}{$\mathbb{X}$}
\makeatletter
\newcommand{\cvtotalpages}{%
  \ifcsname lastpage@lastpage\endcsname
    \lastpage@lastpage
  \else
    \thepage
  \fi
}
\makeatother


% Define a new column type for the scholarship environment
\newcolumntype{Y}{>{\raggedleft}p{\leftcolumn}}

% Define the 'keywords' environment
\newenvironment{keywords}{%
  \renewcommand{\arraystretch}{1.1}

  \begin{longtable}{@{}Y p{\rightcolumnlength}@{}} 
}{%
  \end{longtable}
  \vspace{-1em}
}

% Render a scholarshipentry in the scolarship environment
% Usage: \scholarshipentry{<date>}{<description>}
\newcommand\keywordsentry[2]{
  \textbf{#1} &   #2\\ 
}


% Define the 'scholarship' environment
\newenvironment{scholarship}{%
  \begin{tabular}{Y p{\rightcolumnlength}}
}{%
  \end{tabular}
}

% Render a scholarshipentry in the scolarship environment
% Usage: \scholarshipentry{<date>}{<description>}
\newcommand\scholarshipentry[2]{
  #1    &  #2 \\
}

\newlength{\pubrightcolumnlength}
\setlength{\pubrightcolumnlength}{15.7cm}

\newlength{\publeftcolumn}
\setlength{\publeftcolumn}{0.3cm}

\newlength{\pubyearcolumn}
\setlength{\pubyearcolumn}{0.3cm}

\newcolumntype{Z}{>{\raggedleft}p{\pubyearcolumn}}

% Define the 'scholarship' environment
% \newenvironment{publication}{%
%   \begin{longtable}{Z p{\publeftcolumn} p{\pubrightcolumnlength}}
% }{%
%   \end{longtable}
% }

% Render a scholarshipentry in the scolarship environment
% Usage: \scholarshipentry{<date>}{<description>}
\newcommand\publicationentry[2]{
  #1    &  #2 \vspace{2pt}\\
}

% author title venue year url abbr

% \newcommand\pubentry[7]{
% #1. #4. \href{#5}{``#2''}. #3 (#6). #7
    
% }

\newcommand\pubentry[7]{
#1. #4. \href{#5}{``#2''}. #3 (#6). #7
    
}

% Define the 'skills' environment
% \newenvironment{skills}{%
%   \begin{longtable}{@{}R{\leftcolumn} E@{}}
% }{%
%   \end{longtable}
% }

% Render a skill in the skills environment
% Usage: \skill{<skill>}{<level>}
\newcommand\skill[2]{
  \textbf{#1}    & \foreach \x in {1,...,5}{{\color{accentcolor!80} \ifnumgreater{\x}{#2}{\faCircleThin}{\faCircle}}\enspace } \\
}

\newcolumntype{E}{>{\raggedright\arraybackslash}p{\rightcolumnlength}}

% Define the 'experiences' environment
\newenvironment{experiences}{%
  \begin{longtable}{@{}R{\leftcolumn}|p{9.8cm}E@{}}
}{%
  \end{longtable}
}

% Render an experience in the experiences environment
% Usage: 
% \experience
%  {<End date>}      {<Title>}{<Enterprise>}{<Country>}
%  {<Start date}     {
%                      <Experience description (Could be a list)>
%                    }
%                    {<Technology list>}
\newcommand\experience[6]{
  #1    & #2 & \multicolumn{1}{r}{#3, #4}  								\\*
  #5    & \multicolumn{2}{l}{\begin{minipage}[t]{\rightcolumnlength}
  					         #6 \vspace{0.5\baselineskip}
                   \end{minipage}}										\\*
                %  & \footnotesize{\foreach \n in {#7}{\cvtag{\n}}} 	\\
  }
  
\newcommand\experiencesingle[4]{
  #1    & #2 &  \multicolumn{1}{r}{#3, #4}   \\
  }


\newcommand\emptySeparator{\multicolumn{3}{c}{}\\}

% Define the 'projects' environment
\newenvironment{projects}{%
  \begin{longtable}{@{}l}
}{%
  \end{longtable}
}

% Define the 'project' entry in the 'projects' environment
% Usage:
% \project
%   {<Project name>}{<dates>}
%   {<link1> <link2>}
%   {<Project description>}
%   {<techno1>,<techno2>}
\newcommand\project[5]{
  \begin{minipage}[t]{\dimexpr(\linewidth-.8em)}\textbf{#1} \hfill #2\\*
    \begin{minipage}[t]{\linewidth}
  					         #4
                   \end{minipage}\smallskip\\
    % \footnotesize{\foreach \n in {#5}{\cvtag{\n}}}\\
  \end{minipage}
  \\*
}


\newcommand*\twocolumnsection[2]{
  \begin{minipage}[t]{\dimexpr(\linewidth/2) - 3em}
    #1
  \end{minipage}
  \hfill
  \begin{minipage}[t]{\dimexpr(\linewidth/2) - 3em}
    #2
  \end{minipage}
  }


\newenvironment{referees}{%
\begin{multicols}{2}
\setlength{\columnsep}{2em}
}{%
  \hfill
  \bigskip
  \end{multicols}
}

\newcommand*\referee[4]{
\vbox to 2.7cm{

\textbf{#1}\\
\emph{#2}\\
#3\\
\texttt{\href{mailto:#4}{#4}}\\
 \vfil
}

}
