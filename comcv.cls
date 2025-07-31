\NeedsTeXFormat{LaTeX2e}

\newif\ifextended
\extendedfalse
\DeclareOption{extended}{\extendedtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt]{article}


\RequirePackage[top=0.5cm,left=1.0cm,right=1.0cm,bottom=0.5cm]{geometry}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{fontspec}
\RequirePackage{titlesec}

\definecolor{gray}{HTML}{555555}
\definecolor{lightgray}{HTML}{999999}
\definecolor{black}{HTML}{000000}
\definecolor{coralpink}{HTML}{FF706C}

\colorlet{defaulttext}{black}
\colorlet{regulartext}{gray}
\colorlet{headertext}{gray}
\colorlet{linktext}{coralpink}
\colorlet{lighttext}{lightgray}



% Font definitions with simplified setup
\setmainfont[
    Path=fonts/,
    UprightFont=Roboto-Regular.ttf,
    BoldFont=Roboto-Bold.ttf,
    ItalicFont=Roboto-Italic.ttf,
    BoldItalicFont=Roboto-BoldItalic.ttf
]{Roboto}

\newfontfamily\regular[
    Path=fonts/,
    UprightFont=Roboto-Regular.ttf
]{Roboto}

\newfontfamily\light[
    Path=fonts/,
    UprightFont=Roboto-Light.ttf,
]{Roboto}

\newfontfamily\thin[
    Path=fonts/,
    UprightFont=Roboto-Thin.ttf,
]{Roboto}

\newfontfamily\regularheader[
    Path=fonts/,
    UprightFont=Roboto-Regular.ttf
]{Roboto}

\newfontfamily\thinheader[
    Path=fonts/,
    UprightFont=Roboto-Thin.ttf
]{Roboto}
\linespread{0.8}  % Slightly tighter line spacing

\newcommand\horbar[1][]{\noindent\makebox[\linewidth]{\color{coralpink}\rule{\paperwidth}{0.3pt}}}

\titlespacing{\section}{0pt}{0pt}{0pt}
\titleformat{\section}{
    \fontsize{12pt}{14pt}\thinheader\color{black}
}{}{0pt}{}

\newenvironment{educationsection}{
  \small % or \footnotesize or \scriptsize for smaller text
  \begin{flushleft}
}{
  \end{flushleft}
}


\newcommand{\jobsection}[4]{%
    \noindent{%
        {\footnotesize\bfseries\color{black}#1}%
        \ \textcolor{linktext}{|} \footnotesize \color{black} #2%
        \hfill \footnotesize \color{black} #3%
    }%
    {\footnotesize\color{black}%
        \setlength{\parindent}{15pt}%
        #4%
    }%
}

\newcommand{\posterentry}[3]{%
  \vspace{0.3em}
  \noindent
  {\footnotesize\bfseries #1\par}%
  \noindent\hspace{1.5em}{\footnotesize #2\par}%
  \noindent\hspace{1.5em}{\footnotesize\textit{#3}\par}%
}

\newenvironment{tightlist}{
    \begin{itemize}
        \setlength{\itemsep}{1pt}
        \setlength{\parskip}{0pt}
        \setlength{\parsep}{0pt}
        \setlength{\leftmargin}{15pt}
        \setlength{\leftmargin}{15pt}
}{
    \end{itemize}
}
