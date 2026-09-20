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


*Label variables and value label assignments
//Section 2
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


//Section 3
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
	label var q3_2 rank_stability
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
	


ee
//Section 4

//Section 4

//Section 5



