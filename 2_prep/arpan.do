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
label define yesno 1 "Yes" 2 "No" 3 "Not Sure" 4 "Prefer not to say"

label define agree_disagree 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly Disagree" 6 "Prefer not to say" 7 "Donot Know"
label define stability 1 "Much more stable" 2 "Somewhat more stable" 3 "About the same" 4 "Somewhat less stable" 5 "Much less stable" 6 "Prefer not to say" 7 "Don't know"
label define rank_stability 1 "Very Stable" 2 "Stable" 3 "Neutral" 4 "Unstable" 5 "Very Unstable" 6 "Prefer not to say" 7 "Dont know"
label define frequency 1 "Daily" 2 "Several times a week" 3 "Weekly" 4 "Occasionally" 5 "Never"
label define notvote_reasons 1 "Did not register" 2 "Away from registerd voting location" 3 "Health/Family issue" 4 "Not interested in voting process" 5 "Didnot trust political parties/candidates" 6 "Intentionally boycotted the election" 7 "My vote would not make no difference"  8 "Prefer not to say" 9 "Others Please specify"
label define degree 1 "Very Likely" 2 "Somewhat Likely" 3 "Somewhat Unlikely" 4 "Very Unlikely" 5 "Donot Know" 6 "Prefer Not to say"
label define confidence 1 "Very Confident" 2 "Confident" 3 "Neutral" 4 "Not Confident" 5 "Not at all confident"
label define engagement 1 "Engaged Directly" 2 "Very Closely" 3 "Somewhat Closely" 4 "Heard But followed Vary Little" 5 "Not at All" 6 "Prefer Not to say"
label define how_closely 1 "Very Closely" 2 "Somewhat Closely" 3 "Not Very Closely" 4 "Not at all" 5 "Prefer not to say"
label define optimism 1 "Very Optimistic" 2 "Somewhat Optimistic" 3 "Neutral" 4 "Somewhat Pessimistic" 5 "Very Pessimistic" 6 "Don't Know'"


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