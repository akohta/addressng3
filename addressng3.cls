\ProvidesClass{addressng3}
% sample of name and address printings for 'nagagata-3' (envelope of japanese standard)
% please use this as a reference to set the position of text.
% 			akihiro ohta 2021/07/25
 
\LoadClass[]{jarticle}

\usepackage{plext}
\usepackage{xstring}
\usepackage{bxpapersize}
\usepackage{type1cm}
\usepackage{xcolor}

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
\newif\ifaddress            % for address position check 
\addressfalse               % \addresstrue : enable, \addressfalse : disable.
\newif\ifnotes              % for notes position check 
\notesfalse                 % \notestrue : enable, \notesfalse : disable.
\newif\ifname               % for name position check
\namefalse                  % \nametrue : enable, \namefalse : disable.
\newif\ifspostcode          % for sender's postcode position check
\spostcodefalse             % \spostcodetrue : enable, \spostcodefalse : disable. 
\newif\ifsaddress           % for sender's address position check
\saddressfalse             % \saddresstrue : enable, \saddressfalse : disable.
\newif\ifsname              % for sender's name position check
\snamefalse                 % \snametrue : enable, \snamefalse : disable.


% address data
\newcommand{\addreceiveraddress}[6]{
	% -- arguments --
	% #1 receiver's name A
	% #2 receiver's name B
	% #3 receiver's notes
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
			\put( 63.0,223.0){\line(1,0){47.7}}
			\put( 63.0,215.0){\line(1,0){47.7}}
			\put( 63.0,215.0){\line(0,1){ 8.0}}
			\put(110.7,215.0){\line(0,1){ 8.0}}
			\put( 68.7,215.0){\line(0,1){ 8.0}}
			\put(105.0,215.0){\line(0,1){ 8.0}}
		\fi
		% -- end postcode position check --
		% postcode 
		\put(62.0,223){ % 1.0mm shift for half size number centering
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
		\ifaddress
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
		\ifaddress
			\put( 92,195){\line(1,0){8}} % upper line
			\put( 92, 30){\line(1,0){8}} % lower line 
			\put( 92, 30){\line(0,1){165}} % leftside line
			\put(100, 30){\line(0,1){165}} % rightside line
		\fi
		% -- end address B position check --
		% address B
		\put( 92,195){
			\vtop to 165truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox<t>{165truemm}{\hfill#6}
			\vfil}
		}

		% -- name A position check --
		\ifname
			\put(60,195){\line(1,0){10}} % upper line
			\put(60, 30){\line(1,0){10}} % lower line
			\put(60, 30){\line(0,1){165}} % leftside line
			\put(70, 30){\line(0,1){165}} % rightside line
		\fi
		% -- end name A position check --
		% name A
		\put(60,195){
			\vtop to 165truemm{\fontsize{7mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{165truemm}{\hskip2zw#1}
			\vfil}
		}

		% -- name B position check --
		\ifname
			\put(50,195){\line(1,0){10}} % upper line
			\put(50, 30){\line(1,0){10}} % lower line
			\put(50, 30){\line(0,1){165}} % leftside line
			\put(60, 30){\line(0,1){165}} % rightside line
		\fi
		% -- end name B position check --
		% name B
		\put(50,195){
			\vtop to 165truemm{\fontsize{7mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{165truemm}{\hskip2zw#2}
			\vfil}
		}

		% -- notes position check --
		\ifnotes
			\put(15,195){\line(1,0){10}} % upper line
			\put(15, 30){\line(1,0){10}} % lower line
			\put(15, 30){\line(0,1){165}} % leftside line
			\put(25, 30){\line(0,1){165}} % rightside line
		\fi
		% -- end notes position check --
		% notes
		\put(15,195){
			\vtop to 165truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox<t>{165truemm}{\hfill\textcolor{red}{#3}}
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
			\put( 11,105.0){\line(1,0){35.0}}
			\put( 11, 98.5){\line(1,0){35.0}}
			\put( 11, 98.5){\line(0,1){6.5}}
			\put( 46, 98.5){\line(0,1){6.5}}
		\fi
		% -- end check --
		% sender's postcoe 
		\put(11,105){
			\vtop to 6.5truemm{\fontsize{4mm}{0pt}\selectfont\vfil
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
		\ifsaddress
			\put(37, 95){\line(1,0){ 6}} % upper line
			\put(37, 15){\line(1,0){ 6}} % lower line
			\put(37, 15){\line(0,1){80}} % leftside line
			\put(43, 15){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% sender's address A
		\put(37,95){
			\vtop to 80truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox<t>{80truemm}{#4}
			\vfil}
		}

		% -- for sender's address B position check --
		\ifsaddress
			\put(31, 95){\line(1,0){ 6}} % upper line
			\put(31, 15){\line(1,0){ 6}} % lower line
			\put(31, 15){\line(0,1){80}} % leftside line
			\put(37, 15){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% sender's address B
		\put(31,95){
			\vtop to 80truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox<t>{80truemm}{\hfill#5}
			\vfil}
		}

		% -- for sender's name position check --
		\ifsname
			\put(18, 95){\line(1,0){ 7}} % upper line
			\put(18, 15){\line(1,0){ 7}} % lower line
			\put(18, 15){\line(0,1){80}} % leftside line
			\put(25, 15){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% sender's name
		\put(18, 95){
			\vtop to 80truemm{\fontsize{5mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{80truemm}{\hfil#1\hskip1zw#2\hskip1zw}
			\vfil}
		}
	\end{picture}
}
