clear
set more off

import excel "$data_raw/raw-data-student.xlsx", sheet("Youth and Aspirations Percep...") firstrow

* Deleted columns
capture drop consent_intro      						// empty and of no use
capture drop prelim             						// empty and of no use
capture drop sec1               						// empty and of no use
capture drop sec1_primer        						// empty and of no use
capture drop gender_other       						// empty and of no use
capture drop ethnicity          						// redundant export field
capture drop religion           						// redundant empty export field
capture drop local_government local_government_clean 	// Cleaned to a different variable

rename _1_4_What_is_your_caste_ethnicit ethnicity
rename _1_6_Which_religion_do_you_ident religion

format interview_date %tdCCYY-NN-DD
generate double interview_time_num = clock(substr(interview_time, 1, 12), "hms")
format interview_time_num %tcHH:MM:SS

* Clean local government name while preserving the full cleaned text.
clonevar local_government_raw = local_government
gen strL local_government_clean = ustrlower(ustrtrim(local_government_raw))
replace local_government_clean = ustrregexra(local_government_clean, "\s+", " ")
replace local_government_clean = ustrregexra(local_government_clean, "\.+$", "")
replace local_government_clean = ustrtrim(local_government_clean)

gen str30 lg_name = ""
gen str30 lg_type = ""
gen byte lg_review = 0
gen str80 lg_review_note = ""

replace lg_name = "Banepa"            if ustrregexm(local_government_clean, "^banepa($| )")
replace lg_name = "Biratnagar"        if ustrregexm(local_government_clean, "^biratnagar($| )")
replace lg_name = "Birendranagar"     if ustrregexm(local_government_clean, "^birendranagar($| )")
replace lg_name = "Butwal"            if ustrregexm(local_government_clean, "^(butwal|butawal)($| )")
replace lg_name = "Chandragiri"       if ustrregexm(local_government_clean, "^chandragir(i|u)($| )")
replace lg_name = "Dhangadhi"         if ustrregexm(local_government_clean, "^dhang")
replace lg_name = "Janakpurdham"      if ustrregexm(local_government_clean, "^janakpur")
replace lg_name = "Kathmandu"         if ustrregexm(local_government_clean, "^kathmandu") | local_government_clean == "काठमाडौं महानगरपालिका"
replace lg_name = "Kirtipur"          if ustrregexm(local_government_clean, "^kirtipur($| )")
replace lg_name = "Lalitpur"          if ustrregexm(local_government_clean, "^lalitpur($| )")
replace lg_name = "Mahalaxmi"         if ustrregexm(local_government_clean, "^mahalaxmi($| )")
replace lg_name = "Pokhara"           if ustrregexm(local_government_clean, "^pokhar")
replace lg_name = "Siddharthanagar"   if ustrregexm(local_government_clean, "^sid+hart|^siddhart|^siddharth|^siddhartha")
replace lg_name = "Tarakeshwar"       if ustrregexm(local_government_clean, "^tarke|^tarake") | local_government_clean == "तारकेश्वर नगरपालिका"
replace lg_name = "Tokha"             if ustrregexm(local_government_clean, "^tokh")

replace lg_name = "Chandragiri"       if local_government_clean == "chandraguri municipality"
replace lg_name = "Birendranagar"     if local_government_clean == "birendra"
replace lg_name = "Pokhara"           if local_government_clean == "pokh"
replace lg_name = "Siddharthanagar"   if local_government_clean == "sidartha na pa"

replace lg_type = "Metropolitan City" if ustrregexm(local_government_clean, "mahanagar|mahangar|metropolitan") ///
    & !ustrregexm(local_government_clean, "sub metropolitan|sub metro|submetro")

replace lg_type = "Sub-Metropolitan City" if ustrregexm(local_government_clean, "sub metropolitan|sub metro|submetro|sub metropoliticity|metro politicity|up na pa|up no pa")

replace lg_type = "Municipality" if ustrregexm(local_government_clean, "municipality|nagarpalika|nagar palika|nagarpa|na pa") ///
    & lg_type == ""

replace lg_type = "Municipality" if inlist(lg_name, "Banepa", "Chandragiri", "Kirtipur", "Mahalaxmi", "Siddharthanagar", "Tarakeshwar", "Tokha") ///
    & lg_type == ""

replace lg_type = "Sub-Metropolitan City" if inlist(lg_name, "Butwal", "Dhangadhi", "Janakpurdham", "Pokhara") ///
    & lg_type == ""

replace lg_type = "Metropolitan City" if inlist(lg_name, "Biratnagar", "Kathmandu", "Lalitpur") ///
    & lg_type == ""

replace lg_type = "Municipality" if lg_name == "Birendranagar" & lg_type == ""

replace lg_review = 1 if lg_name == "" & !missing(local_government_clean)
replace lg_review_note = "Could not standardize local government name" if lg_review == 1

replace lg_review = 1 if local_government_clean == "28"
replace lg_review_note = "Needs manual confirmation" if local_government_clean == "28"

order local_government_clean lg_name lg_type lg_review lg_review_note, after(local_government)
drop local_government_raw

* Clean ward names
capture confirm string variable ward
if !_rc {
    replace ward = "24" if ward == "२४"
    replace ward = "3"  if ward == "३"
    replace ward = "31" if ward == "३१"
    replace ward = "32" if ward == "३२"
    replace ward = "5"  if ward == "५"
    replace ward = "6"  if ward == "६"
    replace ward = "7"  if ward == "७"
    replace ward = "9"  if ward == "۹" | ward == "९"
    destring ward, replace
}

* Encode string categorical variables and keep them in their original positions.
foreach var of varlist Interviewer_Name Province lg_name lg_type {
    capture confirm string variable `var'
    if !_rc {
        encode `var', generate(`var'_temp)
        order `var'_temp, before(`var')
        drop `var'
        rename `var'_temp `var'
    }
}

* Label definitions
label define yesno 1 "Yes" 2 "No" 3 "Not Sure" 4 "Prefer not to say"
label define gender 1 "Male" 2 "Female"
label define education_lb 1 "Bachelors 1st year" 2 "Bachelors 2nd year" 3 "Bachelors 3rd year" 4 "Bachelors 4th year" 5 "Bachelors 5th year" 6 "Masters 1st year" 7 "Masters 2nd year" 8 "PHD"
label define pub_private 1 "Private" 2 "Public" 3 "Prefer not to say"
label define agree_disagree 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly Disagree" 6 "Prefer not to say" 7 "Donot Know"
label define stability 1 "Much more stable" 2 "Somewhat more stable" 3 "About the same" 4 "Somewhat less stable" 5 "Much less stable" 6 "Prefer not to say" 7 "Don't know"
label define rank_stability 1 "Very Stable" 2 "Stable" 3 "Neutral" 4 "Unstable" 5 "Very Unstable" 6 "Prefer not to say" 7 "Dont know"
label define frequency 1 "Daily" 2 "Several times a week" 3 "Weekly" 4 "Occasionally" 5 "Never"
label define notvote_reasons 1 "Did not register" 2 "Away from registerd voting location" 3 "Health/Family issue" 4 "Not interested in voting process" 5 "Didnot trust political parties/candidates" 6 "Intentionally boycotted the election" 7 "My vote would not make no difference" 8 "Prefer not to say" 9 "Others Please specify"
label define degree 1 "Very Likely" 2 "Somewhat Likely" 3 "Somewhat Unlikely" 4 "Very Unlikely" 5 "Donot Know" 6 "Prefer Not to say"
label define confidence 1 "Very Confident" 2 "Confident" 3 "Neutral" 4 "Not Confident" 5 "Not at all confident"
label define engagement 1 "Engaged Directly" 2 "Very Closely" 3 "Somewhat Closely" 4 "Heard But followed Vary Little" 5 "Not at All" 6 "Prefer Not to say"
label define how_closely 1 "Very Closely" 2 "Somewhat Closely" 3 "Not Very Closely" 4 "Not at all" 5 "Prefer not to say"
label define optimism 1 "Very Optimistic" 2 "Somewhat Optimistic" 3 "Neutral" 4 "Somewhat Pessimistic" 5 "Very Pessimistic" 6 "Don't Know"
label define ethnicity_lbl 1 "Bhramin/Chettri" 2 "Dalit" 3 "Janajati" 4 "Muslim" 5 "Madhesi"

replace religion = "6" if religion == "prefer_not_to_say"
label define religion_lbl 1 "Hindu" 2 "Muslim" 3 "Christian" 41 "Buddhist" 5 "Others" 6 "prefer_not_to_say"
destring religion, replace	

label define marriage_lbl 1 "Never Married" 2 "Married" 3 "Divorced/separated/widowed"
label define life_place_lbl 1 "Urban" 2 "Rural" -99 "prefer_not_to_say"
label define migration_plan_lbl 1 "Go Abroad" 2 "Stay in Nepal" 3 "Don't Know" -99 "Prefer not to say"
label define abroad_purpose_lbl 1 "Study" 2 "Work" 3 "Study and Work" 4 "Travel" 	
label define nepal_plan_lbl 1 "Study Further"2 "Seek a Job" 3 "Start a business" 4 "Study and Seek a job" 5 "Study and Start a business" 6 "Seek a job and Start a business"


* Section 1: Demographic information
label variable screener "Eligible: age 18-35 and student at sampled institution"
label variable Interviewer_Name "Name of interviewer"
label variable age "1.1 Age in completed years"
label variable gender "1.2 Gender"
label variable education "1.3 Current education level and year"
label variable edu_school "1.3.1 SLC/SEE school: private or public"
label variable edu_plus2 "1.3.2 Plus-two institution: private or public"
label variable edu_bachelors "1.3.3 Bachelor's institution: private or public"
label variable edu_masters "1.3.4 Master's or higher institution: private or public"
label variable ethnicity "1.4 Caste/ethnicity"
label variable religious_belief "1.5 Considers self a person with religious beliefs"
label variable religion "1.6 Religion"
label variable marital_status "1.7 Marital status"
label variable life_place "1.8 Urban/rural location of most of life"
label variable family_abroad "1.9 Close family member has lived or lives abroad"
label variable family_returned "1.9.1 Family member abroad returned permanently"
label variable migration_plan "1.10 Plans to go abroad or stay in Nepal"
label variable abroad_purpose "1.10.1a Purpose of going abroad"
label variable nepal_plan "1.10.1b Plans while staying in Nepal"

label values screener yesno
label values gender gender
label values education education_lb
label values edu_school pub_private
label values edu_plus2 pub_private
label values edu_bachelors pub_private
label values edu_masters pub_private
label values ethnicity ethnicity_lbl
label values religious_belief yesno
label values religion religion_lbl
label values marital_status marriage_lbl
label values life_place life_place_lbl
label values family_abroad yesno
label values family_returned yesno
label values migration_plan migration_plan_lbl
label values abroad_purpose abroad_purpose_lbl
label values nepal_plan nepal_plan_lbl



* Section 2: Political interest and participation
capture drop sec2
capture drop sec2_primer

label variable q2_1 "2.1 Agreement: politics is central to living in Nepal"
label values q2_1 agree_disagree
label variable q2_2 "2.2 Frequency of following political news"
label values q2_2 frequency
label variable q2_3 "2.3 Active involvement in politics/political organizations"
label values q2_3 yesno
label variable q2_4 "2.4 Voted in 2022 federal election"
label values q2_4 yesno
label variable q2_4_1 "2.4.1 Reason for not voting: federal"
label variable Others_Please_Specify "2.4.1 Other reason for not voting: federal"

label variable q2_5 "2.5 Voted in 2022 provincial election"
label values q2_5 yesno
label variable q2_5_1 "2.5.1 Reason for not voting: provincial"
label variable Others_please_specify_001 "2.5.1 Other reason for not voting: provincial"

label variable q2_6 "2.6 Voted in 2022 local election"
label values q2_6 yesno
label variable q2_6_1 "2.6.1 Reason for not voting: local"
label variable Others_please_specify_002 "2.6.1 Other reason for not voting: local"

capture drop q2_7_transition
label variable q2_7 "2.7 Likelihood of voting in 2027 local elections"
label values q2_7 degree
label variable q2_7_1 "2.7.1 Reason unlikely to vote in 2027 local elections"
label values q2_7_1 notvote_reasons

capture drop q2_8_transition
capture drop q2_8
label variable q2_8_1 "2.8.1 Past 12 months: Attended campaign/rally"
label values q2_8_1 yesno
label variable q2_8_2 "2.8.2 Past 12 months: Volunteered for party/campaign"
label values q2_8_2 yesno
label variable q2_8_3 "2.8.3 Past 12 months: Joined protest/demonstration"
label values q2_8_3 yesno
label variable q2_8_4 "2.8.4 Past 12 months: Joined public meeting/discussion"
label values q2_8_4 yesno
label variable q2_8_5 "2.8.5 Past 12 months: Contacted elected representative"
label values q2_8_5 yesno
label variable q2_8_6 "2.8.6 Past 12 months: Joined ward user committee"
label values q2_8_6 yesno

label variable q2_9 "2.9 Confidence in influencing government decisions"
label values q2_9 confidence

* Section 3: Perception of political stability
capture drop sec3
capture drop sec3_primer

label variable q3_1_1 "Nepal instability cause: Government changes/party conflict"
label variable q3_1_2 "Nepal instability cause: Policy formulation failure"
label variable q3_1_2_001 "Nepal instability cause: Policy implementation failure"
label variable q3_1_3 "Nepal instability cause: Corruption"
label variable q3_1_3_001 "Nepal instability cause: Lack of accountability"
label variable q3_1_4 "Nepal instability cause: Protests/violence/civic unrest"
label variable q3_1_5 "Nepal instability cause: Transfers of government officials"
label variable q3_1_6 "Nepal instability cause: Conflict between government tiers"
label variable q3_1_7 "Nepal instability cause: Foreign/external influence"
label values q3_1_1 q3_1_2 q3_1_2_001 q3_1_3 q3_1_3_001 q3_1_4 q3_1_5 q3_1_6 q3_1_7 agree_disagree

label variable q3_2 "3.2 Political stability of Nepal today"
label values q3_2 rank_stability
label variable q3_3 "3.3 Nepal stability compared with one year ago"
label variable q3_4 "3.4 Nepal stability compared with five years ago"
label variable q3_5 "3.5 Expected Nepal stability in five years"
label values q3_3 q3_4 q3_5 stability

capture drop q3_6_transition
label variable q3_6 "3.6 Likelihood government changes within one year"
label variable q3_7 "3.7 Likelihood government changes before next federal election"
label variable q3_8 "3.8 Likelihood of major political event within five years"
label variable q3_9 "3.9 Likelihood of new political force within five years"
label values q3_6 q3_7 q3_8 q3_9 degree

capture drop q3_10_11_transition
label variable q3_10_11 "Nepal stability risk: Corruption"
label variable q3_10_11_001 "Nepal stability risk: Lack of accountability"
label variable q3_10_12 "Nepal stability risk: Unemployment/economic opportunities"
label variable q3_10_13 "Nepal stability risk: Political exclusion"
label variable q3_10_14 "Nepal stability risk: Rising cost of living"
label variable q3_10_15 "Nepal stability risk: Social media misinformation"
label variable q3_10_16 "Nepal stability risk: Foreign/external influence"
label variable q3_10_17 "Nepal stability risk: Ethnic/religious conflict"

capture confirm string variable q3_10_11_001
if !_rc {
    replace q3_10_11_001 = "7" if q3_10_11_001 == "dont_know"
    destring q3_10_11_001, replace
}

label values q3_10_11 q3_10_11_001 q3_10_12 q3_10_13 q3_10_14 q3_10_15 q3_10_16 q3_10_17 agree_disagree

capture drop future_intro
label variable q3_11_1 "Nepal hope: Governance/anti-corruption reforms"
label variable q3_11_2 "Nepal hope: Youth political participation"
label variable q3_11_3 "Nepal hope: Improved democracy"
label variable q3_11_4 "Nepal hope: Economic/employment prospects"
label values q3_11_1 q3_11_2 q3_11_3 q3_11_4 agree_disagree

* Section 4: Perception on Gen-Z protest
capture drop sec4
capture drop sec4_primer

label variable q4_1 "4.1 Attention to September 8 Gen-Z protest and subsequent politics"
label values q4_1 engagement

capture drop q4_2_1_transition
label variable q4_2_1 "Gen-Z protest cause: Corruption"
label variable q4_2_2 "Gen-Z protest cause: Poor public services"
label variable q4_2_3 "Gen-Z protest cause: Unemployment/economic opportunities"
label variable q4_2_4 "Gen-Z protest cause: Rising cost of living"
label variable q4_2_5 "Gen-Z protest cause: Distrust of leaders/parties/institutions"
label variable q4_2_6 "Gen-Z protest cause: Nepotism/elite capture"
label variable q4_2_7 "Gen-Z protest cause: Social media ban"
label variable q4_2_8 "Gen-Z protest cause: Foreign/external influence"
label variable q4_3 "4.3 Gen-Z protest: turning point in political history"
label variable q4_4 "4.4 Gen-Z protest: greater youth civic/political participation"
label variable q4_5 "4.5 Gen-Z protest: youth voices included in mainstream politics"
label variable q4_6 "4.6 Gen-Z protest: increased public support for RSP"
label variable q4_7 "4.7 Current government represents youth interests"
label variable q4_8 "4.8 Government will continue to advance youth interests"
label values q4_2_1 q4_2_2 q4_2_3 q4_2_4 q4_2_5 q4_2_6 q4_2_7 q4_2_8 q4_3 q4_4 q4_5 q4_6 q4_7 q4_8 agree_disagree

* Section 5: Regional perception
capture drop sec5
capture drop sec5_primer

label variable q5_1 "5.1 Attention to protests in other Asian countries"
label values q5_1 how_closely

capture drop q5_2_1_transition
label variable q5_2_1 "South Asia dissent cause: Governance/corruption/public services"
label variable q5_2_2 "South Asia dissent cause: Unemployment/economic opportunities"
label variable q5_2_3 "South Asia dissent cause: Distrust of leaders/parties/institutions"
label variable q5_2_4 "South Asia dissent cause: Political exclusion"
label variable q5_2_5 "South Asia dissent cause: Nepotism/elite capture"
label variable q5_2_6 "South Asia dissent cause: Foreign/external influence"

capture drop q5_3_transition
label variable q5_3 "5.3 Protests in one country encourage others in South Asia"

label variable q5_4 "5.4 Political stability of South Asia today"
label values q5_4 stability
label variable q5_5 "5.5 Optimism for South Asian stability over next five years"
label values q5_5 optimism

capture drop q5_6_1_transition
label variable q5_6_1 "South Asia stability risk: Corruption/lack of accountability"
label variable q5_6_2 "South Asia stability risk: Unemployment/economic opportunities"
label variable q5_6_3 "South Asia stability risk: Political exclusion"
label variable q5_6_4 "South Asia stability risk: Rising cost of living"
label variable q5_6_5 "South Asia stability risk: Social media misinformation"
label variable q5_6_6 "South Asia stability risk: Foreign/external influence"
label variable q5_6_7 "South Asia stability risk: Ethnic/religious conflict"

capture drop q5_7_1_transition
label variable q5_7_1 "South Asia hope: Governance/anti-corruption reforms"
label variable q5_7_2 "South Asia hope: Youth political participation"
label variable q5_7_3 "South Asia hope: Improved democracy"
label variable q5_7_4 "South Asia hope: Economic/employment prospects"

label values q5_2_1 q5_2_2 q5_2_3 q5_2_4 q5_2_5 q5_2_6 q5_3 q5_6_1 q5_6_2 q5_6_3 q5_6_4 q5_6_5 q5_6_6 q5_6_7 q5_7_1 q5_7_2 q5_7_3 q5_7_4 agree_disagree

* Additional information
capture drop end_note

label variable Record_your_current_location "Original GPS point: latitude longitude altitude accuracy"
label variable _Record_your_current_location_la "GPS latitude (decimal degrees)"
label variable _Record_your_current_location_lo "GPS longitude (decimal degrees)"
label variable _Record_your_current_location_al "GPS altitude (metres)"
label variable _Record_your_current_location_pr "GPS horizontal accuracy (metres)"
label variable Province "Province"
label variable local_government "Local government: original response"
label variable local_government_clean "Local government: cleaned text"
label variable lg_name "Local government: standardized name"
label variable lg_type "Local government: standardized type"
label variable lg_review "Local government: review flag"
label variable lg_review_note "Local government: review note"
label variable ward "Ward number"
label variable ethnicity "Ethnicity"
label variable religion "Religion"
label variable _id "Submission ID (Kobo)"
label variable _uuid "Submission UUID (Kobo)"
label variable _submission_time "Submission date and time: source value, timezone unspecified"
label variable _validation_status "Submission validation status"
label variable _notes "Submission notes"
label variable _status "Submission status"
label variable _submitted_by "Account submitting the response"
label variable __version__ "Form version identifier"
label variable _tags "Submission tags"
label variable metarootUuid "Root submission UUID"
label variable _index "Original export row index"

compress
drop if interview_date < td(23aug2026)


*Creating age-cohort
egen byte age_cohort = cut(age), at(18, 22, 26, 30, 36) icodes

label define age_cohort_lbl ///
    0 "18–21" ///
    1 "22–25" ///
    2 "26–29" ///
    3 "30–35"

label values age_cohort age_cohort_lbl
label variable age_cohort "Age cohort"



// These are dropped for now
drop Record_your_current_location _Record_your_current_location_la _Record_your_current_location_lo _Record_your_current_location_al _Record_your_current_location_pr province _id _uuid _submission_time _validation_status _notes _status _submitted_by __version__ _tags metarootUuid _index interview_time_num consent_agree screener

save "$data_clean/student_survey_cleaned.dta", replace

export excel using "$data_clean/student_survey_cleaned.xlsx", firstrow(variables) replace
