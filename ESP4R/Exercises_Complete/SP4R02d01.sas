/*SP4R02d01*/

/*Part A*/
data sp4r.example_data;
   length First_Name $ 25 Last_Name $ 25;
   input First_Name $ Last_Name $ age height;
   datalines;
   Jordan Bakerman 27 68
   Bruce Wayne 35 70
   Walter White 51 70
   Henry Hill 65 66
   JeanClaude VanDamme 55 69
;
run;

/*Part B*/
data sp4r.example_data2;
   length First_Name $ 25 Last_Name $ 25;
   input First_Name $ Last_Name $ age height @@;
   datalines;
   Jordan Bakerman 27 68 Bruce Wayne 35 70 Walter White 51 70
   Henry Hill 65 66 JeanClaude VanDamme 55 69
   ;
run;

*exercise;
data sp4r.Shelter;
	length Colour $ 10;
	input Name $ Age  Weight  Colour $ Cats $; 
	datalines;
	Pluto 3 25 Black No
	Lizzie 10 43 Tan Yes
	Pesci 10 38 Brindle No
	;
run;

data sp4r.Shelter2;
	length Colour $ 10;
	input Name $ Age  Weight  Colour $ Cats $ @@; 
	datalines;
	Pluto 3 25 Black No Lizzie 10 43 Tan Yes Pesci 10 38 Brindle No
	;
run;