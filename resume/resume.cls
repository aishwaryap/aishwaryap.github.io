% resume.cls - A LaTeX2e class for resumes
% (c) 2011 Arun Chaganty <arunchaganty@gmail.com> http://arun.chagantys.org/
% Modified by Abhiram Ravi (2014) (abhiram.ravi.s@gmail.com)
%
% Written from the excellent resume template of the following authors:
% (c) 2002 Matthew Boedicker <mboedick@mboedick.org> (original author) http://mboedick.org
% (c) 2003 David J. Grant <dgrant@ieee.org> http://www.davidgrant.ca
% (c) 2007 Todd C. Miller <Todd.Miller@courtesan.com> http://www.courtesan.com/todd
% (c) 2009 Derek R. Hildreth <derek@derekhildreth.com> http://www.derekhildreth.com 
%
% This work is licensed under the Creative Commons
% Attribution-NonCommercial-ShareAlike License. To view a copy of this
% license, visit http://creativecommons.org/licenses/by-nc-sa/1.0/ or
% send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford,
% California 94305, USA.
%

% Initial declarations
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2011/11/05 Resume class]

% Options
% `web' hides the address header.
\DeclareOption{web}{\newcommand*{\omitaddress}{}}

% Other options go to article
\PassOptionsToClass{11pt,12pt,letterpaper,a4paper}{article}

\ProcessOptions\relax
% We build off the article class
\LoadClassWithOptions{article}

% Package Declarations

\RequirePackage{latexsym}
\RequirePackage[empty]{fullpage}
\RequirePackage{tweaklist}
%\usepackage[letterspace=10]{microtype}
%\usepackage[charter]{mathdesign}

% Load colors
\RequirePackage[usenames,dvipsnames]{color}
\definecolor{grey}{RGB}{2,72,115}
\definecolor{greylink}{RGB}{2,72,115}
% \definecolor{grey}{RGB}{0,0,0}
% \definecolor{greylink}{RGB}{0,0,0}
% Setup hyperlinks
\RequirePackage{hyperref}
\hypersetup{
    colorlinks,           %
    citecolor=black,      %
    filecolor=black,      %
    linkcolor=black,      %
    urlcolor=black     % can put red here to visualize the links
}
\urlstyle{same}

% Adjust margins, etc.
\textheight=9.0in
\raggedbottom
\raggedright
\setlength{\tabcolsep}{0in}
\addtolength{\oddsidemargin}{-0.375in}
\addtolength{\evensidemargin}{0.375in}
\addtolength{\textwidth}{0.5in}
\addtolength{\topmargin}{-.375in}
\addtolength{\textheight}{0.75in}
%\usepackage[margin=0.3in]{geometry}



% Adjustments for the itemise lengths
\setlength{\itemindent}{0em}
\renewcommand{\itemhook}{
  \setlength{\topsep}{1pt}%
  \setlength{\itemsep}{-1pt}
}

% Define commands of address, and email.
\newcommand*{\@websitename}{}
\newcommand*{\websitename}[1]{\renewcommand*{\@websitename}{#1}}
\newcommand*{\@website}{}
\newcommand*{\website}[1]{\renewcommand*{\@website}{#1}}
\newcommand*{\@email}{}
\newcommand*{\email}[1]{\renewcommand*{\@email}{#1}}
\newcommand*{\@address}{}
\newcommand*{\address}[1]{
  \@ifundefined{omitaddress}{
    \renewcommand*{\@address}{#1}
  }
  {
    % Omitting address/phone number
    \renewcommand*{\@address}{
      \texttt{\colorbox{yellow}{[web version:  address \& phone omitted]}}
    }
  }
}
\address{}

% Display the header at the beginning of the document
\newcommand*{\resumeheader}{
  \begin{tabular*}{7in}{l@{\extracolsep{\fill}}r}
    \textsf{\textbf{\href{\@website}{\LARGE \@author}}} & \textsf{\small \href{mailto:\@email}{\@email}} \\
    {\footnotesize \@address}           & \textsf{\small \href{\@website}{\@websitename}}
  \end{tabular*}
  \\
  \vspace{0.1in}
}

\renewcommand*{\section}[1]{
  \vspace{4pt}
  %\colorbox{grey}
  {
    \begin{minipage}{\textwidth}
    {\small \textbf{\textsf{{\textcolor{grey}{#1 \vphantom{p\^{E}}}}}}}
    \vspace{4pt}
    \hrule
    \end{minipage}
  } \vspace{-2pt}\\
}

\renewcommand*{\subsection}[1]{
  \vspace{4pt}
  %\colorbox{grey}
  {
    \begin{minipage}{\textwidth}
    {\small \textbf{\textsf{{\textcolor{grey}{#1 \vphantom{p\^{E}}}}}}}
    \vspace{4pt}
    \hrule
    \end{minipage}
  } \vspace{-2pt}\\
}

% Is a nice condensed resume point, laid out as follows:
% [1] Title                            [2] Date
% [3] More details                     [4] Location
% - [5] Description
\newcommand{\credential}[5]{
  \item
    \begin{tabular*}{6.5in}{l@{\extracolsep{\fill}}r}
        %\textbf{\textls{\fontfamily{cmss}\selectfont{#1}}} & #2 \\
        \textbf{\textsf{\textls{#1}}} & #2 \\
        \small{#3} & \small{#4}
    \end{tabular*} \vspace{-6pt} \\
    {\footnotesize #5}
  \vspace{-2pt}
}

\newcommand{\credentialtwo}[6]{
  \item
    \begin{tabular*}{6.5in}{l@{\extracolsep{\fill}}r}
        %\textbf{\textls{\fontfamily{cmss}\selectfont{#1}}} & #2 \\
        \textbf{\textsf{\textls{#1}}} & #2 \\
        \textcolor{grey}{\small{#3}} & \small{#4} \\
        \small{#5}
    \end{tabular*} \vspace{-6pt} \\
    {\footnotesize #6}
  \vspace{-2pt}
}

