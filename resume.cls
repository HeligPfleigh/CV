%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modern Professional Resume Class
% Refactored for clean typography, semantic layout, and ATS-friendliness
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/09/11 v2.0 Modern Resume Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[11pt,a4paper]{article}

% Core Packages
\RequirePackage{parskip}                % Paragraph separation without indent
\RequirePackage{array}                  % Advanced table column formatting
\RequirePackage{ifthen}                 % Conditionals
\RequirePackage{graphicx}               % Images
\RequirePackage{xcolor}                 % Modern color support
\RequirePackage{fontawesome}            % Icons
\RequirePackage{setspace}               % Line spacing
\RequirePackage{enumitem}               % Fine-grained list spacing
\RequirePackage{fancyhdr}               % Headers and footers
\RequirePackage{lastpage}               % Reference last page number

\graphicspath{ {./images/} }

% Curated Color Palette
\definecolor{primary}{HTML}{0F172A}      % Dark charcoal / Slate 900 for main headers
\definecolor{accent}{HTML}{1D4ED8}       % Slate / Royal blue for highlights & rules
\definecolor{textdark}{HTML}{1E293B}     % Crisp dark body text
\definecolor{subtext}{HTML}{475569}      % Slate 600 for metadata & dates
\definecolor{rulecolor}{HTML}{CBD5E1}    % Slate 300 for subtle borders
\definecolor{linkblue}{HTML}{1D4ED8}     % High-contrast accessible link color

% Hyperref Setup
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    urlcolor=linkblue,
    linkcolor=accent,
    pdfborder={0 0 0}
}

% Page Numbering & Footer Setup
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\cfoot{\small\color{subtext} Page \thepage\ of \pageref{LastPage}}

% Personal Metadata Definitions
\def\@name{}
\def\@title{}
\def\@profilepic{}
\def\@email{}
\def\@phone{}
\def\@location{}
\def\@linkedinlink{}
\def\@linkedintext{}
\def\@githublink{}
\def\@githubtext{}
\def\@skypelink{}
\def\@skypetext{}

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\tagline}[1]{\def\@title{#1}}
\newcommand{\profilepic}[1]{\def\@profilepic{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\phone}[1]{\def\@phone{#1}}
\newcommand{\location}[1]{\def\@location{#1}}
\newcommand{\linkedin}[2]{\def\@linkedinlink{#1}\def\@linkedintext{#2}}
\newcommand{\github}[2]{\def\@githublink{#1}\def\@githubtext{#2}}
\newcommand{\skype}[2]{\def\@skypelink{#1}\def\@skypetext{#2}}

% Personal Entry / Icon items
\newcommand{\ContactItem}[2]{%
  \mbox{\textcolor{accent}{#1}\hspace{5pt}\textcolor{textdark}{#2}}%
}

% Header Macro
\newcommand{\makecvheader}{%
  \begingroup
  \noindent
  \begin{minipage}[c]{\ifx\@profilepic\@empty 1.0\linewidth \else 0.77\linewidth \fi}
    {\LARGE\bfseries\color{primary} \@name}\par
    \ifx\@title\@empty \else
      \vspace{2pt}
      {\large\bfseries\color{accent} \@title}\par
    \fi
    \vspace{4pt}
    % Contact Grid / Details
    \small
    \begin{tabular}{@{}p{0.46\linewidth} @{\hspace{0.04\linewidth}} p{0.50\linewidth}@{}}
      \ifx\@phone\@empty \else \ContactItem{\faPhone}{\@phone} \fi &
      \ifx\@email\@empty \else \ContactItem{\faEnvelope}{\href{mailto:\@email}{\@email}} \fi \\[2pt]
      \ifx\@location\@empty \else \ContactItem{\faMapMarker}{\@location} \fi &
      \ifx\@linkedinlink\@empty \else \ContactItem{\faLinkedin}{\href{\@linkedinlink}{\@linkedintext}} \fi \\[2pt]
      \ifx\@githublink\@empty \else \ContactItem{\faGithub}{\href{\@githublink}{\@githubtext}} \fi &
      \ifx\@skypelink\@empty \else \ContactItem{\faSkype}{\href{\@skypelink}{\@skypetext}} \fi
    \end{tabular}
  \end{minipage}%
  \ifx\@profilepic\@empty \else
    \hfill
    \begin{minipage}[c]{0.20\linewidth}
      \raggedleft
      \fboxrule=0.6pt
      \fboxsep=0pt
      \fcolorbox{rulecolor}{white}{%
        \includegraphics[width=2.5cm, height=3.2cm, keepaspectratio]{\@profilepic}%
      }%
    \end{minipage}%
  \fi
  \par
  \vspace{0.3em}
  \endgroup
}

% Section Environment
\newenvironment{rSection}[1]{%
  \vspace{0.4em}%
  \noindent{\color{primary}\bfseries\large\MakeUppercase{#1}}\par\nopagebreak\vspace{2pt}%
  {\color{accent}\hrule height 1.2pt}\par\nopagebreak\vspace{3pt}%
}{%
  \par\vspace{0.15em}%
}

% Subsection Environment (for work experience)
\newenvironment{rSubsection}[4]{%
  \vspace{0.25em}%
  \noindent%
  \textbf{\color{primary} #1}%
  \ifthenelse{\equal{#2}{}}{}{\hfill {\small\color{subtext}\textbf{#2}}}\\%
  \ifthenelse{\equal{#3}{}}{}{%
    \textit{\color{textdark} #3}%
    \ifthenelse{\equal{#4}{}}{}{\hfill {\small\color{subtext}\textit{#4}}}\\%
  }%
  \vspace{-0.25em}%
  \begin{itemize}[leftmargin=1.2em, itemsep=1.2pt, parsep=0pt, topsep=1.5pt]%
}{%
  \end{itemize}%
  \vspace{0.1em}%
}

% Simple entry without bullet list (ideal for Education)
\newcommand{\rEntry}[4]{%
  \vspace{0.25em}%
  \noindent%
  \textbf{\color{primary} #1}%
  \ifthenelse{\equal{#2}{}}{}{\hfill {\small\color{subtext}\textbf{#2}}}\\%
  \ifthenelse{\equal{#3}{}}{}{%
    \textit{\color{textdark} #3}%
    \ifthenelse{\equal{#4}{}}{}{\hfill {\small\color{subtext}\textit{#4}}}\\%
  }%
  \vspace{0.1em}%
}

% Project Sub-header inside rSubsection
\newcommand{\rProjectsHeader}[1][Key Projects]{%
  \end{itemize}%
  \vspace{1.5pt}%
  \noindent\textbf{\textit{\color{primary} #1:}}\par\nopagebreak\vspace{1pt}%
  \begin{itemize}[leftmargin=1.2em, itemsep=1.2pt, parsep=0pt, topsep=1pt, label={\small\color{subtext}\textbf{--}}]%
}

% Skill category command
\newcommand{\skillcategory}[2]{%
  \noindent\textbf{\color{primary} #1:} \textcolor{textdark}{#2}\par\vspace{1.5pt}%
}

% Backwards compatibility alias for PersonalEntry
\newcommand{\PersonalEntry}[2]{%
  \noindent\parbox{1.5em}{\textcolor{accent}{#1}}\hspace{0.5em}#2\par\vspace{2pt}%
}