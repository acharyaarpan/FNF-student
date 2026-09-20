clear
set more off 

import excel "$data_raw\raw-data-student.xlsx", sheet("Youth and Aspirations Percep...") firstrow

*Label definitions
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

*Label variables and value label assignments
//Section 1......Demographic Information
	drop sec1 			//empty and of no use
	drop sec1_primer 		//empty and of no use
	
	label var age "1.1 Age in completed years"
	label var gender "1.2 Gender" 
	label var gender_other "1.2 Gender: other, specified" 
	label var education "1.3 Current education level and year"
	label var edu_school "1.3.1 SLC/SEE school: private or public"
	label var edu_plus2 "1.3.2 Plus-two institution: private or public"
	label var edu_bachelors "1.3.3 Bachelor's institution: private or public" 
	label var edu_masters "1.3.4 Master's or higher institution: private or public"

	label var _1_4_What_is_your_caste_ethnicit "1.4 Caste/ethnicity"
		rename _1_4_What_is_your_caste_ethnicit Caste_Ethnicity
	label var religious_belief "1.5 Considers self a person with religious beliefs" 
	label var _1_6_Which_religion_do_you_ident "1.6 Religion"
		rename _1_6_Which_religion_do_you_ident Religion
	label var marital_status "1.7 Marital status"
	label var life_place "1.8 Urban/rural location of most of life"
	label var family_abroad "1.9 Close family member has lived or lives abroad" 
	label var family_returned "1.9.1 Family member abroad returned permanently"
	label var migration_plan "1.10 Plans to go abroad or stay in Nepal"
	label var abroad_purpose "1.10.1a Purpose of going abroad"
	label var nepal_plan "1.10.1b Plans while staying in Nepal"



//Section 2..........Political Interest and Participation
// Deleted variables 
		drop sec2      	 //empty and of no use
		drop sec2_primer  	// empty and of no use
label var q2_1 "2.1 Agreement: politics is central to living in Nepal"  //Agree disagree question
	label values q2_1 agree_disagree
label var q2_2 "2.2 Frequency of following political news"  //frequency question
	label values q2_2 frequency
label var q2_3 "2.3 Active involvement in politics/political organizations" //yes no question
	label values q2_3 yesno
label var q2_4 "2.4 Voted in 2022 federal election" //yes no question
	label values q2_4 yesno
label var q2_4_1 "2.4.1 Reason for not voting: federal" //mcq question
label var Others_Please_Specify "2.4.1 Other reason for not voting: federal" //Check the answers for this variable.

label var q2_5 "2.5 Voted in 2022 provincial election"  
	label values q2_5 yesno
label var q2_5_1 "2.5.1 Reason for not voting: provincial"
label var Others_please_specify_001 "2.5.1 Other reason for not voting: provincial" //Check answer for this variable.

label var q2_6 "2.6 Voted in 2022 local election"
	label values q2_6 yesno
label var q2_6_1 "2.6.1 Reason for not voting: local"
label var Others_please_specify_002 "2.6.1 Other reason for not voting: local" //Check the answers for this variable.


//Delete variables
	drop q2_7_transition //empty and of no use
label var q2_7 "2.7 Likelihood of voting in 2027 local elections"
	label values q2_7 degree
label var q2_7_1 "2.7.1 Reason unlikely to vote in 2027 local elections"
	label values q2_7_1 notvote_reasons

//Delete variables
	drop q2_8_transition //empty and of no use 
	drop q2_8 //Has follow up questions, but in itself it has no relevance 
label var q2_8_1 "2.8.1 Past 12 months: Attended campaign/rally"
label values q2_8_1 yesno
label var q2_8_2 "2.8.2 Past 12 months: Volunteered for party/campaign"
label values q2_8_2 yesno
label var q2_8_3 "2.8.3 Past 12 months: Joined protest/demonstration"
label values q2_8_3 yesno
label var q2_8_4 "2.8.4 Past 12 months: Joined public meeting/discussion"
label values q2_8_4 yesno
label var q2_8_5 "2.8.5 Past 12 months: Contacted elected representative"
label values q2_8_5 yesno
label var q2_8_6 "2.8.6 Past 12 months: Joined ward user committee"
label values q2_8_6 yesno

label var q2_9 "2.9 Confidence in influencing government decisions"
label values q2_9 confidence


//Section 3............Perception of Political Stability
//Drop variables
	drop sec3 
	drop sec3_primer 
label var q3_1_1 "Nepal instability cause: Government changes/party conflict" //agree disagree questions
label var q3_1_2 "Nepal instability cause: Policy formulation failure" //agree disagree questions
label var q3_1_2_001 "Nepal instability cause: Policy implementation failure" //agree disagree questions
label var q3_1_3 "Nepal instability cause: Corruption" //agree disagree questions
label var q3_1_3_001 "Nepal instability cause: Lack of accountability" //agree disagree questions
label var q3_1_4 "Nepal instability cause: Protests/violence/civic unrest" //agree disagree questions
label var q3_1_5 "Nepal instability cause: Transfers of government officials" //agree disagree questions
label var q3_1_6 "Nepal instability cause: Conflict between government tiers" //agree disagree questions
label var q3_1_7 "Nepal instability cause: Foreign/external influence" //agree disagree questions

label values q3_1_1 q3_1_2 q3_1_2_001 q3_1_3 q3_1_3_001 q3_1_4 q3_1_5 q3_1_6 q3_1_7 agree_disagree

label var q3_2 "3.2 Political stability of Nepal today" //Ranking stability question
	label values q3_2 rank_stability
label var q3_3 "3.3 Nepal stability compared with one year ago" // stability questions
label var q3_4 "3.4 Nepal stability compared with five years ago" //stability questions
label var q3_5 "3.5 Expected Nepal stability in five years" //stability question
	label values q3_2 q3_4 q3_5 stability

	drop q3_6_transition //empty and of no use
	
label var q3_6 "3.6 Likelihood government changes within one year"	//degree questions
label var q3_7 "3.7 Likelihood government changes before next federal election"	//degree questions
label var q3_8 "3.8 Likelihood of major political event within five years"	//degree questions
label var q3_9 "3.9 Likelihood of new political force within five years"	//degree questions

	label values q3_6 q3_7 q3_8 q3_9 degree

	drop q3_10_11_transition //empty and of no use


label var q3_10_11 "Nepal stability risk: Corruption"	//Agree disagree question 
label var q3_10_11_001 "Nepal stability risk: Lack of accountability"	//Agree disagree question 
label var q3_10_12 "Nepal stability risk: Unemployment/economic opportunities"	//Agree disagree question 
label var q3_10_13 "Nepal stability risk: Political exclusion"	//Agree disagree question 
label var q3_10_14 "Nepal stability risk: Rising cost of living"	//Agree disagree question 
label var q3_10_15 "Nepal stability risk: Social media misinformation"	//Agree disagree question 
label var q3_10_16 "Nepal stability risk: Foreign/external influence"	//Agree disagree question 
label var q3_10_17 "Nepal stability risk: Ethnic/religious conflict"	//Agree disagree question 
	
	replace q3_10_11_001 = "7" if q3_10_11_001 == "dont_know"
	destring q3_10_11_001, replace

	label values q3_10_11 q3_10_11_001 q3_10_12 q3_10_13 q3_10_14 q3_10_15 q3_10_16 q3_10_17 agree_disagree

	drop future_intro	//empty and of no use 

label var q3_11_1 "Nepal hope: Governance/anti-corruption reforms"	//agree disagree question 
label var q3_11_2 "Nepal hope: Youth political participation"	//agree disagree question
label var q3_11_3 "Nepal hope: Improved democracy"	//agree disagree question
label var q3_11_4 "Nepal hope: Economic/employment prospects"	//agree disagree question

	label values q3_11_1 q3_11_2 q3_11_3 q3_11_4 agree_disagree
	
	
	
//Section 4.........Perception on Gen-Z protest+
//Drop variables 
	drop sec4 				//empty and of no use
	drop sec4_primer		//empty and of no use
	
	label var q4_1 "4.1 Attention to September 8 Gen-Z protest and subsequent politics" //engagement question 
	label values q4_1 engagement
	
	drop q4_2_1_transition 	//empty and of no use
	
	label var q4_2_1 "Gen-Z protest cause: Corruption" //agree disagree question 
	label var q4_2_2 "Gen-Z protest cause: Poor public services" //agree disagree question 
	label var q4_2_3 "Gen-Z protest cause: Unemployment/economic opportunities" //agree disagree question 
	label var q4_2_4 "Gen-Z protest cause: Rising cost of living" //agree disagree question 
	label var q4_2_5 "Gen-Z protest cause: Distrust of leaders/parties/institutions" //agree disagree question 
	label var q4_2_6 "Gen-Z protest cause: Nepotism/elite capture" //agree disagree question 
	label var q4_2_7 "Gen-Z protest cause: Social media ban" //agree disagree question 
	label var q4_2_8 "Gen-Z protest cause: Foreign/external influence" //agree disagree question 
	label var q4_3 "4.3 Gen-Z protest: turning point in political history" //agree disagree question 
	label var q4_4 "4.4 Gen-Z protest: greater youth civic/political participation" //agree disagree question 
	label var q4_5 "4.5 Gen-Z protest: youth voices included in mainstream politics" //agree disagree question 
	label var q4_6 "4.6 Gen-Z protest: increased public support for RSP" //agree disagree question 
	label var q4_7 "4.7 Current government represents youth interests" //agree disagree question 
	label var q4_8 "4.8 Government will continue to advance youth interests" //agree disagree question 
	
	label values q4_2_1 q4_2_2 q4_2_3 q4_2_4 q4_2_5 q4_2_6 q4_2_7 q4_2_8 q4_3 q4_4 q4_5 q4_6 q4_7 q4_8 agree_disagree

	
//Section 5
	drop sec5 				//empty and of no use. 
	drop sec5_primer 		//empty and of no use.
	
	label var q5_1 "5.1 Attention to protests in other Asian countries"		//how closely question 
		label values q5_1 how_closely
	
	drop q5_2_1_transition 

	label var q5_2_1 "South Asia dissent cause: Governance/corruption/public services" //agree disagree question 
	label var q5_2_2 "South Asia dissent cause: Unemployment/economic opportunities" //agree disagree question 
	label var q5_2_3 "South Asia dissent cause: Distrust of leaders/parties/institutions" //agree disagree question 
	label var q5_2_4 "South Asia dissent cause: Political exclusion" //agree disagree question 
	label var q5_2_5 "South Asia dissent cause: Nepotism/elite capture" //agree disagree question 
	label var q5_2_6 "South Asia dissent cause: Foreign/external influence" //agree disagree question 
	
	drop q5_3_transition 
	
	label var q5_3 "5.3 Protests in one country encourage others in South Asia" //agree disagree question  
	
	label var q5_4 "5.4 Political stability of South Asia today" //Stability Question
		label values q5_4 stability
	
	label var q5_5 "5.5 Optimism for South Asian stability over next five years" //Optimism Question 
		label values q5_5 optimism
	
	drop q5_6_1_transition 
	
	label var q5_6_1 "South Asia stability risk: Corruption/lack of accountability" //agree disagree question
	label var q5_6_2 "South Asia stability risk: Unemployment/economic opportunities" //agree disagree question
	label var q5_6_3 "South Asia stability risk: Political exclusion" //agree disagree question
	label var q5_6_4 "South Asia stability risk: Rising cost of living" //agree disagree question
	label var q5_6_5 "South Asia stability risk: Social media misinformation" //agree disagree question
	label var q5_6_6 "South Asia stability risk: Foreign/external influence" //agree disagree question
	label var q5_6_7 "South Asia stability risk: Ethnic/religious conflict" //agree disagree question
	
	drop q5_7_1_transition 
	
	label var q5_7_1 "South Asia hope: Governance/anti-corruption reforms" //agree disagree question
	label var q5_7_2 "South Asia hope: Youth political participation" //agree disagree question
	label var q5_7_3 "South Asia hope: Improved democracy" //agree disagree question
	label var q5_7_4 "South Asia hope: Economic/employment prospects" //agree disagree question
	
	label values q5_2_1 q5_2_2 q5_2_3 q5_2_4 q5_2_5 q5_2_6 q5_3 q5_6_1 q5_6_2 q5_6_3 q5_6_4 q5_6_5 q5_6_6 q5_6_7 q5_7_1 q5_7_2 q5_7_3 q5_7_4 agree_disagree
	
	
//	Additional Information 
	drop end_note				//empty and of no use.
	
	label var Record_your_current_location "Original GPS point: latitude longitude altitude accuracy"
	label var _Record_your_current_location_la "GPS latitude (decimal degrees)"
	label var _Record_your_current_location_lo "GPS longitude (decimal degrees)"
	label var _Record_your_current_location_al "GPS altitude (metres)"
	label var _Record_your_current_location_pr "GPS horizontal accuracy (metres)"
	label var province "Province"
	label var ethnicity "Ethnicity"
	label var religion "Religion"
	label var _id "Submission ID (Kobo)"
	label var _uuid "Submission UUID (Kobo)"
	label var _submission_time "Submission date and time: source value, timezone unspecified" 
	label var _validation_status "Submission validation status"
	label var _notes "Submission notes"
	label var _status "Submission status"
	label var _submitted_by "Account submitting the response" 
	label var __version__ "Form version identifier"
	label var _tags "Submission tags"
	label var metarootUuid "Root submission UUID"
	label var _index "Original export row index"

	

	




