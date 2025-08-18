%%%%%%%%%%%%%%%%%%%%%%
%% start of file `vavidbook.cls'.
%% 
%% Copyright 2023-2024 vavidbook (sx12101184@qq.com)
%% This work may be distributed and/or modified freely
%% available at 
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vividbook}[2023/05/20 v6.0-alpha VividBook doc]
\author{AzureKite}


%%%
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=VIVID, prefix=VIVID@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{VIVID}{#1}}

% ----- Colors -----
\DeclareStringOption[blue]{color}
\DeclareStringOption[en]{lang}
\DeclareStringOption[answer]{result}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[normal]{device}
\DeclareStringOption[cm]{math}
\DeclareStringOption[marginfalse]{marginpar}
\DeclareStringOption[onecol]{toc}
\DeclareStringOption{scheme}

% ----- backward compatibility
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{gray}{\ekv{color=gray}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{nocolor}{\ekv{color=none}}

\DeclareVoidOption{chinese}{\ekv{scheme=chinese}}

\DeclareStringOption[ctexfont]{chinesefont}
\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{nofont}{\ekv{chinesefont=nofont}}

\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{cn}{\ekv{lang=cn}}


\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}

\DeclareVoidOption{answer}{\ekv{result=answer}}
\DeclareVoidOption{noanswer}{\ekv{result=noanswer}}

\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}

\DeclareStringOption[numeric-comp]{citestyle}
\DeclareStringOption[numeric]{bibstyle}

\DeclareVoidOption{newtx}{\ekv{math=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}
\DeclareVoidOption{cm}{\ekv{math=cm}}

\DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}


\DeclareVoidOption{onecol}{\ekv{toc=onecol}}
\DeclareVoidOption{twocol}{\ekv{toc=twocol}}

\DeclareStringOption[chapter]{thmcnt}
\DeclareVoidOption{chapter}{\ekv{thmcnt=chapter}}
\DeclareVoidOption{section}{\ekv{thmcnt=section}}

\DeclareStringOption{cod}
\DeclareVoidOption{minted}{\ekv{cod=minted}}


\DeclareStringOption[biber]{bibend}
\DeclareVoidOption{biber}{\ekv{bibend=biber}}
\DeclareVoidOption{bibtex}{\ekv{bibend=bibtex}}


% ----- Math option -----
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% ----- Title Style -----
\DeclareStringOption[hang]{titlestyle}[hang]
% ----- backward compatibility
\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}
% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessKeyvalOptions*\relax
% \ProcessOptions*\relax
\LoadClass[a4paper,oneside]{book}

\RequirePackage{setspace}

\RequirePackage{csquotes}


\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfkeywords={VIVIDBook},
  colorlinks,
  linkcolor=pink,
  citecolor=winered,
  urlcolor=winered,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}
\newif\ifVIVID@Hy@later
  \@ifpackagelater{hyperref}{2022/05/16}
    {\VIVID@Hy@latertrue}
    {\VIVID@Hy@laterfalse}

%% device settings
\RequirePackage{geometry}
\ifdefstring{\VIVID@device}{normal}{
  \geometry{
    a4paper,
    top=25.4mm, bottom=25.4mm,
    left=20mm, right=20mm,
    headheight=2.17cm,
    headsep=4mm,
    footskip=12mm
  }
  \ifdefstring{\VIVID@marginpar}{margintrue}{
    \geometry{
      marginparwidth=5cm, marginparsep=5mm,
      left=2cm,right=7cm}}{\relax}}{
    \relax}

\ifdefstring{\VIVID@device}{pad}{
\geometry{
  paperwidth=7.5in, 
  paperheight=10in,
  margin=16mm,
  headheight=2.17cm,
  footskip=4mm
}}{\relax}


\RequirePackage{indentfirst,comment}
% fontsetting
\ifdefstring{\VIVID@math}{mtpro2}{
  \let\Bbbk\relax
  \RequirePackage[lite]{mtpro2}
}{\relax}

\setcounter{tocdepth}{1}
\renewcommand{\baselinestretch}{1.2}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage{iftex}

\ifpdftex
  \RequirePackage{newtxtext}
  \RequirePackage[scaled=.90]{helvet}
\else
  \RequirePackage[no-math]{fontspec}
  \setmainfont{TeXGyreTermesX}[
    UprightFont = *-Regular ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic ,
    Extension = .otf ,
    Scale = 1.0]
    
  \setsansfont{texgyreheros}[
    UprightFont = *-regular ,
    BoldFont = *-bold ,
    ItalicFont = *-italic ,
    BoldItalicFont = *-bolditalic ,
    Extension = .otf ,
    Scale = 0.9]
\fi

\ifdefstring{\VIVID@lang}{cn}{
  \ifdefstring{\VIVID@chinesefont}{founder}{
    \RequirePackage[UTF8, scheme=plain, fontset=none]{ctex}
    \setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
    \setCJKsansfont[BoldFont={FZHei-B01}]{FZKai-Z03}
    \setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
    \setCJKfamilyfont{zhsong}{FZShuSong-Z01}
    \setCJKfamilyfont{zhhei}{FZHei-B01}
    \setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
    \setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
    \newcommand*{\songti}{\CJKfamily{zhsong}}
    \newcommand*{\heiti}{\CJKfamily{zhhei}}
    \newcommand*{\kaishu}{\CJKfamily{zhkai}}
    \newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}
  
  \ifdefstring{\VIVID@chinesefont}{nofont}{
    \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
    \xeCJKsetup{AutoFakeBold=true}
    }{\relax}

  \ifdefstring{\VIVID@chinesefont}{ctexfont}{
    \RequirePackage[UTF8,scheme=plain]{ctex}
    \xeCJKsetup{AutoFakeBold=true}
    }{\relax}
  
  \AfterEndPreamble{
    \setlength\parindent{2\ccwd}}
}{\relax}

\ifcsname heiti\endcsname
  \newcommand{\cbfseries}{\heiti}
\else
  \newcommand{\cbfseries}{\bfseries}
\fi


\ifcsname kaishu\endcsname
  \newcommand{\citshape}{\kaishu}
\else
  \newcommand{\citshape}{\itshape}
\fi
\ifcsname kaishu\endcsname
  \newcommand{\cnormal}{\kaishu}
\else
  \newcommand{\cnormal}{\normalfont}
\fi

\ifcsname fangsong\endcsname
  \newcommand{\cfs}{\fangsong}
\else
  \newcommand{\cfs}{\normalfont}
\fi

\RequirePackage{anyfontsize}
\ifdefstring{\VIVID@math}{newtx}{
  \let\oldencodingdefault\encodingdefault
  \let\oldrmdefault\rmdefault
  \let\oldsfdefault\sfdefault
  \let\oldttdefault\ttdefault
  \def\encodingdefault{T1}
  \renewcommand{\rmdefault}{ntxtlf}
  \renewcommand{\sfdefault}{qhv}
  \renewcommand{\ttdefault}{ntxtt}
  \RequirePackage{newtxmath}
  \let\encodingdefault\oldencodingdefault
  \let\rmdefault\oldrmdefault
  \let\sfdefault\oldsfdefault
  \let\ttdefault\oldttdefault
  \let\Bbbk\relax
  \RequirePackage{esint}


  \DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
  \let\sumop\relax\let\prodop\relax
  \DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
  \DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"51}
}{\relax}


% ----- Handle Colors -----
%% 章节以及页脚图形

\RequirePackage[table]{xcolor}
\definecolor{deepBlue}{RGB}{61,124,222}
\definecolor{lightergray}{gray}{0.99}
\definecolor{azures1}{RGB}{250, 252, 254}
\definecolor{azures2}{RGB}{41, 119, 196}
\definecolor{Beige}{RGB}{245,245,220}
\definecolor{Rhodamine}{RGB}{239,84,159}
\definecolor{Magenta}{RGB}{236,0,141}
\definecolor{RubineRed}{RGB}{236,2,126}
\definecolor{DarkCyan}{RGB}{0, 140, 140}
\definecolor{RedViolet}{RGB}{160,34,108}
\definecolor{finegray}{RGB}{248,248,245}
\definecolor{magenta5}{RGB}{199, 42, 199}
\definecolor{Emerald}{RGB}{0, 169, 159}
\definecolor{DeepPink}{RGB}{255, 20, 147}

\ifdefstring{\VIVID@color}{green}{
  \definecolor{structurecolor}{RGB}{0, 174, 247}%
  \definecolor{main}{RGB}{101, 238, 222}%
  \definecolor{second}{RGB}{230,90,7}%
  \definecolor{third}{RGB}{0,160,152}%
}{\relax}
\ifdefstring{\VIVID@color}{cyan}{
  \definecolor{structurecolor}{RGB}{0, 174, 247}%
  \definecolor{main}{RGB}{101, 238, 222}%
  \definecolor{second}{RGB}{175,153,8}%
  \definecolor{third}{RGB}{244,105,102}%
}{\relax}
\ifdefstring{\VIVID@color}{blue}{
  \definecolor{structurecolor}{RGB}{60,113,183}
  \definecolor{main}{RGB}{101, 238, 222}%
  \definecolor{second}{RGB}{244, 105, 102}%
  \definecolor{third}{RGB}{0,174,247}%
}{\relax}
\ifdefstring{\VIVID@color}{gray}{
  \definecolor{structurecolor}{RGB}{150,150,150}
  \definecolor{main}{RGB}{150,150,150}%
  \definecolor{second}{RGB}{150,150,150}%
  \definecolor{third}{RGB}{150,150,150}%
}{\relax}
\ifdefstring{\VIVID@color}{black}{
  \definecolor{structurecolor}{RGB}{0,0,0}
  \definecolor{main}{RGB}{0,0,0}%
  \definecolor{second}{RGB}{0,0,0}%
  \definecolor{third}{RGB}{0,0,0}%
}{\relax}

%green color
\definecolor{structure1}{RGB}{0,120,2}%
\definecolor{main1}{RGB}{0,120,2}%
\definecolor{second1}{RGB}{230,90,7}%
\definecolor{third1}{RGB}{0,160,152}%
%cyan color
\definecolor{structure2}{RGB}{31,186,190}%
\definecolor{main2}{RGB}{59,180,5}%
\definecolor{second2}{RGB}{175,153,8}%
\definecolor{third2}{RGB}{244,105,102}%
%blue color
\definecolor{structure3}{RGB}{60,113,183}
\definecolor{main3}{RGB}{0,166,82}%
\definecolor{second3}{RGB}{255,134,24}%
\definecolor{third3}{RGB}{0,174,247}%
% gray color
\definecolor{structure4}{RGB}{150,150,150}
\definecolor{main4}{RGB}{150,150,150}%
\definecolor{second4}{RGB}{150,150,150}%
\definecolor{third4}{RGB}{150,150,150}%
% black color
\definecolor{structure5}{RGB}{0,0,0}
\definecolor{main5}{RGB}{0,0,0}%
\definecolor{second5}{RGB}{0,0,0}%
\definecolor{third5}{RGB}{0,0,0}%

% corlor definition
\definecolor{winered}{RGB}{212, 51, 131}
\definecolor{bule}{RGB}{18,29,57}
\colorlet{coverlinecolor}{second}


% ----- Title Style -----
\ifdefstring{\VIVID@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\VIVID@titlestyle}{display}{\def\style{display}}{\relax}

% reference: 
% https://tex.stackexchange.com/questions/58506/how-to-make-a-new-command-similar-to-author
% https://pastebin.com/C8W4axzV
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}

\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}
\newcommand{\extrainfo}[1]{\gdef\@extrainfo{#1}}

\RequirePackage{mwe}
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\cover}[1]{\gdef\@cover{#1}}

\newcommand{\question}[1]{{\par\citshape #1}\\[0.2ex]}

\RequirePackage{enumerate}
% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}

\RequirePackage[labelfont={bf,color=structurecolor}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
  \RequirePackage[flushmargin,stable]{footmisc}
  \setlength{\footnotesep}{12pt}
}



\RequirePackage{graphicx}
%\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}
% \providecommand\qed{}
% \renewcommand{\qed}{\hfill\ensuremath{\square}}
\RequirePackage{booktabs}
\RequirePackage{multicol,multirow}

\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,hologo}
%%中文结构名字


%%   章节设置
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}


\RequirePackage[
  backend=\VIVID@bibend,
  citestyle=\VIVID@citestyle,
  bibstyle=\VIVID@bibstyle]{biblatex}

\ifdefstring{\VIVID@lang}{cn}{
  \renewcommand{\baselinestretch}{1.3}
  \renewcommand{\contentsname}{目录}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\partname}{\color{structurecolor}}
  \renewcommand{\thepart}{第\zhnumber{\arabic{part}}部分}
  \renewcommand{\listfigurename}{插图目录}
  \renewcommand{\listtablename}{表格目录}
  \renewcommand{\bibname}{参考文献}
  \newcommand{\ebibname}{参考文献}
  \renewcommand{\appendixname}{附录}
  \renewcommand{\appendixtocname}{附录}
  \renewcommand{\indexname}{索\hspace{2em}引}
  \newcommand\figref[1]{\textbf{图}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{表}~\ref{#1}}
  \newcommand{\authorname}{\citshape 作者：}
  \newcommand{\institutename}{\citshape 组织：}
  \newcommand{\datename}{\citshape 时间：}
  \newcommand{\versionname}{\citshape 版本：}
  \newcommand{\notename}{笔记}
  \renewcommand*{\proofname}{证明}
  \newcommand{\definitionname}{定义}
  \newcommand{\theoremname}{定理}
  \newcommand{\axiomname}{公理}
  \newcommand{\postulatename}{公设}
  \newcommand{\lemmaname}{引理}
  \newcommand{\propositionname}{命题}
  \newcommand{\corollaryname}{推论}
  \newcommand{\examplename}{例题} %
  \newcommand{\instancename}{示例} %
  \newcommand{\problemname}{问题} % 问题
  \newcommand{\exercisename}{练习} % 练习=习题
  \newcommand{\remarkname}{注}
  \newcommand{\assumptionname}{假设}
  \newcommand{\conclusionname}{结论}
  \newcommand{\solutionname}{解}
  \newcommand{\propertyname}{性质}
  \newcommand{\introductionname}{内容提要}
  \newcommand{\introductionsname}{内容概述}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{{\citshape #1}：#2}}
  \newcommand{\updatename}{更新：}
  \newcommand{\historyname}{版本更新历史}
  \newcommand{\beforechap}{第}
  \newcommand{\afterchap}{章}
}{\relax}


\ifdefstring{\VIVID@lang}{en}{
  \setlength\parindent{2em}
  \newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{Table}~\ref{#1}}
  \renewcommand{\chaptername}{Chapter}
  \renewcommand{\partname}{\color{structurecolor} Part}
  \newcommand{\authorname}{\textbf{Author: }}
  \newcommand{\institutename}{\textbf{Institute: }}
  \newcommand{\datename}{\textbf{Date: }}
  \newcommand{\versionname}{\textbf{Version: }}
  \newcommand{\notename}{Note}
  \newcommand{\proofname}{Proof}
  \newcommand{\problemname}{Problem}
  \newcommand{\definitionname}{Definition}
  \newcommand{\theoremname}{Theorem}
  \newcommand{\axiomname}{Axiom}
  \newcommand{\postulatename}{Postulate}
  \newcommand{\lemmaname}{Lemma}
  \newcommand{\propositionname}{Proposition}
  \newcommand{\corollaryname}{Corollary}
  \newcommand{\examplename}{Example}
  \newcommand{\exercisename}{Exercise}
  \newcommand{\remarkname}{Remark}
  \newcommand{\assumptionname}{Assumption}
  \newcommand{\conclusionname}{Conclusion}
  \newcommand{\solutionname}{Solution}
  \newcommand{\propertyname}{Property}
  \newcommand{\introductionname}{Introduction}
  \renewcommand{\appendixname}{Appendix}
  \newcommand{\ebibname}{Bibliography}
  % \newcommand{\problemsetname}{Exercise}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Updates:}
  \newcommand{\historyname}{Version History}
}{\relax}



\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{tikz} %% load tikz without tikz
\usetikzlibrary{backgrounds,calc,shadows,positioning,fit}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
%  https://tex.stackexchange.com/questions/7032/good-way-to-make-textcircled-numbers

\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=structurecolor,draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=structurecolor,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=structurecolor,draw=none] circle (2pt);}
\setlist[enumerate,1]{label=\color{structurecolor}\arabic*.}
\setlist[enumerate,2]{label=\color{structurecolor}(\alph*).}
\setlist[enumerate,3]{label=\color{structurecolor}\Roman*.}
\setlist[enumerate,4]{label=\color{structurecolor}\Alph*.}
\setlist[itemize,1]{label={\eitemiii}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

\RequirePackage{apptools}

% appendix chapter:

\ifdefstring{\VIVID@lang}{cn}{
  \ifdefstring{\VIVID@scheme}{chinese}{
    \newcommand{\xchaptertitle}{第\zhnumber{\arabic{chapter}}章} }{
    \newcommand{\xchaptertitle}{第 \thechapter{} 章}}
% Hyperref 2022/05/16's changelog.txt said
% * nameref is loaded always and earlier (issue#235) 
    \AtBeginDocument{
      \ifVIVID@Hy@later
        \patchcmd{\NR@chapter}%
          {\numberline{\thechapter}}{\numberline{\xchaptertitle}}%
          {}{\fail}
      \else    
        \patchcmd{\Hy@org@chapter}%
          {\numberline{\thechapter}}{\numberline{\xchaptertitle}}%
          {}{\fail}
      \fi
    }
  }
  {\newcommand{\xchaptertitle}{\chaptername~\thechapter~}}

\setcounter{secnumdepth}{5}
\titleformat{\chapter}[\style]{\bfseries}{
  \filcenter\LARGE\enspace\bfseries{\color{structurecolor} \IfAppendix{\appendixname\;\thechapter\;}{\xchaptertitle\;}}}{1pt}{
  \LARGE\bfseries\color{structurecolor}\filcenter}[]
\titleformat{\section}[hang]{\bfseries}{
  \Large\bfseries{\color{structurecolor}\faGg ~\thesection}\enspace}{1pt}{%
  \color{structurecolor}\Large\bfseries\filright}
\titleformat{\subsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\thesubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}
\titleformat{\subsubsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\thesubsubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}



%%define the 
%%definition theorem postulate axiom corollary lemma proposition 
%%and proof environment
\RequirePackage{pifont,manfnt,bbding}
\RequirePackage[many]{tcolorbox}
% \newlength{\normalparindent}
% \setlength{\normalparindent}{\parindent}
\definecolor{axiomcolor}{RGB}{255, 134, 24}%
\ifdefstring{\VIVID@mode}{fancy}{
  \tcbset{
    common/.style={
      fontupper=\citshape,
      lower separated=false,
      % before upper={\setlength{\parindent}{\normalparindent}},
      coltitle=black,
      colback=gray!5,
      boxrule=0.5pt,
      fonttitle=\bfseries,
      enhanced,
      breakable,
      top=8pt,
      before skip=8pt,
      attach boxed title to top left={
        yshift=-0.11in,
        xshift=0.15in},
      boxed title style={
        boxrule=0pt,
        colframe=white,
        arc=0pt,
        outer arc=0pt},
      separator sign={.},},
    defstyle/.style={  %定义
      common,
      colframe=main,  
      colback=main!5,
      colbacktitle=main, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{main}{$\clubsuit$}};}},
    thmstyle/.style={ %定理
      common,
      coltitle=white,
      colframe=second,  
      colback=second!5,
      colbacktitle=second, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{second}{$\heartsuit$}};}},
    axiostyle/.style={ %公理
      common,
      coltitle=white,
      colframe=cyan,  
      colback=cyan!5,
      colbacktitle=cyan, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{pink}{$\spadesuit$}};}},
    prostyle/.style={ %公设
      common,
      colframe=violet,
      coltitle=white,
      colback=violet!5,
      colbacktitle=violet!80, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{violet}{$\spadesuit$}};}},
    propostyle/.style={ %命题
      common,
      colframe=blue,
      coltitle=white,
      colback=blue!5,
      colbacktitle=blue!80, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{blue}{$\spadesuit$}};}},
    corostyle/.style={ %推论
      common,
      colframe=magenta!60,
      coltitle=white,
      colback=magenta!5,
      colbacktitle=magenta!80, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{magenta}{$\spadesuit$}};}},
    lemostyle/.style={ %引理
      common,
      colframe=orange,
      coltitle=white,
      colback=orange!5,
      colbacktitle=orange!70, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{orange}{$\spadesuit$}};}},
    VIVID@title/.code n args={2}
      {
        \ifblank{#2}
          {\tcbset{title={\csname #1name\endcsname~\thetcbcounter}}}
          {\tcbset{title={\csname #1name\endcsname~\thetcbcounter\ (#2)}}}
      },
    VIVID@label/.code n args={2}
      {
        \ifblank{#2}
          {}{\tcbset{label={#1:#2}}}
      }
    }
  
  % define an internal control sequence \VIVID@newtheorem for fancy mode's newtheorem
  % #1 is the environment name, #2 is the prefix of label, #3 is the style
  % style: thmstyle, defstyle, prostyle
  % e.g. \VIVID@newtheorem{theorem}{thm}{thmstyle}
  % will define two environments: numbered ``theorem'' and no-numbered ``theorem*''
  % WARNING FOR MULTILINGUAL: this cs will automatically find \theoremname's definition,
  % WARNING FOR MULTILINGUAL: it should be defined in language settings.
  \newcommand{\VIVID@newtheorem}[3]{
    \ifcsundef{#1name}{%
      \ClassError{VIVIDbook}{%
        \ #1name undefined, \MessageBreak
        Please check in language setting
      }{}
    }{\relax}
    \DeclareTColorBox[auto counter,number within=\VIVID@thmcnt]{#1}{ g o t\label g }{
        common,#3,
        IfValueTF={##1}
          {VIVID@title={#1}{##1}}
          {
            IfValueTF={##2}
            {VIVID@title={#1}{##2}}
            {VIVID@title={#1}{}}
          },
        IfValueT={##4}
          {
            IfBooleanTF={##3}
              {label={##4}}
              {VIVID@label={#2}{##4}}
          }
      }
    \DeclareTColorBox{#1*}{ g o }{
        common,#3,
        IfValueTF={##1}
          {VIVID@title={#1}{##1}}
          {
            IfValueTF={##2}
            {VIVID@title={#1}{##2}}
            {VIVID@title={#1}{}}
          },
      }
  }
  % define several environment 
  % we define headers like \definitionname before
  \VIVID@newtheorem{definition}{def}{defstyle}
  \VIVID@newtheorem{theorem}{thm}{thmstyle}
  \VIVID@newtheorem{postulate}{pos}{prostyle} % prostyle
  \VIVID@newtheorem{axiom}{axi}{axiostyle}
  \VIVID@newtheorem{corollary}{cor}{corostyle}
  
  \VIVID@newtheorem{lemma}{lem}{lemostyle}
  \VIVID@newtheorem{proposition}{pro}{propostyle}
}{\relax}


\ifdefstring{\VIVID@mode}{simple}{
  \let\openbox\relax
  \RequirePackage{amsthm}
  \let\proof\relax
  % \let\proofname\relax
  \let\endproof\relax

  % declare new theorem styles: defstyle, thmstyle, prostyle
  \newtheoremstyle{defstyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{main}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{thmstyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{second}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{prostyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{third}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}

  % define an internal control sequence \VIVID@newtheorem for simple mode's newtheorem
  % #1 is the environment name, #2 is the style
  % style: thmstyle, defstyle, prostyle
  % e.g. \VIVID@newtheorem{theorem}{thmstyle}
  % will define two environments: numbered ``theorem'' and no-numbered ``theorem*''
  % WARNING FOR MULTILINGUAL: this cs will automatically find \theoremname's definition,
  % WARNING FOR MULTILINGUAL: it should be defined in language settings.
  \newcommand{\VIVID@newtheorem}[2]{
    \theoremstyle{#2}
    \newtheorem{#1}{\csname #1name\endcsname}[\VIVID@thmcnt]
    \newtheorem*{#1*}{\csname #1name\endcsname}
  }

  % define several environment 
  % we define headers like \definitionname before
  \VIVID@newtheorem{definition}{defstyle}
  \VIVID@newtheorem{theorem}{thmstyle}
  \VIVID@newtheorem{postulate}{prostyle}
  \VIVID@newtheorem{axiom}{axiostyle}
  \VIVID@newtheorem{corollary}{thmstyle}
  \VIVID@newtheorem{lemma}{thmstyle}
  \VIVID@newtheorem{proposition}{prostyle}
}{\relax}

% define an user control sequence \VIVIDnewtheorem
% #1 is the evironment, #2 is the theorem header
% #3 is the style       #4 is the prefix for fancy mode
% style: thmstyle, defstyle, prostyle
% if #4 is given in simple mode, an error will be raised
% if #4 isn't given in fancy mode, the prefix will be set equal to #1,
%   and a warning will be raised
\newcommand{\VIVID@newtheorem@warning}{}
\newcommand{\VIVID@newtheorem@error}{}
\NewDocumentCommand\VIVIDnewtheorem{ m m m g }
  {
    \renewcommand{\VIVID@newtheorem@warning}{
      \ClassWarning{VIVIDbook}{%
        Because you didn't provide a prefix. \MessageBreak
        We use #1 as the default prefix. \MessageBreak
        You have to use \MessageBreak
        \ref{#1:label} to refer a \MessageBreak
        \begin{#1}{name}{label} environment. \MessageBreak
      }
    }
    \renewcommand{\VIVID@newtheorem@error}{
      \ClassError{VIVIDbook}{%
        You can't set a prefix in mode ``simple''.\MessageBreak
        Just use \MessageBreak
        \VIVIDnewtheorem{#1}{#2}{#3}
      }{%
        We are using ``amsthm'' package to \MessageBreak
        generate theorem-like theorem. \MessageBreak
        The 4th parameter ``prefix'' isn't allowed.
      }
    }
    \expandafter\def\csname #1name\endcsname{#2}
    \ifdefstring{\VIVID@mode}{simple}{%
        \IfValueTF{#4}
          {\VIVID@newtheorem@error}
          {\VIVID@newtheorem{#1}{#3}}
      }{\relax}
    \ifdefstring{\VIVID@mode}{fancy}{%
        \IfValueTF{#4}
          {
            \def\VIVID@temp@prefix{#4}
            \ifdefempty{\VIVID@temp@prefix}
              {
                \VIVID@newtheorem{#1}{#1}{#3}
                \VIVID@newtheorem@warning
              }
              {\VIVID@newtheorem{#1}{#4}{#3}}
          }
          {
            \VIVID@newtheorem{#1}{#1}{#3}
            \VIVID@newtheorem@warning
          }
      }{\relax}
  }

% main（green-def): example exercise problem solution
% second（orange-thm）: proof note remark  
% third（blue-prop):  assumptions property conclusion custom



%% Exercise with counter
\newcounter{exer}[chapter]
\setcounter{exer}{0}
\renewcommand{\theexer}{\thechapter.\arabic{exer}}
\newenvironment{exercise}[1][]{
  \refstepcounter{exer}
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\HandPencilLeft\quad}
    \textbf{\color{main}{\exercisename} \theexer #1 }\rmfamily}{
    \par\ignorespacesafterend}

%% Problem with counter
\newcounter{prob}[chapter]
\setcounter{prob}{0}
\renewcommand{\theprob}{\thechapter.\arabic{prob}}
\newenvironment{problem}[1][]{
  \refstepcounter{prob}
  \par\noindent\textbf{\color{main}{\problemname} \theprob #1 }\rmfamily}{
  \par\ignorespacesafterend}

\newenvironment{note}{
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\textdbend\quad}
    \textbf{\color{second}\notename} \citshape}{\par}

\newenvironment{proof}{
  \par\noindent\textbf{\color{second}\proofname\;}
  \color{black!90}\cfs}{
  % \hfill$\Box$\quad
  \par}

\newenvironment{solution}{\par\noindent\textbf{\color{main}\solutionname} \citshape}{\par}
\newenvironment{remark}{\noindent\textbf{\color{second}\remarkname}}{\par}
\newenvironment{custom}[1]{\par\noindent\textbf{\color{third} #1} \citshape}{\par}

\RequirePackage{multicol}
\tcbset{
  introductionsty/.style={
    enhanced,
    breakable,
    colback=structurecolor!10,
    colframe=structurecolor,
    fonttitle=\bfseries,
    colbacktitle=structurecolor,
    fontupper=\citshape,
    attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
    boxrule=0pt,
    toprule=0.5pt,
    bottomrule=0.5pt,
    top=8pt,
    before skip=8pt,
    sharp corners
  },
}


\newenvironment{introduction}[1][\introductionname]{
  \begin{tcolorbox}[introductionsty,title={#1}]
    \begin{multicols}{2}
      \begin{itemize}[label=\textcolor{structurecolor}{\upshape\scriptsize\SquareShadowBottomRight}]}{
      \end{itemize}
    \end{multicols}
  \end{tcolorbox}}

\tcbset{
    alphasty/.style={
        enhanced,
        breakable,
        colback=azures1,
        colframe=azures2,
        boxrule=0pt,
        top=8pt,
        before skip=12pt,
        sharp corners,
        arc=0mm,
        drop lifted shadow={color=black!20!white,opacity=.3,shadow xshift=0.1cm},%盒子阴影
        overlay = {%
            %标题盒子
            \node[rectangle, %opacity=.3,
            text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},rounded corners=2pt,
            inner sep=1.5mm,fill=azures2,
            anchor=west,
            font=\bfseries] at ([xshift=.45\textwidth,yshift=.5mm]frame.north west)%
            {\bf \introductionsname};
        },
    }
}
%%--------------------------------------------------%%
\newenvironment{introductions}[1][\introductionsname]{\smallskip
    \begin{tcolorbox}[alphasty]
        \begin{multicols}{2}
            \begin{itemize}[label=\textcolor{structurecolor}{\upshape\scriptsize\SquareShadowBottomRight}]}{
            \end{itemize}
        \end{multicols}
    \end{tcolorbox}\smallskip}

%%%%%%%%%%%%%%%%%%
\RequirePackage{adforn}

\newenvironment{problemset}[1][\xchaptertitle~\exercisename]{
  \vspace*{10pt}
  \begin{center}
    \phantomsection\addcontentsline{toc}{section}{\texorpdfstring{\xchaptertitle~\exercisename}{\exercisename}}
    % \markboth{#1}{\rightmark}
    \markright{#1}
    \textcolor{structurecolor}{\Large\bfseries\adftripleflourishleft~#1~\adftripleflourishright}
  \end{center}
  \begin{enumerate}}{
  \end{enumerate}}

\def\relsec{\endgroup start}
\def\endrelsec{end\begingroup\def \@currenvir {relsec}}

\ifdefstring{\VIVID@result}{noanswer}{
  \AtBeginDocument{
  \excludecomment{solution}
  \excludecomment{proof}
  \excludecomment{inline}
  }
}{\relax}







%页眉页脚

%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\RequirePackage{fontawesome}
\RequirePackage{xhfill}
\fancyhf{}

\fancyfoot[c]{\color{structurecolor} \faGg 第~\color{black}{\thepage}\color{structurecolor}~页 \faGg}

\if@twoside
\fancyhead[EL]{\color{structurecolor}{\faPaperPlaneO}\cnormal\leftmark} % E表示偶数页
\fancyhead[ER]{\color{structurecolor}\cnormal\rightmark}
\fancyhead[OR]{\color{structurecolor}{\faPaperPlaneO}\cnormal\leftmark} % E表示偶数页
\fancyhead[OL]{\color{structurecolor}\cnormal\rightmark}
\fancyfoot[EL]{\color{red}{\faLink} }
\fancyfoot[ER]{\color{red}{\faLink} }
\fancyfoot[OR]{\color{structurecolor}{\faUnlink}}
\fancyfoot[OL]{\color{structurecolor}{\faUnlink}}
\else
\fancyhead[R]{\color{structurecolor}\cnormal\rightmark}
\fancyhead[L]{\color{structurecolor}{\faPaperPlaneO}\cnormal\leftmark} % E表示偶数页
\fancyfoot[L]{\color{red}{\faLink}}
\fancyfoot[R]{\color{cyan}{\faUnlink}}
\fi
\renewcommand{\headrule}{\color{orange!90}\hrule width\textwidth}
\pagestyle{fancy}
\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\, #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{\xchaptertitle\, #1}{}}
%%%%%%%%%%%%%%%%%%%%%%%%%


\renewcommand*{\maketitle}{%
\hypersetup{pageanchor=false}
\pagenumbering{Alph}
\begin{titlepage}
  \newgeometry{margin = 0in}
  \parindent=0pt
  \ifdefstring{\VIVID@device}{normal}{
    \ifcsname @cover\endcsname
      \includegraphics[width=\linewidth]{\@cover}
    \else
      \includegraphics[width=\linewidth]{example-image}
    \fi
  }{\relax}
  \ifdefstring{\VIVID@device}{pad}{
    \ifcsname @cover\endcsname
      \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{\@cover}
    \else
      \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{example-image}
    \fi
  }{\relax}
  \setlength{\fboxsep}{0pt}
  \colorbox{coverlinecolor}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
  \vfill
  \vskip-2ex
  \hspace{2em}
  \parbox{0.8\textwidth}{
    \bfseries\Huge 
      \ifcsname @title\endcsname \@title \fi
    \par}
  \vfill
  \vspace{-1.0cm}
  \setstretch{2.5}
  \hspace{2.5em}
  \begin{minipage}[c]{0.67\linewidth}
    {\color{darkgray}\bfseries\Large
      \ifcsname @subtitle\endcsname\@subtitle\\[2ex]\fi}
    \color{gray}\normalsize
    {\renewcommand{\arraystretch}{0.618}
    \begin{tabular}{l}
      % \ifcsname @author\endcsname \authorname \@author\\\fi
      \ifx\@author\empty\else\authorname\cnormal\@author\\ \fi
      \ifcsname @institute\endcsname \institutename \cnormal\@institute\\ \fi
      % \ifcsname @date\endcsname  \@date\\\fi
      \ifx\@date\empty\else\datename\cnormal\@date \\ \fi
      \ifcsname @version\endcsname \cnormal\versionname\@version\\ \fi
      \ifcsname @bioinfo\endcsname \cnormal\@bioinfo\\ \fi
    \end{tabular}}
  \end{minipage}
  \begin{minipage}[c]{0.27\linewidth}
  \begin{tikzpicture}[remember picture,overlay]
    \begin{pgfonlayer}{background}
      \node[opacity=0.8,
            anchor=south east,
            outer sep=0pt,
            inner sep=0pt] at ($(current page.south east) +(-0.8in,1.5in)$) {
              \ifcsname @logo\endcsname\includegraphics[width=4.2cm]{\@logo}\fi};
    \end{pgfonlayer}
  \end{tikzpicture}
  \end{minipage}
  \vfill
  \begin{center}
    \setstretch{1.3}
    \parbox[t]{0.7\textwidth}{\centering \citshape 
      \ifcsname @extrainfo\endcsname\@extrainfo\fi}
  \end{center}
  \vfill
\end{titlepage}
\restoregeometry
\thispagestyle{empty}}


\newcommand{\dollar}{\mbox{\textdollar}}

\RequirePackage{listings}
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle,breaklines=true}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
texcsstyle=*\color{winered},
  numbers=none,
  mathescape=false,
  breaklines=true,
  keywordstyle=\color{winered},
  commentstyle=\color{gray},
  emph={VIVIDpaper,fontenc,fontspec,xeCJK,citestyle,FiraMono,xunicode,figure,fig,image,img,table,itemize,enumerate,ctex,microtype,description,times,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm,tcolorbox,titlestyle,cite,ctex,listings,base,math,scheme,toc,esint,chinesefont,amsmath,bibstyle,natbib,pgfornament},
  emphstyle={\color{frenchplum}},
  morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,extrainfo,logo,cover,subtitle,appendix,chapter,section,hypersetup,mainmatter,frontmatter,tableofcontents,VIVIDpar,heiti,kaishu,lstset,pagecolor,zhnumber,marginpar,part,equote,marginnote,bioinfo,datechange,listofchange,lvert,lastpage,songti,heiti,fangsong,setCJKfamilyfont,textbf,VIVIDnewtheorem,thmcnt,colorlet},
  frame=single,
  tabsize=2,
  rulecolor=\color{structurecolor},
  framerule=0.2pt,
  columns=flexible,
  % backgroundcolor=\color{lightgrey}
}

\newcommand\bmmax{0}
\RequirePackage{bm}

% add the list of change history
\newcommand{\dateinfoline}[2]{
  \noindent\makebox[0pt][r]{%
  \makebox[-3em][r]{%
    \small
    \textbf{\textcolor{structurecolor}{#1}}}\;\;}%
  {\citshape\updatename\ignorespaces#2}}

\newcommand{\datechange}[2]{%
  \noindent{\makebox[\textwidth][r]{\color{structurecolor}\rule{1.15\textwidth}{.4pt}}}
  \dateinfoline{#1}{#2}
  \addcontentsline{dates}{section}{#1 -- #2}}

\newcommand{\listofchanges}{%
  \begingroup
    \renewcommand{\contentsname}{\historyname}
    \let\old@starttoc\@starttoc
    \def\@starttoc##1{
      \old@starttoc{dates}}
    \tableofcontents%
  \endgroup}
% https://tex.stackexchange.com/questions/472931/list-of-all-dates-in-a-document

\newenvironment{change}{
  \begin{enumerate}[label=\small\protect\circled{\arabic*}]}{
  \end{enumerate}}



\renewcommand\tableofcontents{%
  \hypersetup{linktoc=all, linkcolor=black}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \ifdefstring{\VIVID@toc}{twocol}{
      \setlength{\columnsep}{2em}
      \begin{multicols}{2}%
        \@starttoc{toc}
      \end{multicols}}{
      \@starttoc{toc}}
    \if@restonecol\twocolumn\fi
    \hypersetup{linkcolor=winered}}


\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}%
\thispagestyle{empty}%
beforechap\newpage%
\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% https://tex.stackexchange.com/questions/56839/chaptername-is-used-even-for-appendix-chapters-in-toc
\RequirePackage{calc}
\RequirePackage[titles]{tocloft}
\ifdefstring{\VIVID@lang}{cn}{
  % \renewcommand{\cftchappresnum}{\beforechap\space}
  % \renewcommand{\cftchapaftersnum}{\space\afterchap}
  \setlength{\cftchapnumwidth}{\widthof{\textbf{附录~999}}}
  \g@addto@macro\appendix{%
    % recover \thechapter in the \NR@chapter's \numberline
    \ifVIVID@Hy@later
      \patchcmd{\NR@chapter}%
        {\numberline{\xchaptertitle}}{\numberline{\thechapter}}%
        {}{\fail}      
    \else
      \patchcmd{\Hy@org@chapter}%
        {\numberline{\xchaptertitle}}{\numberline{\thechapter}}%
        {}{\fail}  
    \fi
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
      \protect\renewcommand{\protect\cftchapaftersnum}{}%
    }%
  }
}{
  \renewcommand{\cftchappresnum}{\chaptername\space}
  \renewcommand{\cftchapaftersnum}{\space}
  \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~9}}}
  \g@addto@macro\appendix{%
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
      \protect\renewcommand{\protect\cftchapaftersnum}{}%
      \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~999}}}
    }%
  }
}

% restore the tt default family to lmodern tt family
\renewcommand\ttdefault{lmtt}









%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontawesome}
\RequirePackage{xhfill}
\RequirePackage[object=vectorian]{pgfornament} 
\definecolor{ocre}{RGB}{146, 218, 243}
%%%%%%%%%%%目录,chapter图片定制开始%%%%%%%%%%%%%%%
\newif\ifusechapterimage
\usechapterimagetrue
\newcommand{\thechapterimage}{}%
\newcommand{\chapterimage}[1]{\ifusechapterimage\renewcommand{\thechapterimage}{#1}\fi}%
\newcommand{\autodot}{{\color{structurecolor}\faModx}}
\def\@makechapterhead#1{%
	{\parindent \z@ \raggedright \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
		\begin{tikzpicture}[remember picture,overlay]
			\node at (current page.north west)
			{\begin{tikzpicture}[remember picture,overlay]
					\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
					\draw[anchor=west] (\Gm@lmargin+3.3cm,-9cm) node [line width=2pt,rounded corners=15pt,draw=ocre,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
					\draw[anchor=west] (\Gm@lmargin+3.9cm,-9cm) node {\huge\kaishu\bfseries\color{black} 第 \thechapter 章  \autodot\color{black}~#1\strut};
			\end{tikzpicture}};
		\end{tikzpicture}
		\else
		\begin{tikzpicture}[remember picture,overlay]
			\node at (current page.north west)
			{\begin{tikzpicture}[remember picture,overlay]
					\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
					\draw[anchor=west] (\Gm@lmargin+3.3cm,-9cm) node [line width=2pt,rounded corners=15pt,draw=ocre,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
					\draw[anchor=west] (\Gm@lmargin+3.9cm,-9cm) node {\huge\kaishu\bfseries\color{black}#1\strut};
			\end{tikzpicture}};
		\end{tikzpicture}
		\fi\fi\par\vspace*{230\p@}}
	\thispagestyle{fancy}
	}

\def\@makeschapterhead#1{%
	\begin{tikzpicture}[remember picture,overlay]
		\node at (current page.north west)
		{\begin{tikzpicture}[remember picture,overlay]
				\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
				\draw[anchor=west] (\Gm@lmargin+3.3cm,-9cm) node [line width=2pt,rounded corners=15pt,draw=ocre,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
				\draw[anchor=west] (\Gm@lmargin+3.9cm,-9cm) node {\huge\sffamily\bfseries\color{black}#1\strut};
		\end{tikzpicture}};
	\end{tikzpicture}
	\par\vspace*{230\p@}}
%%%%%%%%%%%目录,chapter图片定制结束%%%%%%%%%%%%%%%

\newcommand{\@mptof}[2]{%
	\setlength\fboxsep{0pt}%
	\noindent\colorbox{ocre!40}{\strut\parbox[c][.7cm]{1.1cm}{\color{orange}\Large\bfseries\centering#1}}
\hspace{4pt}
    \colorbox{ocre!40}{\strut\parbox[c][.7cm]{\linewidth-1.3cm}{\partname\Large\centering 第#1部分 * #2}}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% unnumbered part in the table of contents
\newcommand{\@myparttocformat}[1]{%
	\setlength\fboxsep{0pt}%
	\noindent\colorbox{ocre!40}{\strut\parbox[c][.7cm]{\linewidth}{\Large\sffamily\centering#1}}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}
\titlecontents{part}
[-2pt] % Left indentation
{\addvspace{10pt}\bfseries} % Spacing and font options for parts
{}
{}
{}
[\addvspace{-12pt}]
\titlecontents{chapter}
[14mm] % Left indentation
{\bfseries\hspace{-1pt}} %
{\contentslabel[\heiti \thecontentslabel]{14mm}}
{}
%{[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
{\bfseries\ttfamily\titlerule*[0.5pc]{~}\contentspage}
%%%%%%%%PART,chpter目录样式部分定制结束%%%%%%%%%%%%%%%

\titlecontents{section}
[14mm] % Left indentation
{\hspace{-2pt}} %
{\contentslabel[\heiti \thecontentslabel]{7mm}}
{}
%{[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
{\bfseries\ttfamily\titlerule*[0.5pc]{$.$}\contentspage}

\titlecontents{subsection}
[25mm] % Left indentation
{\hspace{-2pt}} %
{\contentslabel[\heiti \thecontentslabel]{10mm}}
{}
%{[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
{\bfseries\ttfamily\titlerule*[0.5pc]{$.$}\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{wallpaper}
%%%%%%%%%%%PART页面定制%%%%%%%%%%%%%%%%%%%%%
\usepackage{eso-pic} % 用于在特定页面添加背景
\newcommand{\thepartimages}{}%
\newcommand{\partimages}[1]{\ifusepartimage\renewcommand{\thepartimages}{#1}\fi}%

\def\@part[#1]#2{%
	\ifnum \c@secnumdepth >-2\relax
	\refstepcounter{part}%
	\addcontentsline{toc}{part}{
	\texorpdfstring{\protect\@mptof{\arabic{part}}{#1}}
	{\arabic{part}~\thepart\ ---\ #1}
}
	\else
	\addcontentsline{toc}{part}{#1}%
	\fi
	\markboth{}{}%
	{\ThisCenterWallPaper{1}{\thepartsimage}
		\centering
		\interlinepenalty \@M
		\normalfont
		\ifnum \c@secnumdepth >-2\relax
\vskip 2cm	\huge\bfseries 	 \partname  \thepart  \\ 
    \pgfornament[scale=.3]{72}  #2 
        \pgfornament[scale=.3]{73}\\[-5pt]
        \pgfornament[scale=.5]{85} \\
		\vskip 10\p@
		\fi
        \begin{tcolorbox}[enhanced jigsaw,
            opacityframe=0.5,opacityback=0.25,opacitybacktitle=0.25,
            colback=cyan!0,colframe=cyan,colbacktitle=cyan,
            boxrule=0pt,
            breakable=true, % 启用分页
            toprule=1.5pt,
            bottomrule=1.5pt,
            enlarge top by=15mm, % 分页后增加顶部空间
            arc=0mm,
            every box/.style={before upper={\color{cyan}}}, % 确保每个分页块中
            overlay = {%
                %标题盒子
                \node[rectangle, %opacity=.3,
                text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},rounded corners=2pt,
                inner sep=1.5mm,fill=cyan,
                anchor=west,
                font=\bfseries] at ([xshift=.4\textwidth,yshift=.5mm]frame.north west)%
                {\bf \large 第 \arabic{part} 部分目录};
            }
            ]
           \normalsize
           \startcontents
           \printcontents{l}{0}[1]{}
        \end{tcolorbox}
				%   \thispagestyle{empty}
	}%
	\@endpart}
\def\@spart#1{%
	{\centering
		\interlinepenalty \@M
		\normalfont
		\Huge \bfseries #1\par}%
	\@endpart
}
\def\@spart#1{%
	{\centering
		\interlinepenalty \@M
		\normalfont
		\Huge \bfseries #1\par}%
	\@endpart}
\def\@endpart{\vfil\newpage
	\if@twoside
	\if@openright
	\null
	\thispagestyle{empty} %
	\fi
	\fi
	\if@tempswa
	\twocolumn
	\fi}
\newif\ifusepartsimage
\usepartsimagetrue
\newcommand{\thepartsimage}{}%
\newcommand{\partsimage}[1]{\ifusepartsimage\renewcommand{\thepartsimage}{#1}\fi}%
%%%%%%%%%%%%%% PART部分定制结束%%%%%%%%%%%%%%%%%%

\definecolor{mlred}{RGB}{253,243,242}
\definecolor{mred}{RGB}{220,53,69}
\definecolor{bg}{rgb}{0.99,0.99,0.99}
\definecolor{mlblue}{RGB}{236,243,255}
\definecolor{mblue}{RGB}{0,123,255}
\definecolor{lsp}{RGB}{0,174,247}
\definecolor{mlblue3}{RGB}{44, 49, 51} % mycmd颜色
\definecolor{mlblue2}{RGB}{35, 41, 55}


%%%%%%%%%%%%%%%%代码抄录定制类%%%%%%%%%%%%%%%%%%%
\RequirePackage{tcolorbox}
\tcbuselibrary{listings,breakable}


\newcommand{\md}[1]{{\color{purple}#1}}
\newcommand{\keypoint}[1]{\textbf{\textcolor{red}{#1}}}
\definecolor{structurecolor}{RGB}{0, 174, 247}%




\RequirePackage{listings}
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle,breaklines=true}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
	texcsstyle=*\color{red!40!orange},
	numbers=none,
	breaklines=true,
	keywordstyle=\color{red!40!orange},
	commentstyle=\color{gray},
emph={equation,itemize,assumption,solution,math,tcolorbox,lstlisting,dinglist,ctex,VIVIDpaper,microtype,fontspec,base,lemma,description,bibstyle,warning,XeLaTeX,minted,exercise,amsthm,booktabs,device,proposition,ascolorbox5,mode,gather,python,iiint,amsmath,example, conclusion,type1cm,mycmd2,ascolorbox1,corollary,sBox,shell,note,macboxd,toc,cite,ascolorbox4,aligned,FiraMono,scheme,color,problem,macbox,pgfornament,xunicode,ascolorbox0,table,PDFLaTeX,titlestyle,property,iint,theorem,figure,introduction,nginx,ascolorbox3,chinesefont,definition,citestyle,ascolorbox10,fontenc,fig,ascolorbox16,axiom,vim,code,enumerate,ascolorbox17,lang,int,ascolorbox19,img,times,BibTeX,image,tabular,proof,postulate,align,xeCJK,ascolorbox11,natbib,remark,esint,listings},
morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,extrainfo,logo,cover,subtitle,appendix,chapter,hypersetup,mainmatter,frontmatter,tableofcontents,VIVIDpar,heiti,kaishu,lstset,pagecolor,zhnumber,marginpar,part,equote,marginnote,bioinfo,datechange,listofchange,lvert,lastpage,songti,heiti,fangsong,setCJKfamilyfont,textbf},
	emphstyle={\color{cyan}},
    breakatwhitespace=true,
	frame=single,
	rulecolor=\color{structurecolor},
	framerule=0pt,
	columns=flexible,
}

\setmonofont{CMU Typewriter Text}

%%--------------------------------------------------%%

%%%%% 自定义-----%%%%%%%%%%%%
\newcommand{\emb}[2][Magenta]{{\bf\color{#1}\uuline{#2}}}


%%%%%%%%%%%%%%%%性质
\newcounter{property}[section]
\setcounter{property}{0}
\renewcommand{\theproperty}{\arabic{property}}

\newtcolorbox{wwproposition3}[2][]{
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
    fontupper=\normalsize, 
    overlay unbroken = {
        %左上边缘细线%更改有效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %标题%更改有效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=structurecolor,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white} \propertyname~\theproperty. ~#2}; %这里可以补计数器
        %底部 (下边缘)颜色装饰矩形%更改有效
        \fill[fill=structurecolor]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    },%上面是实际控制代码,下面的代码仅在跨页分割时生效
    overlay first = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        %标题 %跨页时生效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=DeepPink,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white}  \propertyname~\theproperty. #2};
    },%保持边缘的变化
    overlay last = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %底部%跨页时生效
        \fill[fill=structurecolor]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    }
    #1
}
\NewDocumentEnvironment{property}{O{} O{} O{}}{\stepcounter{property} \smallskip\begin{wwproposition3}{#1}{#2}#3}{\end{wwproposition3} }

%%%%%%%%%%%%%%%%
\tikzset{
    wnodeTheorem/.style={%
        rectangle,top color=lightergray, bottom color=lightergray,
        inner sep=1mm,anchor=west,font=\bf\rmfamily},
    % wnodeminimum/.style={%
        % 	rectangle,  top color=white, bottom color=white,
        % 	text=Emerald,inner sep=1mm,anchor=west,font=\bf\rmfamily}
}
%评析环境-------------------------------------------------------
\newtcolorbox{anybox}[2][]{%
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,
    top=6mm,fontupper=\normalsize,%step and label={tcbremark}{#3},
    overlay unbroken  = {
        %垂直条%更改有效
        \draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题：定义%更改有效
        \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        {\textbf{\color{magenta5} #2}};
        % \draw[color=magenta5,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    overlay first  = {
        %垂直线段%跨页时生效
        \draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题:定义 %跨页时生效
        \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        {\textbf{\color{magenta5} #2}};
        % \draw[color=magenta5,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    % 保持边缘的变化
    overlay last    = {
        %垂直线段%跨页时生效
        \draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
    },
    #1
}
%
\NewDocumentEnvironment{anymark}{O{} O{} O{}}{\smallskip\begin{anybox}{#1}{#2} #3}{\end{anybox}}
% 结束评析
% 例题开始 --------------------------------------------------
% Example with counter
\newcounter{exam}[chapter]
\setcounter{exam}{0}
\renewcommand{\theexam}{\thechapter.\arabic{exam}}
% 例题环境
\newtcolorbox{wwexample}[3][]{%
    arc=0mm,
    breakable,drop fuzzy shadow=black!20!white,
    enhanced,
    colback=lightergray,
    boxrule=0pt,
    top=8mm, %分隔垂直-开始文本
    % enlarge top by=\baselineskip/2+1mm,
    % enlarge top at break by=0mm,pad at break=2mm,
    fontupper=\normalsize,
    step and label={exam}{#3},%标签
    overlay unbroken = {%
        %垂直线段%更改有效
        %\draw[color=gray!5,line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %底部装饰矩形%更改有效
        \fill[fill=Emerald] (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
        % 图像框示例
        %\node[rectangle,
        %         text=black, ,fill=ALamarillo!20,
        %         inner sep=1mm,anchor=west,font=\small\bf\sffamily] at ([xshift=-10.3pt,yshift=-3.2mm]frame.north west)%
        %{ };
        %框编号和描述%更改有效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=Emerald,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{black}例题 \theexam. ~#2};%标题
    },
    % fin overlay
    overlay first  = {%
        %标题框编号和描述%跨页时生效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=Emerald,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf \color{white} 例题 \theexam.~#2};
    },
    % overlay
    %边缘改变%跨页时生效
    overlay middle={\draw[color=lightergray,line width=3pt] ([xshift=3pt] frame.north west)--([xshift=2pt] frame.south west);
    },
    overlay last={\draw[color=lightergray,line width=3pt] ([xshift=3pt] frame.north west)--([xshift=2pt] frame.south west);
        %底部装饰矩形%跨页时生效
        \fill[fill=Emerald] (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm); }
    #1}
%
\NewDocumentEnvironment{example}{O{} O{} O{}}{\smallskip\begin{wwexample}{#1}{#2}%
        #3}{\end{wwexample} }
%例题结束-----------------------------------------------------------------

\newcounter{assumption}
\setcounter{assumption}{1}
\renewcommand{\theassumption}{\arabic{assumption}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtcolorbox{wwproposition}[2][]{
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
    fontupper=\normalsize, 
    overlay unbroken = {
        %左上边缘细线%更改有效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %标题%更改有效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=DeepPink,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white} 假设~\theassumption. ~#2}; %这里可以补计数器
        %底部 (下边缘)颜色装饰矩形%更改有效
        \fill[fill=DeepPink]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    },%上面是实际控制代码,下面的代码仅在跨页分割时生效
    overlay first = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        %标题 %跨页时生效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=DeepPink,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white}  假设~\theassumption. #2};
    },%保持边缘的变化
    overlay last = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %底部%跨页时生效
        \fill[fill=DeepPink]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    }
    #1
}
\NewDocumentEnvironment{assumption}{O{} O{} O{}}{\smallskip\begin{wwproposition}{#1}{#2}#3}{\end{wwproposition} }


\newtcolorbox{keypointbox}[2][]{%
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,
    top=6mm,fontupper=\normalsize,%step and label={tcbremark}{#3},
    overlay unbroken  = {
        %垂直条%更改有效
        \draw[color=structurecolor,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题：定义%更改有效
        \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        {\textbf{\color{magenta5} 性质~#2}};
        % \draw[color=magenta5,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    overlay first  = {
        %垂直线段%跨页时生效
        \draw[color=structurecolor,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题:定义 %跨页时生效
        \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        {\textbf{\color{magenta5} 性质~#2}};
        % \draw[color=magenta5,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    % 保持边缘的变化
    overlay last    = {
        %垂直线段%跨页时生效
        \draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
    }
    #1
}
%
\NewDocumentEnvironment{conclusion}{O{} O{} O{}}{\smallskip\begin{keypointbox}{#1}{#2} #3}{\end{keypointbox}}

\RequirePackage{mdframed}
\newmdenv[topline=false,bottomline=false,rightline=false,leftline=true,linewidth=2pt,
leftmargin=5pt,rightmargin=5pt,linecolor=magenta5,backgroundcolor=brown!8,
shadow=true,shadowsize=2pt,shadowcolor=gray!50,
]{mybox1}

\definecolor{Mark}{RGB}{39,38,112}
\definecolor{mark}{RGB}{203,203,220}
\newtcolorbox{marker}[1][]{
    enhanced,before skip=2mm,
    after skip=3mm,fontupper=\rmfamily\sffamily,
    boxrule=0.4pt,left=5mm,right=2mm,top=1mm,bottom=1mm,
    colback=mark,colframe=tcbcolback!80!black,
    sharp corners,rounded corners=southeast,
    arc is angular,arc=3mm,underlay={
        \path[fill=tcbcolback!80!black] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
        \path[draw=tcbcolframe,shorten <=-0.05mm,shorten >=-0.05mm] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
        \path[fill=Mark,draw=none] (interior.south west) rectangle node[white]{\Huge\bfseries !} ([xshift=4mm]interior.north west);
    },
    drop fuzzy shadow,#1
}

\newcounter{reidaibangou}
\newtcolorbox{reidai}[1][]{breakable,enhanced,boxrule=0.5mm,
    top=2pt,left=44pt,right=4pt,bottom=2pt,arc=0mm,
    colframe=blue!30!gray,
    boxrule=1pt,
    underlay={
        \node[inner sep=1pt,blue!50!black,fill=blue!10!white]at ([xshift=22pt,yshift=-9pt]interior.north west) {\stepcounter{reidaibangou}\bfseries\rmfamily 练习 \thereidaibangou};},
    segmentation code={%
        \draw[dashed] (segmentation.west)--(segmentation.east);
        \node[inner sep=1pt,blue!50!black,fill=blue!10!white] at ([xshift=22pt,yshift=-8pt]segmentation.south west) {\bfseries\rmfamily 解};},
    before upper={\setlength{\parindent}{1mm}},
    before lower={\setlength{\parindent}{1mm}},#1
}


\definecolor{safecolor}{rgb}{0.2, 0.4, 0.8}
\newtcolorbox{kousiki}[2][]{enhanced,left=22pt,right=22pt,arc=0.2mm,
    fonttitle=\rmfamily\bfseries\large,coltitle=white,
    colbacktitle=blue!50!black,
    attach boxed title to top left={},
    boxed title style={skin=enhancedfirst jigsaw,
        arc=0.2mm,bottom=1pt,top=1pt,boxrule=0mm},
    boxrule=0.5pt,colback=safecolor!5!,
    colframe=safecolor,sharp corners=northwest,
    drop fuzzy shadow,title=#2,
    fontupper=\rmfamily,#1}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{varwidth,multicol}
\newcommand{\eqskip}{\hspace{2.0em}}
\newcommand{\titem}{\hspace{0.5em} - }
\newcommand{\exitem}{\hspace{1.0em} - }
\newcommand{\yskip}{\vspace{0.6em}}
\newcommand{\bxskip}{\vspace{-1.5em}}
\newcommand{\lskip}{\hspace{2.0em}}
\newcommand{\rcyskip}{\vspace*{-4pt}} 
\newcommand{\eqyskip}{\vspace*{0.5em}}  
\newcommand{\xskip}{}
\newcommand{\oskip}{}
\newcommand{\ra}{\, \Rightarrow \,}
\newcommand{\RA}{\quad \Rightarrow \quad}
\newcommand{\dd}{\mathrm{d}}
\newcommand{\ee}{\mathrm{e}}
\newcommand{\opdt}{\frac{\mathrm{d}}{\mathrm{d}t}}
\newcommand{\ddt}[1]{\frac{\mathrm{d}#1}{\mathrm{d}t}}
\newcommand{\dddt}[1]{\frac{\mathrm{d}^2#1}{\mathrm{d}t^2}}
\newcommand{\avg}[1]{\left< #1 \right>}
\newcommand{\tspace}{\text{ }}
\newcommand{\sunit}[1]{\text{ #1}}
\newcommand{\tmax}{\text{max}}
\newcommand{\tmin}{\text{min}}
\newcommand{\rad}{\text{ rad}}
\newcommand{\radps}{\text{ rad s$^{-1}$}}
\newcommand{\jpkgk}{\text{ J kg$^{-1}$ K$^{-1}$}}
\newcommand{\jpkgC}{\text{ J kg$^{-1}$ $^\circ\text{C}^{-1}$}}
\newcommand{\mps}{\text{ m s$^{-1}$}}
\newcommand{\cmps}{\text{ cm s$^{-1}$}}
\newcommand{\mpss}{\text{ m s$^{-2}$}}
\newcommand{\kgmpss}{\text{ kg m s$^{-2}$}}
\newcommand{\Vpm}{\text{ V m$^{-1}$}}
\newcommand{\Vpcm}{\text{ V cm$^{-1}$}}
\newcommand{\NpC}{\text{ N C$^{-1}$}}
\newcommand{\muF}{\text{ $\mu$F}}
\newcommand{\pF}{\text{ pF}}
\newcommand{\OC}{\text{$^\circ\text{C}$}}
\newcommand{\halflife}{t_\text{\tiny\sfrac{1}{2}}}
\newcommand{\fnet}{F_\text{net}}
\newcommand{\ec}{4\pi\epsilon_0}
\newcommand{\Mp}{m_\text{p}}
\newcommand{\Mn}{m_\text{n}}
\newcommand{\eoe}{\hfill $\square$}
\newcommand{\teoe}{\tag*{$\square$}}
\newcommand{\feoe}{\vspace*{-\baselineskip}\hfill $\square$}
\newcommand{\up}{\nnearrow}
\newcommand{\down}{\ssearrow}

\DeclareTColorBox{simplesquarebox}{ o m O{.5} O{} }% 
{empty, left=2mm, right=2mm, top=-1mm, attach boxed title to top left={xshift=1.2zw}, boxed title style={empty,left=-2mm,right=-2mm}, colframe=black, coltitle=black, coltext=black, breakable, 
    underlay unbroken={\draw[black,line width=#3pt](title.east) -- (title.east-|frame.east) -- (frame.south east) -- (frame.south west) -- (title.west-|frame.west) -- (title.west); },
    underlay first={\draw[black,line width=#3pt](title.east) -- (title.east-|frame.east) -- (frame.south east) ;
        \draw[black,line width=#3pt] (frame.south west) -- (title.west-|frame.west) -- (title.west); },
    underlay middle={\draw[black,line width=#3pt](frame.north east) -- (frame.south east) ;
        \draw[black,line width=#3pt](frame.south west) -- (frame.north west) ;},
    underlay last={\draw[black,line width=#3pt](frame.north east) -- (frame.south east) -- (frame.south west) -- (frame.north west) ;},
    fonttitle=\rmfamily, IfValueTF={#1}{title=【#2】〈#1〉}{title=【#2】},#4}

\definecolor{DeepBlue}{RGB}{43,59,83}
\definecolor{Deepblue}{RGB}{75,101,134}
\definecolor{Blue}{RGB}{113,151,172}
\definecolor{Wine}{RGB}{136,63,75}
\definecolor{Pink}{RGB}{226,209,211}
\definecolor{Deepviolet}{RGB}{77,49,78}
\definecolor{Violet}{RGB}{103,76,120}
\DeclareTColorBox{ascolorbox1}{ o m O{}}%
{enhanced,colback=white, skin=enhancedlast jigsaw,breakable, attach boxed title to top left={xshift=-4mm,yshift=-0.5mm}, fonttitle=\bfseries\rmfamily, varwidth boxed title=0.85\linewidth, colbacktitle=Violet,colframe=Violet,
    boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
    underlay boxed title={%
        \fill[Violet] (title.north west) -- (title.north east) -- +(\tcboxedtitleheight-1mm,-\tcboxedtitleheight+1mm)
        -- ([xshift=4mm,yshift=0.5mm]frame.north east) -- +(0mm,-1mm) -- (title.south west) -- cycle;
        \fill[Deepviolet] ([yshift=-0.5mm]frame.north west)
        -- +(-0.4,0) -- +(0,-0.3) -- cycle;
        \fill[Deepviolet] ([yshift=-0.5mm]frame.north east)
        -- +(0,-0.3) -- +(0.4,0) -- cycle;  },
    IfValueTF={#1}{title=#2〈#1〉}{title=#2},#3}

\definecolor{DeepBlue}{RGB}{43,59,83}
\definecolor{Deepblue}{RGB}{75,101,134}
\definecolor{Blue}{RGB}{113,151,172}
\definecolor{Wine}{RGB}{136,63,75}
\definecolor{Pink}{RGB}{226,209,211}
\definecolor{Deepviolet}{RGB}{77,49,78}
\definecolor{Violet}{RGB}{103,76,120}
\DeclareTColorBox{ascolorbox1}{ o m O{}}%
{enhanced,colback=white, skin=enhancedlast jigsaw,breakable, attach boxed title to top left={xshift=-4mm,yshift=-0.5mm}, fonttitle=\bfseries\rmfamily, varwidth boxed title=0.85\linewidth, colbacktitle=Violet,colframe=Violet,
    boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
    underlay boxed title={%
        \fill[Violet] (title.north west) -- (title.north east) -- +(\tcboxedtitleheight-1mm,-\tcboxedtitleheight+1mm)
        -- ([xshift=4mm,yshift=0.5mm]frame.north east) -- +(0mm,-1mm) -- (title.south west) -- cycle;
        \fill[Deepviolet] ([yshift=-0.5mm]frame.north west)
        -- +(-0.4,0) -- +(0,-0.3) -- cycle;
        \fill[Deepviolet] ([yshift=-0.5mm]frame.north east)
        -- +(0,-0.3) -- +(0.4,0) -- cycle;  },
    IfValueTF={#1}{title=#2〈#1〉}{title=#2},#3}

\definecolor{xianhong}{RGB}{217,65,128}
\definecolor{Cyan}{RGB}{0,140,210}
\definecolor{huanglv}{RGB}{255, 128, 0}
\definecolor{kafeihuang}{RGB}{255, 0, 0}
\DeclareTColorBox{ascolorbox3}{ m O{black} O{}}%
{empty, breakable, title={#1},attach boxed title to top left, boxed title style={empty,size=minimal, toprule=2pt, top=4pt,
        underlay ={\draw[#2,line width=3pt]
            ([yshift=-1.6pt]frame.north west)--([yshift=-1.6pt]frame.north east);}},
    coltitle=black,fonttitle=\large\bfseries,
    before=\par\medskip\noindent,parbox=false,boxsep=0pt,left=0pt,right=3mm,top=4pt,
    breakable,pad at break=0mm,
    underlay unbroken={\draw[#2,line width=1pt]
        ([yshift=-1pt]title.north east)--([xshift=-0.5pt,yshift=-1pt]title.north-|frame.east)
        --([xshift=-0.5pt]frame.south east)--(frame.south west) ;
        \draw[#2,line width=.5pt]
        ([yshift=-2.5pt]title.north east)--([xshift=-2pt,yshift=-2.5pt]title.north-|frame.east)
        --([yshift=1.5pt,xshift=-2pt]frame.south east)--([yshift=1.5pt]frame.south west);},
    underlay first={\draw[#2,line width=1pt]
        ([yshift=-1pt]title.north east)--([xshift=-0.5pt,yshift=-1pt]title.north-|frame.east)
        --([xshift=-0.5pt]frame.south east) ;
        \draw[#2,line width=.5pt]
        ([yshift=-2.5pt]title.north east)--([xshift=-2pt,yshift=-2.5pt]title.north-|frame.east)
        --([xshift=-2pt]frame.south east) ;},
    underlay middle={\draw[#2,line width=1pt]
        ([xshift=-0.5pt]frame.north east)
        --([xshift=-0.5pt]frame.south east) ;
        \draw[#2,line width=.5pt]
        ([xshift=-2pt]frame.north east)
        --([xshift=-2pt]frame.south east);},
    underlay last={\draw[#2,line width=1pt]
        ([xshift=-0.5pt]frame.north east)
        --([xshift=-0.5pt]frame.south east)--(frame.south west) ;
        \draw[#2,line width=.5pt]
        ([xshift=-2pt]frame.north east)
        --([yshift=1.5pt,xshift=-2pt]frame.south east)--([yshift=1.5pt]frame.south west);}, 
    #3}

\definecolor{Rot}{RGB}{136,63,75}
\definecolor{Bviolet}{RGB}{93,44,108}
\definecolor{Shenlan}{RGB}{39,38,112}
\definecolor{zihong}{RGB}{138,49,103}
\definecolor{qianhong}{RGB}{216,204,219}
\definecolor{huihei}{RGB}{17,25,68}
\definecolor{lanhei}{RGB}{36,63,120}
\definecolor{heilv}{RGB}{43,106,131}
\definecolor{Jiuhong}{RGB}{145,46,63}
\definecolor{huibai}{RGB}{231,231,231}
\DeclareTColorBox{ascolorbox4}{ o m O{3} O{}}%
{enhanced, colback=white, colframe=white,
    attach boxed title to top left={xshift=1cm,yshift=-\tcboxedtitleheight/2}, fonttitle=\bfseries,varwidth boxed title=0.85\linewidth, coltitle=black, fonttitle=\sffamily, 
    enlarge top by=2mm, enlarge bottom by=2mm, breakable, sharp corners,
    boxed title style={colback=white,left=0mm,right=0mm}, 
    borderline={.75pt}{#3pt}{black,dotted},
    underlay unbroken={\draw[black,line width=.5pt]
        (title.east|-frame.north east)--([xshift=-#3*4pt]frame.north east) 
        arc [start angle=180, end angle=270, radius=#3*4pt] 
        -- ([yshift=#3*4pt]frame.south east) 
        arc [start angle=90, end angle=180, radius=#3*4pt] 
        -- ([xshift=#3*4pt]frame.south west)
        arc [start angle=0, end angle=90, radius=#3*4pt] 
        -- ([yshift=-#3*4pt]frame.north west)
        arc [start angle=270, end angle=360, radius=#3*4pt] 
        -- (frame.north west-|title.west) ;
        \filldraw[fill=gray,draw=gray]
        (frame.north east) -- +(0pt,-#3*2pt) -- +(-#3*2pt,-#3*2pt) -- +(-#3*2pt,0pt) -- cycle;
        \filldraw[fill=gray,draw=gray]
        (frame.south east) -- +(-#3*2pt,0pt) -- +(-#3*2pt,#3*2pt) -- +(0pt,#3*2pt) -- cycle;
        \filldraw[fill=gray,draw=gray]
        (frame.south west) -- +(0pt,#3*2pt) -- +(#3*2pt,#3*2pt) -- +(#3*2pt,0pt) -- cycle;
        \filldraw[fill=gray,draw=gray]
        (frame.north west) -- +(0pt,-#3*2pt) -- +(#3*2pt,-#3*2pt) -- +(#3*2pt,0pt) -- cycle;
    },
    underlay first={\draw[black,line width=.5pt]
        (title.east|-frame.north east)--([xshift=-#3*4pt]frame.north east) 
        arc [start angle=180, end angle=270, radius=#3*4pt] 
        -- (frame.south east) ;
        \draw[black,line width=.5pt]
        (frame.south west)
        -- ([yshift=-#3*4pt]frame.north west)
        arc [start angle=270, end angle=360, radius=#3*4pt] 
        -- (frame.north west-|title.west) ;
        \filldraw[fill=gray,draw=gray]
        (frame.north east) -- +(0pt,-#3*2pt) -- +(-#3*2pt,-#3*2pt) -- +(-#3*2pt,0pt) -- cycle;
        \filldraw[fill=gray,draw=gray]
        (frame.north west) -- +(0pt,-#3*2pt) -- +(#3*2pt,-#3*2pt) -- +(#3*2pt,0pt) -- cycle;
    },
    underlay middle={\draw[black,line width=.5pt]
        (frame.north east)--(frame.south east) ;
        \draw[black,line width=.5pt]
        (frame.south west)--(frame.north west) ;
    },
    underlay last={\draw[black,line width=.5pt]
        (frame.north east) -- ([yshift=#3*4pt]frame.south east) 
        arc [start angle=90, end angle=180, radius=#3*4pt] 
        -- ([xshift=#3*4pt]frame.south west)
        arc [start angle=0, end angle=90, radius=#3*4pt] 
        -- (frame.north west);
        \filldraw[fill=gray,draw=gray]
        (frame.south east) -- +(-#3*2pt,0pt) -- +(-#3*2pt,#3*2pt) -- +(0pt,#3*2pt) -- cycle;
        \filldraw[fill=gray,draw=gray]
        (frame.south west) -- +(0pt,#3*2pt) -- +(#3*2pt,#3*2pt) -- +(#3*2pt,0pt) -- cycle;
    },
    IfValueTF={#1}{title=【#2】〈#1〉}{title=【#2】},#4}

\DeclareTColorBox{ascolorbox5}{ O{} m O{Bviolet} O{} }%
{enhanced,colback=white, colframe=white, coltext=#3, attach boxed title to top left={xshift=1mm,yshift=0mm}, fonttitle=\bfseries\rmfamily,varwidth boxed title=0.85\linewidth, colbacktitle=Bviolet, breakable,
    enlarge top by=3mm, enlarge bottom by=3mm, 
    boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
    underlay boxed title={\fill[#3] (title.north west) 
        -- (title.north east) --node[right=3mm]{{#1}}+(0,-\tcboxedtitleheight+.5mm)
        -- ([xshift=-1mm,yshift=.5mm]frame.north east) 
        -- +(0mm,-.5mm) -- (title.south west) -- cycle;
        \draw[#3] ([yshift=-.5mm]title.south west) --
        ([xshift=-1mm,yshift=-.5mm]frame.north east);},
    underlay unbroken={\draw[#3, ultra thick] ([xshift=1mm,yshift=-.3mm]frame.south west)
        -- ([xshift=-1mm,yshift=-.3mm]frame.south east);
        \draw[#3] ([xshift=1mm,yshift=.5mm]frame.south west) 
        -- ([xshift=-1mm,yshift=.5mm]frame.south east);
        \draw[#3,thick,Bviolet,dotted] ([yshift=\tcboxedtitleheight+1mm]frame.north west) 
        -- ([yshift=\tcboxedtitleheight+1mm]frame.north east) 
        -- ([yshift=-2mm]frame.south east) -- ([yshift=-2mm]frame.south west) -- cycle;},
    underlay first={\draw[#3,thick,Bviolet,dotted] ([yshift=\tcboxedtitleheight+1mm]frame.north west) 
        -- ([yshift=\tcboxedtitleheight+1mm]frame.north east) 
        -- (frame.south east);
        \draw[#3,thick,zihong,dotted] (frame.south west)
        -- ([yshift=\tcboxedtitleheight+1mm]frame.north west);},
    underlay middle={\draw[#3,thick,Bviolet,dotted] (frame.north east) -- (frame.south east);
        \draw[#3,thick,Bviolet,dotted] (frame.south west) -- (frame.north west);},
    underlay last={\draw[#3,thick,Bviolet,dotted] (frame.north east) -- ([yshift=-2mm]frame.south east) 
        -- ([yshift=-2mm]frame.south west) -- (frame.north west);
        \draw[#3, zihong,ultra thick] ([xshift=1mm,yshift=-.3mm]frame.south west)
        -- ([xshift=-1mm,yshift=-.3mm]frame.south east);
        \draw[#3] ([xshift=1mm,yshift=.5mm]frame.south west) 
        -- ([xshift=-1mm,yshift=.5mm]frame.south east);},
    title={#2},#4}

\DeclareTColorBox{ascolorbox9}{m O{3} O{} }%
{enhanced, colframe=white, 
    attach boxed title to top left={xshift=-1mm,yshift=0mm}, fonttitle=\bfseries,varwidth boxed title=0.85\linewidth, colbacktitle=black!45!white, coltitle=black, 
    enlarge top by=2mm, enlarge bottom by=2mm, 
    arc=0mm, boxrule=.001pt, interior style={left color=qianhong, right color=Shenlan!50!white},
    boxed title style={size=small,colback=white}, 
    segmentation code={\path[thick, dotted, draw=black]
        ([xshift=5pt]segmentation.west) -- ([xshift=-5pt]segmentation.east);},
    underlay ={\draw[Shenlan,line width=1pt]
        ([xshift=32pt]frame.north west)--(frame.north east)
        -- (frame.south east)
        -- (frame.south west)
        -- (frame.north west);
        \draw[Bviolet, line width=1pt]
        ([yshift=4pt]title.east|-frame.north east)--([yshift=4pt]frame.north east);
        \draw[zihong, line width=1pt]
        ([xshift=4pt,yshift=8pt]title.east|-frame.north east)--([yshift=8pt]frame.north east);
        \draw[xianhong, line width=1pt]
        ([xshift=8pt,yshift=12pt]title.east|-frame.north east)--([yshift=12pt]frame.north east);
        \fill[top color=qianhong, bottom color=Shenlan]
        ([xshift=.5pt]frame.north east) -- ++ (-1mm,0mm) -- ++ (0pt,12.5pt) -- ++ (1mm,0mm) -- cycle;
        \foreach \n in {1,...,#2}{%
            \filldraw[xianhong]
            ([xshift=-(\linewidth-\tcboxedtitlewidth)*4*\n/(#2*4+1),yshift=12pt]frame.north east) circle (2pt);
            \filldraw[zihong]
            ([xshift=-(\linewidth-\tcboxedtitlewidth)*(-1+4*\n)/(#2*4+1),yshift=8pt]frame.north east) circle (2pt);
            \filldraw[Bviolet]
            ([xshift=-(\linewidth-\tcboxedtitlewidth)*(-2+4*\n)/(#2*4+1),yshift=4pt]frame.north east) circle (2pt);
            \filldraw[Shenlan]
            ([xshift=-(\linewidth-\tcboxedtitlewidth)*(-3+4*\n)/(#2*4+1)]frame.north east) circle (2pt);}
    },
    title=\color{Bviolet}{#1},#3}

\DeclareTColorBox{ascolorbox10}{ o m O{.8} O{} }%
{enhanced, interior hidden, colframe=white,
    attach boxed title to top left={xshift=6mm,yshift*=-1.5mm}, fonttitle=\rmfamily, coltitle=black, 
    , left=1mm, right=1mm,breakable,top=0mm,
    boxed title style={empty,left=-2mm,right=-2mm}, 
    underlay unbroken and first={\draw[Jiuhong,line width=1pt, dotted]
        ([xshift=3pt,yshift=-3pt]title.east) -- ([yshift=-3pt]title.east-|frame.east);
        \draw[lanhei,line width=#3pt]
        (title.east) -- (title.east-|frame.east);
        \draw[black!40!white,line width=1pt, dotted]
        ([xshift=-3pt,yshift=-3pt]title.west) -- ([yshift=-3pt]title.west-|frame.west);
        \draw[black,line width=#3pt]
        (title.west) -- (title.west-|frame.west);
    },
    underlay unbroken and last={\draw[lanhei,line width=#3pt]
        (frame.south west) -- (frame.south east);
        \draw[Jiuhong,line width=1pt, dotted]
        ([yshift=3pt]frame.south west) -- ([yshift=3pt]frame.south east);
    },
    IfValueTF={#1}{title=【#2】〈#1〉}{title=\color{lanhei}【#2】},#4}

\DeclareTColorBox{ascolorbox11}{ o m O{4} O{} }%
{enhanced, colback=Jiuhong!30!white, colframe=white,
    attach boxed title to top left={xshift=1cm,yshift=-3mm}, fonttitle=\rmfamily,varwidth boxed title=0.85\linewidth, 
    boxed title style={empty,left=-2mm,right=-2mm}, coltitle=Bviolet,breakable,colback=Jiuhong!20!white,
    underlay unbroken={\draw[kafeihuang,line width=.5pt]
        ([yshift=-#3*0.5pt]title.east)--([yshift=-#3*0.5pt]title.east-|frame.east) -- ++ (0pt,#3pt) -- ++ (-#3pt,0pt)
        -- ([xshift=-#3pt]frame.south east) - ++ (#3pt,0pt) -- ++ (#3pt,#3pt)
        -- ([yshift=#3pt]frame.south west) - ++ (0pt,-#3pt) -- ++ (#3pt,-#3pt)
        -- ([xshift=#3pt,yshift=#3*0.5pt]title.west-|frame.west) - ++ (-#3pt,0pt) -- ++ (-#3pt,-#3pt)
        -- ([yshift=-#3*0.5pt]title.west) ;
        \draw[Bviolet,line width=.5pt]
        ([yshift=#3*0.5pt]title.east)--([xshift=-#3*2pt,yshift=#3*0.5pt]title.east-|frame.east) -- ++ (0pt,-#3*2pt)
        --  ++ (#3*2pt,0pt)
        -- ([yshift=#3*2pt]frame.south east) -- ++ (-#3*2pt,0pt)
        -- ([xshift=-#3*2pt]frame.south east)
        -- ([xshift=#3*2pt]frame.south west) -- ++ (0pt,#3*2pt)
        -- ([yshift=#3*2pt]frame.south west)
        -- ([yshift=-#3*1.5pt]title.west-|frame.west) -- ++ (#3*2pt,0pt)
        -- ++ (0pt,#3*2pt)
        -- ([yshift=#3*0.5pt]title.west);},
    underlay first={\draw[kafeihuang,line width=.5pt]
        ([yshift=-#3*0.5pt]title.east)--([yshift=-#3*0.5pt]title.east-|frame.east) -- ++ (0pt,#3pt) -- ++ (-#3pt,0pt)
        -- ([xshift=-#3pt]frame.south east);
        \draw[kafeihuang,line width=.5pt]
        ([xshift=#3pt]frame.south west)
        -- ([xshift=#3pt,yshift=#3*0.5pt]title.west-|frame.west) - ++ (-#3pt,0pt) -- ++ (-#3pt,-#3pt)
        -- ([yshift=-#3*0.5pt]title.west) ;
        \draw[Bviolet,line width=.5pt]
        ([yshift=#3*0.5pt]title.east)--([xshift=-#3*2pt,yshift=#3*0.5pt]title.east-|frame.east)
        -- ++ (0pt,-#3*2pt)
        -- ++ (#3*2pt,0pt)
        -- (frame.south east);
        \draw[Bviolet,line width=.5pt]
        (frame.south west)
        -- ([yshift=-#3*1.5pt]title.west-|frame.west) -- ++ (#3*2pt,0pt)
        -- ++ (0pt,#3*2pt)
        -- ([yshift=#3*0.5pt]title.west);},
    underlay middle={\draw[kafeihuang,line width=.5pt]
        ([xshift=-#3pt]frame.north east)
        -- ([xshift=-#3pt]frame.south east);
        \draw[kafeihuang,line width=.5pt]
        ([xshift=#3pt]frame.north west)
        -- ([xshift=#3pt]frame.south west);
        \draw[Bviolet,line width=.5pt]
        (frame.north east)
        -- (frame.south east);
        \draw[Bviolet,line width=.5pt]
        (frame.north west)
        -- (frame.south west);},
    underlay last={\draw[kafeihuang,line width=.5pt]
        ([xshift=-#3pt]frame.north east)
        -- ([xshift=-#3pt]frame.south east) - ++ (#3pt,0pt) -- ++ (#3pt,#3pt)
        -- ([yshift=#3pt]frame.south west) - ++ (0pt,-#3pt) -- ++ (#3pt,-#3pt)
        -- ([xshift=#3pt]frame.north west);
        \draw[Bviolet,line width=.5pt]
        (frame.north east)
        -- ([yshift=#3*2pt]frame.south east) -- ++ (-#3*2pt,0pt)
        -- ([xshift=-#3*2pt]frame.south east)
        -- ([xshift=#3*2pt]frame.south west) -- ++ (0pt,#3*2pt)
        -- ([yshift=#3*2pt]frame.south west)
        -- (frame.north west);},
    IfValueTF={#1}{title={#2〈#1〉}}{title=【#2】},#4}

\definecolor{Ro}{RGB}{217,65,128}
\definecolor{Bla}{RGB}{0,140,210}
\definecolor{Gru}{RGB}{134,150,0}
\definecolor{Ge}{RGB}{186,134,0}
\definecolor{bla}{RGB}{231,231,231}
\definecolor{White}{RGB}{43,58,82}
\DeclareTColorBox{ascolorbox17}{ o m O{gray} O{}}%
{enhanced, colback=bla, colframe=white,
    attach boxed title to top left={xshift=1.5cm,yshift=-\tcboxedtitleheight/2}, fonttitle=\bfseries,varwidth boxed title=0.85\linewidth, coltitle=black, fonttitle=\rmfamily, 
    enlarge top by=2mm, enlarge bottom by=2mm, breakable,
    boxed title style={colback=Ro,left=0mm,right=0mm},
    underlay unbroken={
        \draw[fill=Bla, draw=Bla]
        (frame.north west) -- ++ (10mm,0mm) -- ++ (-.5mm,-.5mm) -- ++ (-9mm,0mm) -- ++ (0mm, -9mm) -- ++ (-.5mm,-.5mm) -- cycle;
        \draw[fill=Bla, draw=Bla]
        (frame.south east) -- ++ (-10mm,0mm) -- ++ (.5mm,.5mm) -- ++ (9mm,0mm) -- ++ (0mm, 9mm) -- ++ (.5mm,.5mm) -- cycle;
        \draw[#3, thick] (title.east) -- (frame.north east) -- ([yshift=11mm]frame.south east)-- ++ (-1.2mm,-1.2mm) -- ([xshift=-1.2mm,yshift=1.2mm]frame.south east) -- ++ (-8.6mm,0mm) -- ++ (-1.2mm,-1.2mm) -- (frame.south west) -- ([yshift=-11mm]frame.north west)-- ++ (1.2mm,1.2mm) -- ([xshift=1.2mm,yshift=-1.2mm]frame.north west) -- ++ (8.6mm,0mm) -- ++ (1.2mm,1.2mm) -- (title.west);},
    underlay first={
        \draw[fill=Bviolet, draw=Bviolet]
        (frame.north west) -- ++ (10mm,0mm) -- ++ (-.5mm,-.5mm) -- ++ (-9mm,0mm) -- ++ (0mm, -9mm) -- ++ (-.5mm,-.5mm) -- cycle;
        \draw[#3, thick] (title.east) -- (frame.north east) -- (frame.south east);
        \draw[#3, thick] (frame.south west) -- ([yshift=-11mm]frame.north west)-- ++ (1.2mm,1.2mm) -- ([xshift=1.2mm,yshift=-1.2mm]frame.north west) -- ++ (8.6mm,0mm) -- ++ (1.2mm,1.2mm) -- (title.west);},
    underlay middle={
        \draw[Bviolet, thick] (frame.north east) -- (frame.south east);
        \draw[#3, thick] (frame.north west) -- (frame.south west);},
    underlay last={
        \draw[fill=Bviolet, draw=Bviolet]
        (frame.south east) -- ++ (-10mm,0mm) -- ++ (.5mm,.5mm) -- ++ (9mm,0mm) -- ++ (0mm, 9mm) -- ++ (.5mm,.5mm) -- cycle;
        \draw[#3, thick] (frame.north east) -- ([yshift=11mm]frame.south east)-- ++ (-1.2mm,-1.2mm) -- ([xshift=-1.2mm,yshift=1.2mm]frame.south east) -- ++ (-8.6mm,0mm) -- ++ (-1.2mm,-1.2mm) -- (frame.south west) -- (frame.north west);},
    IfValueTF={#1}{title=#2〈#1〉}{title=\color{white}#2},#4}

\DeclareTColorBox{ascolorbox19}{ o m O{2} O{}}%
{enhanced, colback=qianhong, colframe=white,
    attach boxed title to top left={xshift=5mm,yshift=-\tcboxedtitleheight/2}, fonttitle=\bfseries,varwidth boxed title=0.85\linewidth, coltitle=Bla, fonttitle=\rmfamily, 
    enlarge top by=2mm, enlarge bottom by=2mm, breakable, top=3mm, bottom=3mm,
    boxed title style={colback=white,left=0mm,right=0mm,top=-1mm,bottom=-1mm}, 
    underlay unbroken={\draw[black!40!white,line width=.5pt]
        (title.east|-frame.north east)--([xshift=-#3pt]frame.north east) 
        -- ++ (0,-#3pt);
        \draw[black!40!white,line width=.5pt]
        ([xshift=-#3*4.5pt]frame.north east) -- ++ (0,-#3*3.5pt) -- ++ (#3pt,0);
        \draw[black!40!white,line width=.5pt]
        ([yshift=-#3pt]title.east|-frame.north east)--([yshift=-#3pt,xshift=-#3*6pt]frame.north east);
        \draw[black!40!white,line width=.5pt]
        (title.west|-frame.north west)--([xshift=#3pt]frame.north west) 
        -- ([xshift=#3pt,yshift=#3*6pt]frame.south west);
        \draw[black!40!white,line width=.5pt]
        ([yshift=-#3pt]title.west|-frame.north west)--([yshift=-#3pt]frame.north west) 
        -- ([yshift=#3pt]frame.south west) -- ++ (#3pt,0);
        \draw[black!40!white,line width=.5pt]
        ([yshift=#3*4.5pt]frame.south west) -- ++ (#3*3.5pt,0) -- ++ (0,-#3pt);
        \draw[black,line width=.5pt]
        ([xshift=-#3pt,yshift=-#3pt]frame.north east) -- ++ (#3pt,0) -- ([yshift=#3pt]frame.south east) -- ([xshift=#3*6pt,yshift=#3pt]frame.south west);
        \draw[black,line width=.5pt]
        ([xshift=-#3*3.5pt,yshift=-#3*3.5pt]frame.north east) -- ++ (0,-#3pt) -- ++ (#3*3.5pt,0);
        \draw[black,line width=.5pt]
        ([xshift=-#3pt,yshift=-#3*6pt]frame.north east) -- ([xshift=-#3pt]frame.south east) -- ([xshift=#3pt]frame.south west) -- ++ (0,#3pt);
        \draw[black,line width=.5pt]
        ([xshift=#3*4.5pt]frame.south west) -- ++ (0,#3*3.5pt) -- ++ (-#3pt,0);
        \fill[Bla,line width=.5pt]
        ([xshift=-#3pt,yshift=-#3pt]frame.north east) -- ++ (0,-#3*2.5pt) -- ++ (-#3*2.5pt,0) -- ++ (0,#3*2.5pt) -- cycle;
        \fill[Bla,line width=.5pt]
        ([xshift=#3pt,yshift=#3pt]frame.south west) -- ++ (0,#3*2.5pt) -- ++ (#3*2.5pt,0) -- ++ (0,-#3*2.5pt) -- cycle;
    },
    underlay first={\draw[black!40!white,line width=.5pt]
        (title.east|-frame.north east)--([xshift=-#3pt]frame.north east) 
        -- ++ (0,-#3pt);
        \draw[black!40!white,line width=.5pt]
        ([xshift=-#3*4.5pt]frame.north east) -- ++ (0,-#3*3.5pt) -- ++ (#3pt,0);
        \draw[black!40!white,line width=.5pt]
        ([yshift=-#3pt]title.east|-frame.north east)--([yshift=-#3pt,xshift=-#3*6pt]frame.north east);
        \draw[black!40!white,line width=.5pt]
        (title.west|-frame.north west)--([xshift=#3pt]frame.north west) 
        -- ([xshift=#3pt]frame.south west);
        \draw[black!40!white,line width=.5pt]
        ([yshift=-#3pt]title.west|-frame.north west)--([yshift=-#3pt]frame.north west) 
        -- (frame.south west);
        \draw[black,line width=.5pt]
        ([xshift=-#3pt,yshift=-#3pt]frame.north east) -- ++ (#3pt,0) -- (frame.south east);
        \draw[black,line width=.5pt]
        ([xshift=-#3*3.5pt,yshift=-#3*3.5pt]frame.north east) -- ++ (0,-#3pt) -- ++ (#3*3.5pt,0);
        \draw[black,line width=.5pt]
        ([xshift=-#3pt,yshift=-#3*6pt]frame.north east) -- ([xshift=-#3pt]frame.south east);
        \fill[Ro,line width=.5pt]
        ([xshift=-#3pt,yshift=-#3pt]frame.north east) -- ++ (0,-#3*2.5pt) -- ++ (-#3*2.5pt,0) -- ++ (0,#3*2.5pt) -- cycle;
    },
    underlay middle={\draw[black!40!white,line width=.5pt]
        (frame.north west)--(frame.south west) ;
        \draw[black!40!white,line width=.5pt]
        ([xshift=#3pt]frame.north west)--([xshift=#3pt]frame.south west) ;
        \draw[black,line width=.5pt]
        (frame.north east)--(frame.south east) ;
        \draw[black,line width=.5pt]
        ([xshift=-#3pt]frame.north east)--([xshift=-#3pt]frame.south east) ;
    },
    underlay last={
        \draw[black!40!white,line width=.5pt]
        ([xshift=#3pt]frame.north west) -- ([xshift=#3pt,yshift=#3*6pt]frame.south west);
        \draw[black!40!white,line width=.5pt]
        (frame.north west) -- ([yshift=#3pt]frame.south west) -- ++ (#3pt,0);
        \draw[black!40!white,line width=.5pt]
        ([yshift=#3*4.5pt]frame.south west) -- ++ (#3*3.5pt,0) -- ++ (0,-#3pt);
        \draw[black,line width=.5pt]
        (frame.north east) -- ([yshift=#3pt]frame.south east) -- ([xshift=#3*6pt,yshift=#3pt]frame.south west);
        \draw[black,line width=.5pt]
        ([xshift=-#3pt]frame.north east) -- ([xshift=-#3pt]frame.south east) -- ([xshift=#3pt]frame.south west) -- ++ (0,#3pt);
        \draw[black,line width=.5pt]
        ([xshift=#3*4.5pt]frame.south west) -- ++ (0,#3*3.5pt) -- ++ (-#3pt,0);
        \fill[fill=Ro,line width=.5pt]
        ([xshift=#3pt,yshift=#3pt]frame.south west) -- ++ (0,#3*2.5pt) -- ++ (#3*2.5pt,0) -- ++ (0,-#3*2.5pt) -- cycle;
    },
    IfValueTF={#1}{title=【#2】〈#1〉}{title=【#2】},#4}

% ascbox
% ********************************************************
\definecolor{Jiu}{RGB}{129,0,39}
\definecolor{Kafei}{RGB}{159,36,44}
\definecolor{Juhong}{RGB}{246,76,82}
\definecolor{Lv}{RGB}{23,159,142}
\definecolor{qianlv}{RGB}{199,231,228}
\tcbset{ascbox@ascolorbox/.style={after skip=1.5mm, before skip=2mm,leftright skip=2mm},
    ascboxsizeset@ascolorbox/.style={top=0mm,bottom=0mm,right=-1mm,left=2mm,leftright skip=4mm},
    titleunderline@ascolorbox/.style={underlay pre={\draw[thin,draw=Juhong] ([yshift=.7mm,xshift=3mm]frame.south west) -- ([yshift=.7mm,xshift=20mm]frame.south east);}}}

\tcbset{rectangle@ascboxA/.style={underlay={\fill[Lv] ([xshift=.5mm,yshift=.5mm]frame.#1) -- ++ (-1mm,0mm) -- ++ (0mm,-1mm) -- ++ (1mm,0mm) -- cycle;}},
    rectangle@ascboxA/.default={north east},
    horizontalline@ascboxA/.style={underlay={\draw ([xshift=1mm]frame.#1 west) -- ([xshift=-1mm]frame.#1 east);}},
    horizontalline@ascboxA/.default={north}}

\DeclareTCBox{\ascboxA}{ O{} }%
{enhanced,ascbox@ascolorbox,colframe=white,colback=qianlv,top=-.5mm,bottom=-.5mm,left=1mm,right=1mm,
    rectangle@ascboxA,rectangle@ascboxA={north west},rectangle@ascboxA={south west},rectangle@ascboxA={south east},horizontalline@ascboxA,horizontalline@ascboxA={south},
    #1}

\DeclareTCBox{\ascboxB}{ s O{A} O{} s }%
{empty,ascbox@ascolorbox,ascboxsizeset@ascolorbox,
    before app={%
        \def\shapeA@ascboxB##1{\pathA[thick, Lv!##1!qianlv] ([xshift=-1mm,yshift=-1mm]frame.north west) -- ++ (3mm,0) -- ++ (0,-3mm) -- ++ (-3mm,0) -- cycle;}%
        \def\shapeB@ascboxB##1{\pathB[thick, Lv!##1!Juhong] ([xshift=-2mm]frame.north west) -- ++ (3mm,0) -- ++ (0,-3mm) -- ++ (-3mm,0) -- cycle;}%
        \ifx A#2\def\pathA{\draw}\def\pathB{\draw}%
        \def\firstshape@ascboxB##1{\shapeA@ascboxB{##1}}\def\secondshape@ascboxB##1{\shapeB@ascboxB{##1}}%
        \fi
        \ifx B#2\def\pathA{\fill}\def\pathB{\draw}%
        \def\firstshape@ascboxB##1{\shapeA@ascboxB{##1}}\def\secondshape@ascboxB##1{\shapeB@ascboxB{##1}}%
        \fi
        \ifx C#2\def\pathA{\draw}\def\pathB{\fill}%
        \def\firstshape@ascboxB##1{\shapeB@ascboxB{##1}}\def\secondshape@ascboxB##1{\shapeA@ascboxB{##1}}%
        \fi
        \ifx D#2\def\pathA{\fill}\def\pathB{\fill}%
        \def\firstshape@ascboxB##1{\shapeA@ascboxB{##1}}\def\secondshape@ascboxB##1{\shapeB@ascboxB{##1}}%
        \fi
        \ifx E#2\def\pathA{\fill}\def\pathB{\fill}%
        \def\firstshape@ascboxB##1{\shapeB@ascboxB{##1}}\def\secondshape@ascboxB##1{\shapeA@ascboxB{##1}}%
        \fi
    },
    IfBooleanTF={#4}
    {}{titleunderline@ascolorbox},
    IfBooleanTF={#1}
    {underlay={\firstshape@ascboxB{40}\secondshape@ascboxB{70}}}%
    {underlay={\firstshape@ascboxB{70}\secondshape@ascboxB{40}}},#3}

\DeclareTCBox{\ascboxE}{ s O{A} O{} s }%
{empty,ascbox@ascolorbox,ascboxsizeset@ascolorbox,
before app={%
\def\shapeA@ascboxE##1{\star@ascbox{-.5}{.5}{2mm}\pathA[thick,black!##1!white] (A) -- ($ (AB)!.2!(O) $) -- (B) -- ($ (BC)!.2!(O) $) -- (C) -- ($ (CD)!.2!(O) $) -- (D) -- ($ (DE)!.2!(O) $) -- (E) -- ($ (EA)!.2!(O) $) -- cycle;}%
\def\shapeB@ascboxE##1{\star@ascbox{.5}{-1}{1.5mm}\pathB[thick,black!##1!white] (A) -- ($ (AB)!.2!(O) $) -- (B) -- ($ (BC)!.2!(O) $) -- (C) -- ($ (CD)!.2!(O) $) -- (D) -- ($ (DE)!.2!(O) $) -- (E) -- ($ (EA)!.2!(O) $) -- cycle;}%
\ifx A#2\def\pathA{\draw}\def\pathB{\draw}%
\def\firstshape@ascboxE##1{\shapeA@ascboxE{##1}}\def\secondshape@ascboxE##1{\shapeB@ascboxE{##1}}%
\fi%
\ifx B#2\def\pathA{\filldraw}\def\pathB{\draw}%
\def\firstshape@ascboxE##1{\shapeA@ascboxE{##1}}\def\secondshape@ascboxE##1{\shapeB@ascboxE{##1}}%
\fi%
\ifx C#2\def\pathA{\draw}\def\pathB{\filldraw}%
\def\firstshape@ascboxE##1{\shapeA@ascboxE{##1}}\def\secondshape@ascboxE##1{\shapeB@ascboxE{##1}}%
\fi%
\ifx D#2\def\pathA{\filldraw}\def\pathB{\filldraw}%
\def\firstshape@ascboxE##1{\shapeA@ascboxE{##1}}\def\secondshape@ascboxE##1{\shapeB@ascboxE{##1}}%
\fi%
\ifx E#2\def\pathA{\filldraw}\def\pathB{\filldraw}%
\def\firstshape@ascboxE##1{\shapeB@ascboxE{##1}}\def\secondshape@ascboxE##1{\shapeA@ascboxE{##1}}%
\fi%
},
IfBooleanTF={#4}%
{}{titleunderline@ascolorbox},
IfBooleanTF={#1}%
{underlay={\firstshape@ascboxE{40}\secondshape@ascboxE{70}}}%
{underlay={\firstshape@ascboxE{70}\secondshape@ascboxE{40}}},#3}



\newcommand{\star@ascbox}[3]{\coordinate (O) at ([xshift=#1mm,yshift=#2mm]frame.west);
    \coordinate (A) at ($ (O) + (90:#3) $);
    \coordinate (B) at ($ (O) + (162:#3) $);
    \coordinate (C) at ($ (O) + (234:#3) $);
    \coordinate (D) at ($ (O) + (306:#3) $);
    \coordinate (E) at ($ (O) + (18:#3) $);
    \coordinate (AB) at ($ (A)!.5!(B) $);
    \coordinate (BC) at ($ (B)!.5!(C) $);
    \coordinate (CD) at ($ (C)!.5!(D) $);
    \coordinate (DE) at ($ (D)!.5!(E) $);
    \coordinate (EA) at ($ (E)!.5!(A) $);
}




\DeclareTCBox{\ascboxJ}{ s O{A} O{} s }%
{empty,ascbox@ascolorbox,ascboxsizeset@ascolorbox,
    before app={%
        \def\shapeA@ascboxJ##1{\pathA[black!##1!white] ([xshift=-2mm,yshift=-2.3mm]frame.west) rectangle ++ (1.5mm,1mm);}%
        \def\shapeB@ascboxJ##1{\pathB[black!##1!white] ([xshift=-2mm,yshift=-.7mm]frame.west) rectangle ++ (3mm,1mm);}%
        \def\shapeC@ascboxJ##1{\pathC[black!##1!white] ([xshift=-2mm,yshift=.9mm]frame.west) rectangle ++ (4.5mm,1mm);}%
        \ifx A#2\def\pathA{\draw}\def\pathB{\draw}\def\pathC{\draw}\fi%
        \ifx B#2\def\pathA{\filldraw}\def\pathB{\draw}\def\pathC{\draw}\fi%
        \ifx C#2\def\pathA{\draw}\def\pathB{\filldraw}\def\pathC{\draw}\fi%
        \ifx D#2\def\pathA{\draw}\def\pathB{\draw}\def\pathC{\filldraw}\fi%
        \ifx E#2\def\pathA{\filldraw}\def\pathB{\filldraw}\def\pathC{\draw}\fi%
        \ifx F#2\def\pathA{\filldraw}\def\pathB{\draw}\def\pathC{\filldraw}\fi%
        \ifx G#2\def\pathA{\draw}\def\pathB{\filldraw}\def\pathC{\filldraw}\fi%
        \ifx H#2\def\pathA{\filldraw}\def\pathB{\filldraw}\def\pathC{\filldraw}\fi%
    },
    IfBooleanTF={#4}%
    {}{titleunderline@ascolorbox},
    IfBooleanTF={#1}%
    {underlay={\shapeA@ascboxJ{20}\shapeB@ascboxJ{45}\shapeC@ascboxJ{70}}}%
    {underlay={\shapeA@ascboxJ{70}\shapeB@ascboxJ{45}\shapeC@ascboxJ{20}}},#3}

\definecolor{Green}{RGB}{0, 128, 0}
\newcommand{\cmt}{\noindent\hspace{-0.25em}\textcolor{cyan}{\ding{226}} \hspace{0.2em}}
\newcommand{\sol}{\noindent\hspace{-0.12em}\textcolor{cyan}{\ding{45}} \hspace{0.2em}}
\newcommand{\solc}{\noindent\hspace{-0.12em}\textcolor{cyan}{\ding{45}} \hspace{0.2em}} 

%问题环境定制
\newcounter{question}[section]
\renewcommand{\thequestion}{\arabic{section}.\arabic{question}}
\newcommand{\questions}[1]{%
    \refstepcounter{question}
    \noindent{\textcolor{magenta}{\textsf{\textbf{Question \thequestion }}} \hspace*{1pt} #1 %
}}

%%%%%%%%%%%代码抄录
\definecolor{mlred}{RGB}{253,243,242}
\definecolor{mred}{RGB}{220,53,69}
\definecolor{bg}{rgb}{0.99,0.99,0.99}
\definecolor{mlblue}{RGB}{236,243,255}
\definecolor{mblue}{RGB}{0,123,255}
\definecolor{lsp}{RGB}{0,174,247}
\definecolor{mlblue3}{RGB}{44, 49, 51} % mycmd颜色
\definecolor{mlblue2}{RGB}{35, 41, 55}

%%%%%%%%%%%%%lstlistings%%%%%%%%%%%%%%%%%
\lstdefinestyle{python2}{
    language =   Python, % 语言选Python
    frame=none,
    basicstyle={\small\ttfamily\bfseries\color{white}},
    mathescape,
    emphstyle={\small\ttfamily\bfseries\color{white}},
    numbers=none,
    stepnumber=2,
    numbersep=3em,
    numberstyle= \small\ttfamily\bfseries\tiny,
    keywordstyle    =  \small\ttfamily\bfseries\color{orange},
    stringstyle     =  \small\ttfamily\bfseries\color{white},
    breaklines      =   true,   % 自动换行，
    columns         =   fixed,  %字间距就不固定很丑，必须加
    basewidth       =   .5em,
    commentstyle=\small\ttfamily\bfseries\color{cyan!30},
    backgroundcolor=\color{mlblue3},
    tabsize=4,
    showspaces=false,
    showstringspaces=false,
    morekeywords={Out,In,maketitle,pip,matplotlib,pandas,numpy,np,dtype},
}
\lstdefinestyle{python2}{
    language =   Python, % 语言选Python
    frame=none,
    basicstyle={\small\ttfamily\bfseries\color{white}},
    mathescape,
    emphstyle={\small\ttfamily\bfseries\color{white}},
    numbers=none,
    stepnumber=2,
    numbersep=3em,
    numberstyle= \small\ttfamily\bfseries\tiny,
    keywordstyle    =  \small\ttfamily\bfseries\color{orange},
    stringstyle     =  \small\ttfamily\bfseries\color{white},
    breaklines      =   true,   % 自动换行，
    columns         =   fixed,  %字间距就不固定很丑，必须加
    basewidth       =   .5em,
    commentstyle=\small\ttfamily\bfseries\color{cyan!30},
    backgroundcolor=\color{mlblue3},
    tabsize=4,
    showspaces=false,
    showstringspaces=false,
    morekeywords={Out,In,maketitle,pip,matplotlib,pandas,numpy,np,dtype},
}
\lstdefinestyle{python3}{
    language =   Python, % 语言选Python
    frame=none,
    basicstyle={\small\ttfamily\bfseries\color{white}},
    mathescape,
    emphstyle={\small\ttfamily\bfseries\color{white}},
    numbers=none,
    stepnumber=2,
    numbersep=3em,
    numberstyle= \small\ttfamily\bfseries\tiny,
    keywordstyle    =  \small\ttfamily\bfseries\color{orange},
    stringstyle     =  \small\ttfamily\bfseries\color{white},
    breaklines      =   true,   % 自动换行，
    columns         =   fixed,  %字间距就不固定很丑，必须加
    basewidth       =   .5em,
    commentstyle=\small\ttfamily\bfseries\color{cyan!30},
    backgroundcolor=\color{macosbox@bgdark},
    tabsize=4,
    showspaces=false,
    showstringspaces=false,
    morekeywords={Out,In,maketitle,pip,matplotlib,pandas,numpy,np,dtype},
}
\lstdefinestyle{python4}{
    language =   Python, % 语言选Python
    frame=none,
    mathescape,
    emphstyle={\small\ttfamily\bfseries\color{frenchplum}},
    numbers=none,
    stepnumber=2,
    numbersep=3em,
    numberstyle= \small\ttfamily\bfseries\tiny,
    keywordstyle    =  \small\ttfamily\bfseries\color{orange},
    stringstyle     =  \small\ttfamily\bfseries\color{magenta},
    breaklines      =   true,   % 自动换行，
    columns         =   fixed,  %字间距就不固定很丑，必须加
    basewidth       =   .5em,
    commentstyle=\small\ttfamily\bfseries\color{cyan},
    backgroundcolor=\color{macosbox@bg},
    tabsize=4,
    showspaces=false,
    showstringspaces=false,
    morekeywords={Out,In,maketitle,pip,matplotlib,pandas,numpy,np,dtype},
}
\lstdefinestyle{pythonx}{
language =   Python, % 语言选Python
frame=none,
basicstyle={\small\ttfamily\bfseries\color{white}},
mathescape,
emph={main,Pool,}
emphstyle={\small\ttfamily\bfseries\color{orange}},
numbers=none,
stepnumber=2,
numbersep=3em,
numberstyle= \small\ttfamily\bfseries\tiny,
keywordstyle    =  \small\ttfamily\bfseries\color{cyan},
stringstyle     =  \small\ttfamily\bfseries\color{white},
breaklines      =   true,   % 自动换行，
columns         =   fixed,  %字间距就不固定很丑，必须加
basewidth       =   .5em,
commentstyle=\small\ttfamily\bfseries\color{cyan!30},
backgroundcolor=\color{black},
tabsize=4,
showspaces=false,
showstringspaces=false,
morekeywords={Out,In,maketitle,pip,matplotlib,pandas,numpy,np,dtype},
}
\definecolor{gptc1}{RGB}{52, 53, 64}
\newtcolorbox{gptbox}[1][]{%
    enhanced,
    adjusted title,
    toptitle=1mm,
    bottomtitle=1mm,
    colback=black,
    coltitle=black,
    boxrule=.5mm,
    boxrule=0mm,
    title= \textbf{\ttfamily \color{white} #1 \hspace*{\fill} \textbf{\ttfamily Copy code}}
}

\lstdefinestyle{linux}{
    language = sh , % 语言选Python
    frame=b,
    aboveskip=3mm,
    belowskip=3mm,
    showstringspaces=false,
    columns=flexible,
    framerule=1pt,
    rulecolor=\color{black!35},
    backgroundcolor=\color{gray!5},
    basicstyle={\small\ttfamily},
    numbers=left,
    numberstyle=\tiny\color{black},
    comment=[is]{!/*}
    commentstyle=\color{green!60},
    stringstyle=\color{blue},
    breaklines=true,
    breakatwhitespace=true,
    tabsize=3,
    morekeywords={bind-utils,}
    classoffset=0,
    morekeywords={root@localhost,},keywordstyle=\color{orange},
    classoffset=1,
    morekeywords={yum,bind-utils},keywordstyle=\color{blue},
    classoffset=0,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\tcbset{
    myexample/.style={
        enhanced,
        width=\linewidth,
        colback=white, % 背景颜色 red!5!white
        colframe=gray!20, % 外框的颜色
        fonttitle=\bfseries,
        breakable,
        arc=2pt,
        drop shadow={gray!15,opacity=1},
        titlerule=0pt,
        title style={fill=white},
        coltitle=gray,
        drop shadow,
        highlight math style={reset,colback=white,colframe=black}
    }
}
\newtcolorbox{sBox}{myexample}
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareTColorBox{ascolorbox102}{ o m O{.8} O{} }%
{enhanced, interior hidden, colframe=white,height=0cm,
    attach boxed title to top left={xshift=6mm,yshift*=-1.5mm}, fonttitle=\rmfamily, coltitle=black, 
    , left=1mm, right=1mm,breakable,top=0mm,
    boxed title style={empty,left=-2mm,right=-2mm}, 
    underlay unbroken and last={\draw[lanhei,line width=#3pt]
        (frame.south west) -- (frame.south east);
        \draw[Jiuhong,line width=1pt, dotted]
        ([yshift=3pt]frame.south west) -- ([yshift=3pt]frame.south east);
    },
    IfValueTF={#1}{title=#2〈#1〉}{title=\color{lanhei}#2},#4}

\DeclareTColorBox{ascolorbox101}{ o m O{.8} O{} }%
{enhanced, interior hidden, colframe=white,leftright skip=1mm,
    attach boxed title to top left={xshift=6mm,yshift*=-1.5mm}, fonttitle=\rmfamily, coltitle=black,height=0cm,
    , left=1mm, right=1mm,breakable,top=0mm,
    boxed title style={empty,left=-2mm,right=-2mm}, 
    underlay unbroken and first={\draw[Jiuhong,line width=1pt, dotted]
        ([xshift=3pt,yshift=-3pt]title.east) -- ([yshift=-3pt]title.east-|frame.east);
        \draw[lanhei,line width=#3pt]
        (title.east) -- (title.east-|frame.east);
        \draw[black!40!white,line width=1pt, dotted]
        ([xshift=-3pt,yshift=-3pt]title.west) -- ([yshift=-3pt]title.west-|frame.west);
        \draw[black,line width=#3pt]
        (title.west) -- (title.west-|frame.west);
    },
    IfValueTF={#1}{title=【#2】〈#1〉}{title=\color{lanhei}【#2】},#4}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\hdrule}[1]{\begin{ascolorbox101}{#1}\end{ascolorbox101}}
\newcommand{\btrule}[1]{\begin{ascolorbox102}{#1}\end{ascolorbox102}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtcolorbox{mycmd2}[1]{colback=black,
    colupper=white,
    colback=mlblue3,
    frame style={opacity=0.25},
    colframe=mlblue3,
    center title,
    left = 2pt,
    width=\linewidth,
    listing only,
    drop shadow,
    right = 2pt,
    top = 1mm,
    boxsep =1pt,
    arc=2pt,
    fonttitle=\small\ttfamily\bfseries,
    title ={\faCode \hspace*{\fill} #1 \hspace*{\fill}\faRemove\\文件(F)\quad 动作(A)\quad 编辑(E)\quad 查看(V)\quad 帮助(H)\hspace*{\fill}},
    listing options={style=tcblatex,language=sh},}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{macosbox@top}{RGB}{237,237,237}
\definecolor{macosbox@bot}{RGB}{189,189,189}
\definecolor{macosbox@bord}{RGB}{182,176,176}
\definecolor{macosbox@bg}{RGB}{240,240,240}
\definecolor{macosbox@bgdark}{RGB}{55,56,58}
\definecolor{macosbox@borddark}{RGB}{13,13,15}
\definecolor{macosbox@topdark}{RGB}{96,96,98}
\definecolor{macosbox@botdark}{RGB}{44,45,47}


\newtcolorbox{macbox}[2][]{%
    enhanced,
    coltitle=black,
    colback=macosbox@bg,
    boxrule=0mm,
    frame style={draw=macosbox@bord,fill=macosbox@bord},
    title style={top color=macosbox@top,bottom color=macosbox@bot},
    drop fuzzy shadow=black,
    title={{\textcolor[RGB]{236, 96, 92}{\faCircle}
            \textcolor[RGB]{247, 188, 44}{\faCircle}
            \textcolor[RGB]{88, 204, 65}{\faCircle}
            \hspace*{\fill}\hspace*{-10mm}\texttt{#2}\hspace*{\fill}}},#1
}
\newtcolorbox{macboxd}[2][]{%
    enhanced,
    colupper=white,
    coltitle=white,
    colback=macosbox@bgdark,
    boxrule=0mm,
    frame style={draw=macosbox@borddark,fill=macosbox@borddark},
    title style={top color=macosbox@topdark,bottom color=macosbox@botdark},
    drop fuzzy shadow=black,
    title={{\textcolor[RGB]{236, 96, 92}{\faCircle}
            \textcolor[RGB]{247, 188, 44}{\faCircle}
            \textcolor[RGB]{88, 204, 65}{\faCircle}\hspace*{\fill}\hspace*{-10mm}\texttt{#2}\hspace*{\fill}}},
    #1
}

\ifdefstring{\VIVID@cod}{minted}{
  \RequirePackage{minted}
%minted系列
\usepackage{mdframed}
\BeforeBeginEnvironment{minted}{\begin{mdframed}[backgroundcolor=gray!5,hidealllines=true,innerrightmargin=0pt,linecolor=gray!70,skipabove=2pt,everyline=true,leftmargin=3mm,innerbottommargin=0pt]}
    \AfterEndEnvironment{minted}{\end{mdframed}}
\setminted[vim]{breaklines,
    breakanywhere,
    escapeinside=||,
    highlightcolor=orange!10,
    linenos=true,
    framesep=3pt,
    frame=bottomline,
    framerule=2pt,
    rulecolor=\color{black!35},
    style=colorful,
    breaklines=true,
}

\setminted[python]{breaklines,
    breakanywhere,
    escapeinside=||,
    highlightcolor=green!30,
    linenos=true,
    framesep=3pt,
    frame=bottomline,
    framerule=2pt,
    rulecolor=\color{black!35},
    style=emacs,
    breaklines=true,
}

\setminted[java]{breaklines,
    breakanywhere,
    escapeinside=||,
    highlightcolor=green!30,
    linenos=true,
    framesep=3pt,
    frame=bottomline,
    framerule=2pt,
    rulecolor=\color{black!35},
    style=emacs,
    breaklines=true,
}


\setminted[javascript]{breaklines,
    breakanywhere,
    escapeinside=||,
    highlightcolor=green!30,
    linenos=true,
    framesep=3pt,
    frame=bottomline,
    framerule=2pt,
    rulecolor=\color{black!35},
    style=emacs,
    breaklines=true,
}
\setminted[html]{breaklines,
    breakanywhere,
    escapeinside=||,
    highlightcolor=green!30,
    linenos=true,
    framesep=3pt,
    frame=bottomline,
    framerule=2pt,
    rulecolor=\color{black!35},
    style=emacs,
    breaklines=true,
}
\setminted[nginx]{breaklines,
    breakanywhere,
    escapeinside=||,
    highlightcolor=green!30,
    linenos=true,
    framesep=3pt,
    frame=bottomline,
    framerule=2pt,
    rulecolor=\color{black!35},
    style=emacs,
    breaklines=true,
}

\setminted[shell]{breaklines,
    linenos=true,
    bgcolor=blue!10,
    breakautoindent=false,
    breaksymbolleft=\raisebox{0.8ex}{
        \small\reflectbox{\carriagereturn}},
    breaksymbolindentleft=0pt,
    frame=bottomline,
    framesep=1pt,
    framerule=1pt,
    rulecolor=\color{black!35},
    breaksymbolsepleft=0pt,
    breaksymbolright=\small\carriagereturn,
    breaksymbolindentright=0pt,
}
}{\relax}




\definecolor{mred}{RGB}{220,53,69}
\newtcolorbox{warning}[1][]{%
	enhanced jigsaw,
	breakable,
	borderline west={1.5pt}{0pt}{mred},
	sharp corners,
	boxrule=0pt,
	fonttitle={\small\bfseries},
	coltitle={black},
	title={{\color{mred} \faExclamationTriangle} Warning:\ },
	colbacktitle=mlred,
	colback=bg,
	left=2mm,
	right=2mm,
	#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtcolorbox{wwproposition4}[2][]{
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
    fontupper=\normalsize, 
    overlay unbroken = {
        %左上边缘细线%更改有效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %标题%更改有效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=structurecolor,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white}  ~#2}; %这里可以补计数器
        %底部 (下边缘)颜色装饰矩形%更改有效
        \fill[fill=structurecolor]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    },%上面是实际控制代码,下面的代码仅在跨页分割时生效
    overlay first = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        %标题 %跨页时生效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=DeepPink,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white}  #2};
    },%保持边缘的变化
    overlay last = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %底部%跨页时生效
        \fill[fill=structurecolor]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    }
    #1
}
\NewDocumentEnvironment{anymark1}{O{} O{} O{}}{\smallskip\begin{wwproposition4}{#1}{#2}#3}{\end{wwproposition4} }

%%%%%%%%%%%%%%%%%%%%% 原神盒子 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\definecolor{framegolden}{HTML}{455a64} % 控制外框颜色
\definecolor{framegray}{HTML}{e0e0e0} % 控制填充颜色
\newdimen\ys@frame@linewidth
\newdimen\ys@frame@radius
\newdimen\ys@frame@sep
\def\ys@frame@fill@opacity{0.2}

\pgfdeclarehorizontalshading{ys@fade@circle}{500bp}
{color(0bp)=(pgftransparent!100); color(25bp)=(pgftransparent!100);
color(45bp)=(pgftransparent!0); color(55bp)=(pgftransparent!0);
color(75bp)=(pgftransparent!100); color(100bp)=(pgftransparent!100)}
\pgfdeclarefading{ys circle}{\pgfuseshading{ys@fade@circle}}

\def\ys@frame@star@list@t{%
  -0.7071\ys@frame@radius+0.2133\ys@frame@sep/%
    -0.7071\ys@frame@radius+0.2133\ys@frame@sep/%
    frame.north east,%
  0.7071\ys@frame@radius-0.2133\ys@frame@sep/%
    -0.7071\ys@frame@radius+0.2133\ys@frame@sep/%
    frame.north west}
\def\ys@frame@star@list@b{%
  0.7071\ys@frame@radius-0.2133\ys@frame@sep/%
    0.7071\ys@frame@radius-0.2133\ys@frame@sep/%
    frame.south west,%
  -0.7071\ys@frame@radius+0.2133\ys@frame@sep/%
    0.7071\ys@frame@radius-0.2133\ys@frame@sep/%
    frame.south east}
\edef\ys@frame@star@list{\ys@frame@star@list@t,\ys@frame@star@list@b}

%region outer
\def\ys@frame@remove@middleline#1#2{}
\def\ys@frame@draw@middleline#1#2{%
  \clip ([xshift=-\ys@frame@linewidth,#1]frame.north west)--
        ([xshift=\ys@frame@linewidth,#1]frame.north east)--
        ([xshift=\ys@frame@linewidth,#2]frame.south east)--
        ([xshift=-\ys@frame@linewidth,#2]frame.south west)--cycle;}
\def\ys@frame@unbrokenouter{%
  \path[draw=framegolden,fill=framegray,fill opacity=\ys@frame@fill@opacity,line width=\ys@frame@linewidth]
    ([xshift=\ys@frame@radius]frame.north west)--([xshift=-\ys@frame@radius]frame.north east) 
    arc(-180:-90:\ys@frame@radius)--
    ([yshift=-\ys@frame@radius]frame.north east)--([yshift=\ys@frame@radius]frame.south east)
    arc(90:180:\ys@frame@radius)--
    ([xshift=-\ys@frame@radius]frame.south east)--([xshift=\ys@frame@radius]frame.south west)
    arc(0:90:\ys@frame@radius)--
    ([yshift=\ys@frame@radius]frame.south west)--([yshift=-\ys@frame@radius]frame.north west)
    arc(-90:0:\ys@frame@radius)--cycle;}
\def\ys@frame@firstouter{%
  \ys@frame@remove@middleline{yshift=.5\ys@frame@linewidth}{yshift=.7\ys@frame@linewidth}%
  \path[draw=framegolden,fill=framegray,fill opacity=\ys@frame@fill@opacity,line width=\ys@frame@linewidth]
    ([xshift=\ys@frame@radius]frame.north west)--([xshift=-\ys@frame@radius]frame.north east) 
    arc(-180:-90:\ys@frame@radius)--
    ([yshift=-\ys@frame@radius]frame.north east)--
    (frame.south east)--
    (frame.south west)--
    ([yshift=-\ys@frame@radius]frame.north west)
    arc(-90:0:\ys@frame@radius)--cycle;}
\def\ys@frame@middleouter{%
  \ys@frame@remove@middleline{yshift=-.7\ys@frame@linewidth}{yshift=.7\ys@frame@linewidth}%
  \path[draw=framegolden,fill=framegray,fill opacity=\ys@frame@fill@opacity,line width=\ys@frame@linewidth]
    (frame.north west)--(frame.north east)--(frame.south east)--
    (frame.south west)--cycle;}
\def\ys@frame@lastouter{%
  \ys@frame@remove@middleline{yshift=-.7\ys@frame@linewidth}{yshift=-.5\ys@frame@linewidth}%
  \path[draw=framegolden,fill=framegray,fill opacity=\ys@frame@fill@opacity,line width=\ys@frame@linewidth]
    (frame.north west)--(frame.north east)--
    ([yshift=\ys@frame@radius]frame.south east)
    arc(90:180:\ys@frame@radius)--
    ([xshift=-\ys@frame@radius]frame.south east)--([xshift=\ys@frame@radius]frame.south west)
    arc(0:90:\ys@frame@radius)--
    ([yshift=\ys@frame@radius]frame.south west)--
    (frame.north west)--cycle;}
%endregion 
%region inner
\def\ys@frame@unbrokeninner{%
\path[draw=framegolden,line width=.5\ys@frame@linewidth,line cap=round] 
([xshift=\ys@frame@radius+2\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)
  --([xshift=\ys@frame@radius+5\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west) --++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
  ([xshift=\ys@frame@radius+6\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth) %第一节
  --([xshift=-\ys@frame@radius-8.828\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth)
  ([xshift=-\ys@frame@radius-7.828\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第二节
  --([xshift=-\ys@frame@radius-2\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)
  %%
([yshift=-\ys@frame@radius-2\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east)
--([yshift=-\ys@frame@radius-5\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east) --++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
([yshift=-\ys@frame@radius-6\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth) %第一节
--([yshift=\ys@frame@radius+8.828\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth)
([yshift=\ys@frame@radius+7.828\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第二节
%
  --([yshift=\ys@frame@radius+2\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)
%
([xshift=\ys@frame@radius+2\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)
--([xshift=\ys@frame@radius+5\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west) --++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth)
([xshift=\ys@frame@radius+6\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第一节
--([xshift=-\ys@frame@radius-8.828\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
([xshift=-\ys@frame@radius-7.828\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth) %第二节
  --([xshift=-\ys@frame@radius-2\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)
%
([yshift=-\ys@frame@radius-2\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west)
--([yshift=-\ys@frame@radius-5\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west) --++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth)
([yshift=-\ys@frame@radius-6\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第一节
--([yshift=\ys@frame@radius+8.828\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
([yshift=\ys@frame@radius+7.828\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth) %第二节
  --([yshift=\ys@frame@radius+2\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west);}
\def\ys@frame@firstinner{%
  \path[draw=framegolden,line width=.5\ys@frame@linewidth,line cap=round] 
  ([xshift=\ys@frame@radius+2\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)
  --([xshift=\ys@frame@radius+5\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west) --++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
  ([xshift=\ys@frame@radius+6\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth) %第一节
  --([xshift=-\ys@frame@radius-8.828\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth)
  ([xshift=-\ys@frame@radius-7.828\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第二节
  --([xshift=-\ys@frame@radius-2\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)
  %%
([yshift=-\ys@frame@radius-2\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east)
--([yshift=-\ys@frame@radius-5\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east) --++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
([yshift=-\ys@frame@radius-6\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.north east)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth) %第一节
--([xshift=-\ys@frame@sep]frame.south east)

        ([yshift=-\ys@frame@radius-2\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west)
        --([yshift=-\ys@frame@radius-5\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west) --++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth)
        ([yshift=-\ys@frame@radius-6\ys@frame@linewidth,xshift=\ys@frame@sep]frame.north west)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第一节
          --([xshift=\ys@frame@sep]frame.south west);}
\def\ys@frame@middleinner{%
  \path[draw=framegolden,line width=.5\ys@frame@linewidth,line cap=round] 
    ([xshift=-\ys@frame@sep]frame.north east)--([xshift=-\ys@frame@sep]frame.south east)
    ([xshift=\ys@frame@sep]frame.north west)--([xshift=\ys@frame@sep]frame.south west);}
\def\ys@frame@lastinner{%
  \path[draw=framegolden,line width=.5\ys@frame@linewidth,line cap=round] 
    ([xshift=-\ys@frame@sep]frame.north east)
    --([yshift=\ys@frame@radius+8.828\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth)
    ([yshift=\ys@frame@radius+7.828\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第二节
    %
      --([yshift=\ys@frame@radius+2\ys@frame@linewidth,xshift=-\ys@frame@sep]frame.south east)
%
    ([xshift=\ys@frame@radius+2\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)
    --([xshift=\ys@frame@radius+5\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west) --++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth)
    ([xshift=\ys@frame@radius+6\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth) %第一节
    --([xshift=-\ys@frame@radius-8.828\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)--++(45:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
    ([xshift=-\ys@frame@radius-7.828\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)--++(-45:2\ys@frame@linewidth)--++(45:2\ys@frame@linewidth) %第二节
      --([xshift=-\ys@frame@radius-2\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)
%
    ([xshift=\ys@frame@sep]frame.north west)
    --([yshift=\ys@frame@radius+8.828\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west)--++(-135:2\ys@frame@linewidth)--++(-45:2\ys@frame@linewidth)
    ([yshift=\ys@frame@radius+7.828\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west)--++(-45:2\ys@frame@linewidth)--++(-135:2\ys@frame@linewidth) %第二节
      --([yshift=\ys@frame@radius+2\ys@frame@linewidth,xshift=\ys@frame@sep]frame.south west);}
%endregion
%region corner
\def\ys@frame@unbrokencorner{%
  \path[draw=framegolden,line width=1.5\ys@frame@linewidth,line cap=round]
    ([xshift=\ys@frame@radius-2.7\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)
      --([xshift=\ys@frame@sep,yshift=-\ys@frame@sep]frame.north west)
      --([xshift=\ys@frame@sep,yshift=-\ys@frame@radius+2.7\ys@frame@linewidth]frame.north west)
    ([xshift=-\ys@frame@radius+2.7\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)
      --([xshift=-\ys@frame@sep,yshift=-\ys@frame@sep]frame.north east)
      --([xshift=-\ys@frame@sep,yshift=-\ys@frame@radius+2.7\ys@frame@linewidth]frame.north east)
    ([xshift=-\ys@frame@radius+2.7\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)
      --([xshift=-\ys@frame@sep,yshift=\ys@frame@sep]frame.south east)
      --([xshift=-\ys@frame@sep,yshift=\ys@frame@radius-2.7\ys@frame@linewidth]frame.south east)
    ([xshift=\ys@frame@radius-2.7\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)
      --([xshift=\ys@frame@sep,yshift=\ys@frame@sep]frame.south west)
      --([xshift=\ys@frame@sep,yshift=\ys@frame@radius-2.7\ys@frame@linewidth]frame.south west);}
\def\ys@frame@firstcorner{%
  \path[draw=framegolden,line width=1.5\ys@frame@linewidth,line cap=round]
    ([xshift=\ys@frame@radius-2.7\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north west)
      --([xshift=\ys@frame@sep,yshift=-\ys@frame@sep]frame.north west)
      --([xshift=\ys@frame@sep,yshift=-\ys@frame@radius+2.7\ys@frame@linewidth]frame.north west)
    ([xshift=-\ys@frame@radius+2.7\ys@frame@linewidth,yshift=-\ys@frame@sep]frame.north east)
      --([xshift=-\ys@frame@sep,yshift=-\ys@frame@sep]frame.north east)
      --([xshift=-\ys@frame@sep,yshift=-\ys@frame@radius+2.7\ys@frame@linewidth]frame.north east);}
\def\ys@frame@middlecorner{}
\def\ys@frame@lastcorner{%
  \path[draw=framegolden,line width=1.5\ys@frame@linewidth,line cap=round]
    ([xshift=-\ys@frame@radius+2.7\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south east)
      --([xshift=-\ys@frame@sep,yshift=\ys@frame@sep]frame.south east)
      --([xshift=-\ys@frame@sep,yshift=\ys@frame@radius-2.7\ys@frame@linewidth]frame.south east)
    ([xshift=\ys@frame@radius-2.7\ys@frame@linewidth,yshift=\ys@frame@sep]frame.south west)
      --([xshift=\ys@frame@sep,yshift=\ys@frame@sep]frame.south west)
      --([xshift=\ys@frame@sep,yshift=\ys@frame@radius-2.7\ys@frame@linewidth]frame.south west);}
%endregion
\def\ys@frame@star#1#2#3{%
  \begin{scope}[shift={([xshift=#1,yshift=#2]#3)},scale=\ys@frame@ratio*0.1]
    \path[draw=framegolden,fill=white,
      line width=.7\ys@frame@linewidth,line join=round]
      (1,1)..controls(0.3,0.5) and (-0.3,0.5)..
      (-1,1)..controls(-0.5,0.3) and (-0.5,-0.3)..
      (-1,-1)..controls(-0.3,-0.5) and (0.3,-0.5)..
      (1,-1)..controls(0.5,-0.3) and (0.5,0.3)..(1,1)--cycle;
    \path[scale=0.45,fill=framegolden,line join=round]
      (1,1)..controls(0.3,0.7) and (-0.3,0.7)..
      (-1,1)..controls(-0.7,0.3) and (-0.7,-0.3)..
      (-1,-1)..controls(-0.3,-0.7) and (0.3,-0.7)..
      (1,-1)..controls(0.7,-0.3) and (0.7,0.3)..(1,1)--cycle;
  \end{scope}}
\def\ys@frame@segmentation{%
  \draw[color=framegolden,path fading=ys circle]
    ([xshift=5\ys@frame@radius]segmentation.west) to[ornament=88]
    ([xshift=-5\ys@frame@radius]segmentation.east);}

\tcbset{
  % 控制是否在断点处的线不画出来
  ys/frame/not at break/.code=\let\ys@frame@remove@middleline\ys@frame@draw@middleline,
  ys/frame/fill opacity/.store in=\ys@frame@fill@opacity,
  ys/frame/draw at break/.code=\let\ys@frame@remove@middleline\@gobbletwo,
  % 控制线宽
  ys/frame/line width/.code={\pgfmathsetlength\ys@frame@linewidth{#1}},
  ys/frame/line width=1.4pt,
  % 控制圆弧大小，应为数字，而非长度
  ys/frame/radius/.code={\pgfmathparse{#1}\let\ys@frame@ratio\pgfmathresult
    \pgfmathsetlength\ys@frame@radius{(#1)*1em}%
    \pgfmathsetlength\ys@frame@sep{(#1)*0.5ex}},
  ys/frame/radius=2,
  ys/frame/unbroken/.style={
    interior code={%
      \ys@frame@unbrokenouter % 外框
      \foreach \ii/\jj/\kk in \ys@frame@star@list {\ys@frame@star{\ii}{\jj}{\kk}} % 星
      \ys@frame@unbrokeninner % 内线
      \ys@frame@unbrokencorner % 四角
    },
    interior titled code={%
      \ys@frame@unbrokenouter % 外框
      \foreach \ii/\jj/\kk in \ys@frame@star@list {\ys@frame@star{\ii}{\jj}{\kk}} % 星
      \ys@frame@unbrokeninner % 内线
      \ys@frame@unbrokencorner % 四角
    }
  },
  ys/frame/first/.style={
    interior code={%
      \ys@frame@firstouter
      \foreach \ii/\jj/\kk in \ys@frame@star@list@t {\ys@frame@star{\ii}{\jj}{\kk}}
      \ys@frame@firstinner
      \ys@frame@firstcorner},
    interior titled code={%
      \ys@frame@firstouter
      \foreach \ii/\jj/\kk in \ys@frame@star@list@t {\ys@frame@star{\ii}{\jj}{\kk}}
      \ys@frame@firstinner
      \ys@frame@firstcorner},
  },
  ys/frame/middle/.style={
    interior code={%
      \ys@frame@middleouter
      \ys@frame@middleinner
      \ys@frame@middlecorner}
  },
  ys/frame/last/.style={
    interior code={%
      \ys@frame@lastouter
      \foreach \ii/\jj/\kk in \ys@frame@star@list@b {\ys@frame@star{\ii}{\jj}{\kk}}
      \ys@frame@lastinner
      \ys@frame@lastcorner}
  },
  ys/frame style/unbroken/.style={
    boxsep=2\ys@frame@sep,
    left={.8\ys@frame@radius},right={.8\ys@frame@radius},
    ys/frame/unbroken,title hidden,
    segmentation code=\ys@frame@segmentation
  },
  ys/frame style/first/.style={ys/frame/first,title hidden,segmentation code=\ys@frame@segmentation},
  ys/frame style/middle/.style={ys/frame/middle,segmentation code=\ys@frame@segmentation},
  ys/frame style/last/.style={ys/frame/last,segmentation code=\ys@frame@segmentation},
  ys style/.style={frame hidden, 
    ys/frame style/unbroken,
    extras first={ys/frame style/first},
    extras middle={ys/frame style/middle},
    extras last={ys/frame style/last},
  },
}
\makeatother
\newtcolorbox{ysbox}{enhanced,ys style,breakable,pad at break=2mm,
  ys/frame/not at break,ys/frame/fill opacity=0}
%% End The Most Beautiful Box

