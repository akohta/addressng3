\ProvidesClass{addressng3}
% sample of name and address printings for 'nagagata-3' (envelope of japanese standard)
% please use this as a reference to set the position of text.
% 			akihiro ohta 2021/07/25
 
\LoadClass[]{jarticle}

\usepackage{plext}
\usepackage{xstring}
\usepackage{bxpapersize}
\usepackage{type1cm}

\pagestyle{empty}

%define constant
\newcounter{chv} 
\newcounter{cvv}
\newlength{\lhv}
\newlength{\lvv}

%set const value
\setcounter{chv}{120}
\setcounter{cvv}{235}
\setlength{\lhv}{120truemm}
\setlength{\lvv}{235truemm}

%set paper size
\papersizesetup{size={\lhv,\lvv}}

%set page size
\setlength{\pdfpagewidth}{\lhv}
\setlength{\pdfpageheight}{\lvv}

%set default layout
\setlength{\unitlength}{1truemm}
\setlength{\parindent}{0pt}
\setlength{\topmargin}{-1truein}
\setlength{\evensidemargin}{-1truein}
\setlength{\oddsidemargin}{-1truein}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\footskip}{0pt}
\setlength{\textwidth}{\lhv}
\setlength{\textheight}{\lvv}

%condition variable and default setting
\newif\ifpaperperimeter     % for paper size check
\paperperimeterfalse        % \paperperimetertrue : enable, \paperperimeterfalse : disable.
\newif\ifpostcode           % for postcode position check
\postcodefalse              % \postcodetrue : enable, \postcodefalse : disable.
\newif\ifaddressa           % for address A position check 
\addressafalse              % \addressatrue : enable, \addressafalse : disable.
\newif\ifaddressb           % for address B position check
\addressbfalse              % \addressbtrue : enable, \addressbfalse : disable.
\newif\ifname               % for name position check
\namefalse                  % \nametrue : enable, \namefalse : disable.
\newif\ifspostcode          % for sender's postcode position check
\spostcodefalse             % \spostcodetrue : enable, \spostcodefalse : disable. 
\newif\ifsaddressa          % for sender's address A position check
\saddressafalse             % \saddressatrue : enable, \saddressafalse : disable.
\newif\ifsaddressb          % for sender's address B position check
\saddressbfalse             % \saddressbtrue : enable, \saddressbfalse : disable.
\newif\ifsname              % for sender's name position check
\snamefalse                 % \snametrue : enable, \snamefalse : disable.


% address data
\newcommand{\addreceiveraddress}[6]{
	% -- arguments --
	% #1 receiver's family name
	% #2 receiver's given name
	% #3 receiver's name suffix
	% #4 receiver's postcode
	% #5 receiver's address A
	% #6 receiver's address B
	% -- end arguments --
	\clearpage
	\begin{picture}(\value{chv},\value{cvv})(0,0)
		% -- for paper size check --
		\ifpaperperimeter
			\put(0,0){\line(1,0){\value{chv}}}
			\put(\value{chv},0){\line(0,1){\value{cvv}}}
			\put(0,\value{cvv}){\line(1,0){\value{chv}}}
			\put(0,0){\line(0,1){\value{cvv}}}
		\fi
		% -- end paper size check --

		% -- for postcode position check --
		\ifpostcode
			\put( 65.0,223.0){\line(1,0){47.7}}
			\put( 65.0,215.0){\line(1,0){47.7}}
			\put( 65.0,215.0){\line(0,1){ 8.0}}
			\put(112.7,215.0){\line(0,1){ 8.0}}
			\put( 70.7,215.0){\line(0,1){ 8.0}}
			\put(107.0,215.0){\line(0,1){ 8.0}}
		\fi
		% -- end postcode position check --
		% postcode 
		\put(64.0,223){ % 1.0mm shift for half size number centering
			\vtop to 8.0truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox{5.7truemm}{\hfil\StrChar{#4}{1}\hfil}\hskip1.3truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{2}\hfil}\hskip1.3truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{3}\hfil}\hskip1.9truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{4}\hfil}\hskip1.1truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{5}\hfil}\hskip1.1truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{6}\hfil}\hskip1.1truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{7}\hfil}
			\vfil}
		}

		% -- for address A position check --
		\ifaddressa
			\put(100,195){\line(1,0){8}} % upper line
			\put(100, 30){\line(1,0){8}} % lower line
			\put(100, 30){\line(0,1){165}} % leftside line
			\put(108, 30){\line(0,1){165}} % rightside line
		\fi
		% -- end address A position check --
		% address A
		\put(100,195){
			\vtop to 165truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox<t>{165truemm}{#5}
			\vfil}
		}

		% -- for address B position check --
		\ifaddressb
			\put( 91,195){\line(1,0){8}} % upper line
			\put( 91, 30){\line(1,0){8}} % lower line 
			\put( 91, 30){\line(0,1){165}} % leftside line
			\put( 99, 30){\line(0,1){165}} % rightside line
		\fi
		% -- end address B position check --
		% address B
		\put( 91,195){
			\vtop to 165truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox<t>{165truemm}{\hfill#6\hfil}
			\vfil}
		}

		% -- name position check --
		\ifname
			\put(55,195){\line(1,0){10}} % upper line
			\put(55, 30){\line(1,0){10}} % lower line
			\put(55, 30){\line(0,1){165}} % leftside line
			\put(65, 30){\line(0,1){165}} % rightside line
		\fi
		% -- end name position check --
		% name
		\put(55,195){
			\vtop to 165truemm{\fontsize{8mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{165truemm}{\hskip2zw#1\hskip1zw#2\hskip1zw#3\hfill}
			\vfil}
		}
	\end{picture}
}

\newcommand{\addsenderaddress}[5]{
	% -- arguments --
	% #1 sender's family name
	% #2 sender's given name
	% #3 sender's postcode 
	% #4 sender's address A
	% #5 sender's address B
	% -- end arguments --
	\clearpage
	\begin{picture}(\value{chv},\value{cvv})(0,0)
		% -- for paper size check --
		\ifpaperperimeter
			\put(0,0){\line(1,0){\value{chv}}}
			\put(\value{chv},0){\line(0,1){\value{cvv}}}
			\put(0,\value{cvv}){\line(1,0){\value{chv}}}
			\put(0,0){\line(0,1){\value{cvv}}}
		\fi
		% -- end paper size check --

		% -- for sender's postcode position check --
		\ifspostcode
			\put( 11,115.0){\line(1,0){41.0}}
			\put( 11,108.5){\line(1,0){41.0}}
			\put( 11,108.5){\line(0,1){6.5}}
			\put( 52,108.5){\line(0,1){6.5}}
		\fi
		% -- end check --
		% sender's postcoe 
		\put(11,115){
			\vtop to 6.5truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				〒 \
				\parbox{3truemm}{\hfil\StrChar{#3}{1}\hfil}
				\parbox{3truemm}{\hfil\StrChar{#3}{2}\hfil}
				\parbox{3truemm}{\hfil\StrChar{#3}{3}\hfil}
				-
				\parbox{3truemm}{\hfil\StrChar{#3}{4}\hfil}
				\parbox{3truemm}{\hfil\StrChar{#3}{5}\hfil}
				\parbox{3truemm}{\hfil\StrChar{#3}{6}\hfil}
				\parbox{3truemm}{\hfil\StrChar{#3}{7}\hfil}
			\vfil}
		}

		% -- for sender's address A position check --
		\ifsaddressa
			\put(40,100){\line(1,0){ 6}} % upper line
			\put(40, 20){\line(1,0){ 6}} % lower line
			\put(40, 20){\line(0,1){80}} % leftside line
			\put(46, 20){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% sender's address A
		\put(40,100){
			\vtop to 80truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox<t>{80truemm}{#4}
			\vfil}
		}

		% -- for sender's address B position check --
		\ifsaddressb
			\put(33,100){\line(1,0){ 6}} % upper line
			\put(33, 20){\line(1,0){ 6}} % lower line
			\put(33, 20){\line(0,1){80}} % leftside line
			\put(39, 20){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% sender's address B
		\put(33,100){
			\vtop to 80truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox<t>{80truemm}{\hfill#5\hfil}
			\vfil}
		}

		% -- for sender's name position check --
		\ifsname
			\put(20,100){\line(1,0){ 8}} % upper line
			\put(20, 20){\line(1,0){ 8}} % lower line
			\put(20, 20){\line(0,1){80}} % leftside line
			\put(28, 20){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% sender's name
		\put(20,100){
			\vtop to 80truemm{\fontsize{6mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{80truemm}{\hfill#1\hskip1zw#2\hfil}
			\vfil}
		}
	\end{picture}
}
