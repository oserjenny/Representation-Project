** Open CCES 2012 Common Content 
use "CCES12_Common_VV.dta", clear

** Merge the Race and Ethncity of congressional candidates 
** using the state and congressional district identifiers, inputstate and cdid113 respectively.
merge m:m inputstate cdid113 using "Cuevas_2012-House-Candidates-by-Race.dta"

** This merge should attach 9 new Race and Ethnicity variables to the Common Content

** The only not matched respondents should be from the District of Columbia
tab inputstate if _merge ==1
