clear
set more off 

import excel "$data_raw\raw-data-student.xlsx", sheet("Youth and Aspirations Percep...") firstrow

drop consent_intro // because its empty

*Label definitions
label define yesno 1 "yes" 2 "no"



*Label variables 
label var screener "Eligible: age 18-35 and student at sampled institution"



*value label assignment
label var screener yesno