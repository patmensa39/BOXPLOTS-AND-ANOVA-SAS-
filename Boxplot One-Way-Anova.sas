/*Boxplot for Sale Price and Central_Air*/
proc sgplot data=stat1.ameshousing3;
	vbox SalePrice / category=Central_Air
					connect=mean;
	title "Sale Price Difference accross Central Air";
run;

/*Scatter plots between Sale Price and Ground Living Area*/
proc sgscatter data=stat1.ameshousing3;
	plot SalePrice*Gr_Liv_Area / reg;
	title "Association of Above Ground Living Area with Sale Price";
run;


/*Scatter plot for all the continious variables*/
%let continuous= Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area
                  Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;
               
options nolabel;
proc sgscatter data=stat1.ameshousing3;
	plot SalePrice*(&continuous) / reg;
	title "Association of continous variables and Sale Price ";
run;



/*One-way-Anova for Heating QC and Sale Price*/

ods graphics;
proc glm data=stat1.ameshousing3 plots=diagnostics;
	 class Heating_QC;
	 model SalePrice=Heating_QC;
	 means Heating_QC / hovtest=levene;
	 format Heating_QC $Heating_QC.;
	 title "One-Way Anova with Heating Quatity as Predictor";
run;
quit;
title;




































