** Open CCES 2010 Common Content 
use "CCES_2010_common_validated.dta", clear

** Merge the Race and Ethncity of congressional candidates 
** using the state and congressional district identifiers, V206 and V276 respectively.
merge m:m V206 V276 using "Cuevas_2010-House-Candidates-by-Race.dta"
 
** This merge should attach 6 new Race and Ethnicity variables to the Common Content

** The only not matched respondents should be from the District of Columbia
tab V206 if _merge ==1
