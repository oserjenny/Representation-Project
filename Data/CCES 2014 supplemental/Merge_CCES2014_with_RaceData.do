** Open CCES 2014 Common Content
use "CCEs14_Common_OUTPUT_Feb2015.dta", clear

** Merge the Race and Ethncity of congressional candidates 
** using the state and congressional district identifiers, inputstate and cdid respectively.
merge m:m inputstate cdid using "Cuevas_2014-House-Candidates-by-Race.dta"

** This merge should attach 9 new Race and Ethnicity variables to the Common Content

** The only not matched respondents should be from the District of Columbia
tab inputstate if _merge ==1
