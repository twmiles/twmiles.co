\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[a4paper]{article}

\usepackage[empty]{fullpage}
\usepackage{enumitem}
\usepackage{ifxetex}
\ifxetex
  \usepackage{fontspec}
  \usepackage[xetex]{hyperref}
\else
  \usepackage[utf8]{inputenc}
  \usepackage[T1]{fontenc}
  \usepackage[pdftex]{hyperref}
\fi
\usepackage{merriweather} %set merriweather for font
\usepackage{anyfontsize}
\usepackage{xcolor}
\usepackage{tabularx}
\usepackage{titlesec} %used for horizontal bar
\usepackage{pdfrender} %used for deeper bold than what \textbf{} provides
\usepackage{ifthen} %used for checking if user wants to do anonymous text
\usepackage{fontawesome5} % used for icons
\usepackage{accsupp} % used for alt text for icons
\usepackage{graphicx} % used for pulling in local images for icons
 
%-------------------------------------------------- VARIABLES HERE --------------------------------------------------
\newcommand{\anonymousVar}{false} % mark true or false for anonymous user text (does NOT change company details - just user definitions below)
\newcommand{\darkTheme}{false}
\newcommand{\debugFrame}{false}

% Header variables
\def \fullnametext {Tracy Miles}
\def \subtitle {}

% set asset directory location
\graphicspath{{/assets}}

% \def \linkedinicon {\altText{\faLinkedin}{LinkedIn:}}
\def \linkedinicon {\altText{\includegraphics[scale=.0046]{linkedinLogo.png}}{LinkedIn:}}
\def \linkedinlink {https://linkedin.com/in/twmiles/}
\def \linkedintext {\altText{/twmiles}{https://linkedin.com/in/twmiles/}}

% \def \phoneicon {\altText{\faPhone}{Phone: }}
\def \phoneicon {\altText{\includegraphics[scale=.023]{phoneLogo.png}}{Phone: }}
\def \phonelink {tel:+1-317-515-8504}
\def \phonetext {\altText{1.317.515.8504}{13175158504}}

% \def \emailicon {\altText{\faEnvelope}{Email: }}
\def \emailicon {\altText{\includegraphics[scale=.02]{emailLogo-2.png}}{Email: }}
\def \emaillink {mailto:tracywmiles@gmail.com}
\def \emailtext {\altText{tracywmiles@gmail.com}{tracywmiles@gmail.com}}

% \def \githubicon {\altText{\faGithub}{Github: }}
\def \githubicon {\altText{\includegraphics[scale=.026]{githubLogo.png}}{Github: }}
\def \githublink {https://github.com/twmiles}
\def \githubtext {\altText{/twmiles}{https://github.com/twmiles}}

\def \websiteicon {\altText{\faGlobe}{Website: }}
\def \websitelink {https://twmiles.co/}
\def \websitetext {\altText{Tracy Miles}{https://twmiles.co/}}

\def \passmeterlink {https://github.com/twmiles/passmeter}
\def \passmetertext {\altText{PassMeter}{https://github.com/twmiles/passmeter}}

%\def \potionprogramminglink {https://github.com/twmiles/potion-programming}
%\def \potionprogrammingtext {\altText{Potion Programming Platform}{https://github.com/twmiles/potion-programming}}

\def \potionprogramminglink {https://potionprogramming.com}
\def \potionprogrammingtext {\altText{Potion Programming Platform}{https://potionprogramming.com}}

\def \rowhammerattackresearchlink {https://github.com/twmiles/rowhammer-research}
\def \rowhammerattackresearchtext {\altText{Rowhammer Attack Research}{https://github.com/twmiles/rowhammer-research}}

\def \engcrediblevolunteer {\textbf{EngCredible Volunteer}}


\def \headertype {\doublecol} % \singlecol or \doublecol

% Misc variables
%% adjust spacing after each entry (generic, technical, projects)
\def \entryspacing {-6pt}
\def \technicalEntrySpacing {0pt}
\def \projectEntrySpacing {-10pt}

% Define colours
\definecolor{primary}{HTML}{000000}
\definecolor{secondary}{HTML}{0D47A1}
\definecolor{accent}{HTML}{263238}
\definecolor{links}{HTML}{1565C0}

% Set Dark theme color scheme
\ifthenelse{\equal{\darkTheme}{true}}{
  \definecolor{primary}{HTML}{FFFFFF}
  \definecolor{secondary}{HTML}{FFFFFF}
  \definecolor{accent}{HTML}{FFFFFF}
  \definecolor{links}{HTML}{FFFFFF}
  \pagecolor[HTML]{000000}
  \color[HTML]{FFFFFF}
}{}

% Provides debugging frame (useful to framelines edges when mucking with formatting)
\ifthenelse{\equal{\debugFrame}{true}}{
  \usepackage{showframe}
  \renewcommand*\ShowFrameColor{\color{primary}}
}{}

%------------------------------------------------------------------------------------------------------------------- 

% Margin Settings %
\addtolength{\textwidth}{.2in}
\addtolength{\topmargin}{-.30in}
% Adjust margins
\addtolength{\oddsidemargin}{-0.70in}
\addtolength{\evensidemargin}{-0.70in}
\addtolength{\textwidth}{1.25in}
\addtolength{\topmargin}{-.4in}
% \addtolength{\bottommargin}{-0.6in}
\addtolength{\textheight}{1.1in}

% Set the margin alignment 
\raggedbottom
\raggedright
\setlength{\tabcolsep}{0in}

% Define the link colours
\hypersetup{
    colorlinks=true,
    urlcolor=links,
}
% Defines to make listing easier
%% Header
\def \fullname {\hypersetup{urlcolor=black}\href{\websitelink}{\fullnametext}}
\def \linkedin {\linkedinicon \hspace{3pt}\href{\linkedinlink}{\linkedintext}}
\def \phone {\phoneicon \hspace{3pt}\href{\phonelink}{\phonetext}}
\def \email {\emailicon \hspace{3pt}\href{\emaillink}{\emailtext}}
\def \github {\githubicon \hspace{3pt}\href{\githublink}{\githubtext}}
\def \website {\websiteicon \hspace{3pt}\href{\websitelink}{\websitetext}}
%% Projects
\def \passmeter {\href{\passmeterlink}{\passmetertext}}
\def \potionprogramming {\href{\potionprogramminglink}{\potionprogrammingtext}}
\def \rowhammerattackresearch {\href{\rowhammerattackresearchlink}{\rowhammerattackresearchtext}}

% Custom commands

% provides alternative text to icons/links
\newcommand{\altText}[2]{%
  \BeginAccSupp{
    method=plain,
    unicode=false,
    ActualText={#2}%
  }%
  #1%
  \EndAccSupp{}%
  }

% heavier bolding - using https://tex.stackexchange.com/questions/191201/understanding-what-contour-package-does for reference
\newcommand{\countourBold}[1]{\textpdfrender{TextRenderingMode=FillStroke,FillColor=black,LineWidth=.40pt}{#1}}

% Replaces user details with anonymous ones
\ifthenelse{\equal{\anonymousVar}{true}}
  {
    \renewcommand{\fullnametext} {Anonymous}
    \renewcommand{\subtitle} {}
    \renewcommand{\linkedinlink} {https://linkedin.com/in/Anonymous/}
    \renewcommand{\linkedintext} {\altText{/Anonymous}{https://linkedin.com/in/Anonymous/}}
    \renewcommand{\phonelink} {tel:+1-223-456-7890}
    \renewcommand{\phonetext} {\altText{1.223.456.7890}{12234567890}}
    \renewcommand{\emaillink} {mailto:Anonymous@gmail.com}
    \renewcommand{\emailtext} {\altText{Anonymous@gmail.com}{Anonymous@gmail.com}}
    \renewcommand{\githublink} {https://github.com/Anonymous}
    \renewcommand{\githubtext} {\altText{/Anonymous}{https://github.com/Anonymous}}
    \renewcommand{\websitelink} {https://Anonymous.com/}
    \renewcommand{\websitetext} {\altText{Anonymous.com}{https://Anonymous.com/}}
    \renewcommand{\passmeterlink} {https://github.com/Anonymous/passmeter}
    \renewcommand{\passmetertext} {\altText{PassMeter}{https://github.com/Anonymous/passmeter}}
%    \renewcommand{\potionprogramminglink} {https://github.com/Anonymous/potion-programming}
%    \renewcommand{\potionprogrammingtext} {\altText{Potion Programming Platform}{https://github.com/Anonymous/potion-programming}}

    \renewcommand{\potionprogramminglink} {https://potionprogramming.com}
    \renewcommand{\potionprogrammingtext} {\altText{Potion Programming Platform}{https://potionprogramming.com}}
    
    \renewcommand{\rowhammerattackresearchlink} {https://github.com/Anonymous/rowhammer-research}
    \renewcommand{\rowhammerattackresearchtext} {\altText{Rowhammer Attack Research}{https://github.com/Anonymous/rowhammer-research}}
  
  } %true case
  {} %false case

% Entry start and end, for spacing of experience listings
\newcommand{\resumeEntryStart}{\begin{itemize}[topsep=0pt,partopsep=1ex,parsep=1ex,leftmargin=2.5mm]}
\newcommand{\resumeEntryEnd}{\end{itemize}\vspace{\entryspacing}}

% Entry start and end, for spacing of technical skill listings
\newcommand{\resumeTechnicalEntryStart}{\begin{itemize}[topsep=0pt,partopsep=1ex,parsep=1ex,leftmargin=2.5mm]}
\newcommand{\resumeTechnicalEntryEnd}{\end{itemize}\vspace{\technicalEntrySpacing}}

% Entry start and end, for spacing of project listings
\newcommand{\resumeProjectEntryStart}{\begin{itemize}[topsep=0pt,partopsep=1ex,parsep=1ex,leftmargin=2.5mm]}
\newcommand{\resumeProjectEntryEnd}{\end{itemize}\vspace{\projectEntrySpacing}}

% Itemized list for the bullet points under an entry, if necessary
\newcommand{\resumeItemListStart}{\begin{itemize}[leftmargin=0.50mm]\footnotesize}
\newcommand{\resumeItemListEnd}{\end{itemize}}

% Resume item
\renewcommand\labelitemi{\textbullet}
\renewcommand\labelitemii{\textbullet}
\renewcommand\labelitemiii{\normalfont\bfseries \textendash}
\renewcommand\labelitemiv{\textasteriskcentered}
\newcommand{\resumeItem}[1]{
  \item\footnotesize{
    {#1 \vspace{-2pt}}
  }
}

% Entry with title, subheading, date(s), and location
\newcommand{\resumeEntryTSDL}[4]{
  \vspace{-1pt}\item[]
    \begin{tabularx}{0.97\textwidth}{@{\hspace{-6pt}}X@{\hspace{60pt}}r}
      \textbf{\color{primary}#1} & {\color{accent}\small#2} \\
      \textit{\color{accent}\small#3} & \textit{\color{accent}\small#4} \\
    \end{tabularx}\vspace{-6pt}
}

% Entry with title and date(s)
\newcommand{\resumeEntryTD}[2]{
  \vspace{-1pt}\item[]
    \begin{tabularx}{0.97\textwidth}{@{\hspace{-6pt}}X@{\hspace{60pt}}r}
      \textbf{\color{primary}#1} & {\color{accent}\small#2} \\
    \end{tabularx}\vspace{-10pt}
}

% Entry for special (skills)
\newcommand{\resumeEntryS}[2]{
  \item[]{\hspace{-10pt}}\small{
    \textbf{\color{primary}#1 }{ #2 \vspace{-8pt}}
  }
}

% Double column header
\newcommand{\doublecol}[6]{
  \begin{tabularx}{\textwidth}{Xr}
    {
      \begin{tabular}[c]{l}
        
        \fontsize{35}{45}\selectfont{\color{primary}{{\fullname}}} \\
        {\textit{\subtitle}} % You could add a subtitle here
      \end{tabular}
    } & {
      \begin{tabular}[c]{l@{\hspace{1.5em}}l}
        {\normalsize#4} & {\normalsize#1} \\
        {\normalsize#5} & {\normalsize#2} \\
        {\normalsize#6} & {\normalsize#3}
      \end{tabular}
    }
  \end{tabularx}
}

% Single column header
\newcommand{\singlecol}[6]{
  \begin{tabularx}{\textwidth}{Xr}
    {
      \begin{tabular}[b]{l}
        \fontsize{35}{45}\selectfont{\color{primary}{{\textbf{\fullname}}}} \\
        {\textit{\subtitle}} % You could add a subtitle here
      \end{tabular}
    } & {
      \begin{tabular}[c]{l}
        {\normalsize#1} \\
        {\normalsize#2} \\
        {\normalsize#3} \\
        {\normalsize#4} \\
        {\normalsize#5} \\
        {\normalsize#6}
      \end{tabular}
    }
  \end{tabularx}
}


%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% % Defines the rSection environment for the large sections within the CV
% \newenvironment{rSection}[1]{ % 1 input argument - section name
%   \sectionskip
%   \MakeUppercase{\bf #1} % Section title
%   \sectionlineskip
%   \hrule % Horizontal line
%   \begin{list}{}{ % List for each individual item in the section
%     \setlength{\leftmargin}{1.5em} % Margin within the section
%   }
%   \item[]
% }{
%   \end{list}
% }


% Sections formatting
\titleformat{\section}{
  \vspace{-10pt}\scshape\raggedright\Large\bfseries
}{}{0em}{}[\color{black}\titlerule \vspace{-6pt}]

% Original Sections
% \renewcommand{\section}[2]{\vspace{5pt}
%   \colorbox{secondary}{\color{white}\raggedbottom\normalsize\textbf{{#1}{\hspace{7pt}#2}}}
% }