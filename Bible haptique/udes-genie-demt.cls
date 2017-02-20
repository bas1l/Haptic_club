%%%---------------------------------------------------------------------------
%%% udes-genie-demt.cls
%%% Copyright 2010 Universite de Sherbrooke, Faculte de genie
%%%
%%% This work may be distributed and/or modified under the
%%% conditions of the LaTeX Project Public License, either version 1.3
%%% of this license or (at your option) any later version.
%%% The latest version of this license is in
%%%   http://www.latex-project.org/lppl.txt
%%% and version 1.3 or later is part of all distributions of LaTeX
%%% version 2005/12/01 or later.
%%%
%%% This work has the LPPL maintenance status `maintained'.
%%% 
%%% The current maintainer of this work is:
%%% Charles-Antoine Brunet
%%% Departement de genie electrique et de genie informatique
%%% Universite de Sherbrooke
%%% Sherbrooke (Quebec)
%%% Canada JIK 2R1
%%%
%%% Email: Charles-Antoine.Brunet@USherbrooke.ca
%%% Distribution site:
%%% http://www.usherbrooke.ca/genie/intranet/formulaires-et-documents-internes/
%%%
%%% This work consists of the files:
%%%   udes-genie-demt.cls udes-genie-e.bst udes-genie-f.bst
%%%
%%%---------------------------------------------------------------------------

%------   IDENTIFICATION   ---------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{udes-genie-demt}[2010/05/18 v1.10 Universite de Sherbrooke, %
        Faculte de genie: DPR, essai, memoire et these]

%--- INITIALISATION ----------------------------------------------------------

\newif\ifudes@genie@demt@bibtypeok
\newif\ifudes@genie@demt@bibnumerique
\newif\ifudes@genie@demt@francais
\newif\ifudes@genie@demt@gardedebut
\newif\ifudes@genie@demt@gardefin
\newif\ifudes@genie@demt@lignes
\newif\ifudes@genie@demt@lof
\newif\ifudes@genie@demt@lot
\newif\ifudes@genie@demt@simple
\newif\ifudes@genie@demt@typedocok
\newif\ifudes@genie@demt@typedpr
\newif\ifudes@genie@demt@typeessai
\newif\ifudes@genie@demt@typememoire
\newif\ifudes@genie@demt@typethese
\newif\ifudes@genie@demt@typeprotocole
\newif\ifudes@genie@demt@typeprogok
\newif\ifudes@genie@demt@withspec

\newcounter{udes@genie@demt@pages} \setcounter{udes@genie@demt@pages}{-1}
\newcounter{udes@tmp}

\newcommand*{\udes@genie@demt@departementname}{d\'epartement inconnu}
\newcommand*{\udes@genie@demt@dept}{departement inconnu}
\newcommand*{\udes@genie@demt@dprdoc}{DPR de doctorat inconnue}
\newcommand*{\udes@genie@demt@dprmait}{DPR de ma{\^\i}trise inconnue}
\newcommand*{\udes@genie@demt@essai}{Essai inconnu}
\newcommand*{\udes@genie@demt@memoire}{M\'emoire de ma{\^\i}trise}
\newcommand*{\udes@genie@demt@specialite}{sp\'ecialit\'e inconnue}
\newcommand*{\udes@genie@demt@these}{Th\`ese de doctorat}%
\newcommand*{\udes@genie@demt@typedoc}{type de document inconnu}
\newcommand*{\udes@genie@demt@udesname}{UNIVERSIT\'E DE SHERBROOKE}

%--- DEFINITION DES COMMANDES D'INTERFACE USAGER -----------------------------

\newcommand*{\udes@genie@demt@commoncommands}{
	\newcommand{\Titre}[2][]{
		\renewcommand{\udes@genie@demt@titrea}{##1}
		\renewcommand{\udes@genie@demt@titref}{##2}
	}
	
	\newcommand*{\Auteur}[2]{
		\renewcommand*{\udes@genie@demt@prenom}{##1}
		\renewcommand*{\udes@genie@demt@nom}{##2}
	}
	
	\newcommand*{\Date}[2]{
		\renewcommand*{\udes@genie@demt@mois}{##1}
		\renewcommand*{\udes@genie@demt@annee}{##2}
	}

	\newcommand*{\FichiersBibliographiques}[1]{
		\renewcommand*{\udes@genie@demt@bib}{##1}
	}

  \ifudes@genie@demt@typeprotocole
  \else
		\newcommand{\Jury}[1]{
			\renewcommand{\udes@genie@demt@jury}{##1}
		}
	
		\newcommand*{\FichierResume}[2][]{
			\renewcommand*{\udes@genie@demt@resumea}{##1}
			\renewcommand*{\udes@genie@demt@resumef}{##2}
		}

		\newcommand*{\MotsCles}[2][]{
			\renewcommand*{\udes@genie@demt@motsclesa}{##1}
			\renewcommand*{\udes@genie@demt@motsclesf}{##2}
		}
	
		\newcommand*{\FichierLexique}[1]{
			\renewcommand*{\udes@genie@demt@lexique}{##1}
		}
		
		\newcommand*{\FichierSymboles}[1]{
			\renewcommand*{\udes@genie@demt@symboles}{##1}
		}
		
		\newcommand*{\FichierAcronymes}[1]{
			\renewcommand*{\udes@genie@demt@acronymes}{##1}
		}
	\fi
}

\newcommand*{\udes@genie@demt@emtcommands}{
	\newcommand*{\FichierRemerciements}[1]{
		\renewcommand*{\udes@genie@demt@remerciements}{##1}
	}

	\newcommand{\Dedicace}[1]{
		\renewcommand{\udes@genie@demt@dedicace}{##1}
	}
}

\newcommand*{\udes@genie@demt@setuptypedpr}
{
	\udes@genie@demt@typedocoktrue
	\udes@genie@demt@typedprtrue
	\udes@genie@demt@typeessaifalse
	\udes@genie@demt@typememoirefalse
	\udes@genie@demt@typethesefalse
	\udes@genie@demt@typeprotocolefalse
	\udes@genie@demt@withspecfalse
}

\newcommand*{\udes@genie@demt@setupdpr}
{
	\udes@genie@demt@setuptypedpr
	\udes@genie@demt@commoncommands
  \udes@genie@demt@gardedebutfalse
  \udes@genie@demt@gardefinfalse
}

\newcommand*{\udes@genie@demt@setuptypeessai}
{
	\udes@genie@demt@typedocoktrue
	\udes@genie@demt@typedprfalse
	\udes@genie@demt@typeessaitrue
	\udes@genie@demt@typememoirefalse
	\udes@genie@demt@typethesefalse
	\udes@genie@demt@typeprotocolefalse
	\udes@genie@demt@withspecfalse
}

\newcommand*{\udes@genie@demt@setupessai}
{
	\udes@genie@demt@setuptypeessai
	\udes@genie@demt@commoncommands
	\udes@genie@demt@emtcommands
	\udes@genie@demt@gardedebuttrue
	\udes@genie@demt@gardefintrue
}

\newcommand*{\udes@genie@demt@setuptypememoire}
{
	\udes@genie@demt@typedocoktrue
	\udes@genie@demt@typedprfalse
	\udes@genie@demt@typeessaifalse
	\udes@genie@demt@typememoiretrue
	\udes@genie@demt@typethesefalse
	\udes@genie@demt@typeprotocolefalse
	\udes@genie@demt@withspectrue
}

\newcommand*{\udes@genie@demt@setupmemoire}
{
	\udes@genie@demt@setuptypememoire
	\udes@genie@demt@commoncommands
	\udes@genie@demt@emtcommands
	\udes@genie@demt@gardedebuttrue
	\udes@genie@demt@gardefintrue
}

\newcommand*{\udes@genie@demt@setuptypethese}
{
	\udes@genie@demt@typedocoktrue
	\udes@genie@demt@typedprfalse
	\udes@genie@demt@typeessaifalse
	\udes@genie@demt@typememoirefalse
	\udes@genie@demt@typethesetrue
	\udes@genie@demt@typeprotocolefalse
	\udes@genie@demt@withspectrue
}

\newcommand*{\udes@genie@demt@setupthese}
{
  \udes@genie@demt@setuptypethese
	\udes@genie@demt@commoncommands
	\udes@genie@demt@emtcommands
	\udes@genie@demt@gardedebuttrue
	\udes@genie@demt@gardefintrue
}

\newcommand*{\udes@genie@demt@setuptypeprotocole}
{
  \renewcommand*{\udes@genie@demt@typedoc}{protocole}
	\udes@genie@demt@typedocoktrue
	\udes@genie@demt@typedprfalse
	\udes@genie@demt@typeessaifalse
	\udes@genie@demt@typememoirefalse
	\udes@genie@demt@typethesetrue
	\udes@genie@demt@typeprotocoletrue
	\udes@genie@demt@withspecfalse
}

\newcommand*{\udes@genie@demt@setupprotocole}
{
  \udes@genie@demt@setuptypeprotocole
	\udes@genie@demt@commoncommands
  \udes@genie@demt@gardedebutfalse
  \udes@genie@demt@gardefinfalse
}

%--- OPTIONS -----------------------------------------------------------------

\DeclareOption{francais}{%
	\PassOptionsToClass{francais}{book}%
	\udes@genie@demt@francaistrue%
}

\DeclareOption{english}{%
	\PassOptionsToClass{english}{book}%
	\udes@genie@demt@francaisfalse%
}

\DeclareOption{dpr-maitrise}%
	{\renewcommand*{\udes@genie@demt@typedoc}{dprmait}%
	 \udes@genie@demt@setupdpr}

\DeclareOption{dpr-doctorat}%
	{\renewcommand*{\udes@genie@demt@typedoc}{dprdoc}%
	 \udes@genie@demt@setupdpr}

\DeclareOption{essai}%
	{\renewcommand*{\udes@genie@demt@typedoc}{essai}%
	 \udes@genie@demt@setupessai}

\DeclareOption{memoire}%
	{\renewcommand*{\udes@genie@demt@typedoc}{memoire}%
	 \udes@genie@demt@setupmemoire}

\DeclareOption{these}%
	{\renewcommand*{\udes@genie@demt@typedoc}{these}%
	 \udes@genie@demt@setupthese}

\DeclareOption{electrique}{
	\renewcommand*{\udes@genie@demt@departementname}{D\'epartement de g\'enie \'electrique et de g\'enie informatique}%
	\renewcommand*{\udes@genie@demt@dept}{electrique}%
	\renewcommand*{\udes@genie@demt@specialite}{g\'enie \'electrique}%
  \renewcommand*{\udes@genie@demt@essai}{GEI~808 Essai}
  \renewcommand*{\udes@genie@demt@dprmait}{GEI~727 D\'efinition du projet de recherche}
  \renewcommand*{\udes@genie@demt@dprdoc}{SCA~772 D\'efinition du projet de recherche au doctorat}
	\udes@genie@demt@typeprogoktrue
}

\DeclareOption{mecanique}{
	\renewcommand*{\udes@genie@demt@departementname}{D\'epartement de g\'enie m\'ecanique}%
	\renewcommand*{\udes@genie@demt@dept}{mecanique}%
	\renewcommand*{\udes@genie@demt@specialite}{g\'enie m\'ecanique}
  \renewcommand*{\udes@genie@demt@essai}{GMC~808 Essai}
  \renewcommand*{\udes@genie@demt@dprmait}{GMC~727 D\'efinition du projet de recherche}
  \renewcommand*{\udes@genie@demt@dprdoc}{SCA~772 D\'efinition du projet de recherche au doctorat}
	\udes@genie@demt@typeprogoktrue
}

\DeclareOption{aeronautique}{
  \ExecuteOptions{mecanique}
  \renewcommand*{\udes@genie@demt@essai}{GMC~809 Projet en g\'enie a\'erospatial}
}

\DeclareOption{chimique}{
	\renewcommand*{\udes@genie@demt@departementname}{D\'epartement de g\'enie chimique et de g\'enie biotechnologique}%
	\renewcommand*{\udes@genie@demt@dept}{chimique}%
	\renewcommand*{\udes@genie@demt@specialite}{g\'enie chimique}
  \renewcommand*{\udes@genie@demt@essai}{GCH~808 Essai}
  \renewcommand*{\udes@genie@demt@dprmait}{GCH~727 D\'efinition du projet de recherche}
  \renewcommand*{\udes@genie@demt@dprdoc}{SCA~772 D\'efinition du projet de recherche au doctorat }
	\udes@genie@demt@typeprogoktrue
}

\DeclareOption{civil}{
	\renewcommand*{\udes@genie@demt@departementname}{D\'epartement de g\'enie civil}%
	\renewcommand*{\udes@genie@demt@dept}{civil}%
	\renewcommand*{\udes@genie@demt@specialite}{g\'enie civil}
  \renewcommand*{\udes@genie@demt@essai}{GCI~808 Projet d'int\'egration: essai}
  \renewcommand*{\udes@genie@demt@dprmait}{GCI~727 D\'efinition du projet de recherche}
  \renewcommand*{\udes@genie@demt@dprdoc}{SCA~772 D\'efinition du projet de recherche au doctorat}
	\udes@genie@demt@typeprogoktrue
}

\DeclareOption{ldf}%
	{\udes@genie@demt@loftrue}
\DeclareOption{!ldf}%
	{\udes@genie@demt@loffalse}
\DeclareOption{ldt}%
	{\udes@genie@demt@lottrue}
\DeclareOption{!ldt}%
	{\udes@genie@demt@lotfalse}
	
\DeclareOption{numerique}%
	{\udes@genie@demt@bibnumeriquetrue
	 \udes@genie@demt@bibtypeoktrue
	 \PassOptionsToPackage{numbers,square,comma,sort&compress}{natbib}
	}
\DeclareOption{auteur-annee}%
	{\udes@genie@demt@bibnumeriquefalse
	 \udes@genie@demt@bibtypeoktrue
	 \PassOptionsToPackage{authoryear,square,semicolon,sort}{natbib}
  }

\DeclareOption{simple}%
	{\udes@genie@demt@simpletrue
	 \PassOptionsToClass{oneside,openany}{book}
	 \PassOptionsToPackage{twoside=false}{geometry}		
	 }

\DeclareOption{livre}%
	{\udes@genie@demt@simplefalse
	 \PassOptionsToClass{twoside,openright}{book}
	 \PassOptionsToPackage{twoside=true}{geometry}		
}

\DeclareOption{lignes}%
	{\udes@genie@demt@lignestrue}

\DeclareOption{!lignes}%
	{\udes@genie@demt@lignesfalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ExecuteOptions{francais,ldt,ldf,livre,!lignes}

\ProcessOptions

%--- CHARGEMENT --------------------------------------------------------------

\LoadClass[letterpaper,12pt]{book}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry,setspace,parskip,flafter,array,fancyhdr}
\RequirePackage{natbib}[2009/02/02]
\RequirePackage{etoolbox}[2008/06/28]
\RequirePackage[francais,english]{babel}
\RequirePackage{caption}[2008/04/01]
\RequirePackage{url}

%------   MISE EN PAGE  -------------------------------------------------------

\setlength{\parskip}{1.5ex plus0.25ex minus0ex}
\setlength{\parindent}{0em}

\clubpenalty=10000  % Penalite pour lignes orphelines
\widowpenalty=10000 % Penalite pour lignes veuves

\geometry{letterpaper,hmargin={2.5cm,2.5cm},vmargin={2.5cm,2.5cm},%
          foot=1.25cm,head=0.9cm,headsep=0.35cm,bindingoffset=0.5cm}

\captionsetup[table]{labelsep=quad,textformat=simple,font=normal,margin=5ex,position=top,skip=0.5ex}
\captionsetup[figure]{labelsep=quad,textformat=simple,font=normal,margin=5ex,position=bottom,skip=1ex}

%--- REDEFINITION COMMANDES STANDARDS  ---------------------------------------

\renewcommand{\cite}{\citep}

\renewcommand{\labelitemi}{-}
\renewcommand{\labelitemii}{-}
\renewcommand{\labelitemiii}{-}
\renewcommand{\labelitemiii}{-}

\renewcommand*{\subsubsection}{\secdef\udes@genie@demt@subsubsec\udes@genie@demt@ssubsubsec}

\newcommand*{\udes@genie@demt@subsubsec}[2][default]{\udes@genie@demt@ssubsubsec{#2}}

\newcommand*{\udes@genie@demt@ssubsubsec}[1]{%
	{\noindent\normalfont\sffamily\bfseries #1}\par}

\renewcommand*{\subsection}{\@startsection{subsection}{2}{0pt}{%
	-2ex plus-0.5ex minus -0.5ex}{0.5ex}{\normalfont\large\sffamily\bfseries}}

\renewcommand*{\section}{%
	\@startsection{section}{1}{0pt}{-2ex plus-0.5ex minus -0.5ex}{1ex}%
	{\normalfont\Large\sffamily\bfseries}}

\fancypagestyle{chapitre}{
 \fancyhf{}
 \cfoot{\thepage}
 \renewcommand{\headrulewidth}{0pt}
}

\renewcommand*{\chapter}{
	\if@openright
		\cleardoublepage
	\else
		\clearpage
	\fi
	
 	\thispagestyle{chapitre}
	
 	\global\@topnum\z@
  \@afterindentfalse
  \secdef\udes@genie@demt@chapter\udes@genie@demt@schapter
}

\newcommand*{\udes@genie@demt@chapter}[2][default]{
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\refstepcounter{chapter}%
			\typeout{\chaptername\space\thechapter.}
			\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
		\else
			\addcontentsline{toc}{chapter}{\protect\numberline#1}
		\fi
	\else
		\addcontentsline{toc}{chapter}{\protect\numberline#1}
	\fi
	\chaptermark{#1}
	\addtocontents{lof}{\protect\addvspace{10\p@}}
	\addtocontents{lot}{\protect\addvspace{10\p@}}
	\if@twocolumn
		\@topnewpage[\udes@genie@demt@makechapterhead{#2}]
	\else
		\udes@genie@demt@makechapterhead{#2}
	\@afterheading
	\fi
}
                    
\newcommand*{\udes@genie@demt@makechapterhead}[1]{
	{
%		\parindent \z@ \raggedright \normalfont
		\parindent \z@ \normalfont
		\ifnum \c@secnumdepth >\m@ne
			\if@mainmatter
				\LARGE\sffamily\bfseries \chaptername\space \thechapter
				\par\nobreak
				\vskip 0\p@
			\fi
		\fi
		\interlinepenalty\@M
		\LARGE\sffamily\bfseries #1 \par\nobreak
		\vskip 30\p@
	}
}
  
\newcommand*{\udes@genie@demt@schapter}[1]{
	\if@twocolumn
		\@topnewpage[\udes@genie@demt@makeschapterhead{#1}]
	\else
		\udes@genie@demt@makeschapterhead{#1}
		\@afterheading
	\fi
}
     
\newcommand*{\udes@genie@demt@makeschapterhead}[1]{
	{
		\parindent \z@ \normalfont
%		\parindent \z@ \raggedright \normalfont
		\vskip 0\p@
		\interlinepenalty\@M
		\LARGE\sffamily\bfseries #1 \par\nobreak
		\vskip 30\p@
	}
}

\renewcommand*{\part}{
	\if@openright
		\cleardoublepage
	\else
		\clearpage
	\fi
	\thispagestyle{empty}
	\if@twocolumn
		\onecolumn
		\@tempswatrue
	\else
		\@tempswafalse
	\fi
	\null\vfil
	\secdef\udes@genie@demt@part\udes@genie@demt@spart
}

\newcommand*{\udes@genie@demt@partnum}{%
	\ifcase\value{part}\or PREMI\`ERE\or DEUXI\`EME\or %
		TROISI\`EME\or QUATRI\`EME\or CINQUI\`EME\or SIXI\`EME\or %
		SEPTI\`EME\or HUITI\`EME\or NEUVI\`EME\or DIXI\`EME\or %
		ONZI\`EME\or DOUZI\`EME\or TREIZI\`EME\or QUATORZI\`EME\or %
		QUINZI\`EME\or SEIZI\`EME\or DIX-SEPTI\`EME\or DIX-HUITI\`EME\or %
		DIX-NEUVI\`EME\or VINGTI\`EME
	\fi
}

\newcommand*{\udes@genie@demt@part}[2][default]{
	\ifnum \c@secnumdepth >-2\relax
		\refstepcounter{part}
		\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}
	\else
		\addcontentsline{toc}{part}{#1} 
	\fi
	\markboth{}{}
	{
		\centering
		\interlinepenalty \@M
		\normalfont
		\ifnum \c@secnumdepth >-2\relax
			\iflanguage{francais}{\Huge\bfseries \udes@genie@demt@partnum\ \partname}{}
			\iflanguage{english}{\Huge\bfseries \partname\ \thepart}{}
			\par
			\vskip 20\p@
		\fi
		\Huge\bfseries #2\par
	}
	\udes@genie@demt@endpart
}
    
\newcommand*{\udes@genie@demt@spart}[1]{
	{
		\centering
		\interlinepenalty \@M
		\normalfont
		\Huge\bfseries #1\par
	}
	\udes@genie@demt@endpart
}
    
\newcommand*{\udes@genie@demt@endpart}{
	\vfil\newpage
	\if@twoside
	\if@openright
		\null
		\thispagestyle{empty}
		\newpage
		\fi
	\fi
	\if@tempswa
		\twocolumn
	\fi
}

\renewcommand*{\appendix}{
	\par
	\singlespacing
	\setcounter{chapter}{0}
	\setcounter{section}{0}
	\renewcommand*{\chaptername}{\appendixname}
	\renewcommand*{\thechapter}{\@Alph\c@chapter}
  \setcounter{udes@genie@demt@pages}{\value{page}}
}

\addto\captionsfrench{%
	\def\contentsname{TABLE DES MATI\`ERES}%
	\def\listfigurename{LISTE DES FIGURES}%
	\def\listtablename{LISTE DES TABLEAUX}%
	\def\chaptername{CHAPITRE}%
	\def\bibname{LISTE DES R\'EF\'ERENCES}%
	\def\appendixname{ANNEXE}%
	\def\partname{PARTIE}%
	\def\figurename{Figure}%
	\def\tablename{Tableau}%
	\def\CaptionSeparator{~~}%
	\def\indexname{INDEX}%
	\def\glossaryname{LEXIQUE}%
	\def\abstractname{R\'ESUM\'E}%
	\def\refname{LISTE DES R\'EF\'ERENCES}%
	\def\prefacename{PR\'EFACE}%
	\def\enclname{P.~J. }%
	\def\ccname{Copie \`a }%
	\def\headtoname{\`A}%
	\def\pagename{page}%
	\def\seename{{\emph{voir}}}%
	\def\alsoname{{\emph{voir aussi}}}%
	\def\proofname{D\'emonstration}% for AMS-\LaTeX
}

\addto\captionsenglish{%
	\def\contentsname{TABLE OF CONTENTS}%
	\def\listfigurename{LIST OF FIGURES}%
	\def\listtablename{LIST OF TABLES}%
	\def\chaptername{CHAPTER}%
	\def\bibname{LIST OF REFERENCES}%
	\def\appendixname{ANNEX}%
	\def\partname{PART}%
	\def\figurename{Figure}%
	\def\tablename{Table}%
	\def\glossaryname{GLOSSARY}%
	\def\CaptionSeparator{~~}%
	\def\prefacename{PREFACE}%
	\def\refname{REFERENCES}%
	\def\abstractname{ABSTRACT}% 
	\def\indexname{INDEX}%
	\def\enclname{encl}%
	\def\ccname{cc}%
	\def\headtoname{To}%
	\def\pagename{Page}%
	\def\seename{see}%
	\def\alsoname{see also}%
	\def\proofname{Proof}%
}

%--- COMMANDES INTERNES  -----------------------------------------------------

\newcommand{\udes@genie@demt@titrea}{}
\newcommand{\udes@genie@demt@titref}{}
\newcommand*{\udes@genie@demt@prenom}{}
\newcommand*{\udes@genie@demt@nom}{}
\newcommand*{\udes@genie@demt@mois}{}
\newcommand*{\udes@genie@demt@annee}{}
\newcommand {\udes@genie@demt@jury}{}
\newcommand*{\udes@genie@demt@motsclesa}{}
\newcommand*{\udes@genie@demt@motsclesf}{}
\newcommand*{\udes@genie@demt@resumea}{}
\newcommand*{\udes@genie@demt@resumef}{}
\newcommand*{\udes@genie@demt@remerciements}{}
\newcommand*{\udes@genie@demt@bib}{}
\newcommand {\udes@genie@demt@dedicace}{}
\newcommand*{\udes@genie@demt@lexique}{}
\newcommand*{\udes@genie@demt@symboles}{}
\newcommand*{\udes@genie@demt@acronymes}{}

%-----------

\newcommand{\udes@genie@demt@fichiermanquant}[2]{
\chapter*{#1}

\fbox{\fbox{#2}}

\if@twoside\null\thispagestyle{empty}\clearpage\fi%
}

\newcommand*{\udes@genie@demt@setuplangue}{
	\ifudes@genie@demt@francais
 		\selectlanguage{francais}
	\else
 		\selectlanguage{english}
	\fi
}

\newcommand*{\udes@genie@demt@setupstyle}{
	\ifudes@genie@demt@lignes
	  \renewcommand{\headrulewidth}{0.4pt}
	  \renewcommand{\footrulewidth}{0.4pt}
	\else
	   \renewcommand{\headrulewidth}{0pt}
	   \renewcommand{\footrulewidth}{0pt}
	\fi

	\ifudes@genie@demt@simple
		\pagestyle{fancy}
		\fancyhf{}
		\cfoot{\thepage}
	\else
    \pagestyle{fancy}
		\fancyhf{}
		\fancyhead[RO,LE]{\thepage}
		\fancyhead[LO]{\rightmark}
		\fancyhead[RE]{\leftmark}
	\fi
}

\newcommand*{\udes@genie@demt@setupprogramme}{
 	\ifudes@genie@demt@typeprotocole
 	\else
	  \ifudes@genie@demt@typeprogok
	  \else
	  
			\ClassWarningNoLine{udes-genie-demt}{Specifiez le programme d'etude dans les options de classe}%
	  \fi
  \fi
}

\newcommand*{\udes@genie@demt@setuptypedoc}{
  \ifudes@genie@demt@typedocok
  \else
  
		\ClassWarningNoLine{udes-genie-demt}{Specifiez le type de document dans les options de classe}%
  \fi
}

\newcommand*{\udes@genie@demt@setupnom}{
 	\ifudes@genie@demt@typeprotocole
 	\else
	 	\if\empty\udes@genie@demt@prenom
			
			\ClassWarningNoLine{udes-genie-demt}{Specifiez le prenom avec la commande \protect\Auteur}
			\renewcommand*{\udes@genie@demt@prenom}{Pr\'enom}
		\fi
		
	 	\if\empty\udes@genie@demt@nom
	 	
			\ClassWarningNoLine{udes-genie-demt}{Specifiez le nom avec la commande \protect\Auteur}
	  	\renewcommand*{\udes@genie@demt@nom}{Nom}
		\fi
  \fi
}

\newcommand*{\udes@genie@demt@setupdate}{
 	\if\empty\udes@genie@demt@mois
 	
		\ClassWarningNoLine{udes-genie-demt}{Specifiez le mois avec la commande \protect\Date}
  	\renewcommand*{\udes@genie@demt@mois}{Janvier}
	\fi
	
 	\if\empty\udes@genie@demt@annee
 	
		\ClassWarningNoLine{udes-genie-demt}{Specifiez l'annee avec la commande \protect\Date}
 		\renewcommand*{\udes@genie@demt@annee}{2000}
	\fi
}

\newcommand*{\udes@genie@demt@setupjury}{
 	\ifudes@genie@demt@typeprotocole
 	\else
	 	\if\empty\udes@genie@demt@jury
	 	
			\ClassWarningNoLine{udes-genie-demt}{Specifiez le jury avec la commande \protect\Jury}%
	 		\renewcommand{\udes@genie@demt@jury}{\`A d\'eterminer}
		\fi
  \fi
}

\newcommand*{\udes@genie@demt@setuptitre}{
	\if\empty\udes@genie@demt@titref
		
		\ClassWarningNoLine{udes-genie-demt}%
			{Specifiez titre francais avec la commande \protect\Titre}%
		\renewcommand{\udes@genie@demt@titref}{Titre \`a d\'eterminer}
	\fi

	\ifudes@genie@demt@francais
		\if\empty\udes@genie@demt@titrea
		\else
		
			\ClassWarningNoLine{udes-genie-demt}
			{Titre anglais non requis: document francais}%
		\fi
	\else
		\if\empty\udes@genie@demt@titrea
		
			\ClassWarningNoLine{udes-genie-demt}
				{Specifiez titre anglais avec la commande \protect\Titre}%
 			\renewcommand{\udes@genie@demt@titrea}{Title to be defined}
		\fi		 	
	\fi
}

\newcommand*{\udes@genie@demt@setupbib}{
	\ifudes@genie@demt@bibtypeok
    \ifudes@genie@demt@bibnumerique
		\else
 		  \setcitestyle{aysep={,}}
		\fi
	\else
  
		\ClassWarningNoLine{udes-genie-demt}{Type de reference non specifie.
			\MessageBreak Specifier le type dans les options de classe}
		\setcitestyle{authoryear,square,semicolon,aysep={,}}
  \fi
  
  \if\empty\udes@genie@demt@bib
  
		\ClassWarningNoLine{udes-genie-demt}{Liste des references absente: aucun fichiers bib.%
			\MessageBreak Utilisez la commande \protect\FichiersBibliographiques}					
  \fi
  
	\ifudes@genie@demt@francais
   	\bibliographystyle{udes-genie-f}
	\else
  	\bibliographystyle{udes-genie-e}
	\fi
}

\newcommand*{\udes@genie@demt@setupdocument}{
  \udes@genie@demt@setuplangue
  \udes@genie@demt@setupstyle
  \udes@genie@demt@setupprogramme
  \udes@genie@demt@setuptypedoc
  \udes@genie@demt@setupnom
  \udes@genie@demt@setupdate
  \udes@genie@demt@setupjury
  \udes@genie@demt@setuptitre
  \udes@genie@demt@setupbib
}

\newcommand*{\udes@genie@demt@gen@gardedebut}{
	\ifudes@genie@demt@gardedebut
		{\null\thispagestyle{empty}\renewcommand*{\thepage}{GD1}\clearpage}
		{\if@twoside\null\thispagestyle{empty}\renewcommand*{\thepage}{GD2}\cleardoublepage\fi}%
	\fi
}

\newcommand*{\udes@genie@demt@typedocument}{
	\begin{tabular}{c}%
		\Large\csname udes@genie@demt@\udes@genie@demt@typedoc\endcsname%
		\ifudes@genie@demt@withspec\\[0.5ex]\Large\udes@genie@demt@specialityname~\udes@genie@demt@specialite\fi%
	\end{tabular}
}

\newcommand*{\udes@genie@demt@gen@titre}{
	\begin{titlepage}
		\renewcommand*{\thepage}{T1}%
		\vspace*{-0.5 in}%
		\begin{center}%
 			\ifudes@genie@demt@typeprotocole
				\begin{tabular}{c}
					\Large \udes@genie@demt@udesname \\
					\Large \udes@genie@demt@facultyname
				\end{tabular}
 	    \else
				\begin{tabular}{c}
					\Large\udes@genie@demt@udesname \\
					\Large\udes@genie@demt@facultyname \\%
					\Large\udes@genie@demt@departementname\\[0.5ex]
				\end{tabular}
			\fi
			\vfill
			\ifudes@genie@demt@francais
				{\huge\udes@genie@demt@titref\par}%
			\else				
				\begin{otherlanguage}{francais}
				{\huge\udes@genie@demt@titref}
				\end{otherlanguage}\par
				{\Large\udes@genie@demt@titrea\par}
			\fi
			\vfill
			\ifudes@genie@demt@typeprotocole
 	    \else
 	      \udes@genie@demt@typedocument
				\vfill
			\fi
			\begin{tabular}{c}
				{\Large\udes@genie@demt@prenom~\udes@genie@demt@nom}
			\end{tabular}
			\vfill
			\ifudes@genie@demt@typeprotocole
 	    \else
				{\large\udes@genie@demt@juryname~\begin{tabular}[t]{l}\udes@genie@demt@jury\end{tabular}}
				\vfill
			\fi
			{\Large \udes@genie@demt@adressname \hfill \udes@genie@demt@mois~\udes@genie@demt@annee}%
		\end{center}
	\end{titlepage}
	\clearpage
	{\thispagestyle{empty}\renewcommand*{\thepage}{T2}\cleardoublepage}
}

\newcommand{\udes@genie@demt@equal}[3]{
	\ifnum#1=#2
	\else
	
		\ClassWarningNoLine{udes-genie-demt}{#3}%
	\fi
}

\newcommand{\udes@genie@demt@lowerequal}[3]{
	\ifnum#1<#2
	\else
		\ifnum#1=#2
		\else
		
			\ClassWarningNoLine{udes-genie-demt}{#3}%
		\fi
	\fi
}

\newcommand{\udes@genie@demt@gen@dedicace}{
	\if\empty\udes@genie@demt@dedicace
	\else
		{\null\vfill
		\null\hfill%
		\begin{minipage}{0.5\linewidth}%
			\setlength{\parskip}{1.5ex}\setlength{\parindent}{0em}%
			\udes@genie@demt@dedicace%
		\end{minipage}	
		\vfill\vfill\null
		\thispagestyle{empty}\renewcommand*{\thepage}{D1}\clearpage
		\if@twoside\null\thispagestyle{empty}\renewcommand*{\thepage}{D2}\cleardoublepage\fi}%
	\fi
}

\newcommand{\udes@genie@demt@gen@resumea}{
	\begin{otherlanguage}{english}
		\chapter*{\abstractname}
		\setcounter{udes@tmp}{\value{page}}
		\input{\udes@genie@demt@resumea}\par			
		\begin{description}\item[\udes@genie@demt@motsclesname]\udes@genie@demt@motsclesa\end{description}\par
		\clearpage
		\addtocounter{udes@tmp}{-\value{page}}
		\udes@genie@demt@equal{-1}{\value{udes@tmp}}{Le resume anglais doit etre d'une page %
			maximum,\MessageBreak incluant les mots-cles}
		\ifodd\value{page}\else\if@twoside\null\thispagestyle{empty}\cleardoublepage\fi\fi%
	\end{otherlanguage}
}

\newcommand{\udes@genie@demt@gen@resumef}{
	\begin{otherlanguage}{francais}
		\chapter*{\abstractname}
		\setcounter{udes@tmp}{\value{page}}
		\input{\udes@genie@demt@resumef}\par			
		\begin{description}\item[\udes@genie@demt@motsclesname]\udes@genie@demt@motsclesf\end{description}\par
		\clearpage
		\addtocounter{udes@tmp}{-\value{page}}
		\udes@genie@demt@equal{-1}{\value{udes@tmp}}{Le resume francais doit etre d'une page %
			maximum,\MessageBreak incluant les mots-cles}
		\ifodd\value{page}\else\if@twoside\null\thispagestyle{empty}\cleardoublepage\fi\fi%
	\end{otherlanguage}
}

\newcommand*{\udes@genie@demt@setupmotsclesa}{
 	\ifudes@genie@demt@typeprotocole
 	\else
	 	\if\empty\udes@genie@demt@motsclesa
	 	
			\ClassWarningNoLine{udes-genie-demt}{Specifiez 3 a 8 mots cle anglais%
			                     \MessageBreak avec la commande \protect\MotsCles}%
	 		\renewcommand*{\udes@genie@demt@motsclesf}{English keywords to be specified}
	 	\fi
 	\fi
}

\newcommand*{\udes@genie@demt@setupmotsclesf}{
 	\ifudes@genie@demt@typeprotocole
 	\else
	 	\if\empty\udes@genie@demt@motsclesf
	 	
			\ClassWarningNoLine{udes-genie-demt}{Specifiez 3 a 8 mots cle francais%
			                     \MessageBreak avec la commande \protect\MotsCles}%
	 		\renewcommand*{\udes@genie@demt@motsclesf}{Mots cl\'es fran\c{c}ais \`a d\'eterminer}
	 	\fi
 	\fi
}

\newcommand{\udes@genie@demt@gen@resumes}{
  \ifudes@genie@demt@typeprotocole
  \else
		\if\empty\udes@genie@demt@resumef
		
			\ClassWarningNoLine{udes-genie-demt}%
				{Pas de fichier resume francais!\MessageBreak Ajustez la commande \protect\FichierResume}
			\udes@genie@demt@fichiermanquant{\abstractname}{Fichier de r\'esum\'e fran\c{c}ais manquant.}
			\udes@genie@demt@setupmotsclesf
		\else
			\udes@genie@demt@setupmotsclesf
		  \udes@genie@demt@gen@resumef
		\fi
		
		\ifudes@genie@demt@francais				
			\if\empty\udes@genie@demt@resumea
			\else
			  \udes@genie@demt@setupmotsclesa
	  		\udes@genie@demt@gen@resumea
			\fi			
		\else
			\if\empty\udes@genie@demt@resumea
			
				\ClassWarningNoLine{udes-genie-demt}%
					{Pas de fichier resume anglais!\MessageBreak Ajustez la commande \protect\FichierResume}
				\udes@genie@demt@fichiermanquant{\abstractname}{Missing english abstract file.}
			  \udes@genie@demt@setupmotsclesa
			\else
			  \udes@genie@demt@setupmotsclesa
	  		\udes@genie@demt@gen@resumea
			\fi			
		\fi
	\fi
}

\newcommand*{\udes@genie@demt@gen@remerciements}{
	\if\empty\udes@genie@demt@remerciements
	\else
		\chapter*{\udes@genie@demt@acknowledgementsname}
		\setcounter{udes@tmp}{\value{page}}
		\input{\udes@genie@demt@remerciements}
		\clearpage
		\addtocounter{udes@tmp}{-\value{page}}
		\udes@genie@demt@equal{-1}{\value{udes@tmp}}{Les remerciements doivent etre\MessageBreak
			d'une page maximum}
		\ifodd\value{page}\else\if@twoside\null\thispagestyle{empty}\cleardoublepage\fi\fi%
	\fi
}

\newcommand*{\udes@genie@demt@gen@listes}{
	\ifudes@genie@demt@lof\listoffigures\if@twoside\cleardoublepage\else\clearpage\fi\fi  
	 
	\ifudes@genie@demt@lot\listoftables\if@twoside\cleardoublepage\else\clearpage\fi\fi
  
	\if\empty\udes@genie@demt@lexique
	\else
		\chapter*{\glossaryname}
		\markboth{\glossaryname}{\glossaryname}%
		\input{\udes@genie@demt@lexique}\if@twoside\cleardoublepage\else\clearpage\fi
	\fi%
	
	\if\empty\udes@genie@demt@symboles
	\else
		\chapter*{\udes@genie@demt@listsymbolsname}
		\markboth{\udes@genie@demt@listsymbolsname}{\udes@genie@demt@listsymbolsname}%
 		\input{\udes@genie@demt@symboles}\if@twoside\cleardoublepage\else\clearpage\fi
	\fi%
	
	\if\empty\udes@genie@demt@acronymes%
	\else
		\chapter*{\udes@genie@demt@listacronymsname}
 		\markboth{\udes@genie@demt@listacronymsname}{\udes@genie@demt@listacronymsname}
		\input{\udes@genie@demt@acronymes}\if@twoside\cleardoublepage\else\clearpage\fi
	\fi%
}

\newcommand*{\udes@genie@demt@gen@preliminaires}{
	\udes@genie@demt@gen@dedicace
	
	\setcounter{page}{1}  

	\udes@genie@demt@gen@resumes
	\udes@genie@demt@gen@remerciements

	\tableofcontents\if@twoside\cleardoublepage\else\clearpage\fi

	\udes@genie@demt@gen@listes
}

\newcommand*{\udes@genie@demt@gen@bibliographie}{
  \if\empty\udes@genie@demt@bib
  \else
	  \refstepcounter{chapter} %fake a chapter for correct hyperlink in hyperref
	  \addcontentsline{toc}{chapter}{\bibname}
	 	\bibliography{\udes@genie@demt@bib}
		\if@twoside\cleardoublepage\else\clearpage\fi
  \fi
}

\newcommand*{\udes@genie@demt@gen@gardefin}{
	\ifudes@genie@demt@gardefin
		{\null\thispagestyle{empty}\renewcommand*{\thepage}{GF1}\clearpage}
		{\if@twoside\null\thispagestyle{empty}\renewcommand*{\thepage}{GF2}\cleardoublepage\fi}%
	\fi
}

\newcommand*{\udes@genie@demt@checkpages@dprmait}{%
	\udes@genie@demt@lowerequal{\value{udes@genie@demt@pages}}{30}{La DPR de maitrise semble longue.\MessageBreak Le protocole suggere de 20 a 30 pages}
}

\newcommand*{\udes@genie@demt@checkpages@dprdoc}{%
	\udes@genie@demt@lowerequal{\value{udes@genie@demt@pages}}{40}{La DPR de doctorat semble longue.\MessageBreak Le protocole suggere de 25 a 40 pages}
}

\newcommand*{\udes@genie@demt@checkpages@essai}{%
	\udes@genie@demt@lowerequal{\value{udes@genie@demt@pages}}{70}{L'essai semble long. Le protocole exige\MessageBreak un maximum de 70 pages}
}

\newcommand*{\udes@genie@demt@checkpages@memoire}{%
	\udes@genie@demt@lowerequal{\value{udes@genie@demt@pages}}{120}{Le memoire semble long. Le protocole exige\MessageBreak un maximum de 120 pages}
}

\newcommand*{\udes@genie@demt@checkpages@these}{%
	\udes@genie@demt@lowerequal{\value{udes@genie@demt@pages}}{250}{La these semble longue. Le protocole exige\MessageBreak un maximum de 250 pages}
}

\addto\captionsfrench{%
	\def\udes@genie@demt@listsymbolsname{LISTE DES SYMBOLES}%
	\def\udes@genie@demt@listacronymsname{LISTE DES ACRONYMES}%
	\def\udes@genie@demt@acknowledgementsname{REMERCIEMENTS}%
	\def\udes@genie@demt@facultyname{Facult\'e de g\'enie}%
	\def\udes@genie@demt@specialityname{Sp\'ecialit\'e~:}%
	\def\udes@genie@demt@juryname{Jury~:}%
	\def\udes@genie@demt@adressname{Sherbrooke (Qu\'ebec) Canada}%
	\def\udes@genie@demt@motsclesname{Mots-cl\'es~:}%
}

\addto\captionsenglish{%
	\def\udes@genie@demt@adressname{Sherbrooke (Qu\'ebec) Canada}%
	\def\udes@genie@demt@listsymbolsname{LIST OF SYMBOLS}%
	\def\udes@genie@demt@listacronymsname{LIST OF ACRONYMS}%
	\def\udes@genie@demt@acknowledgementsname{ACKNOWLEDGEMENTS}%
	\def\udes@genie@demt@facultyname{Facult\'e de g\'enie}%
	\def\udes@genie@demt@specialityname{Specialit\'e~:}%
	\def\udes@genie@demt@juryname{Jury:}%
	\def\udes@genie@demt@motsclesname{Keywords:}%
}

\AtBeginDocument{
	\@ifpackageloaded{inputenc}{}{\RequirePackage[latin1]{inputenc}}
}

\AfterEndPreamble{
	\frontmatter%
	\singlespacing%
	\udes@genie@demt@setupdocument%
	\udes@genie@demt@gen@gardedebut%
 	\udes@genie@demt@gen@titre%
	\udes@genie@demt@gen@preliminaires%
	\mainmatter%
	\onehalfspacing%
}

\AtEndDocument{%
	\backmatter%
	\singlespacing%
  \ifnum\value{udes@genie@demt@pages}=-1
  	\setcounter{udes@genie@demt@pages}{\value{page}}
  \fi
	\if@twoside\cleardoublepage\else\clearpage\fi%
	\udes@genie@demt@gen@bibliographie%
	\udes@genie@demt@gen@gardefin%
	\csname udes@genie@demt@checkpages@\udes@genie@demt@typedoc\endcsname
}
