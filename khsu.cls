% Этот класс предоставляет оформление научних работ по правилам
% ДСТУ 3008-95 "ДОКУМЕНТАЦІЯ. ЗВІТИ У СФЕРІ НАУКИ І ТЕХНІКИ" и
% Херсонского государственного университета.
%
% Название класса и его версия. Требуемый формат.
\ProvidesClass{khsu}[2017/02/19]
\NeedsTeXFormat{LaTeX2e}
%
% Базовый класс
\LoadClass[14pt,oneside]{extreport}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ТРЕБУЕМЫЕ ПАКЕТЫ
% Правильная кодировка готовых pdf. Подключать до других пакетов кодировки!
\RequirePackage{cmap}
% Поддержка кирилических шрифтов.
\RequirePackage[T1,T2A]{fontenc}
% Кодировать все в Юникод.
\RequirePackage[utf8]{inputenc}
% Языковые пакеты. Последний - основной.
\RequirePackage[english,russian,ukrainian]{babel}
% Комманды с параметрами
\RequirePackage{xkeyval}
% Условный оператор
\RequirePackage{ifthen}
%
%
%
% Размерности листа
\RequirePackage[a4paper, top=2cm, bottom=2cm, left=3cm, right=1cm]{geometry}
% Починить отступ в первой строке абзаца
\RequirePackage{indentfirst}
% Настройка колонтитулов, в т.ч. - номера страницы
\RequirePackage{fancyhdr}
% Управление заголовками
\RequirePackage[raggedright]{titlesec}
\RequirePackage{titletoc}
%
%
%
\RequirePackage{lipsum}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancyhf{} % очистка текущих значений
\fancyhead[R]{\thepage} % установка верхнего колонтитула
\renewcommand{\headrulewidth}{0pt} % убрать разделительную линию
\pagestyle{fancy}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Титульная страница
\makeatletter

\define@cmdkey[CW]{TitlePage}{MinistryName}[Міністерство освіти і науки України]{}
\define@cmdkey[CW]{TitlePage}{UniversityName}[Херсонський державний університет]{}
\define@cmdkey[CW]{TitlePage}{FacultyName}[Факультет фізики, математики та інформатики]{}
\define@cmdkey[CW]{TitlePage}{DepartmentName}[Назва кафедри]{}
\define@cmdkey[CW]{TitlePage}{CityOfResearch}[Місто]{}
\define@cmdkey[CW]{TitlePage}{YearOfResearch}[рік]{}
%%
\define@cmdkey[CW]{TitlePage}{ResearchTitle}[\LaTeX{} \,--\, шаблон студентських наукових робіт]{}
\define@cmdkey[CW]{TitlePage}{StudentName}[ПІБ]{}
\define@cmdkey[CW]{TitlePage}{StudentSex}[male]{}
\define@cmdkey[CW]{TitlePage}{StudentGroup}[група]{}
\define@cmdkey[CW]{TitlePage}{StudentCourse}[курс]{}
\define@cmdkey[CW]{TitlePage}{StudentSpeciality}[Спеціальність]{}
%%
\define@cmdkey[CW]{TitlePage}{SupervisorDegree}[професор]{}
\define@cmdkey[CW]{TitlePage}{SupervisorName}[ПІБ]{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\MakeTitlePage}[1]{
	\setkeys[CW]{TitlePage}{#1}
	\thispagestyle{empty}
	\setlength{\parindent}{0cm}
	
	\begin{center}
		\par\MakeUppercase{\cmdCW@TitlePage@MinistryName}
		\par\MakeUppercase{\cmdCW@TitlePage@UniversityName}
		\par\MakeUppercase{\cmdCW@TitlePage@FacultyName}
		\par\MakeUppercase{\cmdCW@TitlePage@DepartmentName}
		\vfill		
		\par\MakeUppercase{\cmdCW@TitlePage@ResearchTitle}
	\end{center}
	
	\vfill	
	
	\begin{flushleft}
	\hyphenpenalty=10000 % не использовать переносы на титульной странице
	\pretolerance=10000
	\setlength{\leftskip}{8cm}
	\par
	\ifthenelse
		{\equal{\cmdCW@TitlePage@StudentSex}{male}}
		{Виконав: студент }
		{
			\ifthenelse
			{\equal{\cmdCW@TitlePage@StudentSex}{female}}
			{Виконала: студентка }
			{\textit{Check StudentSex value! }}
		}
	\cmdCW@TitlePage@StudentCourse\ курсу \cmdCW@TitlePage@StudentGroup\ групи спеціальності \cmdCW@TitlePage@StudentSpeciality
	\par\cmdCW@TitlePage@StudentName
	
	\par Науковий керівник: \cmdCW@TitlePage@SupervisorDegree
	\par \cmdCW@TitlePage@SupervisorName
	\end{flushleft}
	
	\vfill
	
	\begin{center}
	\cmdCW@TitlePage@CityOfResearch\ \,--\, \cmdCW@TitlePage@YearOfResearch	
	\end{center}
	\pagebreak
}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\titlecontents{chapter}
%    [0.5em]
%    {\vspace{1em}}
%    {\hspace{-1em}\contentslabel{0.7em}\hspace{1em}}
%    {\hspace*{-1.5em}}
%    {\titlerule*[1pc]{}\contentspage}
%    []
%% тепер займемося змістом
%\titlecontents{section}
%    [0.5em]
%    {\vspace{1em}}
%    {\hspace{-1em}\contentslabel{0.7em}\hspace{1em}}
%    {\hspace*{-1.5em}}
%    {\titlerule*[1pc]{}\contentspage}
%    []
%\titlecontents{subsection}
%    [0.5em]
%    {\vspace{1em}}
%    {\hspace{-1em}.\contentslabel{0.7em}\hspace{1em}}
%    {\hspace*{-1.5em}}
%    {\titlerule*[1pc]{}\contentspage}
%    []

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% будемо змінювати стилі заголовків
%\titleformat{command}
%	[shape]
%	{format}
%	{label}
%	{sep}
%	{before-code}
%	[after-code]
% спочатку --- для розділу
%\titleformat{\chapter} % указуємо, що модифікуємо саме розділ
%			{\centering\normalsize\MakeUppercase} % указуємо формат назви ("усі великі")
%			{\thechapter} % указуємо формат власне номера: це буде просто число, без крапки
%			{0em} % відстань між номером і назвою
%			{РОЗДІЛ \thechapter} % текст, що передує назві
\titleformat{\chapter}[display] % раздел
	{\filcenter}	% центровать
    {\MakeUppercase{\chaptertitlename} \thechapter}	% РОЗДІЛ Х 
    {8pt} %??
	{\MakeUppercase}	% название капсом
    {}
\titlespacing{\chapter} % указуємо, що модифікуємо саме розділ
	{0pt} % відступ зліва
	{-28pt} % відступ зверху 
	{48pt} % відступ знизу
\titlecontents{chapter}
	[0em] %
	{}
	{\bfseries\MakeUppercase{ \thecontentslabel {}\quad}\bfseries}%\chaptername\
	{}
	{\dotfill\contentspage}    
    
    
\titleformat{\section}[block]
    {\normalsize\bfseries}
    {\thesection {.}\quad}
    {1em}
    {}
\titlespacing{\section} % указуємо, що модифікуємо саме підрозділ
	{0pt} % відступ зліва
	{24pt} % відступ зверху 
	{24pt} % відступ знизу 
\titlecontents{section}
	[2em] %
	{}
	{\thecontentslabel {}\quad}
	{}
	{\dotfill\contentspage}    
    
    
\titleformat{\subsection}[block]
    {\normalsize\bfseries\itshape}
    {\thesubsection {.}\quad}
    {1em}
    {}
\titlespacing{\subsection} % указуємо, що модифікуємо саме пункт
	{0pt} % відступ зліва
	{12pt} % відступ зверху
	{12pt} % відступ знизу 
\titlecontents{subsection}
	[5em] %
	{}
	{\thecontentslabel {}\quad}
	{}
	{\dotfill\contentspage}   
	

\newcommand{\likechapterheading}[1]{ 
	\newpage
	\begin{center}
	\textbf{\MakeUppercase{#1}}
	\end{center}
	\mbox{}\newline}
        
	\makeatletter
		\renewcommand{\@dotsep}{2}
		\newcommand{\l@likechapter}[2]{{\@dottedtocline{0}{0pt}{0pt}{\bfseries #1}{#2}}}
	\makeatother
    
	\newcommand{\likechapter}[1]{    
		\likechapterheading{#1}    
		\addcontentsline{toc}{likechapter}{\MakeUppercase{#1}}}