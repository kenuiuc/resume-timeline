\ProvidesClass{yaac-another-awesome-cv}[2018/07/19  v1.9.2 'YAAC: Another Awesome CV' Class]

\LoadClass[letterpaper, 10pt]{ctexart}

\newif\if@showLinks   \@showLinksfalse

\DeclareOption{green}{
  \def\@green{green}
}

\DeclareOption{red}{
  \def\@red{red}
}

\DeclareOption{indigo}{
  \def\@indigo{indigo}
}
\DeclareOption{orange}{
  \def\@orange{orange}
}

\DeclareOption{monochrome}{
  \def\@monochrome{monochrome}
}

\DeclareOption{alternative}{
  \def\@alternative{alternate}
}

\DeclareOption{showLinks}{ \@showLinkstrue}

\ProcessOptions

% Fix error
\usepackage{amsmath}

% Dependences
\RequirePackage[english]{babel}
\RequirePackage[utf8]{luainputenc}
\RequirePackage{fontspec} % for loading fonts
\RequirePackage{url,parskip} % other packages for formatting
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{fullpage}

% page margin
\RequirePackage[left=5mm,top=5mm,right=5mm,bottom=5mm]{geometry}

\RequirePackage{fontawesome}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{longtable} 	
\RequirePackage{etoolbox}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{fancyhdr}


\DeclareUnicodeCharacter{00E9}{\'{e}}
% Define default accent colors
\definecolor{basecolor}{HTML}{000066}       %BLUE

\ifundef{\@green} {
  \ifundef{\@red} {
    \ifundef{\@indigo}{
      \ifundef{\@orange} {
        \ifundef{\@monochrome} {}
        { \definecolor{basecolor}{HTML}{000000}}
      }
      { \definecolor{basecolor}{HTML}{e68a00} }
    }
    { \definecolor{basecolor}{rgb}{0.2, 0.07, 0.48} }
  }
  { \definecolor{basecolor}{HTML}{b30000} }     %RED
}
{ \definecolor{basecolor}{rgb}{0.0, 0.62, 0.38} }

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
\titleformat{\section}{\Large\bfseries\raggedright}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{0pt}{0pt}

% Configure list
\setlist[itemize,1]{label=\faAngleRight, nosep, leftmargin=2em} 
\setlist[itemize,2]{label=\faAngleRight, nosep, leftmargin=1.5em} 

% Setup Array : new column type
\newcolumntype{R}[1]{>{\hfill}m{#1}}

%Italian hyphenation for the word: ''corporations''
\hyphenation{im-pre-se}

% Setup fonts
 \defaultfontfeatures{Mapping=tex-text}
 \setmainfont{Source Sans Pro Light}[
     BoldFont = SourceSansPro-Regular, 
     ItalicFont= Source Sans Pro Light Italic
]

%New length definition
\newlength{\rightcolumnlength}
\setlength{\rightcolumnlength}{16cm}

\newlength{\leftcolumn}
\setlength{\leftcolumn}{4.0cm}

% Font Awesome icons aliases
\newcommand{\mailSymbol}{\faAt}
\newcommand{\locationSymbol}{\faMapMarker}
\newcommand{\infoSymbol}{\faInfo}
\newcommand{\linkedinSymbol}{\faLinkedin}
\newcommand{\viadeoSymbol}{\faViadeo}
\newcommand{\mobileSymbol}{\faMobilePhone}
\newcommand{\githubSymbol}{\faGithub}

\newcommand\link[2]{\color{linkcolor}\href{#1}{#2}\color{Black} }
\newcommand\important[1]{\textbf #1}

% Create a tag
% Usage: \cvtag{<tag label>}
\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[scale=1.2, anchor=base, fill=red!20, rounded corners=0.5ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.5ex,text depth=0.5ex]{#1};
}    

% Render author's name
% Usage: \user{<firstanme>}{<lastname>}
\newcommand\user[2]{
    \color{accentcolor}
    {\textbf{\huge {#1}} \color{Black}}
}

% Render a text with its symbol
% Usage; \socialtext{<icon>}{<label>}
\newcommand{\socialtext}[2]{\mbox{\textcolor{symbolcolor}{#1}\hspace{0.5em}#2\hspace{1em}}}
% Render a link with its symbol
% Usage; \sociallink{<icon>}{<label>}
\newcommand{\sociallink}[3]{\mbox{\textcolor{symbolcolor}{#1}\hspace{0.5em}\link{#2}{#3}\hspace{1em}}}

\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\photo}[2]{\def\@photo{#2}\def\@photodiameter{#1}}
\newcommand*{\address}[1]{\socialtext{\locationSymbol}{#1}}
\newcommand*{\infos}[1]{\socialtext{\infoSymbol}{#1}}
\newcommand*{\linkedin}[1]{\sociallink{\linkedinSymbol}{http://www.linkedin.com/in/#1/fr}{linkedin.com/in/#1}}
\newcommand*{\github}[1]{\sociallink{\githubSymbol}{https://www.github.com/#1}{github.com/#1}}
\newcommand*{\email}[1]{\sociallink{\mailSymbol}{mailto:#1}{#1}}
\newcommand*{\website}[2]{\sociallink{\faExternalLink}{#1}{#2}}
\newcommand*\smartphone[1]{\socialtext{\mobileSymbol}{#1}}    

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
    \color{accentcolor}
    \user{\@firstname}{\@lastname}\color{black}\\
    \small{\@socialinfo}
    \end{minipage}
    \ifdef{\@photodiameter}{
      \begin{minipage}{\@photodiameter}
        \idphoto
      \end{minipage}
    }{}
    % \resumetitle{\@tagline}
  }{
    \ifundef{\@photodiameter}{
      \begin{minipage}{\linewidth}
    }{
      \begin{minipage}{\dimexpr\linewidth-\@photodiameter-2em}
    }
    \user{\@firstname}{\@lastname}
    % \resumetitle{\@tagline}
    \vspace{5pt}\\
    \small{\@socialinfo}
    \end{minipage}
    \ifdef{\@photodiameter}{
      \begin{minipage}{\@photodiameter}
        \idphoto
      \end{minipage}
    }{}
  }
}

% Resume part title definition
\newcommand\sectionTitle[2]{\section{\texorpdfstring{\color{accentcolor}#2\enspace \textsc{#1}}{#1}}}

\newcolumntype{E}{>{\raggedright\arraybackslash}p{\rightcolumnlength}}

% Define the 'experiences' environment
\newenvironment{experiences}{
  \begin{longtable}{R{\leftcolumn}|E}
}{
  \end{longtable}
}

% \experience
% {date}     {title}
% {location} {company}
% {
%     <Experience description (Could be a list)>
% }
% {<Technology list>}
\newcommand\experience[7]{
    \textbf{\large {#1}} & \textbf{\large {#3}} \\*
    \text{\large #2}   & \text{\large #4} \\*
                & \begin{minipage}[t]{\rightcolumnlength} #5 \end{minipage} \\*
                & \footnotesize{\foreach \n in {#6}{\cvtag{\n}}} \\
}

\newcommand\emptySeparator{
    & \\
}

% \degree
% {location} {degree name}
%            {school name}
\newcommand\degree[3]{
    \textbf{\large#1} & \textbf{\large{#2}} \\*
                    & \text{\large #3} \\*
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