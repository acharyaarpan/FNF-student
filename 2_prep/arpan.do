clear
set more off 

import excel "$data_raw\raw-data-student.xlsx", sheet("Youth and Aspirations Percep...") firstrow

*Deleted columns
drop consent_intro 	// empty and of no use
drop prelim			// empty and of no use
drop sec1			// empty and of no use
drop sec1_primer	// empty and of no use
drop gender_other	// empty and of no use
drop ethnicity		// redundent



rename _1_4_What_is_your_caste_ethnicit ethnicity

format interview_date %tdCCYY-NN-DD	
generate double interview_time_num = clock(substr(interview_time, 1, 12), "hms")
format interview_time_num %tcHH:MM:SS


*Cleaning local levels name
do "$prep/local_clean.do"

*Cleaning ward names
replace ward = "24" if ward == "२४"
replace ward = "3" 	if ward == "३"
replace ward = "31" if ward == "३१"
replace ward = "32" if ward == "३२"
replace ward = "5" 	if ward == "५"
replace ward = "6" 	if ward == "६"
replace ward = "7" 	if ward == "७"
replace ward = "9" 	if ward == "९"
destring ward, replace

*encoding and ensuring their position
foreach var of varlist Interviewer_Name Province lg_name lg_type{
	encode `var', generate(`var'_temp)
	order `var'_temp, before (`var')
	drop `var'
	rename `var'_temp `var'
}


*Label definitions
label define yesno 1 "yes" 2 "no"
label define gender 1 "Male" 2 "Female"
label define education_lb 1 "Bachelors 1st year" 2 "Bachelors 2nd year" 3 "Bachelors 3rd year" 4 "Bachelors 4th year" 5 "Bachelors 5th year" 6 "Masters 1st year" 7 "Masters 2nd year" 8 "PHD"
label define pub_private 1 "Private" 2 "Public" 3 "Prefer not to say"



*Label variables 
label var screener "Eligible: age 18-35 and student at sampled institution"
label variable Interviewer_Name "Name of interviewer"



*value label assignment
label values screener yesno
label values gender gender
label values education education_lb
label values edu_school pub_private
label values edu_plus2 pub_private
label value edu_bachelors pub_private
label value edu_masters pub_private