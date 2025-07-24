% comcv.cls – patched
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{comcv}[2021/01/21 Compact CV]

\newif\ifextended
\extendedfalse
\DeclareOption{extended}{\extendedtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[top=0.5cm,left=1cm,right=1cm,bottom=1.2cm]{geometry}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{fontspec}
\RequirePackage{array}
\RequirePackage{totpages}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{hyperref}
\PassOptionsToPackage{unicode}{hyperref}
\PassOptionsToPackage{naturalnames}{hyperref}

\definecolor{white}{HTML}{FFFFFF}
\definecolor{gray}{HTML}{555555}
\definecolor{lightgray}{HTML}{999999}
\definecolor{black}{HTML}{000000}
\definecolor{coralpink}{HTML}{FF706C}

\colorlet{defaulttext}{black}
\colorlet{regulartext}{gray}
\colorlet{headertext}{gray}
\colorlet{linktext}{coralpink}
\colorlet{lighttext}{lightgray}

\hypersetup{
    colorlinks=true,
    linkcolor=linktext,
    urlcolor=linktext,
    citecolor=linktext,
    pdfborder={0 0 0}
}

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
    UprightFont=Roboto-Light.ttf
]{Roboto}

\newfontfamily\thin[
    Path=fonts/,
    UprightFont=Roboto-Thin.ttf
]{Roboto}

\newfontfamily\regularheader[
    Path=fonts/,
    UprightFont=Roboto-Regular.ttf
]{Roboto}

\newfontfamily\thinheader[
    Path=fonts/,
    UprightFont=Roboto-Thin.ttf
]{Roboto}

\newfontfamily\mediumheader[
    Path=fonts/,
    UprightFont=Roboto-Medium.ttf
]{Roboto}



\newcommand*{\fullname}[3]{\def\comcv@firstname{#1}\def\comcv@lastname{#2}\def\comcv@degree{#3}}
\newcommand*{\cvtitle}[1]{\def\comcv@title{#1}}
\newcommand*{\email}[1]{\def\comcv@mailid{#1}}
\newcommand*{\website}[2]{\def\comcv@websiteurl{#1}\def\comcv@websitetext{#2}}
\newcommand*{\github}[2]{\def\comcv@githuburl{#1}\def\comcv@githubtext{#2}}
\newcommand*{\linkedin}[2]{\def\comcv@linkedinurl{#1}\def\comcv@linkedintext{#2}}
\newcommand\horbar[1][]{\noindent\makebox[\linewidth]{\color{gray}\rule{\paperwidth}{0.4pt}}}

% Titles
\titlespacing{\section}{0pt}{0pt}{0pt}
\titleformat{\section}{
    \fontsize{14pt}{16pt}\thinheader\color{black}
}{}{0pt}{}

\titlespacing{\subsection}{0pt}{0pt}{0pt}
\titleformat{\subsection}[runin]{
    \fontsize{12pt}{12pt}\mediumheader\bfseries\color{black}
}{}{0pt}{}

\newcommand{\combosection}[4]{%
    \subsection*{\small\color{black}\bfseries #1%
        \ifx&#2&%
        \else%
            \ \textcolor{linktext}{|} \light\small{#2}%
        \fi%
        \hfill \small #3%
    }%
    \vspace{0.5\baselineskip}%
    {\small\color{black}%
        \setlength{\parindent}{15pt}%
        #4%
    }%
}

\AtBeginDocument{
    \hypersetup{
        pdfauthor={\comcv@firstname~\comcv@lastname},
        pdftitle={\comcv@firstname~\comcv@lastname's CV},
    }

    % Define contact info if they exist
    \ifdefined\comcv@mailid
		\def\comcv@email{\href{mailto:\comcv@mailid}{\comcv@mailid}}
    \fi
    \ifdefined\comcv@websiteurl
        \def\comcv@website{\href{\comcv@websiteurl}{\comcv@websitetext}}
    \fi
    \ifdefined\comcv@githuburl
        \def\comcv@github{\href{\comcv@githuburl}{\comcv@githubtext}}
    \fi
    \ifdefined\comcv@linkedinurl
        \def\comcv@linkedin{\href{\comcv@linkedinurl}{\comcv@linkedintext}}
    \fi

    \begin{center}
        \fontsize{35pt}{45pt}\thinheader\textcolor{black}{\comcv@firstname}~\regularheader\textcolor{headertext}{\comcv@lastname}
        \ifx\comcv@degree\empty\else
            \thinheader,~\comcv@degree
        \fi

        \vspace{4pt}
        
        \ifdefined\comcv@title
            \ifx\comcv@title\empty
                \large\light\color{black}
                \comcv@email\hspace{1.5em}%
                \comcv@website\hspace{1.5em}%
                \comcv@github\hspace{1.5em}%
                \comcv@linkedin
                \vspace{4pt}
                \horbar
            \else
                \large\light\color{black}\comcv@title
                \vspace{4pt}
                \horbar
                \large\light\color{black}
                \comcv@email\hspace{1.5em}%
                \comcv@website\hspace{1.5em}%
                \comcv@github\hspace{1.5em}%
                \comcv@linkedin
            \fi
        \else
            \large\light\color{black}
            \comcv@email\hspace{1.5em}%
            \comcv@website\hspace{1.5em}%
            \comcv@github\hspace{1.5em}%
            \comcv@linkedin
            \vspace{4pt}
            \horbar
        \fi
        \vspace{8pt}
    \end{center}
}

\newenvironment{tightlist}{
    \begin{itemize}
        \setlength{\itemsep}{1pt}
        \setlength{\parskip}{0pt}
        \setlength{\parsep}{0pt}
        \setlength{\leftmargin}{15pt} % Proper indentation
}{
    \end{itemize}
}
