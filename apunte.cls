\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{apunte}[2021/12/25 Clase para hacer apuntes en LaTeX]
\LoadClass[12pt, openany]{book}

% PARÁMETROS ---------------
\input{parametros}


% --------------- PAQUETES MÍNIMOS ---------------
\RequirePackage{fullpage}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{subfiles}


% --------------- LENGUAJE ---------------
\RequirePackage[spanish, es-lcroman]{babel}


% --------------- TEXTO ---------------
\RequirePackage{parskip}
\RequirePackage{xspace}
\RequirePackage{dirtytalk} %\say{} para poner texto entre comillas fácilmente
\RequirePackage[none]{hyphenat}
\RequirePackage[colorlinks=true, allcolors=blue, pdftitle={Apunte}]{hyperref} % Para poner hipervínculos


% --------------- MATEMÁTICAS ---------------
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{bbm}
\RequirePackage{dsfont} %\mathds{} para la función indicatriz
\RequirePackage{bm} % bold math
\RequirePackage{diagbox} %\diagbox{}
\RequirePackage{mathrsfs}
\RequirePackage{upgreek} %\up[letra]
\RequirePackage{subfig}
\RequirePackage{booktabs}
\RequirePackage{authblk} %\author


% TEOREMAS ---------------
\renewcommand\qedsymbol{$\blacksquare$}

\newtheoremstyle{note}{3pt}{3pt}{}{}{\bfseries}{:}{.5em}{}

\newtheorem{theorem}{Teorema}[section]
\newtheorem{corollary}{Corolario}[theorem]
\newtheorem{lemma}[theorem]{Lema}
\newtheorem{proposition}[theorem]{Proposición}

\theoremstyle{note}
\newtheorem*{remark}{Observaci\'on}
\newtheorem*{note}{Nota}
\newtheorem*{exercise}{Ejercicio}
\newtheorem*{example}{Ejemplo}

\theoremstyle{definition}
\newtheorem{definition}{Definición}[section]

% TEOREMAS CON TCOLORBOX ---------------
\newenvironment{ftheorem}[1][]
{\begin{tbox}\begin{theorem}[#1]\label{theo:\thetheorem}} % Se crea un label automático pal teorema
{\end{theorem}\end{tbox}}

\newenvironment{fremark}
{\begin{rbox}\begin{remark}}
{\end{remark}\end{rbox}}

\newenvironment{fnote}
{\begin{nbox}\begin{note}}
{\end{note}\end{nbox}}

\newenvironment{fdefinition}[1][]
{\begin{dbox}\begin{definition}[#1]}
{\end{definition}\end{dbox}}

\newenvironment{fexercise}
{\begin{ebox}\begin{exercise}}
{\end{exercise}\end{ebox}}

\newenvironment{fexample}[1][]
{\begin{examplebox}\begin{example}[#1]}
{\end{example}\end{examplebox}}

\newenvironment{flemma}[1][]
{\begin{tbox}\begin{lemma}[#1]}
{\end{lemma}\end{tbox}}

\newenvironment{fcorollary}
{\begin{tbox}\begin{corollary}}
{\end{corollary}\end{tbox}}

\newenvironment{fproposition}
{\begin{tbox}\begin{proposition}}
{\end{proposition}\end{tbox}}


% --------------- CÓDIGO ---------------
\RequirePackage{listings} % Poner código en LaTeX


% --------------- ALGORITMOS ---------------
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}


% --------------- COLORES ---------------
\RequirePackage[dvipsnames]{xcolor}


% --------------- GRÁFICOS/IMÁGENES ---------------
\RequirePackage{graphicx}
\graphicspath{{Images/}}
\RequirePackage[theorems]{tcolorbox}

% IMÁGENES ---------------
\newcommand{\foto}[3][]{\begin{figure}[H]
\begin{center}
\includegraphics[scale=#2]{\figura{#3}}
\caption{#1}
\label{fig:\thechapter.#3}
\end{center}
\end{figure}}

% Sintaxis: \foto[CAPTION]{ESCALA}{NÚMERO DE LA FIGURA}


% COLOR BOXES ---------------
\tcbuselibrary{breakable}

\newtcolorbox{tbox}
{boxrule=0.1pt, leftrule=2.5pt, colback=Bittersweet!7, colframe=RedOrange!75, sharp corners} % Teoremas

\newtcolorbox{rbox}
{boxrule=1pt, leftrule=2.5pt, colback=blue!7, colframe=blue!75, sharp corners} % Observaciones

\newtcolorbox{nbox}
{boxrule=0.1pt, leftrule=2.5pt, colback=cyan!7, colframe=cyan!75, sharp corners, breakable} % Notas

\newtcolorbox{ebox}
{boxrule=0.1pt, leftrule=2.5pt, colback=azulpatrio!7, colframe=azulpatrio!75, sharp corners, breakable} % Ejercicios

\newtcolorbox{examplebox}
{boxrule=0.1pt, leftrule=2.5pt, colback=Fuchsia!7, colframe=Fuchsia!75, sharp corners, breakable} % Ejemplos

\newtcolorbox{dbox}
{boxrule=0.1pt, leftrule=2.5pt, colback=ForestGreen!7, colframe=ForestGreen!75, sharp corners} % Definiciones

\newcommand{\fmath}[1]
{\tcbhighmath[boxrule=0.8pt, colframe=black,colback=white,sharp corners]{#1}} % Hacer una box alrededor de ecuaciones

% --------------- OTROS ---------------
\RequirePackage{ifthen}
\RequirePackage{enumitem} % Permite personalizar enumerate, itemize y description
\RequirePackage{dirtree} % Generar árbol de directorios


% --------------- HEADERS ---------------
\usepackage{fancyhdr}
\usepackage{chngpage}
\usepackage{afterpage}
\setlength{\headheight}{15.2pt}
\setlength{\headsep}{5pt}
\pagestyle{fancy}

\renewcommand{\contentsname}{\contenidos} % Cambia el nombre de la tabla de contenidos

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\fancyhf{} % Elimina los números de página del footer
\fancyhead[LE,RO]{Capítulo \thechapter}
\fancyhead[CE,CO]{\leftmark}
\fancyhead[RE,LO]{\thepage}

\usepackage{titlesec}

\titleformat{\chapter}[frame]{\normalfont}{\filcenter \small \ Cap\'itulo \thechapter \  }{7pt}{\Large \bfseries \filcenter}
\titlespacing*{\chapter}{0pt}{-35pt}{40pt}
\titleformat{\section}[hang]{\normalfont}{\large \bfseries \thesection . }{0pt}{\large \bfseries}
\titleformat{\subsection}[hang]{\normalfont}{\bfseries \thesubsection . }{0pt}{\bfseries}

\RequirePackage{letltxmacro}

\LetLtxMacro{\oldchapter}{\chapter}
\LetLtxMacro{\oldsection}{\section}
\LetLtxMacro{\oldsubsection}{\subsection}

\renewcommand{\section}[1]{\oldsection{#1}\label{sec:\thesection}}
\renewcommand{\subsection}[1]{\oldsubsection{#1}\label{subsec:\thesubsection}}

% COMANDOS TÍPICOS ---------------
\newcommand{\R}{\mathbb{R}} % Números Reales 
\newcommand{\C}{\mathbb{C}} % Números Complejos
\newcommand{\N}{\mathbb{N}} % Números Naturales
\newcommand{\Z}{\mathbb{Z}} % Números Enteros
\newcommand{\Q}{\mathbb{Q}} % Números Racionales
\newcommand{\K}{\mathbb{K}} % Campo de escalares
\newcommand{\borel}[1]{\mathcal{B}(#1)}
\newcommand{\cs}{\quad \text{ c.s.}}
\newcommand{\limit}[1][]{\xrightarrow[\hphantom{\hspace{1.5em}}]{#1}}
\DeclareMathOperator{\dimn}{dim} % Operador dimensión
\DeclareMathOperator*{\esssup}{ess\,sup}

% COMENTARIOS ---------------
\newcommand{\com}[3]{{\colorbox{#2}{\bfseries\sffamily\scriptsize\textcolor{white}{#1}}}
{\textcolor{#2}{\sf\small\textit{#3}}}}

\definecolor{black}{rgb}{0.0, 0.0, 0.0}
\definecolor{copper}{rgb}{0.72, 0.45, 0.2}
\definecolor{darkgreen}{rgb}{0.05, 0.6, 0.05}
\definecolor{purple}{rgb}{0.4,0.3,0.8}
\definecolor{darkorange}{rgb}{1.0, 0.35, 0.0}
\definecolor{wine}{rgb}{0.8, 0.4, 0.4}
\definecolor{piscola}{rgb}{0.75, 0.30, 0.12}
\definecolor{negroni}{rgb}{0.85, 0.10, 0.01}
\definecolor{amber-ale}{rgb}{0.90, 0.45, 0.05}
\definecolor{indianyellow}{rgb}{0.89, 0.66, 0.34}
\definecolor{codegray}{rgb}{0.9,0.9,0.9}
\definecolor{tequila}{rgb}{0.7412,0.4235,0.3529}
\definecolor{azulpatrio}{rgb}{0, 0.21, 0.68}
\definecolor{verdebienchillon}{rgb}{0.55, 0.74, 0.01}
\definecolor{blue(munsell)}{rgb}{0.0, 0.5, 0.69}
\definecolor{blue(ncs)}{rgb}{0.0, 0.53, 0.74}
\definecolor{azul-benja}{rgb}{0, 0, 1}
\definecolor{greenradar}{rgb}{0.57, 0.76, 0.49}
\definecolor{mauvetaupe}{rgb}{0.57, 0.37, 0.43}
\definecolor{teal}{rgb}{0.25, 0.875, 0.8125}
\definecolor{awesome}{rgb}{1.0, 0.44, 0.37}
\definecolor{brightturquoise}{rgb}{0.00, 0.90, 0.90}

\newcommand{\seba}[1]{\com{Seba}{piscola}{#1}} % Comando pa poner comentarios.