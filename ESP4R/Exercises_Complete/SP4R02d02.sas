/*SP4R02d02*/

/*Import data using a DATA step*/
data sp4r.all_names;
   length First_Name $ 25 Last_Name $ 25;
   infile "/home/u63563404/SP4R/allnames.csv" dlm=',';
   input First_Name $ Last_Name $ age height;
run;

/***************************************************************************************************/
/*Import data using PROC IMPORT*/
proc import out=sp4r.baseball 
   datafile= "/home/u63563404/SP4R/baseball.csv" DBMS=CSV REPLACE;
   getnames=yes;
   datarow=2; 
run;

/*Rename the variables*/
data sp4r.baseball;
   set sp4r.baseball;
   rename nAtBat = At_Bats
	     nHits = Hits
	     nHome = Home_Runs
	     nRuns = Runs
	     nRBI = RBIs
	     nError = Errors;
run;

/***************************************************************************************************/
/*Creating a SAS data set from delimited data by hand*/
data sp4r.example_data3;
   length First_name $ 25;
   infile datalines dlm='*';
   input First_Name $ Last_Name $ age height;
   datalines;
   Jordan*Bakerman*27*68
   Bruce*Wayne*35*70
   Walter*White*51*70
   Henry*Hill*65*66
   Jean Claude*Van Damme*55*69
;run;

*exercise;
data sp4r.shelter3;
	infile datalines dlm='#';
	input Name $ Age Weight Colour $ Cats $;
	datalines;
	Pluto#3#25#Black#No 
	Lizzie#10#43#Tan#Yes 
	Pesci#10#38#Brindle#No
	;
run;


data sp4r.state_pop_in;
	length State $ 25 Pop 8;
	infile "/home/u63563404/SP4R/state_pop.txt" dlm = "	";
	input State $ Pop;
run;

proc import out = sp4r.state_pop_in2 
	datafile = "/home/u63563404/SP4R/state_pop.xlsx" 
	dbms = xlsx REPLACE; 
	getnames = NO; 
	sheet = "State_Pop_Data"; 
	datarow = 1;
run;

data sp4r.state_pop_in2; 
	set sp4r.state_pop_in2; 
	rename A = State 
		   B = Pop
		; 
run;

