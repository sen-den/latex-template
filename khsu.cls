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
\RequirePackage[a4paper, top=2cm, bottom=2cm, left=2.5cm, right=1cm]{geometry}
% Починить отступ в первой строке абзаца
\RequirePackage{indentfirst}
% Настройка колонтитулов, в т.ч. - номера страницы
\RequirePackage{fancyhdr}
% Управление заголовками
\RequirePackage[raggedright]{titlesec}
% Управление содержанием
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
% Абзацный отступ
\setlength{\parindent}{5ex}
\setlength{\parskip}{0pt}
% Глубина нумерации
\setcounter{secnumdepth}{3}
% Глубина содержания
\setcounter{tocdepth}{2}
% Интервал - полуторный
\linespread{1.3}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\titleformat{command}[shape]
%	{format}
%	{label}
%	{sep}
%	{before-code}
%	[after-code]
%\titleformat{\chapter} % указуємо, що модифікуємо саме розділ
%			{\centering\normalsize\MakeUppercase} % указуємо формат назви ("усі великі")
%			{\thechapter} % указуємо формат власне номера: це буде просто число, без крапки
%			{0em} % відстань між номером і назвою
%			{РОЗДІЛ \thechapter} % текст, що передує назві
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	РОЗДІЛ
\titleformat{\chapter}[display] % раздел
	{\filcenter}	% центровать
    {\MakeUppercase{\chaptertitlename} \thechapter}	% РОЗДІЛ Х 
    {0pt} % отступ после
	{\MakeUppercase}	% название капсом
	{}
\assignpagestyle{\chapter}{fancy}
\titlespacing{\chapter} % указуємо, що модифікуємо саме розділ
	{0ex} % відступ зліва
	{-30pt} % відступ зверху 
	{8pt} % відступ знизу
\titlecontents{chapter}
	[0ex] %
	{}
	{\MakeUppercase{\thecontentslabel\quad}}%\chaptername\
	{}
	{\dotfill\contentspage}    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	ПІДРОЗДІЛ
\titleformat{\section}[block]
    {\normalsize}
    {\thesection\quad}
    {1em}
    {}
\titlespacing{\section} % указуємо, що модифікуємо саме підрозділ
	{\parindent} % відступ зліва
	{0pt} % відступ зверху 
	{12pt} % відступ знизу 
\titlecontents{section}
	[5ex] %
	{}
	{\thecontentslabel\quad}
	{}
	{\dotfill\contentspage}    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	ПУНКТ
\titleformat{\subsection}[block]
    {\normalsize}
    {\thesubsection\quad}
    {1em}
    {}
\titlespacing{\subsection} % указуємо, що модифікуємо саме пункт
	{\parindent} % відступ зліва
	{12pt} % відступ зверху 
	{12pt} % відступ знизу 
\titlecontents{subsection}
	[10ex] %
	{}
	{\thecontentslabel {}\quad}
	{}
	{\dotfill\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	ПІДПУНКТ
\titleformat{\subsubsection}[block]
    {\normalsize}
    {\thesubsubsection\quad}
    {1em}
    {}
\titlespacing{\subsubsection} % указуємо, що модифікуємо саме пункт
	{\parindent} % відступ зліва
	{0pt} % відступ зверху 
	{0pt} % відступ знизу 
\titlecontents{subsubsection}
	[15ex] %
	{}
	{\thecontentslabel {}\quad}
	{}
	{\dotfill\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% СТРУКТУРНА ЧАСТИНА % Вступ, Висновки і т.п.
\newcommand{\likechapterheading}[1]{ 
	\newpage
	\begin{center}
	\MakeUppercase{#1}	% Заголовок, капсом и по центру
	\end{center}
	\mbox{}\newline}
        
	\makeatletter
		\renewcommand{\@dotsep}{2}
		\newcommand{\l@likechapter}[2]{{\@dottedtocline{0}{0pt}{0pt}{#1}{#2}}}
	\makeatother
    
	\newcommand{\likechapter}[1]{
		\likechapterheading{#1} % собственно название
		\addcontentsline{toc}{likechapter}{{#1}}	% и содержание
	}
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
	
	\begin{center}
		\par\noindent\MakeUppercase{\cmdCW@TitlePage@MinistryName}
		\par\noindent\MakeUppercase{\cmdCW@TitlePage@UniversityName}
		\par\noindent\MakeUppercase{\cmdCW@TitlePage@FacultyName}
		\par\noindent\MakeUppercase{\cmdCW@TitlePage@DepartmentName}
		\vfill		
		\par\noindent\MakeUppercase{\cmdCW@TitlePage@ResearchTitle}
	\end{center}
	
	\vfill	
	
	\begin{flushleft}
	\hyphenpenalty=10000 % не использовать переносы на титульной странице
	\pretolerance=10000
	\setlength{\leftskip}{8cm}
	\par\noindent
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
	\par\noindent\cmdCW@TitlePage@StudentName
	
	\par\noindent Науковий керівник: \cmdCW@TitlePage@SupervisorDegree
	\par\noindent \cmdCW@TitlePage@SupervisorName
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