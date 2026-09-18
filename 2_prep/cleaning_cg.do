* Youth and Aspirations Perception Survey: reproducible cleaning
* Source: supplied XLSForm survey/choices and questionnaire PDF.
* Run 0_master.do. No user-written Stata packages are required.
* Original response values are retained in the source snapshot and *_raw fields.
* No records are deleted, imputed, deduplicated, or geographically reassigned.
version 17
clear
set more off
if "$workspace" == "" {
    display as error "Run 0_master.do first."
    exit 198
}
capture log close _all
log using "$log/survey_cleaning.log", text replace
* Pending decisions. Change only after respondent-code meaning is confirmed.
local buddhist_41_confirmed 1
import excel "$data_raw/raw-data-student.xlsx", sheet("Youth and Aspirations Percep...") allstring clear
local imported_rows = _N - 1
assert `imported_rows' > 0

assert A[1] == "consent_intro"
rename A src001
label variable src001 "consent_intro"
assert B[1] == "consent_agree"
rename B src002
label variable src002 "consent_agree"
assert C[1] == "screener"
rename C src003
label variable src003 "screener"
assert D[1] == "prelim"
rename D src004
label variable src004 "prelim"
assert E[1] == "interview_date"
rename E src005
label variable src005 "interview_date"
assert F[1] == "interview_time"
rename F src006
label variable src006 "interview_time"
assert G[1] == "Interviewer_Name"
rename G src007
label variable src007 "Interviewer_Name"
assert H[1] == "Province"
rename H src008
label variable src008 "Province"
assert I[1] == "local_government"
rename I src009
label variable src009 "local_government"
assert J[1] == "ward"
rename J src010
label variable src010 "ward"
assert K[1] == "sec1"
rename K src011
label variable src011 "sec1"
assert L[1] == "sec1_primer"
rename L src012
label variable src012 "sec1_primer"
assert M[1] == "age"
rename M src013
label variable src013 "age"
assert N[1] == "gender"
rename N src014
label variable src014 "gender"
assert O[1] == "gender_other"
rename O src015
label variable src015 "gender_other"
assert P[1] == "education"
rename P src016
label variable src016 "education"
assert Q[1] == "edu_school"
rename Q src017
label variable src017 "edu_school"
assert R[1] == "edu_plus2"
rename R src018
label variable src018 "edu_plus2"
assert S[1] == "edu_bachelors"
rename S src019
label variable src019 "edu_bachelors"
assert T[1] == "edu_masters"
rename T src020
label variable src020 "edu_masters"
assert U[1] == "_1_4_What_is_your_caste_ethnicity"
rename U src021
label variable src021 "_1_4_What_is_your_caste_ethnicity"
assert V[1] == "religious_belief"
rename V src022
label variable src022 "religious_belief"
assert W[1] == "_1_6_Which_religion_do_you_identify_with"
rename W src023
label variable src023 "_1_6_Which_religion_do_you_identify_with"
assert X[1] == "marital_status"
rename X src024
label variable src024 "marital_status"
assert Y[1] == "life_place"
rename Y src025
label variable src025 "life_place"
assert Z[1] == "family_abroad"
rename Z src026
label variable src026 "family_abroad"
assert AA[1] == "family_returned"
rename AA src027
label variable src027 "family_returned"
assert AB[1] == "migration_plan"
rename AB src028
label variable src028 "migration_plan"
assert AC[1] == "abroad_purpose"
rename AC src029
label variable src029 "abroad_purpose"
assert AD[1] == "nepal_plan"
rename AD src030
label variable src030 "nepal_plan"
assert AE[1] == "sec2"
rename AE src031
label variable src031 "sec2"
assert AF[1] == "sec2_primer"
rename AF src032
label variable src032 "sec2_primer"
assert AG[1] == "q2_1"
rename AG src033
label variable src033 "q2_1"
assert AH[1] == "q2_2"
rename AH src034
label variable src034 "q2_2"
assert AI[1] == "q2_3"
rename AI src035
label variable src035 "q2_3"
assert AJ[1] == "q2_4"
rename AJ src036
label variable src036 "q2_4"
assert AK[1] == "q2_4_1"
rename AK src037
label variable src037 "q2_4_1"
assert AL[1] == "Others_Please_Specify"
rename AL src038
label variable src038 "Others_Please_Specify"
assert AM[1] == "q2_5"
rename AM src039
label variable src039 "q2_5"
assert AN[1] == "q2_5_1"
rename AN src040
label variable src040 "q2_5_1"
assert AO[1] == "Others_please_specify_001"
rename AO src041
label variable src041 "Others_please_specify_001"
assert AP[1] == "q2_6"
rename AP src042
label variable src042 "q2_6"
assert AQ[1] == "q2_6_1"
rename AQ src043
label variable src043 "q2_6_1"
assert AR[1] == "Others_please_specify_002"
rename AR src044
label variable src044 "Others_please_specify_002"
assert AS[1] == "q2_7_transition"
rename AS src045
label variable src045 "q2_7_transition"
assert AT[1] == "q2_7"
rename AT src046
label variable src046 "q2_7"
assert AU[1] == "q2_7_1"
rename AU src047
label variable src047 "q2_7_1"
assert AV[1] == "q2_8_transition"
rename AV src048
label variable src048 "q2_8_transition"
assert AW[1] == "q2_8"
rename AW src049
label variable src049 "q2_8"
assert AX[1] == "q2_8_1"
rename AX src050
label variable src050 "q2_8_1"
assert AY[1] == "q2_8_2"
rename AY src051
label variable src051 "q2_8_2"
assert AZ[1] == "q2_8_3"
rename AZ src052
label variable src052 "q2_8_3"
assert BA[1] == "q2_8_4"
rename BA src053
label variable src053 "q2_8_4"
assert BB[1] == "q2_8_5"
rename BB src054
label variable src054 "q2_8_5"
assert BC[1] == "q2_8_6"
rename BC src055
label variable src055 "q2_8_6"
assert BD[1] == "q2_9"
rename BD src056
label variable src056 "q2_9"
assert BE[1] == "sec3"
rename BE src057
label variable src057 "sec3"
assert BF[1] == "sec3_primer"
rename BF src058
label variable src058 "sec3_primer"
assert BG[1] == "q3_1_1"
rename BG src059
label variable src059 "q3_1_1"
assert BH[1] == "q3_1_2"
rename BH src060
label variable src060 "q3_1_2"
assert BI[1] == "q3_1_2_001"
rename BI src061
label variable src061 "q3_1_2_001"
assert BJ[1] == "q3_1_3"
rename BJ src062
label variable src062 "q3_1_3"
assert BK[1] == "q3_1_3_001"
rename BK src063
label variable src063 "q3_1_3_001"
assert BL[1] == "q3_1_4"
rename BL src064
label variable src064 "q3_1_4"
assert BM[1] == "q3_1_5"
rename BM src065
label variable src065 "q3_1_5"
assert BN[1] == "q3_1_6"
rename BN src066
label variable src066 "q3_1_6"
assert BO[1] == "q3_1_7"
rename BO src067
label variable src067 "q3_1_7"
assert BP[1] == "q3_2"
rename BP src068
label variable src068 "q3_2"
assert BQ[1] == "q3_3"
rename BQ src069
label variable src069 "q3_3"
assert BR[1] == "q3_4"
rename BR src070
label variable src070 "q3_4"
assert BS[1] == "q3_5"
rename BS src071
label variable src071 "q3_5"
assert BT[1] == "q3_6_transition"
rename BT src072
label variable src072 "q3_6_transition"
assert BU[1] == "q3_6"
rename BU src073
label variable src073 "q3_6"
assert BV[1] == "q3_7"
rename BV src074
label variable src074 "q3_7"
assert BW[1] == "q3_8"
rename BW src075
label variable src075 "q3_8"
assert BX[1] == "q3_9"
rename BX src076
label variable src076 "q3_9"
assert BY[1] == "q3_10_11_transition"
rename BY src077
label variable src077 "q3_10_11_transition"
assert BZ[1] == "q3_10_11"
rename BZ src078
label variable src078 "q3_10_11"
assert CA[1] == "q3_10_11_001"
rename CA src079
label variable src079 "q3_10_11_001"
assert CB[1] == "q3_10_12"
rename CB src080
label variable src080 "q3_10_12"
assert CC[1] == "q3_10_13"
rename CC src081
label variable src081 "q3_10_13"
assert CD[1] == "q3_10_14"
rename CD src082
label variable src082 "q3_10_14"
assert CE[1] == "q3_10_15"
rename CE src083
label variable src083 "q3_10_15"
assert CF[1] == "q3_10_16"
rename CF src084
label variable src084 "q3_10_16"
assert CG[1] == "q3_10_17"
rename CG src085
label variable src085 "q3_10_17"
assert CH[1] == "future_intro"
rename CH src086
label variable src086 "future_intro"
assert CI[1] == "q3_11_1"
rename CI src087
label variable src087 "q3_11_1"
assert CJ[1] == "q3_11_2"
rename CJ src088
label variable src088 "q3_11_2"
assert CK[1] == "q3_11_3"
rename CK src089
label variable src089 "q3_11_3"
assert CL[1] == "q3_11_4"
rename CL src090
label variable src090 "q3_11_4"
assert CM[1] == "sec4"
rename CM src091
label variable src091 "sec4"
assert CN[1] == "sec4_primer"
rename CN src092
label variable src092 "sec4_primer"
assert CO[1] == "q4_1"
rename CO src093
label variable src093 "q4_1"
assert CP[1] == "q4_2_1_transition"
rename CP src094
label variable src094 "q4_2_1_transition"
assert CQ[1] == "q4_2_1"
rename CQ src095
label variable src095 "q4_2_1"
assert CR[1] == "q4_2_2"
rename CR src096
label variable src096 "q4_2_2"
assert CS[1] == "q4_2_3"
rename CS src097
label variable src097 "q4_2_3"
assert CT[1] == "q4_2_4"
rename CT src098
label variable src098 "q4_2_4"
assert CU[1] == "q4_2_5"
rename CU src099
label variable src099 "q4_2_5"
assert CV[1] == "q4_2_6"
rename CV src100
label variable src100 "q4_2_6"
assert CW[1] == "q4_2_7"
rename CW src101
label variable src101 "q4_2_7"
assert CX[1] == "q4_2_8"
rename CX src102
label variable src102 "q4_2_8"
assert CY[1] == "q4_3"
rename CY src103
label variable src103 "q4_3"
assert CZ[1] == "q4_4"
rename CZ src104
label variable src104 "q4_4"
assert DA[1] == "q4_5"
rename DA src105
label variable src105 "q4_5"
assert DB[1] == "q4_6"
rename DB src106
label variable src106 "q4_6"
assert DC[1] == "q4_7"
rename DC src107
label variable src107 "q4_7"
assert DD[1] == "q4_8"
rename DD src108
label variable src108 "q4_8"
assert DE[1] == "sec5"
rename DE src109
label variable src109 "sec5"
assert DF[1] == "sec5_primer"
rename DF src110
label variable src110 "sec5_primer"
assert DG[1] == "q5_1"
rename DG src111
label variable src111 "q5_1"
assert DH[1] == "q5_2_1_transition"
rename DH src112
label variable src112 "q5_2_1_transition"
assert DI[1] == "q5_2_1"
rename DI src113
label variable src113 "q5_2_1"
assert DJ[1] == "q5_2_2"
rename DJ src114
label variable src114 "q5_2_2"
assert DK[1] == "q5_2_3"
rename DK src115
label variable src115 "q5_2_3"
assert DL[1] == "q5_2_4"
rename DL src116
label variable src116 "q5_2_4"
assert DM[1] == "q5_2_5"
rename DM src117
label variable src117 "q5_2_5"
assert DN[1] == "q5_2_6"
rename DN src118
label variable src118 "q5_2_6"
assert DO[1] == "q5_3_transition"
rename DO src119
label variable src119 "q5_3_transition"
assert DP[1] == "q5_3"
rename DP src120
label variable src120 "q5_3"
assert DQ[1] == "q5_4"
rename DQ src121
label variable src121 "q5_4"
assert DR[1] == "q5_5"
rename DR src122
label variable src122 "q5_5"
assert DS[1] == "q5_6_1_transition"
rename DS src123
label variable src123 "q5_6_1_transition"
assert DT[1] == "q5_6_1"
rename DT src124
label variable src124 "q5_6_1"
assert DU[1] == "q5_6_2"
rename DU src125
label variable src125 "q5_6_2"
assert DV[1] == "q5_6_3"
rename DV src126
label variable src126 "q5_6_3"
assert DW[1] == "q5_6_4"
rename DW src127
label variable src127 "q5_6_4"
assert DX[1] == "q5_6_5"
rename DX src128
label variable src128 "q5_6_5"
assert DY[1] == "q5_6_6"
rename DY src129
label variable src129 "q5_6_6"
assert DZ[1] == "q5_6_7"
rename DZ src130
label variable src130 "q5_6_7"
assert EA[1] == "q5_7_1_transition"
rename EA src131
label variable src131 "q5_7_1_transition"
assert EB[1] == "q5_7_1"
rename EB src132
label variable src132 "q5_7_1"
assert EC[1] == "q5_7_2"
rename EC src133
label variable src133 "q5_7_2"
assert ED[1] == "q5_7_3"
rename ED src134
label variable src134 "q5_7_3"
assert EE[1] == "q5_7_4"
rename EE src135
label variable src135 "q5_7_4"
assert EF[1] == "end_note"
rename EF src136
label variable src136 "end_note"
assert EG[1] == "Record_your_current_location"
rename EG src137
label variable src137 "Record_your_current_location"
assert EH[1] == "_Record_your_current_location_latitude"
rename EH src138
label variable src138 "_Record_your_current_location_latitude"
assert EI[1] == "_Record_your_current_location_longitude"
rename EI src139
label variable src139 "_Record_your_current_location_longitude"
assert EJ[1] == "_Record_your_current_location_altitude"
rename EJ src140
label variable src140 "_Record_your_current_location_altitude"
assert EK[1] == "_Record_your_current_location_precision"
rename EK src141
label variable src141 "_Record_your_current_location_precision"
assert EL[1] == "province"
rename EL src142
label variable src142 "province"
assert EM[1] == "ethnicity"
rename EM src143
label variable src143 "ethnicity"
assert EN[1] == "religion"
rename EN src144
label variable src144 "religion"
assert EO[1] == "_id"
rename EO src145
label variable src145 "_id"
assert EP[1] == "_uuid"
rename EP src146
label variable src146 "_uuid"
assert EQ[1] == "_submission_time"
rename EQ src147
label variable src147 "_submission_time"
assert ER[1] == "_validation_status"
rename ER src148
label variable src148 "_validation_status"
assert ES[1] == "_notes"
rename ES src149
label variable src149 "_notes"
assert ET[1] == "_status"
rename ET src150
label variable src150 "_status"
assert EU[1] == "_submitted_by"
rename EU src151
label variable src151 "_submitted_by"
assert EV[1] == "__version__"
rename EV src152
label variable src152 "__version__"
assert EW[1] == "_tags"
rename EW src153
label variable src153 "_tags"
assert EX[1] == "meta/rootUuid"
rename EX src154
label variable src154 "meta/rootUuid"
assert EY[1] == "_index"
rename EY src155
label variable src155 "_index"
drop in 1
generate long source_row = _n + 1
label variable source_row "Row in original Excel workbook, including header"
* allstring uses Excel display formatting and hides the submission time.
* Read the underlying numeric date separately to preserve its fractional day.
preserve
local lastrow = `imported_rows' + 1
import excel "$data_raw/raw-data-student.xlsx", sheet("Youth and Aspirations Percep...") cellrange(EQ2:EQ`lastrow') clear
generate long source_row = _n + 1
generate double __submission_ms = round(EQ*86400000,1)
keep source_row __submission_ms
tempfile submission_clock
save `submission_clock'
restore
merge 1:1 source_row using `submission_clock', assert(match) nogen
replace src147 = subinstr(string(__submission_ms,"%tcCCYY-NN-DD_HH:MM:SS"),"_"," ",.)
drop __submission_ms
save "$data_clean/survey_source_snapshot.dta", replace
assert missing(src001)
drop src001
rename src002 consent_agree
label variable consent_agree "Consent to participate"
char consent_agree[source_name] "consent_agree"
notes consent_agree: Do you understand the information I have provided, and do you agree to participate in this survey?
char consent_agree[question_en] "Do you understand the information I have provided, and do you agree to participate in this survey?"
char consent_agree[question_ne] "मैले दिएको जानकारी तपाईंले बुझ्नुभयो र यस सर्वेक्षणमा सहभागी हुन सहमत हुनुहुन्छ?"
char consent_agree[form_type] "select_one yes_no"
char consent_agree[form_relevant] ""
rename src003 screener
label variable screener "Eligible: age 18-35 and student at sampled institution"
char screener[source_name] "screener"
notes screener: Are you currently between the age of 18-35 and are a student at this college/university.
char screener[question_en] "Are you currently between the age of 18-35 and are a student at this college/university."
char screener[question_ne] "के तपाईं हाल १८–३५ वर्ष उमेर समूहमा पर्नुहुन्छ र यस कलेज/विश्वविद्यालयमा अध्ययनरत विद्यार्थी हुनुहुन्छ?"
char screener[form_type] "select_one screener"
char screener[form_relevant] "USD {consent_agree} = '1'"
assert missing(src004)
drop src004
rename src005 interview_date
label variable interview_date "Interview date"
char interview_date[source_name] "interview_date"
notes interview_date: Interview date
char interview_date[question_en] "Interview date"
char interview_date[question_ne] "अन्तर्वार्ता मिति"
char interview_date[form_type] "date"
char interview_date[form_relevant] ""
rename src006 interview_time
label variable interview_time "Interview time"
char interview_time[source_name] "interview_time"
notes interview_time: Interview time
char interview_time[question_en] "Interview time"
char interview_time[question_ne] "अन्तर्वार्ता समय"
char interview_time[form_type] "time"
char interview_time[form_relevant] ""
rename src007 interviewer
label variable interviewer "Interviewer"
char interviewer[source_name] "Interviewer_Name"
notes interviewer: Interviewer Name
char interviewer[question_en] "Interviewer Name"
char interviewer[question_ne] "गणकको  नाम "
char interviewer[form_type] "select_one xq9zw28"
char interviewer[form_relevant] ""
rename src008 province
label variable province "Province (explicit codes follow supplied choice-list order)"
char province[source_name] "Province"
notes province: Province
char province[question_en] "Province"
char province[question_ne] "प्रदेश "
char province[form_type] "select_one ar01j09"
char province[form_relevant] ""
rename src009 local_government
label variable local_government "Local government"
char local_government[source_name] "local_government"
notes local_government: Local Government
char local_government[question_en] "Local Government"
char local_government[question_ne] "गाउपलिका, नगरपालिका र  पालिका को नाम   "
char local_government[form_type] "text"
char local_government[form_relevant] ""
rename src010 ward
label variable ward "Ward number"
char ward[source_name] "ward"
notes ward: Ward
char ward[question_en] "Ward"
char ward[question_ne] "वडा"
char ward[form_type] "text"
char ward[form_relevant] ""
assert missing(src011)
drop src011
assert missing(src012)
drop src012
rename src013 age
label variable age "1.1 Age in completed years"
char age[source_name] "age"
notes age: 1.1 What is your age?
char age[question_en] "1.1 What is your age?"
char age[question_ne] "१.१ हजुरको उमेर कति हो?"
char age[form_type] "integer"
char age[form_relevant] ""
rename src014 gender
label variable gender "1.2 Gender"
char gender[source_name] "gender"
notes gender: 1.2 What is your Gender?
char gender[question_en] "1.2 What is your Gender?"
char gender[question_ne] "१.२ हजुरको लिंग के हो?"
char gender[form_type] "select_one gender"
char gender[form_relevant] ""
rename src015 gender_other
label variable gender_other "1.2 Gender: other, specified"
char gender_other[source_name] "gender_other"
notes gender_other: Please specify
char gender_other[question_en] "Please specify"
char gender_other[question_ne] "कृपया उल्लेख गर्नुहोस्"
char gender_other[form_type] "text"
char gender_other[form_relevant] "USD {gender} = '3'"
rename src016 education
label variable education "1.3 Current education level and year"
char education[source_name] "education"
notes education: 1.3 What is the highest level of education you are currently pursuing?
char education[question_en] "1.3 What is the highest level of education you are currently pursuing?"
char education[question_ne] "१.३ तपाईंले हाल अध्ययन गर्नु भएको  उच्चतम शैक्षिक तह कुन हो ?"
char education[form_type] "select_one education"
char education[form_relevant] ""
rename src017 edu_school
label variable edu_school "1.3.1 SLC/SEE school: private or public"
char edu_school[source_name] "edu_school"
notes edu_school: 1.3.1 Did you attend a private or public school for your SLC/SEE education?
char edu_school[question_en] "1.3.1 Did you attend a private or public school for your SLC/SEE education?"
char edu_school[question_ne] "१.३.१ तपाईंले एसएलसी/एसईई तहमा निजी वा सरकारी/सार्वजनिक विद्यालयमध्ये कुनमा अध्ययन गर्नुभएको थियो?"
char edu_school[form_type] "select_one private_public"
char edu_school[form_relevant] "USD {education} != '-99'"
rename src018 edu_plus2
label variable edu_plus2 "1.3.2 Plus-two institution: private or public"
char edu_plus2[source_name] "edu_plus2"
notes edu_plus2: 1.3.2 Did you attend a private or public institution for your +2 education?
char edu_plus2[question_en] "1.3.2 Did you attend a private or public institution for your +2 education?"
char edu_plus2[question_ne] "१.३.२ तपाईंले +२ तहमा निजी वा सरकारी/सार्वजनिक शैक्षिक संस्थामध्ये कुनमा अध्ययन गर्नुभएको थियो?"
char edu_plus2[form_type] "select_one private_public"
char edu_plus2[form_relevant] "USD {education} != '-99'"
rename src019 edu_bachelors
label variable edu_bachelors "1.3.3 Bachelor's institution: private or public"
char edu_bachelors[source_name] "edu_bachelors"
notes edu_bachelors: 1.3.3 Did you attend a private or public institution for your Bachelor's degree?
char edu_bachelors[question_en] "1.3.3 Did you attend a private or public institution for your Bachelor's degree?"
char edu_bachelors[question_ne] "१.३.३ तपाईंले स्नातक तहमा निजी वा सरकारी/सार्वजनिक शैक्षिक संस्थामध्ये कुनमा अध्ययन गर्नुभएको थियो?"
char edu_bachelors[form_type] "select_one private_public"
char edu_bachelors[form_relevant] "USD {education} = '6' or USD {education} = '7' or USD {education} = '8'"
rename src020 edu_masters
label variable edu_masters "1.3.4 Master's or higher institution: private or public"
char edu_masters[source_name] "edu_masters"
notes edu_masters: 1.3.4 Did you attend a private or public institution for your Master's degree or above?
char edu_masters[question_en] "1.3.4 Did you attend a private or public institution for your Master's degree or above?"
char edu_masters[question_ne] "१.३.४ तपाईंले स्नातकोत्तर वा सोभन्दा माथिको तहमा निजी वा सरकारी/सार्वजनिक शैक्षिक संस्थामध्ये कुनमा अध्ययन गर्नुभएको थियो?"
char edu_masters[form_type] "select_one private_public"
char edu_masters[form_relevant] "USD {education} = '6' or USD {education} = '8'"
rename src021 ethnicity
label variable ethnicity "1.4 Caste/ethnicity"
char ethnicity[source_name] "_1_4_What_is_your_caste_ethnicity"
notes ethnicity: 1.4 What is your caste/ethnicity?
char ethnicity[question_en] "1.4 What is your caste/ethnicity?"
char ethnicity[question_ne] "१.४ तपाई को जात/जातियता के हो?"
char ethnicity[form_type] "select_one cp3qw00"
char ethnicity[form_relevant] ""
rename src022 religious_belief
label variable religious_belief "1.5 Considers self a person with religious beliefs"
char religious_belief[source_name] "religious_belief"
notes religious_belief: 1.5.  Do you consider yourself a person with religious beliefs?
char religious_belief[question_en] "1.5.  Do you consider yourself a person with religious beliefs?"
char religious_belief[question_ne] "१.५ आफूलाई धार्मिक आस्था भएको व्यक्ति मान्नुहुन्छ?"
char religious_belief[form_type] "select_one yes_no_unsure"
char religious_belief[form_relevant] ""
rename src023 religion
label variable religion "1.6 Religion"
char religion[source_name] "_1_6_Which_religion_do_you_identify_with"
notes religion: 1.6 Which religion do you identify with?
char religion[question_en] "1.6 Which religion do you identify with?"
char religion[question_ne] "१.६ तपाई को धर्म के हो ?"
char religion[form_type] "select_one hn9bp27"
char religion[form_relevant] "USD {religious_belief} = '1'"
rename src024 marital_status
label variable marital_status "1.7 Marital status"
char marital_status[source_name] "marital_status"
notes marital_status: 1.7.  What is your marital status?
char marital_status[question_en] "1.7.  What is your marital status?"
char marital_status[question_ne] "१.७ तपाईंको वैवाहिक अवस्था के हो?"
char marital_status[form_type] "select_one marital"
char marital_status[form_relevant] ""
rename src025 life_place
label variable life_place "1.8 Urban/rural location of most of life"
char life_place[source_name] "life_place"
notes life_place: 1.8.  Where have you spent most of your life in?
char life_place[question_en] "1.8.  Where have you spent most of your life in?"
char life_place[question_ne] "१.८ तपाईंले आफ्नो जीवनको अधिकांश समय कहाँ बिताउनुभएको छ?"
char life_place[form_type] "select_one urban_rural"
char life_place[form_relevant] ""
rename src026 family_abroad
label variable family_abroad "1.9 Close family member has lived or lives abroad"
char family_abroad[source_name] "family_abroad"
notes family_abroad: 1.9.  Have any of your close family member lived abroad or is currently living abroad?
char family_abroad[question_en] "1.9.  Have any of your close family member lived abroad or is currently living abroad?"
char family_abroad[question_ne] "१.९ तपाईंका नजिकका परिवारका कुनै सदस्य विदेशमा बस्नुभएको छ वा हाल विदेशमा बसिरहनुभएको छ?"
char family_abroad[form_type] "select_one yes_no_pns"
char family_abroad[form_relevant] ""
rename src027 family_returned
label variable family_returned "1.9.1 Family member abroad returned permanently"
char family_returned[source_name] "family_returned"
notes family_returned: 1.9.1. Has he/she returned permanetly?
char family_returned[question_en] "1.9.1. Has he/she returned permanetly?"
char family_returned[question_ne] "१.९.१ उहाँ सधै को लागि फर्केर आउनुभएको छ?"
char family_returned[form_type] "select_one yes_no_dk_pns"
char family_returned[form_relevant] "USD {family_abroad} = '1'"
rename src028 migration_plan
label variable migration_plan "1.10 Plans to go abroad or stay in Nepal"
char migration_plan[source_name] "migration_plan"
notes migration_plan: 1.10.  Are you planning to go abroad or stay in Nepal?
char migration_plan[question_en] "1.10.  Are you planning to go abroad or stay in Nepal?"
char migration_plan[question_ne] "१.१० तपाईं विदेश जाने योजना बनाउँदै हुनुहुन्छ कि नेपालमै बस्ने?"
char migration_plan[form_type] "select_one migration_plan"
char migration_plan[form_relevant] ""
rename src029 abroad_purpose
label variable abroad_purpose "1.10.1a Purpose of going abroad"
char abroad_purpose[source_name] "abroad_purpose"
notes abroad_purpose: 1.10.1a.  Are you planning to study or work?
char abroad_purpose[question_en] "1.10.1a.  Are you planning to study or work?"
char abroad_purpose[question_ne] "१.१०.१क  तपाईं अध्ययन गर्न जाने योजना बनाउँदै हुनुहुन्छ कि काम गर्न?"
char abroad_purpose[form_type] "select_one abroad_purpose"
char abroad_purpose[form_relevant] "USD {migration_plan} = '1'"
rename src030 nepal_plan
label variable nepal_plan "1.10.1b Plans while staying in Nepal"
char nepal_plan[source_name] "nepal_plan"
notes nepal_plan: 1.10.1b.  Are you planning to continue your study, seek a job or start your business?
char nepal_plan[question_en] "1.10.1b.  Are you planning to continue your study, seek a job or start your business?"
char nepal_plan[question_ne] "१.१०.१ख तपाईं आफ्नो अध्ययनलाई निरन्तरता दिने, रोजगारी खोज्ने वा व्यवसाय सुरु गर्ने योजनामा हुनुहुन्छ?"
char nepal_plan[form_type] "select_one nepal_plan"
char nepal_plan[form_relevant] "USD {migration_plan} = '2'"
assert missing(src031)
drop src031
assert missing(src032)
drop src032
rename src033 q2_1
label variable q2_1 "2.1 Agreement: politics is central to living in Nepal"
char q2_1[source_name] "q2_1"
notes q2_1: 2.1. To what extent do you agree with the following statement? “Involvement on politics is central to living in Nepal”
char q2_1[question_en] "2.1. To what extent do you agree with the following statement? “Involvement on politics is central to living in Nepal”"
char q2_1[question_ne] "२.१ तलका भनाइहरूसँग तपाईं कत्तिको सहमत हुनुहुन्छ? “नेपालमा जीवन बिताउन राजनीतिमा संलग्नता महत्वपूर्ण छ ।”"
char q2_1[form_type] "select_one agree5"
char q2_1[form_relevant] ""
rename src034 q2_2
label variable q2_2 "2.2 Frequency of following political news"
char q2_2[source_name] "q2_2"
notes q2_2: 2.2.  How often do you follow political news?
char q2_2[question_en] "2.2.  How often do you follow political news?"
char q2_2[question_ne] "२.२ तपाईं राजनीतिक समाचार कत्तिको  हेर्नु वा पढ्नुहुन्छ?"
char q2_2[form_type] "select_one newsfreq"
char q2_2[form_relevant] ""
rename src035 q2_3
label variable q2_3 "2.3 Active involvement in politics/political organizations"
char q2_3[source_name] "q2_3"
notes q2_3: 2.3.  Have you been actively involved in politics/political organizations?
char q2_3[question_en] "2.3.  Have you been actively involved in politics/political organizations?"
char q2_3[question_ne] "२.३ के तपाईं राजनीतिमा वा राजनीतिक संस्थाहरूमा (जस्तै राजनीतिक दल, कलेज/विस्वविध्यालयको  संगठनहरु, दलको भात्री संगठन, टोल सुधार समिति हरु, युवा क्लभहरू)    सक्रिय रूपमा संलग्न हुनुभएको छ/हुनु हुन्छ ?"
char q2_3[form_type] "select_one yes_no_pns"
char q2_3[form_relevant] ""
rename src036 q2_4
label variable q2_4 "2.4 Voted in 2022 federal election"
char q2_4[source_name] "q2_4"
notes q2_4: 2.4.  Did you vote in the 2022 federal election? (Ask only for respondents above or equal to the age of 22)
char q2_4[question_en] "2.4.  Did you vote in the 2022 federal election? (Ask only for respondents above or equal to the age of 22)"
char q2_4[question_ne] "२.४ के तपाईंले २०७९ को प्रतिनिधिसभा निर्वाचनमा मतदान गर्नुभयो?"
char q2_4[form_type] "select_one vote"
char q2_4[form_relevant] "USD {age} >= 22"
rename src037 q2_4_1
label variable q2_4_1 "2.4.1 Reason for not voting: federal"
char q2_4_1[source_name] "q2_4_1"
notes q2_4_1: 2.4.1.  Why didn’t you vote?
char q2_4_1[question_en] "2.4.1.  Why didn’t you vote?"
char q2_4_1[question_ne] "२.४.१ तपाईंले किन मतदान गर्नुभएन?"
char q2_4_1[form_type] "select_one nonvote_reason"
char q2_4_1[form_relevant] "USD {q2_4} = '2'"
rename src038 q2_4_1_other
label variable q2_4_1_other "2.4.1 Other reason for not voting: federal"
char q2_4_1_other[source_name] "Others_Please_Specify"
notes q2_4_1_other: Others Please Specify
char q2_4_1_other[question_en] "Others Please Specify"
char q2_4_1_other[question_ne] "अरु कारण भए खुलाइदिनुहोला "
char q2_4_1_other[form_type] "text"
char q2_4_1_other[form_relevant] "USD {q2_4_1} = 'others_please_specify'"
rename src039 q2_5
label variable q2_5 "2.5 Voted in 2022 provincial election"
char q2_5[source_name] "q2_5"
notes q2_5: 2.5.  Did you vote in the 2022 provincial election? (Ask only for respondents above or equal to the age of 22)
char q2_5[question_en] "2.5.  Did you vote in the 2022 provincial election? (Ask only for respondents above or equal to the age of 22)"
char q2_5[question_ne] "२.५ के तपाईंले २०७९ को प्रदेशसभा निर्वाचनमा मतदान गर्नुभयो?"
char q2_5[form_type] "select_one vote"
char q2_5[form_relevant] "USD {age} >= 22 and USD {q2_4} = '1'"
rename src040 q2_5_1
label variable q2_5_1 "2.5.1 Reason for not voting: provincial"
char q2_5_1[source_name] "q2_5_1"
notes q2_5_1: 2.5.1.  Why didn’t you vote?
char q2_5_1[question_en] "2.5.1.  Why didn’t you vote?"
char q2_5_1[question_ne] "२.५.१ तपाईंले किन मतदान गर्नुभएन?"
char q2_5_1[form_type] "select_one nonvote_reason"
char q2_5_1[form_relevant] "USD {q2_5} = '2'"
rename src041 q2_5_1_other
label variable q2_5_1_other "2.5.1 Other reason for not voting: provincial"
char q2_5_1_other[source_name] "Others_please_specify_001"
notes q2_5_1_other: Others please specify
char q2_5_1_other[question_en] "Others please specify"
char q2_5_1_other[question_ne] "अरु कारण भए खुलाइदिनुहोला "
char q2_5_1_other[form_type] "text"
char q2_5_1_other[form_relevant] "USD {q2_5_1} = 'others_please_specify'"
rename src042 q2_6
label variable q2_6 "2.6 Voted in 2022 local election"
char q2_6[source_name] "q2_6"
notes q2_6: 2.6.  Did you vote in the 2022 local election? (Ask only for respondents above or equal to the age of 22)
char q2_6[question_en] "2.6.  Did you vote in the 2022 local election? (Ask only for respondents above or equal to the age of 22)"
char q2_6[question_ne] "२.६ के तपाईंले २०७९ को स्थानीय तह निर्वाचनमा मतदान गर्नुभयो?"
char q2_6[form_type] "select_one vote"
char q2_6[form_relevant] "USD {age} >= 22"
rename src043 q2_6_1
label variable q2_6_1 "2.6.1 Reason for not voting: local"
char q2_6_1[source_name] "q2_6_1"
notes q2_6_1: 2.6.1.  Why didn’t you vote?
char q2_6_1[question_en] "2.6.1.  Why didn’t you vote?"
char q2_6_1[question_ne] "२.६.१ तपाईंले किन मतदान गर्नुभएन?"
char q2_6_1[form_type] "select_one nonvote_reason"
char q2_6_1[form_relevant] "USD {q2_6} = '2'"
rename src044 q2_6_1_other
label variable q2_6_1_other "2.6.1 Other reason for not voting: local"
char q2_6_1_other[source_name] "Others_please_specify_002"
notes q2_6_1_other: Others please specify
char q2_6_1_other[question_en] "Others please specify"
char q2_6_1_other[question_ne] "अरु कारण भए खुलाइदिनुहोला "
char q2_6_1_other[form_type] "text"
char q2_6_1_other[form_relevant] "USD {q2_6_1} = 'others_please_specify'"
assert missing(src045)
drop src045
rename src046 q2_7
label variable q2_7 "2.7 Likelihood of voting in 2027 local elections"
char q2_7[source_name] "q2_7"
notes q2_7: 2.7.  How likely are you to vote in the upcoming 2027 local elections?
char q2_7[question_en] "2.7.  How likely are you to vote in the upcoming 2027 local elections?"
char q2_7[question_ne] "२.७ आगामी २०८४ को स्थानीय तह निर्वाचनमा तपाईंले मतदान गर्ने सम्भावना कत्तिको छ?"
char q2_7[form_type] "select_one future_vote"
char q2_7[form_relevant] ""
rename src047 q2_7_1
label variable q2_7_1 "2.7.1 Reason unlikely to vote in 2027 local elections"
char q2_7_1[source_name] "q2_7_1"
notes q2_7_1: 2.7.1.  Why are you unlikely to vote?
char q2_7_1[question_en] "2.7.1.  Why are you unlikely to vote?"
char q2_7_1[question_ne] "२.७.१ तपाईंले मतदान गर्ने सम्भावना कम हुनुको मुख्य कारण के हो?"
char q2_7_1[form_type] "select_one unlikely_reason"
char q2_7_1[form_relevant] "USD {q2_7} = '3' or USD {q2_7} = '4'"
assert missing(src048)
drop src048
assert missing(src049)
drop src049
rename src050 q2_8_1
label variable q2_8_1 "2.8.1 Past 12 months: Attended campaign/rally"
char q2_8_1[source_name] "q2_8_1"
notes q2_8_1: Attend a political campaign or election rally
char q2_8_1[question_en] "Attend a political campaign or election rally"
char q2_8_1[question_ne] "राजनीतिक अभियान वा चुनावी सभामा सहभागी भएको"
char q2_8_1[form_type] "select_one civic_yes_no"
char q2_8_1[form_relevant] ""
rename src051 q2_8_2
label variable q2_8_2 "2.8.2 Past 12 months: Volunteered for party/campaign"
char q2_8_2[source_name] "q2_8_2"
notes q2_8_2: Volunteered for a political party or election campaign
char q2_8_2[question_en] "Volunteered for a political party or election campaign"
char q2_8_2[question_ne] "राजनीतिक दल वा निर्वाचन अभियानमा स्वयंसेवकका रूपमा काम गरेको"
char q2_8_2[form_type] "select_one civic_yes_no"
char q2_8_2[form_relevant] ""
rename src052 q2_8_3
label variable q2_8_3 "2.8.3 Past 12 months: Joined protest/demonstration"
char q2_8_3[source_name] "q2_8_3"
notes q2_8_3: Participated in protest/demonstration
char q2_8_3[question_en] "Participated in protest/demonstration"
char q2_8_3[question_ne] "विरोध/प्रदर्शनमा सहभागी भएको"
char q2_8_3[form_type] "select_one civic_yes_no"
char q2_8_3[form_relevant] ""
rename src053 q2_8_4
label variable q2_8_4 "2.8.4 Past 12 months: Joined public meeting/discussion"
char q2_8_4[source_name] "q2_8_4"
notes q2_8_4: Participated in a public meeting/ discussion
char q2_8_4[question_en] "Participated in a public meeting/ discussion"
char q2_8_4[question_ne] "सार्वजनिक बैठक/छलफलमा सहभागी भएको"
char q2_8_4[form_type] "select_one civic_yes_no"
char q2_8_4[form_relevant] ""
rename src054 q2_8_5
label variable q2_8_5 "2.8.5 Past 12 months: Contacted elected representative"
char q2_8_5[source_name] "q2_8_5"
notes q2_8_5: Contacted an elected representative to raise an issue
char q2_8_5[question_en] "Contacted an elected representative to raise an issue"
char q2_8_5[question_ne] "कुनै विषय उठाउन निर्वाचित प्रतिनिधिसँग सम्पर्क गरेको"
char q2_8_5[form_type] "select_one civic_yes_no"
char q2_8_5[form_relevant] ""
rename src055 q2_8_6
label variable q2_8_6 "2.8.6 Past 12 months: Joined ward user committee"
char q2_8_6[source_name] "q2_8_6"
notes q2_8_6: Become a member of the user’s committee at your ward
char q2_8_6[question_en] "Become a member of the user’s committee at your ward"
char q2_8_6[question_ne] "आफ्नो वडाको उपभोक्ता समितिको सदस्य बनेको"
char q2_8_6[form_type] "select_one civic_yes_no"
char q2_8_6[form_relevant] ""
rename src056 q2_9
label variable q2_9 "2.9 Confidence in influencing government decisions"
char q2_9[source_name] "q2_9"
notes q2_9: 2.9.  How confident are you that people like you can influence government decisions?
char q2_9[question_en] "2.9.  How confident are you that people like you can influence government decisions?"
char q2_9[question_ne] "२.९ हजुरको उमेर समुहको नागरिकहरुले  सरकारी निर्णयहरूमा प्रभाव पार्न सक्छन् भन्ने कुरामा तपाईं कत्तिको विश्वस्त हुनुहुन्छ?"
char q2_9[form_type] "select_one confidence"
char q2_9[form_relevant] ""
assert missing(src057)
drop src057
assert missing(src058)
drop src058
rename src059 q3_1_1
label variable q3_1_1 "Nepal instability cause: Government changes/party conflict"
char q3_1_1[source_name] "q3_1_1"
notes q3_1_1: 3.1.1  Frequent change in government and political conflict within and between parties causes political instability in Nepal.
char q3_1_1[question_en] "3.1.1  Frequent change in government and political conflict within and between parties causes political instability in Nepal."
char q3_1_1[question_ne] "३.१.१ सरकारमा बारम्बार हुने परिवर्तन तथा दलभित्र र दलहरूबीचको राजनीतिक द्वन्द्वले नेपालमा राजनीतिक अस्थिरता निम्त्याउँछ।"
char q3_1_1[form_type] "select_one agree5"
char q3_1_1[form_relevant] ""
rename src060 q3_1_2
label variable q3_1_2 "Nepal instability cause: Policy formulation failure"
char q3_1_2[source_name] "q3_1_2"
notes q3_1_2: 3.1.2 Inability of the government to formulate policies causes political instability in Nepal.
char q3_1_2[question_en] "3.1.2 Inability of the government to formulate policies causes political instability in Nepal."
char q3_1_2[question_ne] "३.१.२ सरकारले नीति बनाउन नसक्दा नेपालमा राजनीतिक अस्थिरता निम्तिन्छ।"
char q3_1_2[form_type] "select_one agree5"
char q3_1_2[form_relevant] ""
rename src061 q3_1_2_001
label variable q3_1_2_001 "Nepal instability cause: Policy implementation failure"
char q3_1_2_001[source_name] "q3_1_2_001"
notes q3_1_2_001: 3.1.3 Inability of the government to implement its policies causes political instability in Nepal.
char q3_1_2_001[question_en] "3.1.3 Inability of the government to implement its policies causes political instability in Nepal."
char q3_1_2_001[question_ne] "३.१.२ सरकारले नीति कार्यान्वयन गर्न नसक्दा नेपालमा राजनीतिक अस्थिरता निम्तिन्छ।"
char q3_1_2_001[form_type] "select_one vx7xv18"
char q3_1_2_001[form_relevant] ""
rename src062 q3_1_3
label variable q3_1_3 "Nepal instability cause: Corruption"
char q3_1_3[source_name] "q3_1_3"
notes q3_1_3: 3.1.4 Corruption causes political instability.
char q3_1_3[question_en] "3.1.4 Corruption causes political instability."
char q3_1_3[question_ne] "३.१.४ भ्रष्टाचारले राजनीतिक अस्थिरता निम्त्याउँछ।"
char q3_1_3[form_type] "select_one agree5"
char q3_1_3[form_relevant] ""
rename src063 q3_1_3_001
label variable q3_1_3_001 "Nepal instability cause: Lack of accountability"
char q3_1_3_001[source_name] "q3_1_3_001"
notes q3_1_3_001: 3.1.5 Lack of Accountability causes political instability.
char q3_1_3_001[question_en] "3.1.5 Lack of Accountability causes political instability."
char q3_1_3_001[question_ne] "३.१.५ पारदर्शिताको कमिले  राजनीतिक अस्थिरता निम्त्याउँछ।"
char q3_1_3_001[form_type] "select_one fx1wd71"
char q3_1_3_001[form_relevant] ""
rename src064 q3_1_4
label variable q3_1_4 "Nepal instability cause: Protests/violence/civic unrest"
char q3_1_4[source_name] "q3_1_4"
notes q3_1_4: 3.1.6 Frequent public protests, demonstration, violence and civic unrest cause political instability.
char q3_1_4[question_en] "3.1.6 Frequent public protests, demonstration, violence and civic unrest cause political instability."
char q3_1_4[question_ne] "३.१.६ बारम्बार हुने सार्वजनिक विरोध, प्रदर्शन, हिंसा र नागरिक अशान्तिले राजनीतिक अस्थिरता निम्त्याउँछ।"
char q3_1_4[form_type] "select_one agree5"
char q3_1_4[form_relevant] ""
rename src065 q3_1_5
label variable q3_1_5 "Nepal instability cause: Transfers of government officials"
char q3_1_5[source_name] "q3_1_5"
notes q3_1_5: 3.1.7 Frequent transfer of government officials causes political instability.
char q3_1_5[question_en] "3.1.7 Frequent transfer of government officials causes political instability."
char q3_1_5[question_ne] "३.१.७ सरकारी अधिकारीहरूको बारम्बार सरुवाले राजनीतिक अस्थिरता निम्त्याउँछ।"
char q3_1_5[form_type] "select_one agree5"
char q3_1_5[form_relevant] ""
rename src066 q3_1_6
label variable q3_1_6 "Nepal instability cause: Conflict between government tiers"
char q3_1_6[source_name] "q3_1_6"
notes q3_1_6: 3.1.6 Conflict between different tiers of government causes political instability
char q3_1_6[question_en] "3.1.6 Conflict between different tiers of government causes political instability"
char q3_1_6[question_ne] "३.१.८ सरकारका विभिन्न तहबीचको (संघ, प्रदेश र स्थानीय) द्वन्द्वले राजनीतिक अस्थिरता निम्त्याउँछ।"
char q3_1_6[form_type] "select_one agree5"
char q3_1_6[form_relevant] ""
rename src067 q3_1_7
label variable q3_1_7 "Nepal instability cause: Foreign/external influence"
char q3_1_7[source_name] "q3_1_7"
notes q3_1_7: 3.1.7 Foreign/External influence causes political instability.
char q3_1_7[question_en] "3.1.7 Foreign/External influence causes political instability."
char q3_1_7[question_ne] "३.१.९ विदेशी/बाह्य प्रभावले राजनीतिक अस्थिरता निम्त्याउँछ।"
char q3_1_7[form_type] "select_one agree5"
char q3_1_7[form_relevant] ""
rename src068 q3_2
label variable q3_2 "3.2 Political stability of Nepal today"
char q3_2[source_name] "q3_2"
notes q3_2: 3.2.  How would you rate the political stability of Nepal today?
char q3_2[question_en] "3.2.  How would you rate the political stability of Nepal today?"
char q3_2[question_ne] "३.२ आजको अवस्थामा नेपालको राजनीतिक स्थिरतालाई तपाईं कसरी मूल्याङ्कन गर्नुहुन्छ?"
char q3_2[form_type] "select_one stability"
char q3_2[form_relevant] ""
rename src069 q3_3
label variable q3_3 "3.3 Nepal stability compared with one year ago"
char q3_3[source_name] "q3_3"
notes q3_3: 3.3.  Compared to one year ago, Nepal is politically:
char q3_3[question_en] "3.3.  Compared to one year ago, Nepal is politically:"
char q3_3[question_ne] "३.३ एक वर्षअघिको तुलनामा नेपालको राजनीतिक अवस्था:"
char q3_3[form_type] "select_one comparison"
char q3_3[form_relevant] ""
rename src070 q3_4
label variable q3_4 "3.4 Nepal stability compared with five years ago"
char q3_4[source_name] "q3_4"
notes q3_4: 3.4.  Compared to five years ago, Nepal is politically:
char q3_4[question_en] "3.4.  Compared to five years ago, Nepal is politically:"
char q3_4[question_ne] "३.४ पाँच वर्षअघिको तुलनामा नेपालको राजनीतिक अवस्था:"
char q3_4[form_type] "select_one comparison"
char q3_4[form_relevant] ""
rename src071 q3_5
label variable q3_5 "3.5 Expected Nepal stability in five years"
char q3_5[source_name] "q3_5"
notes q3_5: 3.5.  Compared to now, in 5 years Nepal will be:
char q3_5[question_en] "3.5.  Compared to now, in 5 years Nepal will be:"
char q3_5[question_ne] "३.५ अहिलेको तुलनामा पाँच वर्षपछि नेपालको राजनीतिक अवस्था कस्तो हुनेछ?"
char q3_5[form_type] "select_one comparison"
char q3_5[form_relevant] ""
assert missing(src072)
drop src072
rename src073 q3_6
label variable q3_6 "3.6 Likelihood government changes within one year"
char q3_6[source_name] "q3_6"
notes q3_6: 3.6.  How likely do you think the government will change in the next one year?
char q3_6[question_en] "3.6.  How likely do you think the government will change in the next one year?"
char q3_6[question_ne] "३.६ आगामी एक वर्षमा सरकार परिवर्तन हुने सम्भावना कत्तिको छ भन्ने तपाईंलाई लाग्छ?"
char q3_6[form_type] "select_one likelihood"
char q3_6[form_relevant] ""
rename src074 q3_7
label variable q3_7 "3.7 Likelihood government changes before next federal election"
char q3_7[source_name] "q3_7"
notes q3_7: 3.7.  How likely do you think the government will change before the next federal election?
char q3_7[question_en] "3.7.  How likely do you think the government will change before the next federal election?"
char q3_7[question_ne] "३.७ अर्को प्रतिनिधिसभा निर्वाचनअघि सरकार परिवर्तन हुने सम्भावना कत्तिको छ भन्ने तपाईंलाई लाग्छ?"
char q3_7[form_type] "select_one likelihood"
char q3_7[form_relevant] ""
rename src075 q3_8
label variable q3_8 "3.8 Likelihood of major political event within five years"
char q3_8[source_name] "q3_8"
notes q3_8: 3.8.  How likely do you think Nepal will experience a major political event, movement or revolution within the next five years?
char q3_8[question_en] "3.8.  How likely do you think Nepal will experience a major political event, movement or revolution within the next five years?"
char q3_8[question_ne] "३.८ आगामी पाँच वर्षभित्र नेपालमा कुनै ठूलो राजनीतिक घटना, आन्दोलन वा राजनीतिक परिवर्तन हुने सम्भावना कत्तिको छ?"
char q3_8[form_type] "select_one likelihood"
char q3_8[form_relevant] ""
rename src076 q3_9
label variable q3_9 "3.9 Likelihood of new political force within five years"
char q3_9[source_name] "q3_9"
notes q3_9: 3.9.  How likely is a new political party or political force to emerge in the next five years?
char q3_9[question_en] "3.9.  How likely is a new political party or political force to emerge in the next five years?"
char q3_9[question_ne] "३.९ आगामी पाँच वर्षमा नयाँ राजनीतिक दल वा राजनीतिक शक्ति उदाउने सम्भावना कत्तिको छ?"
char q3_9[form_type] "select_one likelihood"
char q3_9[form_relevant] ""
assert missing(src077)
drop src077
rename src078 q3_10_11
label variable q3_10_11 "Nepal stability risk: Corruption"
char q3_10_11[source_name] "q3_10_11"
notes q3_10_11: 3.10.1 Corruption poses a great risk to political stability in Nepal.
char q3_10_11[question_en] "3.10.1 Corruption poses a great risk to political stability in Nepal."
char q3_10_11[question_ne] "३.१०.१ भ्रष्टाचारले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
char q3_10_11[form_type] "select_one agree5"
char q3_10_11[form_relevant] ""
rename src079 q3_10_11_001
label variable q3_10_11_001 "Nepal stability risk: Lack of accountability"
char q3_10_11_001[source_name] "q3_10_11_001"
notes q3_10_11_001: 3.10.2 lack of accountability poses a great risk to political stability in Nepal.
char q3_10_11_001[question_en] "3.10.2 lack of accountability poses a great risk to political stability in Nepal."
char q3_10_11_001[question_ne] "३.१०.२ जवाफदेहिताको कमीले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
char q3_10_11_001[form_type] "select_one sn7om92"
char q3_10_11_001[form_relevant] ""
rename src080 q3_10_12
label variable q3_10_12 "Nepal stability risk: Unemployment/economic opportunities"
char q3_10_12[source_name] "q3_10_12"
notes q3_10_12: 3.10.3 Unemployment and lack of economic opportunities pose a great risk to political stability in Nepal.
char q3_10_12[question_en] "3.10.3 Unemployment and lack of economic opportunities pose a great risk to political stability in Nepal."
char q3_10_12[question_ne] "३.१०.३ बेरोजगारी र आर्थिक अवसरको कमीले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
char q3_10_12[form_type] "select_one agree5"
char q3_10_12[form_relevant] ""
rename src081 q3_10_13
label variable q3_10_13 "Nepal stability risk: Political exclusion"
char q3_10_13[source_name] "q3_10_13"
notes q3_10_13: 3.10.3 Political exclusion of certain groups poses a great risk to political stability in Nepal.
char q3_10_13[question_en] "3.10.3 Political exclusion of certain groups poses a great risk to political stability in Nepal."
char q3_10_13[question_ne] "३.१०.४ राज्य संयत्रमा  सामवेशिताको कमीले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
char q3_10_13[form_type] "select_one agree5"
char q3_10_13[form_relevant] ""
rename src082 q3_10_14
label variable q3_10_14 "Nepal stability risk: Rising cost of living"
char q3_10_14[source_name] "q3_10_14"
notes q3_10_14: 3.10.4 Rising cost of living poses a great risk to political stability in Nepal.
char q3_10_14[question_en] "3.10.4 Rising cost of living poses a great risk to political stability in Nepal."
char q3_10_14[question_ne] "३.१०.५ बढ्दो महंगीले भविष्यमा  नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
char q3_10_14[form_type] "select_one agree5"
char q3_10_14[form_relevant] ""
rename src083 q3_10_15
label variable q3_10_15 "Nepal stability risk: Social media misinformation"
char q3_10_15[source_name] "q3_10_15"
notes q3_10_15: 3.10.5 Misinformation through social media poses a great risk to political stability in Nepal.
char q3_10_15[question_en] "3.10.5 Misinformation through social media poses a great risk to political stability in Nepal."
char q3_10_15[question_ne] "३.१०.६ सामाजिक सञ्जालमार्फत फैलिने गलत/मिथ्य/भ्रामक  सूचनाले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
char q3_10_15[form_type] "select_one agree5"
char q3_10_15[form_relevant] ""
rename src084 q3_10_16
label variable q3_10_16 "Nepal stability risk: Foreign/external influence"
char q3_10_16[source_name] "q3_10_16"
notes q3_10_16: 3.10.6 Influence of foreign/external forces poses a great risk to political stability in Nepal.
char q3_10_16[question_en] "3.10.6 Influence of foreign/external forces poses a great risk to political stability in Nepal."
char q3_10_16[question_ne] "३.१०.७ विदेशी/बाह्य शक्तिको प्रभावले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
char q3_10_16[form_type] "select_one agree5"
char q3_10_16[form_relevant] ""
rename src085 q3_10_17
label variable q3_10_17 "Nepal stability risk: Ethnic/religious conflict"
char q3_10_17[source_name] "q3_10_17"
notes q3_10_17: 3.10.7 Ethnic or religious tension/conflict poses a great risk to political stability in Nepal.
char q3_10_17[question_en] "3.10.7 Ethnic or religious tension/conflict poses a great risk to political stability in Nepal."
char q3_10_17[question_ne] "३.१०.८ जातीय वा धार्मिक तनाव/द्वन्द्वले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ |"
char q3_10_17[form_type] "select_one agree5"
char q3_10_17[form_relevant] ""
assert missing(src086)
drop src086
rename src087 q3_11_1
label variable q3_11_1 "Nepal hope: Governance/anti-corruption reforms"
char q3_11_1[source_name] "q3_11_1"
notes q3_11_1: 3.11.1 I am hopeful for Nepal’s future because it had adopted better governance and anti-corruption reforms.
char q3_11_1[question_en] "3.11.1 I am hopeful for Nepal’s future because it had adopted better governance and anti-corruption reforms."
char q3_11_1[question_ne] "३.११.१ नेपालले सुशासन र भ्रष्टाचारविरोधी सुधारहरू अपनाएकोले म नेपालको भविष्यप्रति आशावादी छु।"
char q3_11_1[form_type] "select_one agree5"
char q3_11_1[form_relevant] ""
rename src088 q3_11_2
label variable q3_11_2 "Nepal hope: Youth political participation"
char q3_11_2[source_name] "q3_11_2"
notes q3_11_2: 3.11.2 I am hopeful about Nepal’s future because of greater youth participation in politics.
char q3_11_2[question_en] "3.11.2 I am hopeful about Nepal’s future because of greater youth participation in politics."
char q3_11_2[question_ne] "३.११.२ राजनीतिमा युवाहरूको बढ्दो सहभागिताका कारण म नेपालको भविष्यप्रति आशावादी छु।"
char q3_11_2[form_type] "select_one agree5"
char q3_11_2[form_relevant] ""
rename src089 q3_11_3
label variable q3_11_3 "Nepal hope: Improved democracy"
char q3_11_3[source_name] "q3_11_3"
notes q3_11_3: 3.11.3 I am hopeful about Nepal’s future because of the state of the democracy has improved.
char q3_11_3[question_en] "3.11.3 I am hopeful about Nepal’s future because of the state of the democracy has improved."
char q3_11_3[question_ne] "३.११.३ लोकतन्त्रको अवस्था सुधार भएकोले म नेपालको भविष्यप्रति आशावादी छु।"
char q3_11_3[form_type] "select_one agree5"
char q3_11_3[form_relevant] ""
rename src090 q3_11_4
label variable q3_11_4 "Nepal hope: Economic/employment prospects"
char q3_11_4[source_name] "q3_11_4"
notes q3_11_4: 3.11.4 I am hopeful about Nepal’s future because economic and employment prospect is in increasing trend.
char q3_11_4[question_en] "3.11.4 I am hopeful about Nepal’s future because economic and employment prospect is in increasing trend."
char q3_11_4[question_ne] "३.११.४ आर्थिक तथा रोजगारीका सम्भावना बढ्दो क्रममा रहेकाले म नेपालको भविष्यप्रति आशावादी छु।"
char q3_11_4[form_type] "select_one agree5"
char q3_11_4[form_relevant] ""
assert missing(src091)
drop src091
assert missing(src092)
drop src092
rename src093 q4_1
label variable q4_1 "4.1 Attention to September 8 Gen-Z protest and subsequent politics"
char q4_1[source_name] "q4_1"
notes q4_1: 4.1.  How closely have you followed the September 8 Gen-Z protest and the subsequent political happenings in Nepal?
char q4_1[question_en] "4.1.  How closely have you followed the September 8 Gen-Z protest and the subsequent political happenings in Nepal?"
char q4_1[question_ne] "४.१ भदौ २३ र २४  को Gen-Z आन्दोलन र त्यसपछि नेपालमा भएका राजनीतिक घटनाक्रमलाई तपाईंले कत्तिको नजिकबाट चासो राख्नु भएको  थियो ?"
char q4_1[form_type] "select_one follow_genz"
char q4_1[form_relevant] ""
assert missing(src094)
drop src094
rename src095 q4_2_1
label variable q4_2_1 "Gen-Z protest cause: Corruption"
char q4_2_1[source_name] "q4_2_1"
notes q4_2_1: 4.2.1 Widescale corruption are reasons behind the Gen-Z protest in Nepal.
char q4_2_1[question_en] "4.2.1 Widescale corruption are reasons behind the Gen-Z protest in Nepal."
char q4_2_1[question_ne] "४.२.१ व्यापक भ्रष्टाचार नेपालमा Gen-Z आन्दोलन हुनुका कारण हुन्।"
char q4_2_1[form_type] "select_one agree5"
char q4_2_1[form_relevant] ""
rename src096 q4_2_2
label variable q4_2_2 "Gen-Z protest cause: Poor public services"
char q4_2_2[source_name] "q4_2_2"
notes q4_2_2: 4.2.2 Poor public service delivery are reasons behind the Gen-Z protest in Nepal.
char q4_2_2[question_en] "4.2.2 Poor public service delivery are reasons behind the Gen-Z protest in Nepal."
char q4_2_2[question_ne] "४.२.२ कमजोर सार्वजनिक सेवा प्रवाह नेपालमा Gen-Z आन्दोलन हुनुका कारण हुन्।"
char q4_2_2[form_type] "select_one agree5"
char q4_2_2[form_relevant] ""
rename src097 q4_2_3
label variable q4_2_3 "Gen-Z protest cause: Unemployment/economic opportunities"
char q4_2_3[source_name] "q4_2_3"
notes q4_2_3: 4.2.3 Unemployment and lack of economic opportunities reasons behind Gen-Z protest in Nepal.
char q4_2_3[question_en] "4.2.3 Unemployment and lack of economic opportunities reasons behind Gen-Z protest in Nepal."
char q4_2_3[question_ne] "४.२.३ बेरोजगारी र आर्थिक अवसरको कमी नेपालमा Gen-Z आन्दोलन हुनुका कारण हुन्।"
char q4_2_3[form_type] "select_one agree5"
char q4_2_3[form_relevant] ""
rename src098 q4_2_4
label variable q4_2_4 "Gen-Z protest cause: Rising cost of living"
char q4_2_4[source_name] "q4_2_4"
notes q4_2_4: 4.2.4 Rising cost of living is the reason behind Gen-Z protest in Nepal.
char q4_2_4[question_en] "4.2.4 Rising cost of living is the reason behind Gen-Z protest in Nepal."
char q4_2_4[question_ne] "४.२.४ बढ्दो महंगी  नेपालमा Gen-Z आन्दोलन हुनुको कारण हो।"
char q4_2_4[form_type] "select_one agree5"
char q4_2_4[form_relevant] ""
rename src099 q4_2_5
label variable q4_2_5 "Gen-Z protest cause: Distrust of leaders/parties/institutions"
char q4_2_5[source_name] "q4_2_5"
notes q4_2_5: 4.2.5 Lack of trust in political leaders, parties, and government institutions are the reasons behind Gen-Z protest in Nepal.
char q4_2_5[question_en] "4.2.5 Lack of trust in political leaders, parties, and government institutions are the reasons behind Gen-Z protest in Nepal."
char q4_2_5[question_ne] "४.२.५ राजनीतिक नेता, दल र सरकारी संस्थाप्रतिको विश्वासको कमी नेपालमा Gen-Z आन्दोलन हुनुका कारण हुन्।"
char q4_2_5[form_type] "select_one agree5"
char q4_2_5[form_relevant] ""
rename src100 q4_2_6
label variable q4_2_6 "Gen-Z protest cause: Nepotism/elite capture"
char q4_2_6[source_name] "q4_2_6"
notes q4_2_6: 4.2.6 Nepotism and elite capture are the reasons behind Gen-Z protest in Nepal.
char q4_2_6[question_en] "4.2.6 Nepotism and elite capture are the reasons behind Gen-Z protest in Nepal."
char q4_2_6[question_ne] "४.२.६ नातावाद र सीमित पहुचयोग्य  वर्गको वर्चस्वनै  नेपालमा Gen-Z आन्दोलन हुनुका कारण हुन्।"
char q4_2_6[form_type] "select_one agree5"
char q4_2_6[form_relevant] ""
rename src101 q4_2_7
label variable q4_2_7 "Gen-Z protest cause: Social media ban"
char q4_2_7[source_name] "q4_2_7"
notes q4_2_7: 4.2.7 Sudden ban of social media is the reason behind Gen-Z protest in Nepal.
char q4_2_7[question_en] "4.2.7 Sudden ban of social media is the reason behind Gen-Z protest in Nepal."
char q4_2_7[question_ne] "४.२.७ सामाजिक सञ्जालमाथिको अचानक लगाइएको प्रतिबन्ध नेपालमा Gen-Z आन्दोलन हुनुको कारण हो।"
char q4_2_7[form_type] "select_one agree5"
char q4_2_7[form_relevant] ""
rename src102 q4_2_8
label variable q4_2_8 "Gen-Z protest cause: Foreign/external influence"
char q4_2_8[source_name] "q4_2_8"
notes q4_2_8: 4.2.8 External influence or outside forces is the major reason behind Gen-Z protest in Nepal.
char q4_2_8[question_en] "4.2.8 External influence or outside forces is the major reason behind Gen-Z protest in Nepal."
char q4_2_8[question_ne] "४.२.८ बाह्य प्रभाव वा बाह्य शक्तिहरू नेपालमा Gen-Z आन्दोलन हुनुको प्रमुख कारण हो।"
char q4_2_8[form_type] "select_one agree5"
char q4_2_8[form_relevant] ""
rename src103 q4_3
label variable q4_3 "4.3 Gen-Z protest: turning point in political history"
char q4_3[source_name] "q4_3"
notes q4_3: 4.3.  To what extent do you agree that the recent Gen-Z protest represents a turning point in Nepal’s political history?
char q4_3[question_en] "4.3.  To what extent do you agree that the recent Gen-Z protest represents a turning point in Nepal’s political history?"
char q4_3[question_ne] "४.३ हालैको Gen-Z आन्दोलनले नेपालको राजनीतिक इतिहासमा एउटा महत्वपूर्ण मोड ल्याएको छ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
char q4_3[form_type] "select_one agree5"
char q4_3[form_relevant] ""
rename src104 q4_4
label variable q4_4 "4.4 Gen-Z protest: greater youth civic/political participation"
char q4_4[source_name] "q4_4"
notes q4_4: 4.4.  To what extent do you agree that the Gen-Z protest has encouraged greater civic and political participation among young people? Gen-Z
char q4_4[question_en] "4.4.  To what extent do you agree that the Gen-Z protest has encouraged greater civic and political participation among young people? Gen-Z"
char q4_4[question_ne] "४.४ आन्दोलनले युवाहरूको सामाजिक  तथा राजनीतिक सहभागिता बढाउन प्रोत्साहन गरेको छ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
char q4_4[form_type] "select_one agree5"
char q4_4[form_relevant] ""
rename src105 q4_5
label variable q4_5 "4.5 Gen-Z protest: youth voices included in mainstream politics"
char q4_5[source_name] "q4_5"
notes q4_5: 4.5.  To what extent do you agree Gen-Z protest have led to inclusion of youth voices into mainstream politics? Gen-Z
char q4_5[question_en] "4.5.  To what extent do you agree Gen-Z protest have led to inclusion of youth voices into mainstream politics? Gen-Z"
char q4_5[question_ne] "४.५ आन्दोलनले युवाहरूका आवाजलाई मूलधारको राजनीतिमा समेट्न योगदान गरेको छ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
char q4_5[form_type] "select_one agree5"
char q4_5[form_relevant] ""
rename src106 q4_6
label variable q4_6 "4.6 Gen-Z protest: increased public support for RSP"
char q4_6[source_name] "q4_6"
notes q4_6: 4.6.  To what extent do you agree that the Gen Z protest contributed to the rise of public support for the Rastriya Swatantra Party (RSP)? Gen-Z
char q4_6[question_en] "4.6.  To what extent do you agree that the Gen Z protest contributed to the rise of public support for the Rastriya Swatantra Party (RSP)? Gen-Z"
char q4_6[question_ne] "४.६ आन्दोलनले हालको बहुमत प्राप्त सरकार प्रति जनसमर्थन बढाउन योगदान गरेको छ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
char q4_6[form_type] "select_one agree5"
char q4_6[form_relevant] ""
rename src107 q4_7
label variable q4_7 "4.7 Current government represents youth interests"
char q4_7[source_name] "q4_7"
notes q4_7: 4.7.  To what extent do you agree that the current government represents the interests of the young generation in Nepal?
char q4_7[question_en] "4.7.  To what extent do you agree that the current government represents the interests of the young generation in Nepal?"
char q4_7[question_ne] "४.७ हालको सरकारले नेपालका युवापुस्ताको हितको प्रतिनिधित्व गर्छ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
char q4_7[form_type] "select_one agree5"
char q4_7[form_relevant] ""
rename src108 q4_8
label variable q4_8 "4.8 Government will continue to advance youth interests"
char q4_8[source_name] "q4_8"
notes q4_8: 4.8.  To what extent do you agree that the current government will continue to represent and advance the interest of young people?
char q4_8[question_en] "4.8.  To what extent do you agree that the current government will continue to represent and advance the interest of young people?"
char q4_8[question_ne] "४.८ हालको सरकारले आगामी दिनमा पनि युवाहरूको हितको प्रतिनिधित्व र प्रवर्द्धन गरिरहनेछ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
char q4_8[form_type] "select_one agree5"
char q4_8[form_relevant] ""
assert missing(src109)
drop src109
assert missing(src110)
drop src110
rename src111 q5_1
label variable q5_1 "5.1 Attention to protests in other Asian countries"
char q5_1[source_name] "q5_1"
notes q5_1: 5.1.  How closely have you followed Gen-Z or other protests in other Asian countries Indonesia, Bangladesh, Sri Lanka, and India?
char q5_1[question_en] "5.1.  How closely have you followed Gen-Z or other protests in other Asian countries Indonesia, Bangladesh, Sri Lanka, and India?"
char q5_1[question_ne] "५.१ इन्डोनेसिया, बंगलादेश, श्रीलंका र भारतलगायत अन्य एसियाली देशहरूमा भएका Gen-Z वा अन्य आन्दोलनलाई तपाईंले कत्तिको नजिकबाट चासो  राख्नु भएको छ?"
char q5_1[form_type] "select_one south_follow"
char q5_1[form_relevant] ""
assert missing(src112)
drop src112
rename src113 q5_2_1
label variable q5_2_1 "South Asia dissent cause: Governance/corruption/public services"
char q5_2_1[source_name] "q5_2_1"
notes q5_2_1: 5.2.1 Young people in South Asia are expressing their dissent against the existing political regime because of lack good governance, rampant corruption, and poor public service delivery.
char q5_2_1[question_en] "5.2.1 Young people in South Asia are expressing their dissent against the existing political regime because of lack good governance, rampant corruption, and poor public service delivery."
char q5_2_1[question_ne] "५.२.१ दक्षिण एसियाका युवाहरूले सुशासनको कमी, व्यापक भ्रष्टाचार र कमजोर सार्वजनिक सेवा प्रवाहका कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
char q5_2_1[form_type] "select_one agree6"
char q5_2_1[form_relevant] ""
rename src114 q5_2_2
label variable q5_2_2 "South Asia dissent cause: Unemployment/economic opportunities"
char q5_2_2[source_name] "q5_2_2"
notes q5_2_2: 5.2.2 Young people in South Asia are expressing their dissent against the existing political regime because of unemployment and lack of economic opportunities.
char q5_2_2[question_en] "5.2.2 Young people in South Asia are expressing their dissent against the existing political regime because of unemployment and lack of economic opportunities."
char q5_2_2[question_ne] "५.२.२ दक्षिण एसियाका युवाहरूले बेरोजगारी र आर्थिक अवसरको कमीका कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
char q5_2_2[form_type] "select_one agree6"
char q5_2_2[form_relevant] ""
rename src115 q5_2_3
label variable q5_2_3 "South Asia dissent cause: Distrust of leaders/parties/institutions"
char q5_2_3[source_name] "q5_2_3"
notes q5_2_3: 5.2.3 Young people in South Asia are expressing their dissent against the existing political regime because of lack of trust in political leaders, political parties, and government institutions
char q5_2_3[question_en] "5.2.3 Young people in South Asia are expressing their dissent against the existing political regime because of lack of trust in political leaders, political parties, and government institutions"
char q5_2_3[question_ne] "५.२.३ दक्षिण एसियाका युवाहरूले राजनीतिक नेता, दल र सरकारी संस्थाप्रतिको विश्वासको कमीका कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
char q5_2_3[form_type] "select_one agree6"
char q5_2_3[form_relevant] ""
rename src116 q5_2_4
label variable q5_2_4 "South Asia dissent cause: Political exclusion"
char q5_2_4[source_name] "q5_2_4"
notes q5_2_4: 5.2.4 Young people in South Asia are expressing their dissent against the existing political regime because of their exclusion from politics.
char q5_2_4[question_en] "5.2.4 Young people in South Asia are expressing their dissent against the existing political regime because of their exclusion from politics."
char q5_2_4[question_ne] "५.२.४ दक्षिण एसियाका युवाहरूले राजनीतिबाट आफूहरू बहिष्कृत भएको कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
char q5_2_4[form_type] "select_one agree6"
char q5_2_4[form_relevant] ""
rename src117 q5_2_5
label variable q5_2_5 "South Asia dissent cause: Nepotism/elite capture"
char q5_2_5[source_name] "q5_2_5"
notes q5_2_5: 5.2.5 Young people in South Asia are expressing their dissent against the existing political regime because of nepotism and elite capture.
char q5_2_5[question_en] "5.2.5 Young people in South Asia are expressing their dissent against the existing political regime because of nepotism and elite capture."
char q5_2_5[question_ne] "५.२.५ दक्षिण एसियाका युवाहरूले नातावाद र पहुँचयोग्य वर्गको वर्चस्व  कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
char q5_2_5[form_type] "select_one agree6"
char q5_2_5[form_relevant] ""
rename src118 q5_2_6
label variable q5_2_6 "South Asia dissent cause: Foreign/external influence"
char q5_2_6[source_name] "q5_2_6"
notes q5_2_6: 5.2.6 Young people in South Asia are expressing their dissent against the existing political regime because of external or outside influence.
char q5_2_6[question_en] "5.2.6 Young people in South Asia are expressing their dissent against the existing political regime because of external or outside influence."
char q5_2_6[question_ne] "५.२.६ दक्षिण एसियाका युवाहरूले बाह्य प्रभावका कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
char q5_2_6[form_type] "select_one agree6"
char q5_2_6[form_relevant] ""
assert missing(src119)
drop src119
rename src120 q5_3
label variable q5_3 "5.3 Protests in one country encourage others in South Asia"
char q5_3[source_name] "q5_3"
notes q5_3: 5.3. To what extent do you agree with the following statement? Protest in one country has encouraged protests in other countries in South Asia.
char q5_3[question_en] "5.3. To what extent do you agree with the following statement? Protest in one country has encouraged protests in other countries in South Asia."
char q5_3[question_ne] "५.३ तलका भनाइहरूसँग तपाईं कत्तिको सहमत हुनुहुन्छ? एउटा देशमा भएको आन्दोलनले दक्षिण एसियाका अन्य देशहरूमा पनि आन्दोलन गर्न प्रोत्साहन गरेको छ।"
char q5_3[form_type] "select_one agree5"
char q5_3[form_relevant] ""
rename src121 q5_4
label variable q5_4 "5.4 Political stability of South Asia today"
char q5_4[source_name] "q5_4"
notes q5_4: 5.4.  How would you rate the political stability of the entire South Asian region today?
char q5_4[question_en] "5.4.  How would you rate the political stability of the entire South Asian region today?"
char q5_4[question_ne] "५.४ आजको अवस्थामा समग्र दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतालाई तपाईं कसरी मूल्याङ्कन गर्नुहुन्छ?"
char q5_4[form_type] "select_one south_stability"
char q5_4[form_relevant] ""
rename src122 q5_5
label variable q5_5 "5.5 Optimism for South Asian stability over next five years"
char q5_5[source_name] "q5_5"
notes q5_5: 5.5.  Overall, how optimistic are you about political stability in South Asia over the next five years?
char q5_5[question_en] "5.5.  Overall, how optimistic are you about political stability in South Asia over the next five years?"
char q5_5[question_ne] "५.५ समग्रमा, आगामी पाँच वर्षमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरताबारे तपाईं कत्तिको आशावादी हुनुहुन्छ?"
char q5_5[form_type] "select_one optimism"
char q5_5[form_relevant] ""
assert missing(src123)
drop src123
rename src124 q5_6_1
label variable q5_6_1 "South Asia stability risk: Corruption/lack of accountability"
char q5_6_1[source_name] "q5_6_1"
notes q5_6_1: 5.6.1. Corruption/ lack of accountability poses a great risk to political stability in South Asia
char q5_6_1[question_en] "5.6.1. Corruption/ lack of accountability poses a great risk to political stability in South Asia"
char q5_6_1[question_ne] "५.६.१ भ्रष्टाचार/जवाफदेहिताको कमीले भविष्यमा दक्षिण एसियाली क्षेत्रको  राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
char q5_6_1[form_type] "select_one agree5"
char q5_6_1[form_relevant] ""
rename src125 q5_6_2
label variable q5_6_2 "South Asia stability risk: Unemployment/economic opportunities"
char q5_6_2[source_name] "q5_6_2"
notes q5_6_2: 5.6.2 Unemployment and lack of economic opportunities pose a great risk to political stability in South Asia.
char q5_6_2[question_en] "5.6.2 Unemployment and lack of economic opportunities pose a great risk to political stability in South Asia."
char q5_6_2[question_ne] "५.६.२ बेरोजगारी र आर्थिक अवसरको कमीले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
char q5_6_2[form_type] "select_one agree5"
char q5_6_2[form_relevant] ""
rename src126 q5_6_3
label variable q5_6_3 "South Asia stability risk: Political exclusion"
char q5_6_3[source_name] "q5_6_3"
notes q5_6_3: 5.6.3 Political exclusion of certain groups poses a great risk to political stability in South Asia.
char q5_6_3[question_en] "5.6.3 Political exclusion of certain groups poses a great risk to political stability in South Asia."
char q5_6_3[question_ne] "५.६.३ सरकारी संयत्रमा समावेशिताको कमिले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
char q5_6_3[form_type] "select_one agree5"
char q5_6_3[form_relevant] ""
rename src127 q5_6_4
label variable q5_6_4 "South Asia stability risk: Rising cost of living"
char q5_6_4[source_name] "q5_6_4"
notes q5_6_4: 5.6.4 Rising cost of living poses a great risk to political stability in South Asia.
char q5_6_4[question_en] "5.6.4 Rising cost of living poses a great risk to political stability in South Asia."
char q5_6_4[question_ne] "५.६.४ बढ्दो महंगीले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
char q5_6_4[form_type] "select_one agree5"
char q5_6_4[form_relevant] ""
rename src128 q5_6_5
label variable q5_6_5 "South Asia stability risk: Social media misinformation"
char q5_6_5[source_name] "q5_6_5"
notes q5_6_5: 5.6.5 Misinformation through social media poses a great risk to political stability in South Asia.
char q5_6_5[question_en] "5.6.5 Misinformation through social media poses a great risk to political stability in South Asia."
char q5_6_5[question_ne] "५.६.५ सामाजिक सञ्जालमार्फत फैलिने गलत/मिथ्य/भ्रामक  सूचनाले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ ।"
char q5_6_5[form_type] "select_one agree5"
char q5_6_5[form_relevant] ""
rename src129 q5_6_6
label variable q5_6_6 "South Asia stability risk: Foreign/external influence"
char q5_6_6[source_name] "q5_6_6"
notes q5_6_6: 5.6.6 Influence of foreign/external forces poses a great risk to political stability in South Asia.
char q5_6_6[question_en] "5.6.6 Influence of foreign/external forces poses a great risk to political stability in South Asia."
char q5_6_6[question_ne] "५.६.६ विदेशी/बाह्य शक्तिको प्रभावले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
char q5_6_6[form_type] "select_one agree5"
char q5_6_6[form_relevant] ""
rename src130 q5_6_7
label variable q5_6_7 "South Asia stability risk: Ethnic/religious conflict"
char q5_6_7[source_name] "q5_6_7"
notes q5_6_7: 5.6.7 Ethnic or religious tension/conflict poses a great risk to political stability in South Asia.
char q5_6_7[question_en] "5.6.7 Ethnic or religious tension/conflict poses a great risk to political stability in South Asia."
char q5_6_7[question_ne] "५.६.७ जातीय वा धार्मिक तनाव/द्वन्द्वले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
char q5_6_7[form_type] "select_one agree5"
char q5_6_7[form_relevant] ""
assert missing(src131)
drop src131
rename src132 q5_7_1
label variable q5_7_1 "South Asia hope: Governance/anti-corruption reforms"
char q5_7_1[source_name] "q5_7_1"
notes q5_7_1: 5.7.1 I am hopeful for South Asia’s future because South Asian countries have adopted better governance and anti-corruption reforms.
char q5_7_1[question_en] "5.7.1 I am hopeful for South Asia’s future because South Asian countries have adopted better governance and anti-corruption reforms."
char q5_7_1[question_ne] "५.७.१ दक्षिण एसियाली देशहरूले सुशासन र भ्रष्टाचारविरोधी सुधारहरू अपनाएकाले म दक्षिण एसियाली क्षेत्रको भविष्यप्रति आशावादी छु।"
char q5_7_1[form_type] "select_one agree5"
char q5_7_1[form_relevant] ""
rename src133 q5_7_2
label variable q5_7_2 "South Asia hope: Youth political participation"
char q5_7_2[source_name] "q5_7_2"
notes q5_7_2: 5.7.2 I am hopeful about South Asia’s future because of greater youth participation in politics in South Asia.
char q5_7_2[question_en] "5.7.2 I am hopeful about South Asia’s future because of greater youth participation in politics in South Asia."
char q5_7_2[question_ne] "५.७.२ दक्षिण एसियाली राजनीतिमा युवाहरूको बढ्दो सहभागिताका कारण म दक्षिण एसियाली क्षेत्रको भविष्यप्रति आशावादी छु।"
char q5_7_2[form_type] "select_one agree5"
char q5_7_2[form_relevant] ""
rename src134 q5_7_3
label variable q5_7_3 "South Asia hope: Improved democracy"
char q5_7_3[source_name] "q5_7_3"
notes q5_7_3: 5.7.3 I am hopeful about South Asia’s future because of the state of the democracy has improved in South Asia.
char q5_7_3[question_en] "5.7.3 I am hopeful about South Asia’s future because of the state of the democracy has improved in South Asia."
char q5_7_3[question_ne] "५.७.३ दक्षिण एसियामा लोकतन्त्रको अवस्था सुधार भएकाले म दक्षिण एसियाली क्षेत्रको भविष्यप्रति आशावादी छु।"
char q5_7_3[form_type] "select_one agree5"
char q5_7_3[form_relevant] ""
rename src135 q5_7_4
label variable q5_7_4 "South Asia hope: Economic/employment prospects"
char q5_7_4[source_name] "q5_7_4"
notes q5_7_4: 5.7.4  I am hopeful about South Asia’s future because economic and employment prospect is in increasing trend.
char q5_7_4[question_en] "5.7.4  I am hopeful about South Asia’s future because economic and employment prospect is in increasing trend."
char q5_7_4[question_ne] "५.७.४ आर्थिक तथा रोजगारीका सम्भावना बढ्दो क्रममा रहेकाले म दक्षिण एसियाली क्षेत्रको भविष्यप्रति आशावादी छु।"
char q5_7_4[form_type] "select_one agree5"
char q5_7_4[form_relevant] ""
assert missing(src136)
drop src136
rename src137 gps_raw
label variable gps_raw "Original GPS point: latitude longitude altitude accuracy"
char gps_raw[source_name] "Record_your_current_location"
notes gps_raw: Record your current location
char gps_raw[question_en] "Record your current location"
char gps_raw[question_ne] "Location"
char gps_raw[form_type] "geopoint"
char gps_raw[form_relevant] "USD {consent_agree} = '1'"
rename src138 gps_latitude
label variable gps_latitude "GPS latitude (decimal degrees)"
char gps_latitude[source_name] "_Record_your_current_location_latitude"
notes gps_latitude: _Record_your_current_location_latitude
rename src139 gps_longitude
label variable gps_longitude "GPS longitude (decimal degrees)"
char gps_longitude[source_name] "_Record_your_current_location_longitude"
notes gps_longitude: _Record_your_current_location_longitude
rename src140 gps_altitude
label variable gps_altitude "GPS altitude (metres)"
char gps_altitude[source_name] "_Record_your_current_location_altitude"
notes gps_altitude: _Record_your_current_location_altitude
rename src141 gps_accuracy
label variable gps_accuracy "GPS horizontal accuracy (metres)"
char gps_accuracy[source_name] "_Record_your_current_location_precision"
notes gps_accuracy: _Record_your_current_location_precision
assert missing(src142)
drop src142
assert missing(src143)
drop src143
assert missing(src144)
drop src144
rename src145 submission_id
label variable submission_id "Submission ID (Kobo)"
char submission_id[source_name] "_id"
notes submission_id: _id
rename src146 submission_uuid
label variable submission_uuid "Submission UUID (Kobo)"
char submission_uuid[source_name] "_uuid"
notes submission_uuid: _uuid
rename src147 submission_datetime_raw
label variable submission_datetime_raw "Submission date and time: source value, timezone unspecified"
char submission_datetime_raw[source_name] "_submission_time"
notes submission_datetime_raw: _submission_time
rename src148 validation_status
label variable validation_status "Submission validation status"
char validation_status[source_name] "_validation_status"
notes validation_status: _validation_status
rename src149 submission_notes
label variable submission_notes "Submission notes"
char submission_notes[source_name] "_notes"
notes submission_notes: _notes
rename src150 submission_status
label variable submission_status "Submission status"
char submission_status[source_name] "_status"
notes submission_status: _status
rename src151 submitted_by
label variable submitted_by "Account submitting the response"
char submitted_by[source_name] "_submitted_by"
notes submitted_by: _submitted_by
rename src152 form_version
label variable form_version "Form version identifier"
char form_version[source_name] "__version__"
notes form_version: __version__
rename src153 submission_tags
label variable submission_tags "Submission tags"
char submission_tags[source_name] "_tags"
notes submission_tags: _tags
rename src154 root_uuid
label variable root_uuid "Root submission UUID"
char root_uuid[source_name] "meta/rootUuid"
notes root_uuid: meta/rootUuid
rename src155 source_index
label variable source_index "Original export row index"
char source_index[source_name] "_index"
notes source_index: _index

* Reusable flags. These identify review cases; they never overwrite responses.
generate int qc_unknown_codes = 0
generate int qc_required_missing = 0
generate int qc_skip_conflicts = 0
generate int qc_applicable_missing = 0
label define qc 0 "No" 1 "Yes"
label define missing_status 0 "Answered" 1 "Missing: expected by form routing" 2 "Missing: outside form routing" 3 "Missing: routing undetermined" 4 "Answered outside form routing" 5 "Answered: routing undetermined"

label define vl_yes_no 1 "Yes" 2 "No" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_screener 1 "Yes" 2 "No" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_xq9zw28 1 "Biwash" 2 "Buddhi" 3 "Janak" 4 "Januka" 5 "Kanti" 6 "Manju" 7 "Nabin" 8 "Pankaj" 9 "Sagar" 10 "Shreeya" 11 "Sumitra" 12 "Susmita" 13 "Usha" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_ar01j09 1 "Koshi" 2 "Madhesh" 3 "Bagmati" 4 "Gandaki" 5 "Lumbini" 6 "Sudurpaschim" 7 "Karnali" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_gender 1 "Male" 2 "Female" 3 "Others" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_education 1 "Bachelors 1st year" 2 "Bachelors 2nd year" 3 "Bachelors 3rd year" 4 "Bachelors 4th year" 5 "Bachelors 5th year" 6 "Masters 1st year" 7 "Masters 2nd year" 8 "PHD" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_private_public 1 "Private" 2 "Public" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_cp3qw00 1 "Bhramin/Chettri" 2 "Dalit" 3 "Janajati" 4 "Muslim" 5 "Madhesi" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_yes_no_unsure 1 "Yes" 2 "No" 3 "Not Sure" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_hn9bp27 1 "Hindu" 2 "Muslim" 3 "Christian" 4 "Buddhist" 5 "Others" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_marital 1 "Never Married" 2 "Married" 3 "Divorced/separated/widowed" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_urban_rural 1 "Urban" 2 "Rural" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_yes_no_pns 1 "Yes" 2 "No" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_yes_no_dk_pns 1 "Yes" 2 "No" 3 "Don't know/Unsure" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_migration_plan 1 "Go Abroad" 2 "Stay in Nepal" 3 "Don't know/Unsure" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_abroad_purpose 1 "Study" 2 "Work" 3 "Study and Work" 4 "Travel" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_nepal_plan 1 "Study Further" 2 "Seek a Job" 3 "Start a business" 4 "Study and Seek a job" 5 "Study and Start a business" 6 "Seek a job and Start a business" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_agree5 1 "Strongly agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly disagree" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_newsfreq 1 "Daily" 2 "Several times a week" 3 "Weekly" 4 "Occasionally" 5 "Never" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_vote 1 "Yes" 2 "No" 3 "Voted, but does not know at which level" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_nonvote_reason 1 "Did not register" 3 "Away from registered voting location" 4 "Health/family issue" 5 "Not interested in voting process" 6 "Did not trust political parties/candidates" 7 "Intentionally boycotted the election" 8 "My vote would make no difference" .r "Prefer not to say" 96 "Others Please Specify" .d "Don't know" .u "Unmapped source response (review)"
label define vl_future_vote 1 "Very Likely" 2 "Somewhat Likely" 3 "Somewhat unlikely" 4 "Very unlikely" .d "Don't know" .r "Prefer not to say" .u "Unmapped source response (review)"
label define vl_unlikely_reason 1 "Did not register" 2 "Away from registered voting location" 3 "Not interested in voting process" 4 "Do not trust political parties/candidates" 5 "Intentionally boycott the election" 6 "My vote would make no difference" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_civic_yes_no 1 "Yes" 2 "No" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_confidence 1 "Very confident" 2 "Confident" 3 "Neutral" 4 "Not confident" 5 "Not at all confident" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_vx7xv18 1 "Strongly agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly disagree" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_fx1wd71 1 "Strongly agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly disagree" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_stability 1 "Very stable" 2 "Stable" 3 "Neutral" 4 "Unstable" 5 "Very unstable" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_comparison 1 "Much more stable" 2 "Somewhat more stable" 3 "About the same" 4 "Somewhat less stable" 5 "Much less stable" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_likelihood 1 "Very Likely" 2 "Somewhat Likely" 3 "Neutral/ Not sure" 4 "Somewhat unlikely" 5 "Very unlikely" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_sn7om92 1 "Strongly agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly disagree" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_follow_genz 1 "Engaged directly" 2 "Very closely" 3 "Somewhat closely" 4 "Heard but followed very little" 5 "Not at all" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_south_follow 1 "Very Closely" 2 "Somewhat Closely" 3 "Not very Closely" 4 "Not at all" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_agree6 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly disagree" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
label define vl_south_stability 1 "Very Stable" 2 "Stable" 3 "Neutral" 4 "Unstable" 5 "Very Unstable" .d "Don't know" .r "Prefer not to say" .u "Unmapped source response (review)"
label define vl_optimism 1 "Very Optimistic" 2 "Somewhat Optimistic" 3 "Neutral" 4 "Somewhat Pessimistic" 5 "Very Pessimistic" .d "Don't know" .r "Prefer not to say" .u "Unmapped source response (review)"

* consent_agree: yes_no
rename consent_agree consent_agree_raw
generate double consent_agree = .
replace consent_agree = 1 if ustrtrim(consent_agree_raw) == "1"
replace consent_agree = 2 if ustrtrim(consent_agree_raw) == "2"
replace consent_agree = .u if consent_agree == . & !missing(ustrtrim(consent_agree_raw))
replace qc_unknown_codes = qc_unknown_codes + (consent_agree == .u)
label values consent_agree vl_yes_no
label variable consent_agree "Consent to participate"
char consent_agree[source_name] "consent_agree"
char consent_agree[question_en] "Do you understand the information I have provided, and do you agree to participate in this survey?"
char consent_agree[question_ne] "मैले दिएको जानकारी तपाईंले बुझ्नुभयो र यस सर्वेक्षणमा सहभागी हुन सहमत हुनुहुन्छ?"
notes consent_agree: Do you understand the information I have provided, and do you agree to participate in this survey?
notes consent_agree: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See consent_agree_raw for original code.
order consent_agree, before(consent_agree_raw)
label variable consent_agree_raw "Original code: consent_agree"

* screener: screener
rename screener screener_raw
generate double screener = .
replace screener = 1 if ustrtrim(screener_raw) == "1"
replace screener = 2 if ustrtrim(screener_raw) == "2"
replace screener = .u if screener == . & !missing(ustrtrim(screener_raw))
replace qc_unknown_codes = qc_unknown_codes + (screener == .u)
label values screener vl_screener
label variable screener "Eligible: age 18-35 and student at sampled institution"
char screener[source_name] "screener"
char screener[question_en] "Are you currently between the age of 18-35 and are a student at this college/university."
char screener[question_ne] "के तपाईं हाल १८–३५ वर्ष उमेर समूहमा पर्नुहुन्छ र यस कलेज/विश्वविद्यालयमा अध्ययनरत विद्यार्थी हुनुहुन्छ?"
notes screener: Are you currently between the age of 18-35 and are a student at this college/university.
notes screener: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See screener_raw for original code.
order screener, before(screener_raw)
label variable screener_raw "Original code: screener"

* interviewer: xq9zw28
rename interviewer interviewer_raw
generate double interviewer = .
replace interviewer = 1 if ustrtrim(interviewer_raw) == "biwash"
replace interviewer = 2 if ustrtrim(interviewer_raw) == "buddhi"
replace interviewer = 3 if ustrtrim(interviewer_raw) == "janak"
replace interviewer = 4 if ustrtrim(interviewer_raw) == "januka"
replace interviewer = 5 if ustrtrim(interviewer_raw) == "kanti"
replace interviewer = 6 if ustrtrim(interviewer_raw) == "manju"
replace interviewer = 7 if ustrtrim(interviewer_raw) == "nabin"
replace interviewer = 8 if ustrtrim(interviewer_raw) == "pankaj"
replace interviewer = 9 if ustrtrim(interviewer_raw) == "sagar"
replace interviewer = 10 if ustrtrim(interviewer_raw) == "shreeya"
replace interviewer = 11 if ustrtrim(interviewer_raw) == "sumitra"
replace interviewer = 12 if ustrtrim(interviewer_raw) == "susmita"
replace interviewer = 13 if ustrtrim(interviewer_raw) == "usha"
replace interviewer = .u if interviewer == . & !missing(ustrtrim(interviewer_raw))
replace qc_unknown_codes = qc_unknown_codes + (interviewer == .u)
label values interviewer vl_xq9zw28
label variable interviewer "Interviewer"
char interviewer[source_name] "Interviewer_Name"
char interviewer[question_en] "Interviewer Name"
char interviewer[question_ne] "गणकको  नाम "
notes interviewer: Interviewer Name
notes interviewer: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See interviewer_raw for original code.
order interviewer, before(interviewer_raw)
label variable interviewer_raw "Original code: interviewer"

* province: ar01j09
rename province province_raw
generate double province = .
replace province = 1 if ustrtrim(province_raw) == "koshi"
replace province = 2 if ustrtrim(province_raw) == "madhesh"
replace province = 3 if ustrtrim(province_raw) == "bagamati"
replace province = 4 if ustrtrim(province_raw) == "gandaki"
replace province = 5 if ustrtrim(province_raw) == "lumbini"
replace province = 6 if ustrtrim(province_raw) == "sudurpaschim"
replace province = 7 if ustrtrim(province_raw) == "karnali"
replace province = .u if province == . & !missing(ustrtrim(province_raw))
replace qc_unknown_codes = qc_unknown_codes + (province == .u)
label values province vl_ar01j09
label variable province "Province (explicit codes follow supplied choice-list order)"
char province[source_name] "Province"
char province[question_en] "Province"
char province[question_ne] "प्रदेश "
notes province: Province
notes province: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See province_raw for original code.
order province, before(province_raw)
label variable province_raw "Original code: province"

* gender: gender
rename gender gender_raw
generate double gender = .
replace gender = 1 if ustrtrim(gender_raw) == "1"
replace gender = 2 if ustrtrim(gender_raw) == "2"
replace gender = 3 if ustrtrim(gender_raw) == "3"
replace gender = .r if ustrtrim(gender_raw) == "-99"
replace gender = .u if gender == . & !missing(ustrtrim(gender_raw))
replace qc_unknown_codes = qc_unknown_codes + (gender == .u)
label values gender vl_gender
label variable gender "1.2 Gender"
char gender[source_name] "gender"
char gender[question_en] "1.2 What is your Gender?"
char gender[question_ne] "१.२ हजुरको लिंग के हो?"
notes gender: 1.2 What is your Gender?
notes gender: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See gender_raw for original code.
order gender, before(gender_raw)
label variable gender_raw "Original code: gender"

* education: education
rename education education_raw
generate double education = .
replace education = 1 if ustrtrim(education_raw) == "1"
replace education = 2 if ustrtrim(education_raw) == "2"
replace education = 3 if ustrtrim(education_raw) == "3"
replace education = 4 if ustrtrim(education_raw) == "4"
replace education = 5 if ustrtrim(education_raw) == "5"
replace education = 6 if ustrtrim(education_raw) == "6"
replace education = 7 if ustrtrim(education_raw) == "7"
replace education = 8 if ustrtrim(education_raw) == "8"
replace education = .r if ustrtrim(education_raw) == "-99"
replace education = .u if education == . & !missing(ustrtrim(education_raw))
replace qc_unknown_codes = qc_unknown_codes + (education == .u)
label values education vl_education
label variable education "1.3 Current education level and year"
char education[source_name] "education"
char education[question_en] "1.3 What is the highest level of education you are currently pursuing?"
char education[question_ne] "१.३ तपाईंले हाल अध्ययन गर्नु भएको  उच्चतम शैक्षिक तह कुन हो ?"
notes education: 1.3 What is the highest level of education you are currently pursuing?
notes education: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See education_raw for original code.
order education, before(education_raw)
label variable education_raw "Original code: education"

* edu_school: private_public
rename edu_school edu_school_raw
generate double edu_school = .
replace edu_school = 1 if ustrtrim(edu_school_raw) == "1"
replace edu_school = 2 if ustrtrim(edu_school_raw) == "2"
replace edu_school = .r if ustrtrim(edu_school_raw) == "-99"
replace edu_school = .u if edu_school == . & !missing(ustrtrim(edu_school_raw))
replace qc_unknown_codes = qc_unknown_codes + (edu_school == .u)
label values edu_school vl_private_public
label variable edu_school "1.3.1 SLC/SEE school: private or public"
char edu_school[source_name] "edu_school"
char edu_school[question_en] "1.3.1 Did you attend a private or public school for your SLC/SEE education?"
char edu_school[question_ne] "१.३.१ तपाईंले एसएलसी/एसईई तहमा निजी वा सरकारी/सार्वजनिक विद्यालयमध्ये कुनमा अध्ययन गर्नुभएको थियो?"
notes edu_school: 1.3.1 Did you attend a private or public school for your SLC/SEE education?
notes edu_school: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See edu_school_raw for original code.
order edu_school, before(edu_school_raw)
label variable edu_school_raw "Original code: edu_school"

* edu_plus2: private_public
rename edu_plus2 edu_plus2_raw
generate double edu_plus2 = .
replace edu_plus2 = 1 if ustrtrim(edu_plus2_raw) == "1"
replace edu_plus2 = 2 if ustrtrim(edu_plus2_raw) == "2"
replace edu_plus2 = .r if ustrtrim(edu_plus2_raw) == "-99"
replace edu_plus2 = .u if edu_plus2 == . & !missing(ustrtrim(edu_plus2_raw))
replace qc_unknown_codes = qc_unknown_codes + (edu_plus2 == .u)
label values edu_plus2 vl_private_public
label variable edu_plus2 "1.3.2 Plus-two institution: private or public"
char edu_plus2[source_name] "edu_plus2"
char edu_plus2[question_en] "1.3.2 Did you attend a private or public institution for your +2 education?"
char edu_plus2[question_ne] "१.३.२ तपाईंले +२ तहमा निजी वा सरकारी/सार्वजनिक शैक्षिक संस्थामध्ये कुनमा अध्ययन गर्नुभएको थियो?"
notes edu_plus2: 1.3.2 Did you attend a private or public institution for your +2 education?
notes edu_plus2: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See edu_plus2_raw for original code.
order edu_plus2, before(edu_plus2_raw)
label variable edu_plus2_raw "Original code: edu_plus2"

* edu_bachelors: private_public
rename edu_bachelors edu_bachelors_raw
generate double edu_bachelors = .
replace edu_bachelors = 1 if ustrtrim(edu_bachelors_raw) == "1"
replace edu_bachelors = 2 if ustrtrim(edu_bachelors_raw) == "2"
replace edu_bachelors = .r if ustrtrim(edu_bachelors_raw) == "-99"
replace edu_bachelors = .u if edu_bachelors == . & !missing(ustrtrim(edu_bachelors_raw))
replace qc_unknown_codes = qc_unknown_codes + (edu_bachelors == .u)
label values edu_bachelors vl_private_public
label variable edu_bachelors "1.3.3 Bachelor's institution: private or public"
char edu_bachelors[source_name] "edu_bachelors"
char edu_bachelors[question_en] "1.3.3 Did you attend a private or public institution for your Bachelor's degree?"
char edu_bachelors[question_ne] "१.३.३ तपाईंले स्नातक तहमा निजी वा सरकारी/सार्वजनिक शैक्षिक संस्थामध्ये कुनमा अध्ययन गर्नुभएको थियो?"
notes edu_bachelors: 1.3.3 Did you attend a private or public institution for your Bachelor's degree?
notes edu_bachelors: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See edu_bachelors_raw for original code.
order edu_bachelors, before(edu_bachelors_raw)
label variable edu_bachelors_raw "Original code: edu_bachelors"

* edu_masters: private_public
rename edu_masters edu_masters_raw
generate double edu_masters = .
replace edu_masters = 1 if ustrtrim(edu_masters_raw) == "1"
replace edu_masters = 2 if ustrtrim(edu_masters_raw) == "2"
replace edu_masters = .r if ustrtrim(edu_masters_raw) == "-99"
replace edu_masters = .u if edu_masters == . & !missing(ustrtrim(edu_masters_raw))
replace qc_unknown_codes = qc_unknown_codes + (edu_masters == .u)
label values edu_masters vl_private_public
label variable edu_masters "1.3.4 Master's or higher institution: private or public"
char edu_masters[source_name] "edu_masters"
char edu_masters[question_en] "1.3.4 Did you attend a private or public institution for your Master's degree or above?"
char edu_masters[question_ne] "१.३.४ तपाईंले स्नातकोत्तर वा सोभन्दा माथिको तहमा निजी वा सरकारी/सार्वजनिक शैक्षिक संस्थामध्ये कुनमा अध्ययन गर्नुभएको थियो?"
notes edu_masters: 1.3.4 Did you attend a private or public institution for your Master's degree or above?
notes edu_masters: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See edu_masters_raw for original code.
order edu_masters, before(edu_masters_raw)
label variable edu_masters_raw "Original code: edu_masters"

* ethnicity: cp3qw00
rename ethnicity ethnicity_raw
generate double ethnicity = .
replace ethnicity = 1 if ustrtrim(ethnicity_raw) == "1"
replace ethnicity = 2 if ustrtrim(ethnicity_raw) == "2"
replace ethnicity = 3 if ustrtrim(ethnicity_raw) == "3"
replace ethnicity = 4 if ustrtrim(ethnicity_raw) == "4"
replace ethnicity = 5 if ustrtrim(ethnicity_raw) == "5"
replace ethnicity = .r if ustrtrim(ethnicity_raw) == "-99"
replace ethnicity = .u if ethnicity == . & !missing(ustrtrim(ethnicity_raw))
replace qc_unknown_codes = qc_unknown_codes + (ethnicity == .u)
label values ethnicity vl_cp3qw00
label variable ethnicity "1.4 Caste/ethnicity"
char ethnicity[source_name] "_1_4_What_is_your_caste_ethnicity"
char ethnicity[question_en] "1.4 What is your caste/ethnicity?"
char ethnicity[question_ne] "१.४ तपाई को जात/जातियता के हो?"
notes ethnicity: 1.4 What is your caste/ethnicity?
notes ethnicity: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See ethnicity_raw for original code.
order ethnicity, before(ethnicity_raw)
label variable ethnicity_raw "Original code: ethnicity"

* religious_belief: yes_no_unsure
rename religious_belief religious_belief_raw
generate double religious_belief = .
replace religious_belief = 1 if ustrtrim(religious_belief_raw) == "1"
replace religious_belief = 2 if ustrtrim(religious_belief_raw) == "2"
replace religious_belief = 3 if ustrtrim(religious_belief_raw) == "3"
replace religious_belief = .r if ustrtrim(religious_belief_raw) == "-99"
replace religious_belief = .u if religious_belief == . & !missing(ustrtrim(religious_belief_raw))
replace qc_unknown_codes = qc_unknown_codes + (religious_belief == .u)
label values religious_belief vl_yes_no_unsure
label variable religious_belief "1.5 Considers self a person with religious beliefs"
char religious_belief[source_name] "religious_belief"
char religious_belief[question_en] "1.5.  Do you consider yourself a person with religious beliefs?"
char religious_belief[question_ne] "१.५ आफूलाई धार्मिक आस्था भएको व्यक्ति मान्नुहुन्छ?"
notes religious_belief: 1.5.  Do you consider yourself a person with religious beliefs?
notes religious_belief: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See religious_belief_raw for original code.
order religious_belief, before(religious_belief_raw)
label variable religious_belief_raw "Original code: religious_belief"

* religion: hn9bp27
rename religion religion_raw
generate double religion = .
replace religion = 1 if ustrtrim(religion_raw) == "1"
replace religion = 2 if ustrtrim(religion_raw) == "2"
replace religion = 3 if ustrtrim(religion_raw) == "3"
replace religion = 4 if ustrtrim(religion_raw) == "4_1"
replace religion = 5 if ustrtrim(religion_raw) == "5"
replace religion = .r if ustrtrim(religion_raw) == "prefer_not_to_say"
if `buddhist_41_confirmed' == 1 {
    replace religion = 4 if ustrtrim(religion_raw) == "41"
}
replace religion = .u if religion == . & !missing(ustrtrim(religion_raw))
replace qc_unknown_codes = qc_unknown_codes + (religion == .u)
label values religion vl_hn9bp27
label variable religion "1.6 Religion"
char religion[source_name] "_1_6_Which_religion_do_you_identify_with"
char religion[question_en] "1.6 Which religion do you identify with?"
char religion[question_ne] "१.६ तपाई को धर्म के हो ?"
notes religion: 1.6 Which religion do you identify with?
notes religion: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See religion_raw for original code.
order religion, before(religion_raw)
label variable religion_raw "Original code: religion"

* marital_status: marital
rename marital_status marital_status_raw
generate double marital_status = .
replace marital_status = 1 if ustrtrim(marital_status_raw) == "1"
replace marital_status = 2 if ustrtrim(marital_status_raw) == "2"
replace marital_status = 3 if ustrtrim(marital_status_raw) == "3"
replace marital_status = .u if marital_status == . & !missing(ustrtrim(marital_status_raw))
replace qc_unknown_codes = qc_unknown_codes + (marital_status == .u)
label values marital_status vl_marital
label variable marital_status "1.7 Marital status"
char marital_status[source_name] "marital_status"
char marital_status[question_en] "1.7.  What is your marital status?"
char marital_status[question_ne] "१.७ तपाईंको वैवाहिक अवस्था के हो?"
notes marital_status: 1.7.  What is your marital status?
notes marital_status: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See marital_status_raw for original code.
order marital_status, before(marital_status_raw)
label variable marital_status_raw "Original code: marital_status"

* life_place: urban_rural
rename life_place life_place_raw
generate double life_place = .
replace life_place = 1 if ustrtrim(life_place_raw) == "1"
replace life_place = 2 if ustrtrim(life_place_raw) == "2"
replace life_place = .r if ustrtrim(life_place_raw) == "-99"
replace life_place = .u if life_place == . & !missing(ustrtrim(life_place_raw))
replace qc_unknown_codes = qc_unknown_codes + (life_place == .u)
label values life_place vl_urban_rural
label variable life_place "1.8 Urban/rural location of most of life"
char life_place[source_name] "life_place"
char life_place[question_en] "1.8.  Where have you spent most of your life in?"
char life_place[question_ne] "१.८ तपाईंले आफ्नो जीवनको अधिकांश समय कहाँ बिताउनुभएको छ?"
notes life_place: 1.8.  Where have you spent most of your life in?
notes life_place: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See life_place_raw for original code.
order life_place, before(life_place_raw)
label variable life_place_raw "Original code: life_place"

* family_abroad: yes_no_pns
rename family_abroad family_abroad_raw
generate double family_abroad = .
replace family_abroad = 1 if ustrtrim(family_abroad_raw) == "1"
replace family_abroad = 2 if ustrtrim(family_abroad_raw) == "2"
replace family_abroad = .r if ustrtrim(family_abroad_raw) == "-99"
replace family_abroad = .u if family_abroad == . & !missing(ustrtrim(family_abroad_raw))
replace qc_unknown_codes = qc_unknown_codes + (family_abroad == .u)
label values family_abroad vl_yes_no_pns
label variable family_abroad "1.9 Close family member has lived or lives abroad"
char family_abroad[source_name] "family_abroad"
char family_abroad[question_en] "1.9.  Have any of your close family member lived abroad or is currently living abroad?"
char family_abroad[question_ne] "१.९ तपाईंका नजिकका परिवारका कुनै सदस्य विदेशमा बस्नुभएको छ वा हाल विदेशमा बसिरहनुभएको छ?"
notes family_abroad: 1.9.  Have any of your close family member lived abroad or is currently living abroad?
notes family_abroad: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See family_abroad_raw for original code.
order family_abroad, before(family_abroad_raw)
label variable family_abroad_raw "Original code: family_abroad"

* family_returned: yes_no_dk_pns
rename family_returned family_returned_raw
generate double family_returned = .
replace family_returned = 1 if ustrtrim(family_returned_raw) == "1"
replace family_returned = 2 if ustrtrim(family_returned_raw) == "2"
replace family_returned = 3 if ustrtrim(family_returned_raw) == "3"
replace family_returned = .r if ustrtrim(family_returned_raw) == "-99"
replace family_returned = .u if family_returned == . & !missing(ustrtrim(family_returned_raw))
replace qc_unknown_codes = qc_unknown_codes + (family_returned == .u)
label values family_returned vl_yes_no_dk_pns
label variable family_returned "1.9.1 Family member abroad returned permanently"
char family_returned[source_name] "family_returned"
char family_returned[question_en] "1.9.1. Has he/she returned permanetly?"
char family_returned[question_ne] "१.९.१ उहाँ सधै को लागि फर्केर आउनुभएको छ?"
notes family_returned: 1.9.1. Has he/she returned permanetly?
notes family_returned: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See family_returned_raw for original code.
order family_returned, before(family_returned_raw)
label variable family_returned_raw "Original code: family_returned"

* migration_plan: migration_plan
rename migration_plan migration_plan_raw
generate double migration_plan = .
replace migration_plan = 1 if ustrtrim(migration_plan_raw) == "1"
replace migration_plan = 2 if ustrtrim(migration_plan_raw) == "2"
replace migration_plan = 3 if ustrtrim(migration_plan_raw) == "3"
replace migration_plan = .r if ustrtrim(migration_plan_raw) == "-99"
replace migration_plan = .u if migration_plan == . & !missing(ustrtrim(migration_plan_raw))
replace qc_unknown_codes = qc_unknown_codes + (migration_plan == .u)
label values migration_plan vl_migration_plan
label variable migration_plan "1.10 Plans to go abroad or stay in Nepal"
char migration_plan[source_name] "migration_plan"
char migration_plan[question_en] "1.10.  Are you planning to go abroad or stay in Nepal?"
char migration_plan[question_ne] "१.१० तपाईं विदेश जाने योजना बनाउँदै हुनुहुन्छ कि नेपालमै बस्ने?"
notes migration_plan: 1.10.  Are you planning to go abroad or stay in Nepal?
notes migration_plan: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See migration_plan_raw for original code.
order migration_plan, before(migration_plan_raw)
label variable migration_plan_raw "Original code: migration_plan"

* abroad_purpose: abroad_purpose
rename abroad_purpose abroad_purpose_raw
generate double abroad_purpose = .
replace abroad_purpose = 1 if ustrtrim(abroad_purpose_raw) == "1"
replace abroad_purpose = 2 if ustrtrim(abroad_purpose_raw) == "2"
replace abroad_purpose = 3 if ustrtrim(abroad_purpose_raw) == "3"
replace abroad_purpose = 4 if ustrtrim(abroad_purpose_raw) == "4"
replace abroad_purpose = .u if abroad_purpose == . & !missing(ustrtrim(abroad_purpose_raw))
replace qc_unknown_codes = qc_unknown_codes + (abroad_purpose == .u)
label values abroad_purpose vl_abroad_purpose
label variable abroad_purpose "1.10.1a Purpose of going abroad"
char abroad_purpose[source_name] "abroad_purpose"
char abroad_purpose[question_en] "1.10.1a.  Are you planning to study or work?"
char abroad_purpose[question_ne] "१.१०.१क  तपाईं अध्ययन गर्न जाने योजना बनाउँदै हुनुहुन्छ कि काम गर्न?"
notes abroad_purpose: 1.10.1a.  Are you planning to study or work?
notes abroad_purpose: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See abroad_purpose_raw for original code.
order abroad_purpose, before(abroad_purpose_raw)
label variable abroad_purpose_raw "Original code: abroad_purpose"

* nepal_plan: nepal_plan
rename nepal_plan nepal_plan_raw
generate double nepal_plan = .
replace nepal_plan = 1 if ustrtrim(nepal_plan_raw) == "1"
replace nepal_plan = 2 if ustrtrim(nepal_plan_raw) == "2"
replace nepal_plan = 3 if ustrtrim(nepal_plan_raw) == "3"
replace nepal_plan = 4 if ustrtrim(nepal_plan_raw) == "4"
replace nepal_plan = 5 if ustrtrim(nepal_plan_raw) == "5"
replace nepal_plan = 6 if ustrtrim(nepal_plan_raw) == "6"
replace nepal_plan = .u if nepal_plan == . & !missing(ustrtrim(nepal_plan_raw))
replace qc_unknown_codes = qc_unknown_codes + (nepal_plan == .u)
label values nepal_plan vl_nepal_plan
label variable nepal_plan "1.10.1b Plans while staying in Nepal"
char nepal_plan[source_name] "nepal_plan"
char nepal_plan[question_en] "1.10.1b.  Are you planning to continue your study, seek a job or start your business?"
char nepal_plan[question_ne] "१.१०.१ख तपाईं आफ्नो अध्ययनलाई निरन्तरता दिने, रोजगारी खोज्ने वा व्यवसाय सुरु गर्ने योजनामा हुनुहुन्छ?"
notes nepal_plan: 1.10.1b.  Are you planning to continue your study, seek a job or start your business?
notes nepal_plan: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See nepal_plan_raw for original code.
order nepal_plan, before(nepal_plan_raw)
label variable nepal_plan_raw "Original code: nepal_plan"

* q2_1: agree5
rename q2_1 q2_1_raw
generate double q2_1 = .
replace q2_1 = 1 if ustrtrim(q2_1_raw) == "1"
replace q2_1 = 2 if ustrtrim(q2_1_raw) == "2"
replace q2_1 = 3 if ustrtrim(q2_1_raw) == "3"
replace q2_1 = 4 if ustrtrim(q2_1_raw) == "4"
replace q2_1 = 5 if ustrtrim(q2_1_raw) == "5"
replace q2_1 = .r if ustrtrim(q2_1_raw) == "-99"
replace q2_1 = .d if ustrtrim(q2_1_raw) == "6"
replace q2_1 = .u if q2_1 == . & !missing(ustrtrim(q2_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_1 == .u)
label values q2_1 vl_agree5
label variable q2_1 "2.1 Agreement: politics is central to living in Nepal"
char q2_1[source_name] "q2_1"
char q2_1[question_en] "2.1. To what extent do you agree with the following statement? “Involvement on politics is central to living in Nepal”"
char q2_1[question_ne] "२.१ तलका भनाइहरूसँग तपाईं कत्तिको सहमत हुनुहुन्छ? “नेपालमा जीवन बिताउन राजनीतिमा संलग्नता महत्वपूर्ण छ ।”"
notes q2_1: 2.1. To what extent do you agree with the following statement? “Involvement on politics is central to living in Nepal”
notes q2_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_1_raw for original code.
order q2_1, before(q2_1_raw)
label variable q2_1_raw "Original code: q2_1"

* q2_2: newsfreq
rename q2_2 q2_2_raw
generate double q2_2 = .
replace q2_2 = 1 if ustrtrim(q2_2_raw) == "1"
replace q2_2 = 2 if ustrtrim(q2_2_raw) == "2"
replace q2_2 = 3 if ustrtrim(q2_2_raw) == "3"
replace q2_2 = 4 if ustrtrim(q2_2_raw) == "4"
replace q2_2 = 5 if ustrtrim(q2_2_raw) == "5"
replace q2_2 = .u if q2_2 == . & !missing(ustrtrim(q2_2_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_2 == .u)
label values q2_2 vl_newsfreq
label variable q2_2 "2.2 Frequency of following political news"
char q2_2[source_name] "q2_2"
char q2_2[question_en] "2.2.  How often do you follow political news?"
char q2_2[question_ne] "२.२ तपाईं राजनीतिक समाचार कत्तिको  हेर्नु वा पढ्नुहुन्छ?"
notes q2_2: 2.2.  How often do you follow political news?
notes q2_2: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_2_raw for original code.
order q2_2, before(q2_2_raw)
label variable q2_2_raw "Original code: q2_2"

* q2_3: yes_no_pns
rename q2_3 q2_3_raw
generate double q2_3 = .
replace q2_3 = 1 if ustrtrim(q2_3_raw) == "1"
replace q2_3 = 2 if ustrtrim(q2_3_raw) == "2"
replace q2_3 = .r if ustrtrim(q2_3_raw) == "-99"
replace q2_3 = .u if q2_3 == . & !missing(ustrtrim(q2_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_3 == .u)
label values q2_3 vl_yes_no_pns
label variable q2_3 "2.3 Active involvement in politics/political organizations"
char q2_3[source_name] "q2_3"
char q2_3[question_en] "2.3.  Have you been actively involved in politics/political organizations?"
char q2_3[question_ne] "२.३ के तपाईं राजनीतिमा वा राजनीतिक संस्थाहरूमा (जस्तै राजनीतिक दल, कलेज/विस्वविध्यालयको  संगठनहरु, दलको भात्री संगठन, टोल सुधार समिति हरु, युवा क्लभहरू)    सक्रिय रूपमा संलग्न हुनुभएको छ/हुनु हुन्छ ?"
notes q2_3: 2.3.  Have you been actively involved in politics/political organizations?
notes q2_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_3_raw for original code.
order q2_3, before(q2_3_raw)
label variable q2_3_raw "Original code: q2_3"

* q2_4: vote
rename q2_4 q2_4_raw
generate double q2_4 = .
replace q2_4 = 1 if ustrtrim(q2_4_raw) == "1"
replace q2_4 = 2 if ustrtrim(q2_4_raw) == "2"
replace q2_4 = 3 if ustrtrim(q2_4_raw) == "3"
replace q2_4 = .r if ustrtrim(q2_4_raw) == "-99"
replace q2_4 = .u if q2_4 == . & !missing(ustrtrim(q2_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_4 == .u)
label values q2_4 vl_vote
label variable q2_4 "2.4 Voted in 2022 federal election"
char q2_4[source_name] "q2_4"
char q2_4[question_en] "2.4.  Did you vote in the 2022 federal election? (Ask only for respondents above or equal to the age of 22)"
char q2_4[question_ne] "२.४ के तपाईंले २०७९ को प्रतिनिधिसभा निर्वाचनमा मतदान गर्नुभयो?"
notes q2_4: 2.4.  Did you vote in the 2022 federal election? (Ask only for respondents above or equal to the age of 22)
notes q2_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_4_raw for original code.
order q2_4, before(q2_4_raw)
label variable q2_4_raw "Original code: q2_4"

* q2_4_1: nonvote_reason
rename q2_4_1 q2_4_1_raw
generate double q2_4_1 = .
replace q2_4_1 = 1 if ustrtrim(q2_4_1_raw) == "1"
replace q2_4_1 = 3 if ustrtrim(q2_4_1_raw) == "3"
replace q2_4_1 = 4 if ustrtrim(q2_4_1_raw) == "4"
replace q2_4_1 = 5 if ustrtrim(q2_4_1_raw) == "5"
replace q2_4_1 = 6 if ustrtrim(q2_4_1_raw) == "6"
replace q2_4_1 = 7 if ustrtrim(q2_4_1_raw) == "7"
replace q2_4_1 = 8 if ustrtrim(q2_4_1_raw) == "8"
replace q2_4_1 = .r if ustrtrim(q2_4_1_raw) == "-99"
replace q2_4_1 = 96 if ustrtrim(q2_4_1_raw) == "others_please_specify"
replace q2_4_1 = .u if q2_4_1 == . & !missing(ustrtrim(q2_4_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_4_1 == .u)
label values q2_4_1 vl_nonvote_reason
label variable q2_4_1 "2.4.1 Reason for not voting: federal"
char q2_4_1[source_name] "q2_4_1"
char q2_4_1[question_en] "2.4.1.  Why didn’t you vote?"
char q2_4_1[question_ne] "२.४.१ तपाईंले किन मतदान गर्नुभएन?"
notes q2_4_1: 2.4.1.  Why didn’t you vote?
notes q2_4_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_4_1_raw for original code.
order q2_4_1, before(q2_4_1_raw)
label variable q2_4_1_raw "Original code: q2_4_1"

* q2_5: vote
rename q2_5 q2_5_raw
generate double q2_5 = .
replace q2_5 = 1 if ustrtrim(q2_5_raw) == "1"
replace q2_5 = 2 if ustrtrim(q2_5_raw) == "2"
replace q2_5 = 3 if ustrtrim(q2_5_raw) == "3"
replace q2_5 = .r if ustrtrim(q2_5_raw) == "-99"
replace q2_5 = .u if q2_5 == . & !missing(ustrtrim(q2_5_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_5 == .u)
label values q2_5 vl_vote
label variable q2_5 "2.5 Voted in 2022 provincial election"
char q2_5[source_name] "q2_5"
char q2_5[question_en] "2.5.  Did you vote in the 2022 provincial election? (Ask only for respondents above or equal to the age of 22)"
char q2_5[question_ne] "२.५ के तपाईंले २०७९ को प्रदेशसभा निर्वाचनमा मतदान गर्नुभयो?"
notes q2_5: 2.5.  Did you vote in the 2022 provincial election? (Ask only for respondents above or equal to the age of 22)
notes q2_5: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_5_raw for original code.
order q2_5, before(q2_5_raw)
label variable q2_5_raw "Original code: q2_5"

* q2_5_1: nonvote_reason
rename q2_5_1 q2_5_1_raw
generate double q2_5_1 = .
replace q2_5_1 = 1 if ustrtrim(q2_5_1_raw) == "1"
replace q2_5_1 = 3 if ustrtrim(q2_5_1_raw) == "3"
replace q2_5_1 = 4 if ustrtrim(q2_5_1_raw) == "4"
replace q2_5_1 = 5 if ustrtrim(q2_5_1_raw) == "5"
replace q2_5_1 = 6 if ustrtrim(q2_5_1_raw) == "6"
replace q2_5_1 = 7 if ustrtrim(q2_5_1_raw) == "7"
replace q2_5_1 = 8 if ustrtrim(q2_5_1_raw) == "8"
replace q2_5_1 = .r if ustrtrim(q2_5_1_raw) == "-99"
replace q2_5_1 = 96 if ustrtrim(q2_5_1_raw) == "others_please_specify"
replace q2_5_1 = .u if q2_5_1 == . & !missing(ustrtrim(q2_5_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_5_1 == .u)
label values q2_5_1 vl_nonvote_reason
label variable q2_5_1 "2.5.1 Reason for not voting: provincial"
char q2_5_1[source_name] "q2_5_1"
char q2_5_1[question_en] "2.5.1.  Why didn’t you vote?"
char q2_5_1[question_ne] "२.५.१ तपाईंले किन मतदान गर्नुभएन?"
notes q2_5_1: 2.5.1.  Why didn’t you vote?
notes q2_5_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_5_1_raw for original code.
order q2_5_1, before(q2_5_1_raw)
label variable q2_5_1_raw "Original code: q2_5_1"

* q2_6: vote
rename q2_6 q2_6_raw
generate double q2_6 = .
replace q2_6 = 1 if ustrtrim(q2_6_raw) == "1"
replace q2_6 = 2 if ustrtrim(q2_6_raw) == "2"
replace q2_6 = 3 if ustrtrim(q2_6_raw) == "3"
replace q2_6 = .r if ustrtrim(q2_6_raw) == "-99"
replace q2_6 = .u if q2_6 == . & !missing(ustrtrim(q2_6_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_6 == .u)
label values q2_6 vl_vote
label variable q2_6 "2.6 Voted in 2022 local election"
char q2_6[source_name] "q2_6"
char q2_6[question_en] "2.6.  Did you vote in the 2022 local election? (Ask only for respondents above or equal to the age of 22)"
char q2_6[question_ne] "२.६ के तपाईंले २०७९ को स्थानीय तह निर्वाचनमा मतदान गर्नुभयो?"
notes q2_6: 2.6.  Did you vote in the 2022 local election? (Ask only for respondents above or equal to the age of 22)
notes q2_6: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_6_raw for original code.
order q2_6, before(q2_6_raw)
label variable q2_6_raw "Original code: q2_6"

* q2_6_1: nonvote_reason
rename q2_6_1 q2_6_1_raw
generate double q2_6_1 = .
replace q2_6_1 = 1 if ustrtrim(q2_6_1_raw) == "1"
replace q2_6_1 = 3 if ustrtrim(q2_6_1_raw) == "3"
replace q2_6_1 = 4 if ustrtrim(q2_6_1_raw) == "4"
replace q2_6_1 = 5 if ustrtrim(q2_6_1_raw) == "5"
replace q2_6_1 = 6 if ustrtrim(q2_6_1_raw) == "6"
replace q2_6_1 = 7 if ustrtrim(q2_6_1_raw) == "7"
replace q2_6_1 = 8 if ustrtrim(q2_6_1_raw) == "8"
replace q2_6_1 = .r if ustrtrim(q2_6_1_raw) == "-99"
replace q2_6_1 = 96 if ustrtrim(q2_6_1_raw) == "others_please_specify"
replace q2_6_1 = .u if q2_6_1 == . & !missing(ustrtrim(q2_6_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_6_1 == .u)
label values q2_6_1 vl_nonvote_reason
label variable q2_6_1 "2.6.1 Reason for not voting: local"
char q2_6_1[source_name] "q2_6_1"
char q2_6_1[question_en] "2.6.1.  Why didn’t you vote?"
char q2_6_1[question_ne] "२.६.१ तपाईंले किन मतदान गर्नुभएन?"
notes q2_6_1: 2.6.1.  Why didn’t you vote?
notes q2_6_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_6_1_raw for original code.
order q2_6_1, before(q2_6_1_raw)
label variable q2_6_1_raw "Original code: q2_6_1"

* q2_7: future_vote
rename q2_7 q2_7_raw
generate double q2_7 = .
replace q2_7 = 1 if ustrtrim(q2_7_raw) == "1"
replace q2_7 = 2 if ustrtrim(q2_7_raw) == "2"
replace q2_7 = 3 if ustrtrim(q2_7_raw) == "3"
replace q2_7 = 4 if ustrtrim(q2_7_raw) == "4"
replace q2_7 = .d if ustrtrim(q2_7_raw) == "5"
replace q2_7 = .r if ustrtrim(q2_7_raw) == "-99"
replace q2_7 = .u if q2_7 == . & !missing(ustrtrim(q2_7_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_7 == .u)
label values q2_7 vl_future_vote
label variable q2_7 "2.7 Likelihood of voting in 2027 local elections"
char q2_7[source_name] "q2_7"
char q2_7[question_en] "2.7.  How likely are you to vote in the upcoming 2027 local elections?"
char q2_7[question_ne] "२.७ आगामी २०८४ को स्थानीय तह निर्वाचनमा तपाईंले मतदान गर्ने सम्भावना कत्तिको छ?"
notes q2_7: 2.7.  How likely are you to vote in the upcoming 2027 local elections?
notes q2_7: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_7_raw for original code.
order q2_7, before(q2_7_raw)
label variable q2_7_raw "Original code: q2_7"

* q2_7_1: unlikely_reason
rename q2_7_1 q2_7_1_raw
generate double q2_7_1 = .
replace q2_7_1 = 1 if ustrtrim(q2_7_1_raw) == "1"
replace q2_7_1 = 2 if ustrtrim(q2_7_1_raw) == "2"
replace q2_7_1 = 3 if ustrtrim(q2_7_1_raw) == "3"
replace q2_7_1 = 4 if ustrtrim(q2_7_1_raw) == "4"
replace q2_7_1 = 5 if ustrtrim(q2_7_1_raw) == "5"
replace q2_7_1 = 6 if ustrtrim(q2_7_1_raw) == "6"
replace q2_7_1 = .r if ustrtrim(q2_7_1_raw) == "-99"
replace q2_7_1 = .u if q2_7_1 == . & !missing(ustrtrim(q2_7_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_7_1 == .u)
label values q2_7_1 vl_unlikely_reason
label variable q2_7_1 "2.7.1 Reason unlikely to vote in 2027 local elections"
char q2_7_1[source_name] "q2_7_1"
char q2_7_1[question_en] "2.7.1.  Why are you unlikely to vote?"
char q2_7_1[question_ne] "२.७.१ तपाईंले मतदान गर्ने सम्भावना कम हुनुको मुख्य कारण के हो?"
notes q2_7_1: 2.7.1.  Why are you unlikely to vote?
notes q2_7_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_7_1_raw for original code.
order q2_7_1, before(q2_7_1_raw)
label variable q2_7_1_raw "Original code: q2_7_1"

* q2_8_1: civic_yes_no
rename q2_8_1 q2_8_1_raw
generate double q2_8_1 = .
replace q2_8_1 = 1 if ustrtrim(q2_8_1_raw) == "1"
replace q2_8_1 = 2 if ustrtrim(q2_8_1_raw) == "2"
replace q2_8_1 = .u if q2_8_1 == . & !missing(ustrtrim(q2_8_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_8_1 == .u)
label values q2_8_1 vl_civic_yes_no
label variable q2_8_1 "2.8.1 Past 12 months: Attended campaign/rally"
char q2_8_1[source_name] "q2_8_1"
char q2_8_1[question_en] "Attend a political campaign or election rally"
char q2_8_1[question_ne] "राजनीतिक अभियान वा चुनावी सभामा सहभागी भएको"
notes q2_8_1: Attend a political campaign or election rally
notes q2_8_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_8_1_raw for original code.
order q2_8_1, before(q2_8_1_raw)
label variable q2_8_1_raw "Original code: q2_8_1"

* q2_8_2: civic_yes_no
rename q2_8_2 q2_8_2_raw
generate double q2_8_2 = .
replace q2_8_2 = 1 if ustrtrim(q2_8_2_raw) == "1"
replace q2_8_2 = 2 if ustrtrim(q2_8_2_raw) == "2"
replace q2_8_2 = .u if q2_8_2 == . & !missing(ustrtrim(q2_8_2_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_8_2 == .u)
label values q2_8_2 vl_civic_yes_no
label variable q2_8_2 "2.8.2 Past 12 months: Volunteered for party/campaign"
char q2_8_2[source_name] "q2_8_2"
char q2_8_2[question_en] "Volunteered for a political party or election campaign"
char q2_8_2[question_ne] "राजनीतिक दल वा निर्वाचन अभियानमा स्वयंसेवकका रूपमा काम गरेको"
notes q2_8_2: Volunteered for a political party or election campaign
notes q2_8_2: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_8_2_raw for original code.
order q2_8_2, before(q2_8_2_raw)
label variable q2_8_2_raw "Original code: q2_8_2"

* q2_8_3: civic_yes_no
rename q2_8_3 q2_8_3_raw
generate double q2_8_3 = .
replace q2_8_3 = 1 if ustrtrim(q2_8_3_raw) == "1"
replace q2_8_3 = 2 if ustrtrim(q2_8_3_raw) == "2"
replace q2_8_3 = .u if q2_8_3 == . & !missing(ustrtrim(q2_8_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_8_3 == .u)
label values q2_8_3 vl_civic_yes_no
label variable q2_8_3 "2.8.3 Past 12 months: Joined protest/demonstration"
char q2_8_3[source_name] "q2_8_3"
char q2_8_3[question_en] "Participated in protest/demonstration"
char q2_8_3[question_ne] "विरोध/प्रदर्शनमा सहभागी भएको"
notes q2_8_3: Participated in protest/demonstration
notes q2_8_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_8_3_raw for original code.
order q2_8_3, before(q2_8_3_raw)
label variable q2_8_3_raw "Original code: q2_8_3"

* q2_8_4: civic_yes_no
rename q2_8_4 q2_8_4_raw
generate double q2_8_4 = .
replace q2_8_4 = 1 if ustrtrim(q2_8_4_raw) == "1"
replace q2_8_4 = 2 if ustrtrim(q2_8_4_raw) == "2"
replace q2_8_4 = .u if q2_8_4 == . & !missing(ustrtrim(q2_8_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_8_4 == .u)
label values q2_8_4 vl_civic_yes_no
label variable q2_8_4 "2.8.4 Past 12 months: Joined public meeting/discussion"
char q2_8_4[source_name] "q2_8_4"
char q2_8_4[question_en] "Participated in a public meeting/ discussion"
char q2_8_4[question_ne] "सार्वजनिक बैठक/छलफलमा सहभागी भएको"
notes q2_8_4: Participated in a public meeting/ discussion
notes q2_8_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_8_4_raw for original code.
order q2_8_4, before(q2_8_4_raw)
label variable q2_8_4_raw "Original code: q2_8_4"

* q2_8_5: civic_yes_no
rename q2_8_5 q2_8_5_raw
generate double q2_8_5 = .
replace q2_8_5 = 1 if ustrtrim(q2_8_5_raw) == "1"
replace q2_8_5 = 2 if ustrtrim(q2_8_5_raw) == "2"
replace q2_8_5 = .u if q2_8_5 == . & !missing(ustrtrim(q2_8_5_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_8_5 == .u)
label values q2_8_5 vl_civic_yes_no
label variable q2_8_5 "2.8.5 Past 12 months: Contacted elected representative"
char q2_8_5[source_name] "q2_8_5"
char q2_8_5[question_en] "Contacted an elected representative to raise an issue"
char q2_8_5[question_ne] "कुनै विषय उठाउन निर्वाचित प्रतिनिधिसँग सम्पर्क गरेको"
notes q2_8_5: Contacted an elected representative to raise an issue
notes q2_8_5: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_8_5_raw for original code.
order q2_8_5, before(q2_8_5_raw)
label variable q2_8_5_raw "Original code: q2_8_5"

* q2_8_6: civic_yes_no
rename q2_8_6 q2_8_6_raw
generate double q2_8_6 = .
replace q2_8_6 = 1 if ustrtrim(q2_8_6_raw) == "1"
replace q2_8_6 = 2 if ustrtrim(q2_8_6_raw) == "2"
replace q2_8_6 = .u if q2_8_6 == . & !missing(ustrtrim(q2_8_6_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_8_6 == .u)
label values q2_8_6 vl_civic_yes_no
label variable q2_8_6 "2.8.6 Past 12 months: Joined ward user committee"
char q2_8_6[source_name] "q2_8_6"
char q2_8_6[question_en] "Become a member of the user’s committee at your ward"
char q2_8_6[question_ne] "आफ्नो वडाको उपभोक्ता समितिको सदस्य बनेको"
notes q2_8_6: Become a member of the user’s committee at your ward
notes q2_8_6: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_8_6_raw for original code.
order q2_8_6, before(q2_8_6_raw)
label variable q2_8_6_raw "Original code: q2_8_6"

* q2_9: confidence
rename q2_9 q2_9_raw
generate double q2_9 = .
replace q2_9 = 1 if ustrtrim(q2_9_raw) == "1"
replace q2_9 = 2 if ustrtrim(q2_9_raw) == "2"
replace q2_9 = 3 if ustrtrim(q2_9_raw) == "3"
replace q2_9 = 4 if ustrtrim(q2_9_raw) == "4"
replace q2_9 = 5 if ustrtrim(q2_9_raw) == "5"
replace q2_9 = .u if q2_9 == . & !missing(ustrtrim(q2_9_raw))
replace qc_unknown_codes = qc_unknown_codes + (q2_9 == .u)
label values q2_9 vl_confidence
label variable q2_9 "2.9 Confidence in influencing government decisions"
char q2_9[source_name] "q2_9"
char q2_9[question_en] "2.9.  How confident are you that people like you can influence government decisions?"
char q2_9[question_ne] "२.९ हजुरको उमेर समुहको नागरिकहरुले  सरकारी निर्णयहरूमा प्रभाव पार्न सक्छन् भन्ने कुरामा तपाईं कत्तिको विश्वस्त हुनुहुन्छ?"
notes q2_9: 2.9.  How confident are you that people like you can influence government decisions?
notes q2_9: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q2_9_raw for original code.
order q2_9, before(q2_9_raw)
label variable q2_9_raw "Original code: q2_9"

* q3_1_1: agree5
rename q3_1_1 q3_1_1_raw
generate double q3_1_1 = .
replace q3_1_1 = 1 if ustrtrim(q3_1_1_raw) == "1"
replace q3_1_1 = 2 if ustrtrim(q3_1_1_raw) == "2"
replace q3_1_1 = 3 if ustrtrim(q3_1_1_raw) == "3"
replace q3_1_1 = 4 if ustrtrim(q3_1_1_raw) == "4"
replace q3_1_1 = 5 if ustrtrim(q3_1_1_raw) == "5"
replace q3_1_1 = .r if ustrtrim(q3_1_1_raw) == "-99"
replace q3_1_1 = .d if ustrtrim(q3_1_1_raw) == "6"
replace q3_1_1 = .u if q3_1_1 == . & !missing(ustrtrim(q3_1_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_1_1 == .u)
label values q3_1_1 vl_agree5
label variable q3_1_1 "Nepal instability cause: Government changes/party conflict"
char q3_1_1[source_name] "q3_1_1"
char q3_1_1[question_en] "3.1.1  Frequent change in government and political conflict within and between parties causes political instability in Nepal."
char q3_1_1[question_ne] "३.१.१ सरकारमा बारम्बार हुने परिवर्तन तथा दलभित्र र दलहरूबीचको राजनीतिक द्वन्द्वले नेपालमा राजनीतिक अस्थिरता निम्त्याउँछ।"
notes q3_1_1: 3.1.1  Frequent change in government and political conflict within and between parties causes political instability in Nepal.
notes q3_1_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_1_1_raw for original code.
order q3_1_1, before(q3_1_1_raw)
label variable q3_1_1_raw "Original code: q3_1_1"

* q3_1_2: agree5
rename q3_1_2 q3_1_2_raw
generate double q3_1_2 = .
replace q3_1_2 = 1 if ustrtrim(q3_1_2_raw) == "1"
replace q3_1_2 = 2 if ustrtrim(q3_1_2_raw) == "2"
replace q3_1_2 = 3 if ustrtrim(q3_1_2_raw) == "3"
replace q3_1_2 = 4 if ustrtrim(q3_1_2_raw) == "4"
replace q3_1_2 = 5 if ustrtrim(q3_1_2_raw) == "5"
replace q3_1_2 = .r if ustrtrim(q3_1_2_raw) == "-99"
replace q3_1_2 = .d if ustrtrim(q3_1_2_raw) == "6"
replace q3_1_2 = .u if q3_1_2 == . & !missing(ustrtrim(q3_1_2_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_1_2 == .u)
label values q3_1_2 vl_agree5
label variable q3_1_2 "Nepal instability cause: Policy formulation failure"
char q3_1_2[source_name] "q3_1_2"
char q3_1_2[question_en] "3.1.2 Inability of the government to formulate policies causes political instability in Nepal."
char q3_1_2[question_ne] "३.१.२ सरकारले नीति बनाउन नसक्दा नेपालमा राजनीतिक अस्थिरता निम्तिन्छ।"
notes q3_1_2: 3.1.2 Inability of the government to formulate policies causes political instability in Nepal.
notes q3_1_2: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_1_2_raw for original code.
order q3_1_2, before(q3_1_2_raw)
label variable q3_1_2_raw "Original code: q3_1_2"

* q3_1_2_001: vx7xv18
rename q3_1_2_001 q3_1_2_001_raw
generate double q3_1_2_001 = .
replace q3_1_2_001 = 1 if ustrtrim(q3_1_2_001_raw) == "1"
replace q3_1_2_001 = 2 if ustrtrim(q3_1_2_001_raw) == "2"
replace q3_1_2_001 = 3 if ustrtrim(q3_1_2_001_raw) == "3"
replace q3_1_2_001 = 4 if ustrtrim(q3_1_2_001_raw) == "4"
replace q3_1_2_001 = 5 if ustrtrim(q3_1_2_001_raw) == "5"
replace q3_1_2_001 = .r if ustrtrim(q3_1_2_001_raw) == "-99"
replace q3_1_2_001 = .u if q3_1_2_001 == . & !missing(ustrtrim(q3_1_2_001_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_1_2_001 == .u)
label values q3_1_2_001 vl_vx7xv18
label variable q3_1_2_001 "Nepal instability cause: Policy implementation failure"
char q3_1_2_001[source_name] "q3_1_2_001"
char q3_1_2_001[question_en] "3.1.3 Inability of the government to implement its policies causes political instability in Nepal."
char q3_1_2_001[question_ne] "३.१.२ सरकारले नीति कार्यान्वयन गर्न नसक्दा नेपालमा राजनीतिक अस्थिरता निम्तिन्छ।"
notes q3_1_2_001: 3.1.3 Inability of the government to implement its policies causes political instability in Nepal.
notes q3_1_2_001: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_1_2_001_raw for original code.
order q3_1_2_001, before(q3_1_2_001_raw)
label variable q3_1_2_001_raw "Original code: q3_1_2_001"

* q3_1_3: agree5
rename q3_1_3 q3_1_3_raw
generate double q3_1_3 = .
replace q3_1_3 = 1 if ustrtrim(q3_1_3_raw) == "1"
replace q3_1_3 = 2 if ustrtrim(q3_1_3_raw) == "2"
replace q3_1_3 = 3 if ustrtrim(q3_1_3_raw) == "3"
replace q3_1_3 = 4 if ustrtrim(q3_1_3_raw) == "4"
replace q3_1_3 = 5 if ustrtrim(q3_1_3_raw) == "5"
replace q3_1_3 = .r if ustrtrim(q3_1_3_raw) == "-99"
replace q3_1_3 = .d if ustrtrim(q3_1_3_raw) == "6"
replace q3_1_3 = .u if q3_1_3 == . & !missing(ustrtrim(q3_1_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_1_3 == .u)
label values q3_1_3 vl_agree5
label variable q3_1_3 "Nepal instability cause: Corruption"
char q3_1_3[source_name] "q3_1_3"
char q3_1_3[question_en] "3.1.4 Corruption causes political instability."
char q3_1_3[question_ne] "३.१.४ भ्रष्टाचारले राजनीतिक अस्थिरता निम्त्याउँछ।"
notes q3_1_3: 3.1.4 Corruption causes political instability.
notes q3_1_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_1_3_raw for original code.
order q3_1_3, before(q3_1_3_raw)
label variable q3_1_3_raw "Original code: q3_1_3"

* q3_1_3_001: fx1wd71
rename q3_1_3_001 q3_1_3_001_raw
generate double q3_1_3_001 = .
replace q3_1_3_001 = 1 if ustrtrim(q3_1_3_001_raw) == "1"
replace q3_1_3_001 = 2 if ustrtrim(q3_1_3_001_raw) == "2"
replace q3_1_3_001 = 3 if ustrtrim(q3_1_3_001_raw) == "3"
replace q3_1_3_001 = 4 if ustrtrim(q3_1_3_001_raw) == "4"
replace q3_1_3_001 = 5 if ustrtrim(q3_1_3_001_raw) == "5"
replace q3_1_3_001 = .r if ustrtrim(q3_1_3_001_raw) == "-99"
replace q3_1_3_001 = .u if q3_1_3_001 == . & !missing(ustrtrim(q3_1_3_001_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_1_3_001 == .u)
label values q3_1_3_001 vl_fx1wd71
label variable q3_1_3_001 "Nepal instability cause: Lack of accountability"
char q3_1_3_001[source_name] "q3_1_3_001"
char q3_1_3_001[question_en] "3.1.5 Lack of Accountability causes political instability."
char q3_1_3_001[question_ne] "३.१.५ पारदर्शिताको कमिले  राजनीतिक अस्थिरता निम्त्याउँछ।"
notes q3_1_3_001: 3.1.5 Lack of Accountability causes political instability.
notes q3_1_3_001: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_1_3_001_raw for original code.
order q3_1_3_001, before(q3_1_3_001_raw)
label variable q3_1_3_001_raw "Original code: q3_1_3_001"

* q3_1_4: agree5
rename q3_1_4 q3_1_4_raw
generate double q3_1_4 = .
replace q3_1_4 = 1 if ustrtrim(q3_1_4_raw) == "1"
replace q3_1_4 = 2 if ustrtrim(q3_1_4_raw) == "2"
replace q3_1_4 = 3 if ustrtrim(q3_1_4_raw) == "3"
replace q3_1_4 = 4 if ustrtrim(q3_1_4_raw) == "4"
replace q3_1_4 = 5 if ustrtrim(q3_1_4_raw) == "5"
replace q3_1_4 = .r if ustrtrim(q3_1_4_raw) == "-99"
replace q3_1_4 = .d if ustrtrim(q3_1_4_raw) == "6"
replace q3_1_4 = .u if q3_1_4 == . & !missing(ustrtrim(q3_1_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_1_4 == .u)
label values q3_1_4 vl_agree5
label variable q3_1_4 "Nepal instability cause: Protests/violence/civic unrest"
char q3_1_4[source_name] "q3_1_4"
char q3_1_4[question_en] "3.1.6 Frequent public protests, demonstration, violence and civic unrest cause political instability."
char q3_1_4[question_ne] "३.१.६ बारम्बार हुने सार्वजनिक विरोध, प्रदर्शन, हिंसा र नागरिक अशान्तिले राजनीतिक अस्थिरता निम्त्याउँछ।"
notes q3_1_4: 3.1.6 Frequent public protests, demonstration, violence and civic unrest cause political instability.
notes q3_1_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_1_4_raw for original code.
order q3_1_4, before(q3_1_4_raw)
label variable q3_1_4_raw "Original code: q3_1_4"

* q3_1_5: agree5
rename q3_1_5 q3_1_5_raw
generate double q3_1_5 = .
replace q3_1_5 = 1 if ustrtrim(q3_1_5_raw) == "1"
replace q3_1_5 = 2 if ustrtrim(q3_1_5_raw) == "2"
replace q3_1_5 = 3 if ustrtrim(q3_1_5_raw) == "3"
replace q3_1_5 = 4 if ustrtrim(q3_1_5_raw) == "4"
replace q3_1_5 = 5 if ustrtrim(q3_1_5_raw) == "5"
replace q3_1_5 = .r if ustrtrim(q3_1_5_raw) == "-99"
replace q3_1_5 = .d if ustrtrim(q3_1_5_raw) == "6"
replace q3_1_5 = .u if q3_1_5 == . & !missing(ustrtrim(q3_1_5_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_1_5 == .u)
label values q3_1_5 vl_agree5
label variable q3_1_5 "Nepal instability cause: Transfers of government officials"
char q3_1_5[source_name] "q3_1_5"
char q3_1_5[question_en] "3.1.7 Frequent transfer of government officials causes political instability."
char q3_1_5[question_ne] "३.१.७ सरकारी अधिकारीहरूको बारम्बार सरुवाले राजनीतिक अस्थिरता निम्त्याउँछ।"
notes q3_1_5: 3.1.7 Frequent transfer of government officials causes political instability.
notes q3_1_5: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_1_5_raw for original code.
order q3_1_5, before(q3_1_5_raw)
label variable q3_1_5_raw "Original code: q3_1_5"

* q3_1_6: agree5
rename q3_1_6 q3_1_6_raw
generate double q3_1_6 = .
replace q3_1_6 = 1 if ustrtrim(q3_1_6_raw) == "1"
replace q3_1_6 = 2 if ustrtrim(q3_1_6_raw) == "2"
replace q3_1_6 = 3 if ustrtrim(q3_1_6_raw) == "3"
replace q3_1_6 = 4 if ustrtrim(q3_1_6_raw) == "4"
replace q3_1_6 = 5 if ustrtrim(q3_1_6_raw) == "5"
replace q3_1_6 = .r if ustrtrim(q3_1_6_raw) == "-99"
replace q3_1_6 = .d if ustrtrim(q3_1_6_raw) == "6"
replace q3_1_6 = .u if q3_1_6 == . & !missing(ustrtrim(q3_1_6_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_1_6 == .u)
label values q3_1_6 vl_agree5
label variable q3_1_6 "Nepal instability cause: Conflict between government tiers"
char q3_1_6[source_name] "q3_1_6"
char q3_1_6[question_en] "3.1.6 Conflict between different tiers of government causes political instability"
char q3_1_6[question_ne] "३.१.८ सरकारका विभिन्न तहबीचको (संघ, प्रदेश र स्थानीय) द्वन्द्वले राजनीतिक अस्थिरता निम्त्याउँछ।"
notes q3_1_6: 3.1.6 Conflict between different tiers of government causes political instability
notes q3_1_6: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_1_6_raw for original code.
order q3_1_6, before(q3_1_6_raw)
label variable q3_1_6_raw "Original code: q3_1_6"

* q3_1_7: agree5
rename q3_1_7 q3_1_7_raw
generate double q3_1_7 = .
replace q3_1_7 = 1 if ustrtrim(q3_1_7_raw) == "1"
replace q3_1_7 = 2 if ustrtrim(q3_1_7_raw) == "2"
replace q3_1_7 = 3 if ustrtrim(q3_1_7_raw) == "3"
replace q3_1_7 = 4 if ustrtrim(q3_1_7_raw) == "4"
replace q3_1_7 = 5 if ustrtrim(q3_1_7_raw) == "5"
replace q3_1_7 = .r if ustrtrim(q3_1_7_raw) == "-99"
replace q3_1_7 = .d if ustrtrim(q3_1_7_raw) == "6"
replace q3_1_7 = .u if q3_1_7 == . & !missing(ustrtrim(q3_1_7_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_1_7 == .u)
label values q3_1_7 vl_agree5
label variable q3_1_7 "Nepal instability cause: Foreign/external influence"
char q3_1_7[source_name] "q3_1_7"
char q3_1_7[question_en] "3.1.7 Foreign/External influence causes political instability."
char q3_1_7[question_ne] "३.१.९ विदेशी/बाह्य प्रभावले राजनीतिक अस्थिरता निम्त्याउँछ।"
notes q3_1_7: 3.1.7 Foreign/External influence causes political instability.
notes q3_1_7: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_1_7_raw for original code.
order q3_1_7, before(q3_1_7_raw)
label variable q3_1_7_raw "Original code: q3_1_7"

* q3_2: stability
rename q3_2 q3_2_raw
generate double q3_2 = .
replace q3_2 = 1 if ustrtrim(q3_2_raw) == "1"
replace q3_2 = 2 if ustrtrim(q3_2_raw) == "2"
replace q3_2 = 3 if ustrtrim(q3_2_raw) == "3"
replace q3_2 = 4 if ustrtrim(q3_2_raw) == "4"
replace q3_2 = 5 if ustrtrim(q3_2_raw) == "5"
replace q3_2 = .r if ustrtrim(q3_2_raw) == "-99"
replace q3_2 = .d if ustrtrim(q3_2_raw) == "6"
replace q3_2 = .u if q3_2 == . & !missing(ustrtrim(q3_2_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_2 == .u)
label values q3_2 vl_stability
label variable q3_2 "3.2 Political stability of Nepal today"
char q3_2[source_name] "q3_2"
char q3_2[question_en] "3.2.  How would you rate the political stability of Nepal today?"
char q3_2[question_ne] "३.२ आजको अवस्थामा नेपालको राजनीतिक स्थिरतालाई तपाईं कसरी मूल्याङ्कन गर्नुहुन्छ?"
notes q3_2: 3.2.  How would you rate the political stability of Nepal today?
notes q3_2: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_2_raw for original code.
order q3_2, before(q3_2_raw)
label variable q3_2_raw "Original code: q3_2"

* q3_3: comparison
rename q3_3 q3_3_raw
generate double q3_3 = .
replace q3_3 = 1 if ustrtrim(q3_3_raw) == "1"
replace q3_3 = 2 if ustrtrim(q3_3_raw) == "2"
replace q3_3 = 3 if ustrtrim(q3_3_raw) == "3"
replace q3_3 = 4 if ustrtrim(q3_3_raw) == "4"
replace q3_3 = 5 if ustrtrim(q3_3_raw) == "5"
replace q3_3 = .r if ustrtrim(q3_3_raw) == "-99"
replace q3_3 = .d if ustrtrim(q3_3_raw) == "6"
replace q3_3 = .u if q3_3 == . & !missing(ustrtrim(q3_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_3 == .u)
label values q3_3 vl_comparison
label variable q3_3 "3.3 Nepal stability compared with one year ago"
char q3_3[source_name] "q3_3"
char q3_3[question_en] "3.3.  Compared to one year ago, Nepal is politically:"
char q3_3[question_ne] "३.३ एक वर्षअघिको तुलनामा नेपालको राजनीतिक अवस्था:"
notes q3_3: 3.3.  Compared to one year ago, Nepal is politically:
notes q3_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_3_raw for original code.
order q3_3, before(q3_3_raw)
label variable q3_3_raw "Original code: q3_3"

* q3_4: comparison
rename q3_4 q3_4_raw
generate double q3_4 = .
replace q3_4 = 1 if ustrtrim(q3_4_raw) == "1"
replace q3_4 = 2 if ustrtrim(q3_4_raw) == "2"
replace q3_4 = 3 if ustrtrim(q3_4_raw) == "3"
replace q3_4 = 4 if ustrtrim(q3_4_raw) == "4"
replace q3_4 = 5 if ustrtrim(q3_4_raw) == "5"
replace q3_4 = .r if ustrtrim(q3_4_raw) == "-99"
replace q3_4 = .d if ustrtrim(q3_4_raw) == "6"
replace q3_4 = .u if q3_4 == . & !missing(ustrtrim(q3_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_4 == .u)
label values q3_4 vl_comparison
label variable q3_4 "3.4 Nepal stability compared with five years ago"
char q3_4[source_name] "q3_4"
char q3_4[question_en] "3.4.  Compared to five years ago, Nepal is politically:"
char q3_4[question_ne] "३.४ पाँच वर्षअघिको तुलनामा नेपालको राजनीतिक अवस्था:"
notes q3_4: 3.4.  Compared to five years ago, Nepal is politically:
notes q3_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_4_raw for original code.
order q3_4, before(q3_4_raw)
label variable q3_4_raw "Original code: q3_4"

* q3_5: comparison
rename q3_5 q3_5_raw
generate double q3_5 = .
replace q3_5 = 1 if ustrtrim(q3_5_raw) == "1"
replace q3_5 = 2 if ustrtrim(q3_5_raw) == "2"
replace q3_5 = 3 if ustrtrim(q3_5_raw) == "3"
replace q3_5 = 4 if ustrtrim(q3_5_raw) == "4"
replace q3_5 = 5 if ustrtrim(q3_5_raw) == "5"
replace q3_5 = .r if ustrtrim(q3_5_raw) == "-99"
replace q3_5 = .d if ustrtrim(q3_5_raw) == "6"
replace q3_5 = .u if q3_5 == . & !missing(ustrtrim(q3_5_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_5 == .u)
label values q3_5 vl_comparison
label variable q3_5 "3.5 Expected Nepal stability in five years"
char q3_5[source_name] "q3_5"
char q3_5[question_en] "3.5.  Compared to now, in 5 years Nepal will be:"
char q3_5[question_ne] "३.५ अहिलेको तुलनामा पाँच वर्षपछि नेपालको राजनीतिक अवस्था कस्तो हुनेछ?"
notes q3_5: 3.5.  Compared to now, in 5 years Nepal will be:
notes q3_5: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_5_raw for original code.
order q3_5, before(q3_5_raw)
label variable q3_5_raw "Original code: q3_5"

* q3_6: likelihood
rename q3_6 q3_6_raw
generate double q3_6 = .
replace q3_6 = 1 if ustrtrim(q3_6_raw) == "1"
replace q3_6 = 2 if ustrtrim(q3_6_raw) == "2"
replace q3_6 = 3 if ustrtrim(q3_6_raw) == "3"
replace q3_6 = 4 if ustrtrim(q3_6_raw) == "4"
replace q3_6 = 5 if ustrtrim(q3_6_raw) == "5"
replace q3_6 = .r if ustrtrim(q3_6_raw) == "-99"
replace q3_6 = .u if q3_6 == . & !missing(ustrtrim(q3_6_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_6 == .u)
label values q3_6 vl_likelihood
label variable q3_6 "3.6 Likelihood government changes within one year"
char q3_6[source_name] "q3_6"
char q3_6[question_en] "3.6.  How likely do you think the government will change in the next one year?"
char q3_6[question_ne] "३.६ आगामी एक वर्षमा सरकार परिवर्तन हुने सम्भावना कत्तिको छ भन्ने तपाईंलाई लाग्छ?"
notes q3_6: 3.6.  How likely do you think the government will change in the next one year?
notes q3_6: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_6_raw for original code.
order q3_6, before(q3_6_raw)
label variable q3_6_raw "Original code: q3_6"

* q3_7: likelihood
rename q3_7 q3_7_raw
generate double q3_7 = .
replace q3_7 = 1 if ustrtrim(q3_7_raw) == "1"
replace q3_7 = 2 if ustrtrim(q3_7_raw) == "2"
replace q3_7 = 3 if ustrtrim(q3_7_raw) == "3"
replace q3_7 = 4 if ustrtrim(q3_7_raw) == "4"
replace q3_7 = 5 if ustrtrim(q3_7_raw) == "5"
replace q3_7 = .r if ustrtrim(q3_7_raw) == "-99"
replace q3_7 = .u if q3_7 == . & !missing(ustrtrim(q3_7_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_7 == .u)
label values q3_7 vl_likelihood
label variable q3_7 "3.7 Likelihood government changes before next federal election"
char q3_7[source_name] "q3_7"
char q3_7[question_en] "3.7.  How likely do you think the government will change before the next federal election?"
char q3_7[question_ne] "३.७ अर्को प्रतिनिधिसभा निर्वाचनअघि सरकार परिवर्तन हुने सम्भावना कत्तिको छ भन्ने तपाईंलाई लाग्छ?"
notes q3_7: 3.7.  How likely do you think the government will change before the next federal election?
notes q3_7: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_7_raw for original code.
order q3_7, before(q3_7_raw)
label variable q3_7_raw "Original code: q3_7"

* q3_8: likelihood
rename q3_8 q3_8_raw
generate double q3_8 = .
replace q3_8 = 1 if ustrtrim(q3_8_raw) == "1"
replace q3_8 = 2 if ustrtrim(q3_8_raw) == "2"
replace q3_8 = 3 if ustrtrim(q3_8_raw) == "3"
replace q3_8 = 4 if ustrtrim(q3_8_raw) == "4"
replace q3_8 = 5 if ustrtrim(q3_8_raw) == "5"
replace q3_8 = .r if ustrtrim(q3_8_raw) == "-99"
replace q3_8 = .u if q3_8 == . & !missing(ustrtrim(q3_8_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_8 == .u)
label values q3_8 vl_likelihood
label variable q3_8 "3.8 Likelihood of major political event within five years"
char q3_8[source_name] "q3_8"
char q3_8[question_en] "3.8.  How likely do you think Nepal will experience a major political event, movement or revolution within the next five years?"
char q3_8[question_ne] "३.८ आगामी पाँच वर्षभित्र नेपालमा कुनै ठूलो राजनीतिक घटना, आन्दोलन वा राजनीतिक परिवर्तन हुने सम्भावना कत्तिको छ?"
notes q3_8: 3.8.  How likely do you think Nepal will experience a major political event, movement or revolution within the next five years?
notes q3_8: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_8_raw for original code.
order q3_8, before(q3_8_raw)
label variable q3_8_raw "Original code: q3_8"

* q3_9: likelihood
rename q3_9 q3_9_raw
generate double q3_9 = .
replace q3_9 = 1 if ustrtrim(q3_9_raw) == "1"
replace q3_9 = 2 if ustrtrim(q3_9_raw) == "2"
replace q3_9 = 3 if ustrtrim(q3_9_raw) == "3"
replace q3_9 = 4 if ustrtrim(q3_9_raw) == "4"
replace q3_9 = 5 if ustrtrim(q3_9_raw) == "5"
replace q3_9 = .r if ustrtrim(q3_9_raw) == "-99"
replace q3_9 = .u if q3_9 == . & !missing(ustrtrim(q3_9_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_9 == .u)
label values q3_9 vl_likelihood
label variable q3_9 "3.9 Likelihood of new political force within five years"
char q3_9[source_name] "q3_9"
char q3_9[question_en] "3.9.  How likely is a new political party or political force to emerge in the next five years?"
char q3_9[question_ne] "३.९ आगामी पाँच वर्षमा नयाँ राजनीतिक दल वा राजनीतिक शक्ति उदाउने सम्भावना कत्तिको छ?"
notes q3_9: 3.9.  How likely is a new political party or political force to emerge in the next five years?
notes q3_9: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_9_raw for original code.
order q3_9, before(q3_9_raw)
label variable q3_9_raw "Original code: q3_9"

* q3_10_11: agree5
rename q3_10_11 q3_10_11_raw
generate double q3_10_11 = .
replace q3_10_11 = 1 if ustrtrim(q3_10_11_raw) == "1"
replace q3_10_11 = 2 if ustrtrim(q3_10_11_raw) == "2"
replace q3_10_11 = 3 if ustrtrim(q3_10_11_raw) == "3"
replace q3_10_11 = 4 if ustrtrim(q3_10_11_raw) == "4"
replace q3_10_11 = 5 if ustrtrim(q3_10_11_raw) == "5"
replace q3_10_11 = .r if ustrtrim(q3_10_11_raw) == "-99"
replace q3_10_11 = .d if ustrtrim(q3_10_11_raw) == "6"
replace q3_10_11 = .u if q3_10_11 == . & !missing(ustrtrim(q3_10_11_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_10_11 == .u)
label values q3_10_11 vl_agree5
label variable q3_10_11 "Nepal stability risk: Corruption"
char q3_10_11[source_name] "q3_10_11"
char q3_10_11[question_en] "3.10.1 Corruption poses a great risk to political stability in Nepal."
char q3_10_11[question_ne] "३.१०.१ भ्रष्टाचारले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
notes q3_10_11: 3.10.1 Corruption poses a great risk to political stability in Nepal.
notes q3_10_11: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_10_11_raw for original code.
order q3_10_11, before(q3_10_11_raw)
label variable q3_10_11_raw "Original code: q3_10_11"

* q3_10_11_001: sn7om92
rename q3_10_11_001 q3_10_11_001_raw
generate double q3_10_11_001 = .
replace q3_10_11_001 = 1 if ustrtrim(q3_10_11_001_raw) == "1"
replace q3_10_11_001 = 2 if ustrtrim(q3_10_11_001_raw) == "2"
replace q3_10_11_001 = 3 if ustrtrim(q3_10_11_001_raw) == "3"
replace q3_10_11_001 = 4 if ustrtrim(q3_10_11_001_raw) == "4"
replace q3_10_11_001 = 5 if ustrtrim(q3_10_11_001_raw) == "5"
replace q3_10_11_001 = .r if ustrtrim(q3_10_11_001_raw) == "-99"
replace q3_10_11_001 = .d if ustrtrim(q3_10_11_001_raw) == "dont_know"
replace q3_10_11_001 = .u if q3_10_11_001 == . & !missing(ustrtrim(q3_10_11_001_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_10_11_001 == .u)
label values q3_10_11_001 vl_sn7om92
label variable q3_10_11_001 "Nepal stability risk: Lack of accountability"
char q3_10_11_001[source_name] "q3_10_11_001"
char q3_10_11_001[question_en] "3.10.2 lack of accountability poses a great risk to political stability in Nepal."
char q3_10_11_001[question_ne] "३.१०.२ जवाफदेहिताको कमीले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
notes q3_10_11_001: 3.10.2 lack of accountability poses a great risk to political stability in Nepal.
notes q3_10_11_001: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_10_11_001_raw for original code.
order q3_10_11_001, before(q3_10_11_001_raw)
label variable q3_10_11_001_raw "Original code: q3_10_11_001"

* q3_10_12: agree5
rename q3_10_12 q3_10_12_raw
generate double q3_10_12 = .
replace q3_10_12 = 1 if ustrtrim(q3_10_12_raw) == "1"
replace q3_10_12 = 2 if ustrtrim(q3_10_12_raw) == "2"
replace q3_10_12 = 3 if ustrtrim(q3_10_12_raw) == "3"
replace q3_10_12 = 4 if ustrtrim(q3_10_12_raw) == "4"
replace q3_10_12 = 5 if ustrtrim(q3_10_12_raw) == "5"
replace q3_10_12 = .r if ustrtrim(q3_10_12_raw) == "-99"
replace q3_10_12 = .d if ustrtrim(q3_10_12_raw) == "6"
replace q3_10_12 = .u if q3_10_12 == . & !missing(ustrtrim(q3_10_12_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_10_12 == .u)
label values q3_10_12 vl_agree5
label variable q3_10_12 "Nepal stability risk: Unemployment/economic opportunities"
char q3_10_12[source_name] "q3_10_12"
char q3_10_12[question_en] "3.10.3 Unemployment and lack of economic opportunities pose a great risk to political stability in Nepal."
char q3_10_12[question_ne] "३.१०.३ बेरोजगारी र आर्थिक अवसरको कमीले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
notes q3_10_12: 3.10.3 Unemployment and lack of economic opportunities pose a great risk to political stability in Nepal.
notes q3_10_12: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_10_12_raw for original code.
order q3_10_12, before(q3_10_12_raw)
label variable q3_10_12_raw "Original code: q3_10_12"

* q3_10_13: agree5
rename q3_10_13 q3_10_13_raw
generate double q3_10_13 = .
replace q3_10_13 = 1 if ustrtrim(q3_10_13_raw) == "1"
replace q3_10_13 = 2 if ustrtrim(q3_10_13_raw) == "2"
replace q3_10_13 = 3 if ustrtrim(q3_10_13_raw) == "3"
replace q3_10_13 = 4 if ustrtrim(q3_10_13_raw) == "4"
replace q3_10_13 = 5 if ustrtrim(q3_10_13_raw) == "5"
replace q3_10_13 = .r if ustrtrim(q3_10_13_raw) == "-99"
replace q3_10_13 = .d if ustrtrim(q3_10_13_raw) == "6"
replace q3_10_13 = .u if q3_10_13 == . & !missing(ustrtrim(q3_10_13_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_10_13 == .u)
label values q3_10_13 vl_agree5
label variable q3_10_13 "Nepal stability risk: Political exclusion"
char q3_10_13[source_name] "q3_10_13"
char q3_10_13[question_en] "3.10.3 Political exclusion of certain groups poses a great risk to political stability in Nepal."
char q3_10_13[question_ne] "३.१०.४ राज्य संयत्रमा  सामवेशिताको कमीले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
notes q3_10_13: 3.10.3 Political exclusion of certain groups poses a great risk to political stability in Nepal.
notes q3_10_13: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_10_13_raw for original code.
order q3_10_13, before(q3_10_13_raw)
label variable q3_10_13_raw "Original code: q3_10_13"

* q3_10_14: agree5
rename q3_10_14 q3_10_14_raw
generate double q3_10_14 = .
replace q3_10_14 = 1 if ustrtrim(q3_10_14_raw) == "1"
replace q3_10_14 = 2 if ustrtrim(q3_10_14_raw) == "2"
replace q3_10_14 = 3 if ustrtrim(q3_10_14_raw) == "3"
replace q3_10_14 = 4 if ustrtrim(q3_10_14_raw) == "4"
replace q3_10_14 = 5 if ustrtrim(q3_10_14_raw) == "5"
replace q3_10_14 = .r if ustrtrim(q3_10_14_raw) == "-99"
replace q3_10_14 = .d if ustrtrim(q3_10_14_raw) == "6"
replace q3_10_14 = .u if q3_10_14 == . & !missing(ustrtrim(q3_10_14_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_10_14 == .u)
label values q3_10_14 vl_agree5
label variable q3_10_14 "Nepal stability risk: Rising cost of living"
char q3_10_14[source_name] "q3_10_14"
char q3_10_14[question_en] "3.10.4 Rising cost of living poses a great risk to political stability in Nepal."
char q3_10_14[question_ne] "३.१०.५ बढ्दो महंगीले भविष्यमा  नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
notes q3_10_14: 3.10.4 Rising cost of living poses a great risk to political stability in Nepal.
notes q3_10_14: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_10_14_raw for original code.
order q3_10_14, before(q3_10_14_raw)
label variable q3_10_14_raw "Original code: q3_10_14"

* q3_10_15: agree5
rename q3_10_15 q3_10_15_raw
generate double q3_10_15 = .
replace q3_10_15 = 1 if ustrtrim(q3_10_15_raw) == "1"
replace q3_10_15 = 2 if ustrtrim(q3_10_15_raw) == "2"
replace q3_10_15 = 3 if ustrtrim(q3_10_15_raw) == "3"
replace q3_10_15 = 4 if ustrtrim(q3_10_15_raw) == "4"
replace q3_10_15 = 5 if ustrtrim(q3_10_15_raw) == "5"
replace q3_10_15 = .r if ustrtrim(q3_10_15_raw) == "-99"
replace q3_10_15 = .d if ustrtrim(q3_10_15_raw) == "6"
replace q3_10_15 = .u if q3_10_15 == . & !missing(ustrtrim(q3_10_15_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_10_15 == .u)
label values q3_10_15 vl_agree5
label variable q3_10_15 "Nepal stability risk: Social media misinformation"
char q3_10_15[source_name] "q3_10_15"
char q3_10_15[question_en] "3.10.5 Misinformation through social media poses a great risk to political stability in Nepal."
char q3_10_15[question_ne] "३.१०.६ सामाजिक सञ्जालमार्फत फैलिने गलत/मिथ्य/भ्रामक  सूचनाले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
notes q3_10_15: 3.10.5 Misinformation through social media poses a great risk to political stability in Nepal.
notes q3_10_15: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_10_15_raw for original code.
order q3_10_15, before(q3_10_15_raw)
label variable q3_10_15_raw "Original code: q3_10_15"

* q3_10_16: agree5
rename q3_10_16 q3_10_16_raw
generate double q3_10_16 = .
replace q3_10_16 = 1 if ustrtrim(q3_10_16_raw) == "1"
replace q3_10_16 = 2 if ustrtrim(q3_10_16_raw) == "2"
replace q3_10_16 = 3 if ustrtrim(q3_10_16_raw) == "3"
replace q3_10_16 = 4 if ustrtrim(q3_10_16_raw) == "4"
replace q3_10_16 = 5 if ustrtrim(q3_10_16_raw) == "5"
replace q3_10_16 = .r if ustrtrim(q3_10_16_raw) == "-99"
replace q3_10_16 = .d if ustrtrim(q3_10_16_raw) == "6"
replace q3_10_16 = .u if q3_10_16 == . & !missing(ustrtrim(q3_10_16_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_10_16 == .u)
label values q3_10_16 vl_agree5
label variable q3_10_16 "Nepal stability risk: Foreign/external influence"
char q3_10_16[source_name] "q3_10_16"
char q3_10_16[question_en] "3.10.6 Influence of foreign/external forces poses a great risk to political stability in Nepal."
char q3_10_16[question_ne] "३.१०.७ विदेशी/बाह्य शक्तिको प्रभावले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ ।"
notes q3_10_16: 3.10.6 Influence of foreign/external forces poses a great risk to political stability in Nepal.
notes q3_10_16: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_10_16_raw for original code.
order q3_10_16, before(q3_10_16_raw)
label variable q3_10_16_raw "Original code: q3_10_16"

* q3_10_17: agree5
rename q3_10_17 q3_10_17_raw
generate double q3_10_17 = .
replace q3_10_17 = 1 if ustrtrim(q3_10_17_raw) == "1"
replace q3_10_17 = 2 if ustrtrim(q3_10_17_raw) == "2"
replace q3_10_17 = 3 if ustrtrim(q3_10_17_raw) == "3"
replace q3_10_17 = 4 if ustrtrim(q3_10_17_raw) == "4"
replace q3_10_17 = 5 if ustrtrim(q3_10_17_raw) == "5"
replace q3_10_17 = .r if ustrtrim(q3_10_17_raw) == "-99"
replace q3_10_17 = .d if ustrtrim(q3_10_17_raw) == "6"
replace q3_10_17 = .u if q3_10_17 == . & !missing(ustrtrim(q3_10_17_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_10_17 == .u)
label values q3_10_17 vl_agree5
label variable q3_10_17 "Nepal stability risk: Ethnic/religious conflict"
char q3_10_17[source_name] "q3_10_17"
char q3_10_17[question_en] "3.10.7 Ethnic or religious tension/conflict poses a great risk to political stability in Nepal."
char q3_10_17[question_ne] "३.१०.८ जातीय वा धार्मिक तनाव/द्वन्द्वले भविष्यमा नेपालको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउँन सक्छ |"
notes q3_10_17: 3.10.7 Ethnic or religious tension/conflict poses a great risk to political stability in Nepal.
notes q3_10_17: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_10_17_raw for original code.
order q3_10_17, before(q3_10_17_raw)
label variable q3_10_17_raw "Original code: q3_10_17"

* q3_11_1: agree5
rename q3_11_1 q3_11_1_raw
generate double q3_11_1 = .
replace q3_11_1 = 1 if ustrtrim(q3_11_1_raw) == "1"
replace q3_11_1 = 2 if ustrtrim(q3_11_1_raw) == "2"
replace q3_11_1 = 3 if ustrtrim(q3_11_1_raw) == "3"
replace q3_11_1 = 4 if ustrtrim(q3_11_1_raw) == "4"
replace q3_11_1 = 5 if ustrtrim(q3_11_1_raw) == "5"
replace q3_11_1 = .r if ustrtrim(q3_11_1_raw) == "-99"
replace q3_11_1 = .d if ustrtrim(q3_11_1_raw) == "6"
replace q3_11_1 = .u if q3_11_1 == . & !missing(ustrtrim(q3_11_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_11_1 == .u)
label values q3_11_1 vl_agree5
label variable q3_11_1 "Nepal hope: Governance/anti-corruption reforms"
char q3_11_1[source_name] "q3_11_1"
char q3_11_1[question_en] "3.11.1 I am hopeful for Nepal’s future because it had adopted better governance and anti-corruption reforms."
char q3_11_1[question_ne] "३.११.१ नेपालले सुशासन र भ्रष्टाचारविरोधी सुधारहरू अपनाएकोले म नेपालको भविष्यप्रति आशावादी छु।"
notes q3_11_1: 3.11.1 I am hopeful for Nepal’s future because it had adopted better governance and anti-corruption reforms.
notes q3_11_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_11_1_raw for original code.
order q3_11_1, before(q3_11_1_raw)
label variable q3_11_1_raw "Original code: q3_11_1"

* q3_11_2: agree5
rename q3_11_2 q3_11_2_raw
generate double q3_11_2 = .
replace q3_11_2 = 1 if ustrtrim(q3_11_2_raw) == "1"
replace q3_11_2 = 2 if ustrtrim(q3_11_2_raw) == "2"
replace q3_11_2 = 3 if ustrtrim(q3_11_2_raw) == "3"
replace q3_11_2 = 4 if ustrtrim(q3_11_2_raw) == "4"
replace q3_11_2 = 5 if ustrtrim(q3_11_2_raw) == "5"
replace q3_11_2 = .r if ustrtrim(q3_11_2_raw) == "-99"
replace q3_11_2 = .d if ustrtrim(q3_11_2_raw) == "6"
replace q3_11_2 = .u if q3_11_2 == . & !missing(ustrtrim(q3_11_2_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_11_2 == .u)
label values q3_11_2 vl_agree5
label variable q3_11_2 "Nepal hope: Youth political participation"
char q3_11_2[source_name] "q3_11_2"
char q3_11_2[question_en] "3.11.2 I am hopeful about Nepal’s future because of greater youth participation in politics."
char q3_11_2[question_ne] "३.११.२ राजनीतिमा युवाहरूको बढ्दो सहभागिताका कारण म नेपालको भविष्यप्रति आशावादी छु।"
notes q3_11_2: 3.11.2 I am hopeful about Nepal’s future because of greater youth participation in politics.
notes q3_11_2: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_11_2_raw for original code.
order q3_11_2, before(q3_11_2_raw)
label variable q3_11_2_raw "Original code: q3_11_2"

* q3_11_3: agree5
rename q3_11_3 q3_11_3_raw
generate double q3_11_3 = .
replace q3_11_3 = 1 if ustrtrim(q3_11_3_raw) == "1"
replace q3_11_3 = 2 if ustrtrim(q3_11_3_raw) == "2"
replace q3_11_3 = 3 if ustrtrim(q3_11_3_raw) == "3"
replace q3_11_3 = 4 if ustrtrim(q3_11_3_raw) == "4"
replace q3_11_3 = 5 if ustrtrim(q3_11_3_raw) == "5"
replace q3_11_3 = .r if ustrtrim(q3_11_3_raw) == "-99"
replace q3_11_3 = .d if ustrtrim(q3_11_3_raw) == "6"
replace q3_11_3 = .u if q3_11_3 == . & !missing(ustrtrim(q3_11_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_11_3 == .u)
label values q3_11_3 vl_agree5
label variable q3_11_3 "Nepal hope: Improved democracy"
char q3_11_3[source_name] "q3_11_3"
char q3_11_3[question_en] "3.11.3 I am hopeful about Nepal’s future because of the state of the democracy has improved."
char q3_11_3[question_ne] "३.११.३ लोकतन्त्रको अवस्था सुधार भएकोले म नेपालको भविष्यप्रति आशावादी छु।"
notes q3_11_3: 3.11.3 I am hopeful about Nepal’s future because of the state of the democracy has improved.
notes q3_11_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_11_3_raw for original code.
order q3_11_3, before(q3_11_3_raw)
label variable q3_11_3_raw "Original code: q3_11_3"

* q3_11_4: agree5
rename q3_11_4 q3_11_4_raw
generate double q3_11_4 = .
replace q3_11_4 = 1 if ustrtrim(q3_11_4_raw) == "1"
replace q3_11_4 = 2 if ustrtrim(q3_11_4_raw) == "2"
replace q3_11_4 = 3 if ustrtrim(q3_11_4_raw) == "3"
replace q3_11_4 = 4 if ustrtrim(q3_11_4_raw) == "4"
replace q3_11_4 = 5 if ustrtrim(q3_11_4_raw) == "5"
replace q3_11_4 = .r if ustrtrim(q3_11_4_raw) == "-99"
replace q3_11_4 = .d if ustrtrim(q3_11_4_raw) == "6"
replace q3_11_4 = .u if q3_11_4 == . & !missing(ustrtrim(q3_11_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q3_11_4 == .u)
label values q3_11_4 vl_agree5
label variable q3_11_4 "Nepal hope: Economic/employment prospects"
char q3_11_4[source_name] "q3_11_4"
char q3_11_4[question_en] "3.11.4 I am hopeful about Nepal’s future because economic and employment prospect is in increasing trend."
char q3_11_4[question_ne] "३.११.४ आर्थिक तथा रोजगारीका सम्भावना बढ्दो क्रममा रहेकाले म नेपालको भविष्यप्रति आशावादी छु।"
notes q3_11_4: 3.11.4 I am hopeful about Nepal’s future because economic and employment prospect is in increasing trend.
notes q3_11_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q3_11_4_raw for original code.
order q3_11_4, before(q3_11_4_raw)
label variable q3_11_4_raw "Original code: q3_11_4"

* q4_1: follow_genz
rename q4_1 q4_1_raw
generate double q4_1 = .
replace q4_1 = 1 if ustrtrim(q4_1_raw) == "1"
replace q4_1 = 2 if ustrtrim(q4_1_raw) == "2"
replace q4_1 = 3 if ustrtrim(q4_1_raw) == "3"
replace q4_1 = 4 if ustrtrim(q4_1_raw) == "4"
replace q4_1 = 5 if ustrtrim(q4_1_raw) == "5"
replace q4_1 = .r if ustrtrim(q4_1_raw) == "-99"
replace q4_1 = .u if q4_1 == . & !missing(ustrtrim(q4_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_1 == .u)
label values q4_1 vl_follow_genz
label variable q4_1 "4.1 Attention to September 8 Gen-Z protest and subsequent politics"
char q4_1[source_name] "q4_1"
char q4_1[question_en] "4.1.  How closely have you followed the September 8 Gen-Z protest and the subsequent political happenings in Nepal?"
char q4_1[question_ne] "४.१ भदौ २३ र २४  को Gen-Z आन्दोलन र त्यसपछि नेपालमा भएका राजनीतिक घटनाक्रमलाई तपाईंले कत्तिको नजिकबाट चासो राख्नु भएको  थियो ?"
notes q4_1: 4.1.  How closely have you followed the September 8 Gen-Z protest and the subsequent political happenings in Nepal?
notes q4_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_1_raw for original code.
order q4_1, before(q4_1_raw)
label variable q4_1_raw "Original code: q4_1"

* q4_2_1: agree5
rename q4_2_1 q4_2_1_raw
generate double q4_2_1 = .
replace q4_2_1 = 1 if ustrtrim(q4_2_1_raw) == "1"
replace q4_2_1 = 2 if ustrtrim(q4_2_1_raw) == "2"
replace q4_2_1 = 3 if ustrtrim(q4_2_1_raw) == "3"
replace q4_2_1 = 4 if ustrtrim(q4_2_1_raw) == "4"
replace q4_2_1 = 5 if ustrtrim(q4_2_1_raw) == "5"
replace q4_2_1 = .r if ustrtrim(q4_2_1_raw) == "-99"
replace q4_2_1 = .d if ustrtrim(q4_2_1_raw) == "6"
replace q4_2_1 = .u if q4_2_1 == . & !missing(ustrtrim(q4_2_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_2_1 == .u)
label values q4_2_1 vl_agree5
label variable q4_2_1 "Gen-Z protest cause: Corruption"
char q4_2_1[source_name] "q4_2_1"
char q4_2_1[question_en] "4.2.1 Widescale corruption are reasons behind the Gen-Z protest in Nepal."
char q4_2_1[question_ne] "४.२.१ व्यापक भ्रष्टाचार नेपालमा Gen-Z आन्दोलन हुनुका कारण हुन्।"
notes q4_2_1: 4.2.1 Widescale corruption are reasons behind the Gen-Z protest in Nepal.
notes q4_2_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_2_1_raw for original code.
order q4_2_1, before(q4_2_1_raw)
label variable q4_2_1_raw "Original code: q4_2_1"

* q4_2_2: agree5
rename q4_2_2 q4_2_2_raw
generate double q4_2_2 = .
replace q4_2_2 = 1 if ustrtrim(q4_2_2_raw) == "1"
replace q4_2_2 = 2 if ustrtrim(q4_2_2_raw) == "2"
replace q4_2_2 = 3 if ustrtrim(q4_2_2_raw) == "3"
replace q4_2_2 = 4 if ustrtrim(q4_2_2_raw) == "4"
replace q4_2_2 = 5 if ustrtrim(q4_2_2_raw) == "5"
replace q4_2_2 = .r if ustrtrim(q4_2_2_raw) == "-99"
replace q4_2_2 = .d if ustrtrim(q4_2_2_raw) == "6"
replace q4_2_2 = .u if q4_2_2 == . & !missing(ustrtrim(q4_2_2_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_2_2 == .u)
label values q4_2_2 vl_agree5
label variable q4_2_2 "Gen-Z protest cause: Poor public services"
char q4_2_2[source_name] "q4_2_2"
char q4_2_2[question_en] "4.2.2 Poor public service delivery are reasons behind the Gen-Z protest in Nepal."
char q4_2_2[question_ne] "४.२.२ कमजोर सार्वजनिक सेवा प्रवाह नेपालमा Gen-Z आन्दोलन हुनुका कारण हुन्।"
notes q4_2_2: 4.2.2 Poor public service delivery are reasons behind the Gen-Z protest in Nepal.
notes q4_2_2: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_2_2_raw for original code.
order q4_2_2, before(q4_2_2_raw)
label variable q4_2_2_raw "Original code: q4_2_2"

* q4_2_3: agree5
rename q4_2_3 q4_2_3_raw
generate double q4_2_3 = .
replace q4_2_3 = 1 if ustrtrim(q4_2_3_raw) == "1"
replace q4_2_3 = 2 if ustrtrim(q4_2_3_raw) == "2"
replace q4_2_3 = 3 if ustrtrim(q4_2_3_raw) == "3"
replace q4_2_3 = 4 if ustrtrim(q4_2_3_raw) == "4"
replace q4_2_3 = 5 if ustrtrim(q4_2_3_raw) == "5"
replace q4_2_3 = .r if ustrtrim(q4_2_3_raw) == "-99"
replace q4_2_3 = .d if ustrtrim(q4_2_3_raw) == "6"
replace q4_2_3 = .u if q4_2_3 == . & !missing(ustrtrim(q4_2_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_2_3 == .u)
label values q4_2_3 vl_agree5
label variable q4_2_3 "Gen-Z protest cause: Unemployment/economic opportunities"
char q4_2_3[source_name] "q4_2_3"
char q4_2_3[question_en] "4.2.3 Unemployment and lack of economic opportunities reasons behind Gen-Z protest in Nepal."
char q4_2_3[question_ne] "४.२.३ बेरोजगारी र आर्थिक अवसरको कमी नेपालमा Gen-Z आन्दोलन हुनुका कारण हुन्।"
notes q4_2_3: 4.2.3 Unemployment and lack of economic opportunities reasons behind Gen-Z protest in Nepal.
notes q4_2_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_2_3_raw for original code.
order q4_2_3, before(q4_2_3_raw)
label variable q4_2_3_raw "Original code: q4_2_3"

* q4_2_4: agree5
rename q4_2_4 q4_2_4_raw
generate double q4_2_4 = .
replace q4_2_4 = 1 if ustrtrim(q4_2_4_raw) == "1"
replace q4_2_4 = 2 if ustrtrim(q4_2_4_raw) == "2"
replace q4_2_4 = 3 if ustrtrim(q4_2_4_raw) == "3"
replace q4_2_4 = 4 if ustrtrim(q4_2_4_raw) == "4"
replace q4_2_4 = 5 if ustrtrim(q4_2_4_raw) == "5"
replace q4_2_4 = .r if ustrtrim(q4_2_4_raw) == "-99"
replace q4_2_4 = .d if ustrtrim(q4_2_4_raw) == "6"
replace q4_2_4 = .u if q4_2_4 == . & !missing(ustrtrim(q4_2_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_2_4 == .u)
label values q4_2_4 vl_agree5
label variable q4_2_4 "Gen-Z protest cause: Rising cost of living"
char q4_2_4[source_name] "q4_2_4"
char q4_2_4[question_en] "4.2.4 Rising cost of living is the reason behind Gen-Z protest in Nepal."
char q4_2_4[question_ne] "४.२.४ बढ्दो महंगी  नेपालमा Gen-Z आन्दोलन हुनुको कारण हो।"
notes q4_2_4: 4.2.4 Rising cost of living is the reason behind Gen-Z protest in Nepal.
notes q4_2_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_2_4_raw for original code.
order q4_2_4, before(q4_2_4_raw)
label variable q4_2_4_raw "Original code: q4_2_4"

* q4_2_5: agree5
rename q4_2_5 q4_2_5_raw
generate double q4_2_5 = .
replace q4_2_5 = 1 if ustrtrim(q4_2_5_raw) == "1"
replace q4_2_5 = 2 if ustrtrim(q4_2_5_raw) == "2"
replace q4_2_5 = 3 if ustrtrim(q4_2_5_raw) == "3"
replace q4_2_5 = 4 if ustrtrim(q4_2_5_raw) == "4"
replace q4_2_5 = 5 if ustrtrim(q4_2_5_raw) == "5"
replace q4_2_5 = .r if ustrtrim(q4_2_5_raw) == "-99"
replace q4_2_5 = .d if ustrtrim(q4_2_5_raw) == "6"
replace q4_2_5 = .u if q4_2_5 == . & !missing(ustrtrim(q4_2_5_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_2_5 == .u)
label values q4_2_5 vl_agree5
label variable q4_2_5 "Gen-Z protest cause: Distrust of leaders/parties/institutions"
char q4_2_5[source_name] "q4_2_5"
char q4_2_5[question_en] "4.2.5 Lack of trust in political leaders, parties, and government institutions are the reasons behind Gen-Z protest in Nepal."
char q4_2_5[question_ne] "४.२.५ राजनीतिक नेता, दल र सरकारी संस्थाप्रतिको विश्वासको कमी नेपालमा Gen-Z आन्दोलन हुनुका कारण हुन्।"
notes q4_2_5: 4.2.5 Lack of trust in political leaders, parties, and government institutions are the reasons behind Gen-Z protest in Nepal.
notes q4_2_5: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_2_5_raw for original code.
order q4_2_5, before(q4_2_5_raw)
label variable q4_2_5_raw "Original code: q4_2_5"

* q4_2_6: agree5
rename q4_2_6 q4_2_6_raw
generate double q4_2_6 = .
replace q4_2_6 = 1 if ustrtrim(q4_2_6_raw) == "1"
replace q4_2_6 = 2 if ustrtrim(q4_2_6_raw) == "2"
replace q4_2_6 = 3 if ustrtrim(q4_2_6_raw) == "3"
replace q4_2_6 = 4 if ustrtrim(q4_2_6_raw) == "4"
replace q4_2_6 = 5 if ustrtrim(q4_2_6_raw) == "5"
replace q4_2_6 = .r if ustrtrim(q4_2_6_raw) == "-99"
replace q4_2_6 = .d if ustrtrim(q4_2_6_raw) == "6"
replace q4_2_6 = .u if q4_2_6 == . & !missing(ustrtrim(q4_2_6_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_2_6 == .u)
label values q4_2_6 vl_agree5
label variable q4_2_6 "Gen-Z protest cause: Nepotism/elite capture"
char q4_2_6[source_name] "q4_2_6"
char q4_2_6[question_en] "4.2.6 Nepotism and elite capture are the reasons behind Gen-Z protest in Nepal."
char q4_2_6[question_ne] "४.२.६ नातावाद र सीमित पहुचयोग्य  वर्गको वर्चस्वनै  नेपालमा Gen-Z आन्दोलन हुनुका कारण हुन्।"
notes q4_2_6: 4.2.6 Nepotism and elite capture are the reasons behind Gen-Z protest in Nepal.
notes q4_2_6: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_2_6_raw for original code.
order q4_2_6, before(q4_2_6_raw)
label variable q4_2_6_raw "Original code: q4_2_6"

* q4_2_7: agree5
rename q4_2_7 q4_2_7_raw
generate double q4_2_7 = .
replace q4_2_7 = 1 if ustrtrim(q4_2_7_raw) == "1"
replace q4_2_7 = 2 if ustrtrim(q4_2_7_raw) == "2"
replace q4_2_7 = 3 if ustrtrim(q4_2_7_raw) == "3"
replace q4_2_7 = 4 if ustrtrim(q4_2_7_raw) == "4"
replace q4_2_7 = 5 if ustrtrim(q4_2_7_raw) == "5"
replace q4_2_7 = .r if ustrtrim(q4_2_7_raw) == "-99"
replace q4_2_7 = .d if ustrtrim(q4_2_7_raw) == "6"
replace q4_2_7 = .u if q4_2_7 == . & !missing(ustrtrim(q4_2_7_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_2_7 == .u)
label values q4_2_7 vl_agree5
label variable q4_2_7 "Gen-Z protest cause: Social media ban"
char q4_2_7[source_name] "q4_2_7"
char q4_2_7[question_en] "4.2.7 Sudden ban of social media is the reason behind Gen-Z protest in Nepal."
char q4_2_7[question_ne] "४.२.७ सामाजिक सञ्जालमाथिको अचानक लगाइएको प्रतिबन्ध नेपालमा Gen-Z आन्दोलन हुनुको कारण हो।"
notes q4_2_7: 4.2.7 Sudden ban of social media is the reason behind Gen-Z protest in Nepal.
notes q4_2_7: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_2_7_raw for original code.
order q4_2_7, before(q4_2_7_raw)
label variable q4_2_7_raw "Original code: q4_2_7"

* q4_2_8: agree5
rename q4_2_8 q4_2_8_raw
generate double q4_2_8 = .
replace q4_2_8 = 1 if ustrtrim(q4_2_8_raw) == "1"
replace q4_2_8 = 2 if ustrtrim(q4_2_8_raw) == "2"
replace q4_2_8 = 3 if ustrtrim(q4_2_8_raw) == "3"
replace q4_2_8 = 4 if ustrtrim(q4_2_8_raw) == "4"
replace q4_2_8 = 5 if ustrtrim(q4_2_8_raw) == "5"
replace q4_2_8 = .r if ustrtrim(q4_2_8_raw) == "-99"
replace q4_2_8 = .d if ustrtrim(q4_2_8_raw) == "6"
replace q4_2_8 = .u if q4_2_8 == . & !missing(ustrtrim(q4_2_8_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_2_8 == .u)
label values q4_2_8 vl_agree5
label variable q4_2_8 "Gen-Z protest cause: Foreign/external influence"
char q4_2_8[source_name] "q4_2_8"
char q4_2_8[question_en] "4.2.8 External influence or outside forces is the major reason behind Gen-Z protest in Nepal."
char q4_2_8[question_ne] "४.२.८ बाह्य प्रभाव वा बाह्य शक्तिहरू नेपालमा Gen-Z आन्दोलन हुनुको प्रमुख कारण हो।"
notes q4_2_8: 4.2.8 External influence or outside forces is the major reason behind Gen-Z protest in Nepal.
notes q4_2_8: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_2_8_raw for original code.
order q4_2_8, before(q4_2_8_raw)
label variable q4_2_8_raw "Original code: q4_2_8"

* q4_3: agree5
rename q4_3 q4_3_raw
generate double q4_3 = .
replace q4_3 = 1 if ustrtrim(q4_3_raw) == "1"
replace q4_3 = 2 if ustrtrim(q4_3_raw) == "2"
replace q4_3 = 3 if ustrtrim(q4_3_raw) == "3"
replace q4_3 = 4 if ustrtrim(q4_3_raw) == "4"
replace q4_3 = 5 if ustrtrim(q4_3_raw) == "5"
replace q4_3 = .r if ustrtrim(q4_3_raw) == "-99"
replace q4_3 = .d if ustrtrim(q4_3_raw) == "6"
replace q4_3 = .u if q4_3 == . & !missing(ustrtrim(q4_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_3 == .u)
label values q4_3 vl_agree5
label variable q4_3 "4.3 Gen-Z protest: turning point in political history"
char q4_3[source_name] "q4_3"
char q4_3[question_en] "4.3.  To what extent do you agree that the recent Gen-Z protest represents a turning point in Nepal’s political history?"
char q4_3[question_ne] "४.३ हालैको Gen-Z आन्दोलनले नेपालको राजनीतिक इतिहासमा एउटा महत्वपूर्ण मोड ल्याएको छ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
notes q4_3: 4.3.  To what extent do you agree that the recent Gen-Z protest represents a turning point in Nepal’s political history?
notes q4_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_3_raw for original code.
order q4_3, before(q4_3_raw)
label variable q4_3_raw "Original code: q4_3"

* q4_4: agree5
rename q4_4 q4_4_raw
generate double q4_4 = .
replace q4_4 = 1 if ustrtrim(q4_4_raw) == "1"
replace q4_4 = 2 if ustrtrim(q4_4_raw) == "2"
replace q4_4 = 3 if ustrtrim(q4_4_raw) == "3"
replace q4_4 = 4 if ustrtrim(q4_4_raw) == "4"
replace q4_4 = 5 if ustrtrim(q4_4_raw) == "5"
replace q4_4 = .r if ustrtrim(q4_4_raw) == "-99"
replace q4_4 = .d if ustrtrim(q4_4_raw) == "6"
replace q4_4 = .u if q4_4 == . & !missing(ustrtrim(q4_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_4 == .u)
label values q4_4 vl_agree5
label variable q4_4 "4.4 Gen-Z protest: greater youth civic/political participation"
char q4_4[source_name] "q4_4"
char q4_4[question_en] "4.4.  To what extent do you agree that the Gen-Z protest has encouraged greater civic and political participation among young people? Gen-Z"
char q4_4[question_ne] "४.४ आन्दोलनले युवाहरूको सामाजिक  तथा राजनीतिक सहभागिता बढाउन प्रोत्साहन गरेको छ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
notes q4_4: 4.4.  To what extent do you agree that the Gen-Z protest has encouraged greater civic and political participation among young people? Gen-Z
notes q4_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_4_raw for original code.
order q4_4, before(q4_4_raw)
label variable q4_4_raw "Original code: q4_4"

* q4_5: agree5
rename q4_5 q4_5_raw
generate double q4_5 = .
replace q4_5 = 1 if ustrtrim(q4_5_raw) == "1"
replace q4_5 = 2 if ustrtrim(q4_5_raw) == "2"
replace q4_5 = 3 if ustrtrim(q4_5_raw) == "3"
replace q4_5 = 4 if ustrtrim(q4_5_raw) == "4"
replace q4_5 = 5 if ustrtrim(q4_5_raw) == "5"
replace q4_5 = .r if ustrtrim(q4_5_raw) == "-99"
replace q4_5 = .d if ustrtrim(q4_5_raw) == "6"
replace q4_5 = .u if q4_5 == . & !missing(ustrtrim(q4_5_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_5 == .u)
label values q4_5 vl_agree5
label variable q4_5 "4.5 Gen-Z protest: youth voices included in mainstream politics"
char q4_5[source_name] "q4_5"
char q4_5[question_en] "4.5.  To what extent do you agree Gen-Z protest have led to inclusion of youth voices into mainstream politics? Gen-Z"
char q4_5[question_ne] "४.५ आन्दोलनले युवाहरूका आवाजलाई मूलधारको राजनीतिमा समेट्न योगदान गरेको छ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
notes q4_5: 4.5.  To what extent do you agree Gen-Z protest have led to inclusion of youth voices into mainstream politics? Gen-Z
notes q4_5: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_5_raw for original code.
order q4_5, before(q4_5_raw)
label variable q4_5_raw "Original code: q4_5"

* q4_6: agree5
rename q4_6 q4_6_raw
generate double q4_6 = .
replace q4_6 = 1 if ustrtrim(q4_6_raw) == "1"
replace q4_6 = 2 if ustrtrim(q4_6_raw) == "2"
replace q4_6 = 3 if ustrtrim(q4_6_raw) == "3"
replace q4_6 = 4 if ustrtrim(q4_6_raw) == "4"
replace q4_6 = 5 if ustrtrim(q4_6_raw) == "5"
replace q4_6 = .r if ustrtrim(q4_6_raw) == "-99"
replace q4_6 = .d if ustrtrim(q4_6_raw) == "6"
replace q4_6 = .u if q4_6 == . & !missing(ustrtrim(q4_6_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_6 == .u)
label values q4_6 vl_agree5
label variable q4_6 "4.6 Gen-Z protest: increased public support for RSP"
char q4_6[source_name] "q4_6"
char q4_6[question_en] "4.6.  To what extent do you agree that the Gen Z protest contributed to the rise of public support for the Rastriya Swatantra Party (RSP)? Gen-Z"
char q4_6[question_ne] "४.६ आन्दोलनले हालको बहुमत प्राप्त सरकार प्रति जनसमर्थन बढाउन योगदान गरेको छ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
notes q4_6: 4.6.  To what extent do you agree that the Gen Z protest contributed to the rise of public support for the Rastriya Swatantra Party (RSP)? Gen-Z
notes q4_6: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_6_raw for original code.
order q4_6, before(q4_6_raw)
label variable q4_6_raw "Original code: q4_6"

* q4_7: agree5
rename q4_7 q4_7_raw
generate double q4_7 = .
replace q4_7 = 1 if ustrtrim(q4_7_raw) == "1"
replace q4_7 = 2 if ustrtrim(q4_7_raw) == "2"
replace q4_7 = 3 if ustrtrim(q4_7_raw) == "3"
replace q4_7 = 4 if ustrtrim(q4_7_raw) == "4"
replace q4_7 = 5 if ustrtrim(q4_7_raw) == "5"
replace q4_7 = .r if ustrtrim(q4_7_raw) == "-99"
replace q4_7 = .d if ustrtrim(q4_7_raw) == "6"
replace q4_7 = .u if q4_7 == . & !missing(ustrtrim(q4_7_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_7 == .u)
label values q4_7 vl_agree5
label variable q4_7 "4.7 Current government represents youth interests"
char q4_7[source_name] "q4_7"
char q4_7[question_en] "4.7.  To what extent do you agree that the current government represents the interests of the young generation in Nepal?"
char q4_7[question_ne] "४.७ हालको सरकारले नेपालका युवापुस्ताको हितको प्रतिनिधित्व गर्छ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
notes q4_7: 4.7.  To what extent do you agree that the current government represents the interests of the young generation in Nepal?
notes q4_7: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_7_raw for original code.
order q4_7, before(q4_7_raw)
label variable q4_7_raw "Original code: q4_7"

* q4_8: agree5
rename q4_8 q4_8_raw
generate double q4_8 = .
replace q4_8 = 1 if ustrtrim(q4_8_raw) == "1"
replace q4_8 = 2 if ustrtrim(q4_8_raw) == "2"
replace q4_8 = 3 if ustrtrim(q4_8_raw) == "3"
replace q4_8 = 4 if ustrtrim(q4_8_raw) == "4"
replace q4_8 = 5 if ustrtrim(q4_8_raw) == "5"
replace q4_8 = .r if ustrtrim(q4_8_raw) == "-99"
replace q4_8 = .d if ustrtrim(q4_8_raw) == "6"
replace q4_8 = .u if q4_8 == . & !missing(ustrtrim(q4_8_raw))
replace qc_unknown_codes = qc_unknown_codes + (q4_8 == .u)
label values q4_8 vl_agree5
label variable q4_8 "4.8 Government will continue to advance youth interests"
char q4_8[source_name] "q4_8"
char q4_8[question_en] "4.8.  To what extent do you agree that the current government will continue to represent and advance the interest of young people?"
char q4_8[question_ne] "४.८ हालको सरकारले आगामी दिनमा पनि युवाहरूको हितको प्रतिनिधित्व र प्रवर्द्धन गरिरहनेछ भन्ने कुरामा तपाईं कत्तिको सहमत हुनुहुन्छ?"
notes q4_8: 4.8.  To what extent do you agree that the current government will continue to represent and advance the interest of young people?
notes q4_8: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q4_8_raw for original code.
order q4_8, before(q4_8_raw)
label variable q4_8_raw "Original code: q4_8"

* q5_1: south_follow
rename q5_1 q5_1_raw
generate double q5_1 = .
replace q5_1 = 1 if ustrtrim(q5_1_raw) == "1"
replace q5_1 = 2 if ustrtrim(q5_1_raw) == "2"
replace q5_1 = 3 if ustrtrim(q5_1_raw) == "3"
replace q5_1 = 4 if ustrtrim(q5_1_raw) == "4"
replace q5_1 = .r if ustrtrim(q5_1_raw) == "-99"
replace q5_1 = .u if q5_1 == . & !missing(ustrtrim(q5_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_1 == .u)
label values q5_1 vl_south_follow
label variable q5_1 "5.1 Attention to protests in other Asian countries"
char q5_1[source_name] "q5_1"
char q5_1[question_en] "5.1.  How closely have you followed Gen-Z or other protests in other Asian countries Indonesia, Bangladesh, Sri Lanka, and India?"
char q5_1[question_ne] "५.१ इन्डोनेसिया, बंगलादेश, श्रीलंका र भारतलगायत अन्य एसियाली देशहरूमा भएका Gen-Z वा अन्य आन्दोलनलाई तपाईंले कत्तिको नजिकबाट चासो  राख्नु भएको छ?"
notes q5_1: 5.1.  How closely have you followed Gen-Z or other protests in other Asian countries Indonesia, Bangladesh, Sri Lanka, and India?
notes q5_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_1_raw for original code.
order q5_1, before(q5_1_raw)
label variable q5_1_raw "Original code: q5_1"

* q5_2_1: agree6
rename q5_2_1 q5_2_1_raw
generate double q5_2_1 = .
replace q5_2_1 = 1 if ustrtrim(q5_2_1_raw) == "1"
replace q5_2_1 = 2 if ustrtrim(q5_2_1_raw) == "2"
replace q5_2_1 = 3 if ustrtrim(q5_2_1_raw) == "3"
replace q5_2_1 = 4 if ustrtrim(q5_2_1_raw) == "4"
replace q5_2_1 = 5 if ustrtrim(q5_2_1_raw) == "5"
replace q5_2_1 = .r if ustrtrim(q5_2_1_raw) == "-99"
replace q5_2_1 = .d if ustrtrim(q5_2_1_raw) == "6"
replace q5_2_1 = .u if q5_2_1 == . & !missing(ustrtrim(q5_2_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_2_1 == .u)
label values q5_2_1 vl_agree6
label variable q5_2_1 "South Asia dissent cause: Governance/corruption/public services"
char q5_2_1[source_name] "q5_2_1"
char q5_2_1[question_en] "5.2.1 Young people in South Asia are expressing their dissent against the existing political regime because of lack good governance, rampant corruption, and poor public service delivery."
char q5_2_1[question_ne] "५.२.१ दक्षिण एसियाका युवाहरूले सुशासनको कमी, व्यापक भ्रष्टाचार र कमजोर सार्वजनिक सेवा प्रवाहका कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
notes q5_2_1: 5.2.1 Young people in South Asia are expressing their dissent against the existing political regime because of lack good governance, rampant corruption, and poor public service delivery.
notes q5_2_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_2_1_raw for original code.
order q5_2_1, before(q5_2_1_raw)
label variable q5_2_1_raw "Original code: q5_2_1"

* q5_2_2: agree6
rename q5_2_2 q5_2_2_raw
generate double q5_2_2 = .
replace q5_2_2 = 1 if ustrtrim(q5_2_2_raw) == "1"
replace q5_2_2 = 2 if ustrtrim(q5_2_2_raw) == "2"
replace q5_2_2 = 3 if ustrtrim(q5_2_2_raw) == "3"
replace q5_2_2 = 4 if ustrtrim(q5_2_2_raw) == "4"
replace q5_2_2 = 5 if ustrtrim(q5_2_2_raw) == "5"
replace q5_2_2 = .r if ustrtrim(q5_2_2_raw) == "-99"
replace q5_2_2 = .d if ustrtrim(q5_2_2_raw) == "6"
replace q5_2_2 = .u if q5_2_2 == . & !missing(ustrtrim(q5_2_2_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_2_2 == .u)
label values q5_2_2 vl_agree6
label variable q5_2_2 "South Asia dissent cause: Unemployment/economic opportunities"
char q5_2_2[source_name] "q5_2_2"
char q5_2_2[question_en] "5.2.2 Young people in South Asia are expressing their dissent against the existing political regime because of unemployment and lack of economic opportunities."
char q5_2_2[question_ne] "५.२.२ दक्षिण एसियाका युवाहरूले बेरोजगारी र आर्थिक अवसरको कमीका कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
notes q5_2_2: 5.2.2 Young people in South Asia are expressing their dissent against the existing political regime because of unemployment and lack of economic opportunities.
notes q5_2_2: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_2_2_raw for original code.
order q5_2_2, before(q5_2_2_raw)
label variable q5_2_2_raw "Original code: q5_2_2"

* q5_2_3: agree6
rename q5_2_3 q5_2_3_raw
generate double q5_2_3 = .
replace q5_2_3 = 1 if ustrtrim(q5_2_3_raw) == "1"
replace q5_2_3 = 2 if ustrtrim(q5_2_3_raw) == "2"
replace q5_2_3 = 3 if ustrtrim(q5_2_3_raw) == "3"
replace q5_2_3 = 4 if ustrtrim(q5_2_3_raw) == "4"
replace q5_2_3 = 5 if ustrtrim(q5_2_3_raw) == "5"
replace q5_2_3 = .r if ustrtrim(q5_2_3_raw) == "-99"
replace q5_2_3 = .d if ustrtrim(q5_2_3_raw) == "6"
replace q5_2_3 = .u if q5_2_3 == . & !missing(ustrtrim(q5_2_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_2_3 == .u)
label values q5_2_3 vl_agree6
label variable q5_2_3 "South Asia dissent cause: Distrust of leaders/parties/institutions"
char q5_2_3[source_name] "q5_2_3"
char q5_2_3[question_en] "5.2.3 Young people in South Asia are expressing their dissent against the existing political regime because of lack of trust in political leaders, political parties, and government institutions"
char q5_2_3[question_ne] "५.२.३ दक्षिण एसियाका युवाहरूले राजनीतिक नेता, दल र सरकारी संस्थाप्रतिको विश्वासको कमीका कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
notes q5_2_3: 5.2.3 Young people in South Asia are expressing their dissent against the existing political regime because of lack of trust in political leaders, political parties, and government institutions
notes q5_2_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_2_3_raw for original code.
order q5_2_3, before(q5_2_3_raw)
label variable q5_2_3_raw "Original code: q5_2_3"

* q5_2_4: agree6
rename q5_2_4 q5_2_4_raw
generate double q5_2_4 = .
replace q5_2_4 = 1 if ustrtrim(q5_2_4_raw) == "1"
replace q5_2_4 = 2 if ustrtrim(q5_2_4_raw) == "2"
replace q5_2_4 = 3 if ustrtrim(q5_2_4_raw) == "3"
replace q5_2_4 = 4 if ustrtrim(q5_2_4_raw) == "4"
replace q5_2_4 = 5 if ustrtrim(q5_2_4_raw) == "5"
replace q5_2_4 = .r if ustrtrim(q5_2_4_raw) == "-99"
replace q5_2_4 = .d if ustrtrim(q5_2_4_raw) == "6"
replace q5_2_4 = .u if q5_2_4 == . & !missing(ustrtrim(q5_2_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_2_4 == .u)
label values q5_2_4 vl_agree6
label variable q5_2_4 "South Asia dissent cause: Political exclusion"
char q5_2_4[source_name] "q5_2_4"
char q5_2_4[question_en] "5.2.4 Young people in South Asia are expressing their dissent against the existing political regime because of their exclusion from politics."
char q5_2_4[question_ne] "५.२.४ दक्षिण एसियाका युवाहरूले राजनीतिबाट आफूहरू बहिष्कृत भएको कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
notes q5_2_4: 5.2.4 Young people in South Asia are expressing their dissent against the existing political regime because of their exclusion from politics.
notes q5_2_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_2_4_raw for original code.
order q5_2_4, before(q5_2_4_raw)
label variable q5_2_4_raw "Original code: q5_2_4"

* q5_2_5: agree6
rename q5_2_5 q5_2_5_raw
generate double q5_2_5 = .
replace q5_2_5 = 1 if ustrtrim(q5_2_5_raw) == "1"
replace q5_2_5 = 2 if ustrtrim(q5_2_5_raw) == "2"
replace q5_2_5 = 3 if ustrtrim(q5_2_5_raw) == "3"
replace q5_2_5 = 4 if ustrtrim(q5_2_5_raw) == "4"
replace q5_2_5 = 5 if ustrtrim(q5_2_5_raw) == "5"
replace q5_2_5 = .r if ustrtrim(q5_2_5_raw) == "-99"
replace q5_2_5 = .d if ustrtrim(q5_2_5_raw) == "6"
replace q5_2_5 = .u if q5_2_5 == . & !missing(ustrtrim(q5_2_5_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_2_5 == .u)
label values q5_2_5 vl_agree6
label variable q5_2_5 "South Asia dissent cause: Nepotism/elite capture"
char q5_2_5[source_name] "q5_2_5"
char q5_2_5[question_en] "5.2.5 Young people in South Asia are expressing their dissent against the existing political regime because of nepotism and elite capture."
char q5_2_5[question_ne] "५.२.५ दक्षिण एसियाका युवाहरूले नातावाद र पहुँचयोग्य वर्गको वर्चस्व  कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
notes q5_2_5: 5.2.5 Young people in South Asia are expressing their dissent against the existing political regime because of nepotism and elite capture.
notes q5_2_5: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_2_5_raw for original code.
order q5_2_5, before(q5_2_5_raw)
label variable q5_2_5_raw "Original code: q5_2_5"

* q5_2_6: agree6
rename q5_2_6 q5_2_6_raw
generate double q5_2_6 = .
replace q5_2_6 = 1 if ustrtrim(q5_2_6_raw) == "1"
replace q5_2_6 = 2 if ustrtrim(q5_2_6_raw) == "2"
replace q5_2_6 = 3 if ustrtrim(q5_2_6_raw) == "3"
replace q5_2_6 = 4 if ustrtrim(q5_2_6_raw) == "4"
replace q5_2_6 = 5 if ustrtrim(q5_2_6_raw) == "5"
replace q5_2_6 = .r if ustrtrim(q5_2_6_raw) == "-99"
replace q5_2_6 = .d if ustrtrim(q5_2_6_raw) == "6"
replace q5_2_6 = .u if q5_2_6 == . & !missing(ustrtrim(q5_2_6_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_2_6 == .u)
label values q5_2_6 vl_agree6
label variable q5_2_6 "South Asia dissent cause: Foreign/external influence"
char q5_2_6[source_name] "q5_2_6"
char q5_2_6[question_en] "5.2.6 Young people in South Asia are expressing their dissent against the existing political regime because of external or outside influence."
char q5_2_6[question_ne] "५.२.६ दक्षिण एसियाका युवाहरूले बाह्य प्रभावका कारण विद्यमान राजनीतिक व्यवस्थाप्रति असहमति व्यक्त गरिरहेका छन्।"
notes q5_2_6: 5.2.6 Young people in South Asia are expressing their dissent against the existing political regime because of external or outside influence.
notes q5_2_6: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_2_6_raw for original code.
order q5_2_6, before(q5_2_6_raw)
label variable q5_2_6_raw "Original code: q5_2_6"

* q5_3: agree5
rename q5_3 q5_3_raw
generate double q5_3 = .
replace q5_3 = 1 if ustrtrim(q5_3_raw) == "1"
replace q5_3 = 2 if ustrtrim(q5_3_raw) == "2"
replace q5_3 = 3 if ustrtrim(q5_3_raw) == "3"
replace q5_3 = 4 if ustrtrim(q5_3_raw) == "4"
replace q5_3 = 5 if ustrtrim(q5_3_raw) == "5"
replace q5_3 = .r if ustrtrim(q5_3_raw) == "-99"
replace q5_3 = .d if ustrtrim(q5_3_raw) == "6"
replace q5_3 = .u if q5_3 == . & !missing(ustrtrim(q5_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_3 == .u)
label values q5_3 vl_agree5
label variable q5_3 "5.3 Protests in one country encourage others in South Asia"
char q5_3[source_name] "q5_3"
char q5_3[question_en] "5.3. To what extent do you agree with the following statement? Protest in one country has encouraged protests in other countries in South Asia."
char q5_3[question_ne] "५.३ तलका भनाइहरूसँग तपाईं कत्तिको सहमत हुनुहुन्छ? एउटा देशमा भएको आन्दोलनले दक्षिण एसियाका अन्य देशहरूमा पनि आन्दोलन गर्न प्रोत्साहन गरेको छ।"
notes q5_3: 5.3. To what extent do you agree with the following statement? Protest in one country has encouraged protests in other countries in South Asia.
notes q5_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_3_raw for original code.
order q5_3, before(q5_3_raw)
label variable q5_3_raw "Original code: q5_3"

* q5_4: south_stability
rename q5_4 q5_4_raw
generate double q5_4 = .
replace q5_4 = 1 if ustrtrim(q5_4_raw) == "1"
replace q5_4 = 2 if ustrtrim(q5_4_raw) == "2"
replace q5_4 = 3 if ustrtrim(q5_4_raw) == "3"
replace q5_4 = 4 if ustrtrim(q5_4_raw) == "4"
replace q5_4 = 5 if ustrtrim(q5_4_raw) == "5"
replace q5_4 = .d if ustrtrim(q5_4_raw) == "6"
replace q5_4 = .u if q5_4 == . & !missing(ustrtrim(q5_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_4 == .u)
label values q5_4 vl_south_stability
label variable q5_4 "5.4 Political stability of South Asia today"
char q5_4[source_name] "q5_4"
char q5_4[question_en] "5.4.  How would you rate the political stability of the entire South Asian region today?"
char q5_4[question_ne] "५.४ आजको अवस्थामा समग्र दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतालाई तपाईं कसरी मूल्याङ्कन गर्नुहुन्छ?"
notes q5_4: 5.4.  How would you rate the political stability of the entire South Asian region today?
notes q5_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_4_raw for original code.
order q5_4, before(q5_4_raw)
label variable q5_4_raw "Original code: q5_4"

* q5_5: optimism
rename q5_5 q5_5_raw
generate double q5_5 = .
replace q5_5 = 1 if ustrtrim(q5_5_raw) == "1"
replace q5_5 = 2 if ustrtrim(q5_5_raw) == "2"
replace q5_5 = 3 if ustrtrim(q5_5_raw) == "3"
replace q5_5 = 4 if ustrtrim(q5_5_raw) == "4"
replace q5_5 = 5 if ustrtrim(q5_5_raw) == "5"
replace q5_5 = .d if ustrtrim(q5_5_raw) == "6"
replace q5_5 = .u if q5_5 == . & !missing(ustrtrim(q5_5_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_5 == .u)
label values q5_5 vl_optimism
label variable q5_5 "5.5 Optimism for South Asian stability over next five years"
char q5_5[source_name] "q5_5"
char q5_5[question_en] "5.5.  Overall, how optimistic are you about political stability in South Asia over the next five years?"
char q5_5[question_ne] "५.५ समग्रमा, आगामी पाँच वर्षमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरताबारे तपाईं कत्तिको आशावादी हुनुहुन्छ?"
notes q5_5: 5.5.  Overall, how optimistic are you about political stability in South Asia over the next five years?
notes q5_5: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_5_raw for original code.
order q5_5, before(q5_5_raw)
label variable q5_5_raw "Original code: q5_5"

* q5_6_1: agree5
rename q5_6_1 q5_6_1_raw
generate double q5_6_1 = .
replace q5_6_1 = 1 if ustrtrim(q5_6_1_raw) == "1"
replace q5_6_1 = 2 if ustrtrim(q5_6_1_raw) == "2"
replace q5_6_1 = 3 if ustrtrim(q5_6_1_raw) == "3"
replace q5_6_1 = 4 if ustrtrim(q5_6_1_raw) == "4"
replace q5_6_1 = 5 if ustrtrim(q5_6_1_raw) == "5"
replace q5_6_1 = .r if ustrtrim(q5_6_1_raw) == "-99"
replace q5_6_1 = .d if ustrtrim(q5_6_1_raw) == "6"
replace q5_6_1 = .u if q5_6_1 == . & !missing(ustrtrim(q5_6_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_6_1 == .u)
label values q5_6_1 vl_agree5
label variable q5_6_1 "South Asia stability risk: Corruption/lack of accountability"
char q5_6_1[source_name] "q5_6_1"
char q5_6_1[question_en] "5.6.1. Corruption/ lack of accountability poses a great risk to political stability in South Asia"
char q5_6_1[question_ne] "५.६.१ भ्रष्टाचार/जवाफदेहिताको कमीले भविष्यमा दक्षिण एसियाली क्षेत्रको  राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
notes q5_6_1: 5.6.1. Corruption/ lack of accountability poses a great risk to political stability in South Asia
notes q5_6_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_6_1_raw for original code.
order q5_6_1, before(q5_6_1_raw)
label variable q5_6_1_raw "Original code: q5_6_1"

* q5_6_2: agree5
rename q5_6_2 q5_6_2_raw
generate double q5_6_2 = .
replace q5_6_2 = 1 if ustrtrim(q5_6_2_raw) == "1"
replace q5_6_2 = 2 if ustrtrim(q5_6_2_raw) == "2"
replace q5_6_2 = 3 if ustrtrim(q5_6_2_raw) == "3"
replace q5_6_2 = 4 if ustrtrim(q5_6_2_raw) == "4"
replace q5_6_2 = 5 if ustrtrim(q5_6_2_raw) == "5"
replace q5_6_2 = .r if ustrtrim(q5_6_2_raw) == "-99"
replace q5_6_2 = .d if ustrtrim(q5_6_2_raw) == "6"
replace q5_6_2 = .u if q5_6_2 == . & !missing(ustrtrim(q5_6_2_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_6_2 == .u)
label values q5_6_2 vl_agree5
label variable q5_6_2 "South Asia stability risk: Unemployment/economic opportunities"
char q5_6_2[source_name] "q5_6_2"
char q5_6_2[question_en] "5.6.2 Unemployment and lack of economic opportunities pose a great risk to political stability in South Asia."
char q5_6_2[question_ne] "५.६.२ बेरोजगारी र आर्थिक अवसरको कमीले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
notes q5_6_2: 5.6.2 Unemployment and lack of economic opportunities pose a great risk to political stability in South Asia.
notes q5_6_2: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_6_2_raw for original code.
order q5_6_2, before(q5_6_2_raw)
label variable q5_6_2_raw "Original code: q5_6_2"

* q5_6_3: agree5
rename q5_6_3 q5_6_3_raw
generate double q5_6_3 = .
replace q5_6_3 = 1 if ustrtrim(q5_6_3_raw) == "1"
replace q5_6_3 = 2 if ustrtrim(q5_6_3_raw) == "2"
replace q5_6_3 = 3 if ustrtrim(q5_6_3_raw) == "3"
replace q5_6_3 = 4 if ustrtrim(q5_6_3_raw) == "4"
replace q5_6_3 = 5 if ustrtrim(q5_6_3_raw) == "5"
replace q5_6_3 = .r if ustrtrim(q5_6_3_raw) == "-99"
replace q5_6_3 = .d if ustrtrim(q5_6_3_raw) == "6"
replace q5_6_3 = .u if q5_6_3 == . & !missing(ustrtrim(q5_6_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_6_3 == .u)
label values q5_6_3 vl_agree5
label variable q5_6_3 "South Asia stability risk: Political exclusion"
char q5_6_3[source_name] "q5_6_3"
char q5_6_3[question_en] "5.6.3 Political exclusion of certain groups poses a great risk to political stability in South Asia."
char q5_6_3[question_ne] "५.६.३ सरकारी संयत्रमा समावेशिताको कमिले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
notes q5_6_3: 5.6.3 Political exclusion of certain groups poses a great risk to political stability in South Asia.
notes q5_6_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_6_3_raw for original code.
order q5_6_3, before(q5_6_3_raw)
label variable q5_6_3_raw "Original code: q5_6_3"

* q5_6_4: agree5
rename q5_6_4 q5_6_4_raw
generate double q5_6_4 = .
replace q5_6_4 = 1 if ustrtrim(q5_6_4_raw) == "1"
replace q5_6_4 = 2 if ustrtrim(q5_6_4_raw) == "2"
replace q5_6_4 = 3 if ustrtrim(q5_6_4_raw) == "3"
replace q5_6_4 = 4 if ustrtrim(q5_6_4_raw) == "4"
replace q5_6_4 = 5 if ustrtrim(q5_6_4_raw) == "5"
replace q5_6_4 = .r if ustrtrim(q5_6_4_raw) == "-99"
replace q5_6_4 = .d if ustrtrim(q5_6_4_raw) == "6"
replace q5_6_4 = .u if q5_6_4 == . & !missing(ustrtrim(q5_6_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_6_4 == .u)
label values q5_6_4 vl_agree5
label variable q5_6_4 "South Asia stability risk: Rising cost of living"
char q5_6_4[source_name] "q5_6_4"
char q5_6_4[question_en] "5.6.4 Rising cost of living poses a great risk to political stability in South Asia."
char q5_6_4[question_ne] "५.६.४ बढ्दो महंगीले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
notes q5_6_4: 5.6.4 Rising cost of living poses a great risk to political stability in South Asia.
notes q5_6_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_6_4_raw for original code.
order q5_6_4, before(q5_6_4_raw)
label variable q5_6_4_raw "Original code: q5_6_4"

* q5_6_5: agree5
rename q5_6_5 q5_6_5_raw
generate double q5_6_5 = .
replace q5_6_5 = 1 if ustrtrim(q5_6_5_raw) == "1"
replace q5_6_5 = 2 if ustrtrim(q5_6_5_raw) == "2"
replace q5_6_5 = 3 if ustrtrim(q5_6_5_raw) == "3"
replace q5_6_5 = 4 if ustrtrim(q5_6_5_raw) == "4"
replace q5_6_5 = 5 if ustrtrim(q5_6_5_raw) == "5"
replace q5_6_5 = .r if ustrtrim(q5_6_5_raw) == "-99"
replace q5_6_5 = .d if ustrtrim(q5_6_5_raw) == "6"
replace q5_6_5 = .u if q5_6_5 == . & !missing(ustrtrim(q5_6_5_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_6_5 == .u)
label values q5_6_5 vl_agree5
label variable q5_6_5 "South Asia stability risk: Social media misinformation"
char q5_6_5[source_name] "q5_6_5"
char q5_6_5[question_en] "5.6.5 Misinformation through social media poses a great risk to political stability in South Asia."
char q5_6_5[question_ne] "५.६.५ सामाजिक सञ्जालमार्फत फैलिने गलत/मिथ्य/भ्रामक  सूचनाले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ ।"
notes q5_6_5: 5.6.5 Misinformation through social media poses a great risk to political stability in South Asia.
notes q5_6_5: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_6_5_raw for original code.
order q5_6_5, before(q5_6_5_raw)
label variable q5_6_5_raw "Original code: q5_6_5"

* q5_6_6: agree5
rename q5_6_6 q5_6_6_raw
generate double q5_6_6 = .
replace q5_6_6 = 1 if ustrtrim(q5_6_6_raw) == "1"
replace q5_6_6 = 2 if ustrtrim(q5_6_6_raw) == "2"
replace q5_6_6 = 3 if ustrtrim(q5_6_6_raw) == "3"
replace q5_6_6 = 4 if ustrtrim(q5_6_6_raw) == "4"
replace q5_6_6 = 5 if ustrtrim(q5_6_6_raw) == "5"
replace q5_6_6 = .r if ustrtrim(q5_6_6_raw) == "-99"
replace q5_6_6 = .d if ustrtrim(q5_6_6_raw) == "6"
replace q5_6_6 = .u if q5_6_6 == . & !missing(ustrtrim(q5_6_6_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_6_6 == .u)
label values q5_6_6 vl_agree5
label variable q5_6_6 "South Asia stability risk: Foreign/external influence"
char q5_6_6[source_name] "q5_6_6"
char q5_6_6[question_en] "5.6.6 Influence of foreign/external forces poses a great risk to political stability in South Asia."
char q5_6_6[question_ne] "५.६.६ विदेशी/बाह्य शक्तिको प्रभावले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
notes q5_6_6: 5.6.6 Influence of foreign/external forces poses a great risk to political stability in South Asia.
notes q5_6_6: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_6_6_raw for original code.
order q5_6_6, before(q5_6_6_raw)
label variable q5_6_6_raw "Original code: q5_6_6"

* q5_6_7: agree5
rename q5_6_7 q5_6_7_raw
generate double q5_6_7 = .
replace q5_6_7 = 1 if ustrtrim(q5_6_7_raw) == "1"
replace q5_6_7 = 2 if ustrtrim(q5_6_7_raw) == "2"
replace q5_6_7 = 3 if ustrtrim(q5_6_7_raw) == "3"
replace q5_6_7 = 4 if ustrtrim(q5_6_7_raw) == "4"
replace q5_6_7 = 5 if ustrtrim(q5_6_7_raw) == "5"
replace q5_6_7 = .r if ustrtrim(q5_6_7_raw) == "-99"
replace q5_6_7 = .d if ustrtrim(q5_6_7_raw) == "6"
replace q5_6_7 = .u if q5_6_7 == . & !missing(ustrtrim(q5_6_7_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_6_7 == .u)
label values q5_6_7 vl_agree5
label variable q5_6_7 "South Asia stability risk: Ethnic/religious conflict"
char q5_6_7[source_name] "q5_6_7"
char q5_6_7[question_en] "5.6.7 Ethnic or religious tension/conflict poses a great risk to political stability in South Asia."
char q5_6_7[question_ne] "५.६.७ जातीय वा धार्मिक तनाव/द्वन्द्वले भविष्यमा दक्षिण एसियाली क्षेत्रको राजनीतिक स्थिरतामा ठूलो जोखिम निम्त्याउन सक्छ"
notes q5_6_7: 5.6.7 Ethnic or religious tension/conflict poses a great risk to political stability in South Asia.
notes q5_6_7: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_6_7_raw for original code.
order q5_6_7, before(q5_6_7_raw)
label variable q5_6_7_raw "Original code: q5_6_7"

* q5_7_1: agree5
rename q5_7_1 q5_7_1_raw
generate double q5_7_1 = .
replace q5_7_1 = 1 if ustrtrim(q5_7_1_raw) == "1"
replace q5_7_1 = 2 if ustrtrim(q5_7_1_raw) == "2"
replace q5_7_1 = 3 if ustrtrim(q5_7_1_raw) == "3"
replace q5_7_1 = 4 if ustrtrim(q5_7_1_raw) == "4"
replace q5_7_1 = 5 if ustrtrim(q5_7_1_raw) == "5"
replace q5_7_1 = .r if ustrtrim(q5_7_1_raw) == "-99"
replace q5_7_1 = .d if ustrtrim(q5_7_1_raw) == "6"
replace q5_7_1 = .u if q5_7_1 == . & !missing(ustrtrim(q5_7_1_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_7_1 == .u)
label values q5_7_1 vl_agree5
label variable q5_7_1 "South Asia hope: Governance/anti-corruption reforms"
char q5_7_1[source_name] "q5_7_1"
char q5_7_1[question_en] "5.7.1 I am hopeful for South Asia’s future because South Asian countries have adopted better governance and anti-corruption reforms."
char q5_7_1[question_ne] "५.७.१ दक्षिण एसियाली देशहरूले सुशासन र भ्रष्टाचारविरोधी सुधारहरू अपनाएकाले म दक्षिण एसियाली क्षेत्रको भविष्यप्रति आशावादी छु।"
notes q5_7_1: 5.7.1 I am hopeful for South Asia’s future because South Asian countries have adopted better governance and anti-corruption reforms.
notes q5_7_1: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_7_1_raw for original code.
order q5_7_1, before(q5_7_1_raw)
label variable q5_7_1_raw "Original code: q5_7_1"

* q5_7_2: agree5
rename q5_7_2 q5_7_2_raw
generate double q5_7_2 = .
replace q5_7_2 = 1 if ustrtrim(q5_7_2_raw) == "1"
replace q5_7_2 = 2 if ustrtrim(q5_7_2_raw) == "2"
replace q5_7_2 = 3 if ustrtrim(q5_7_2_raw) == "3"
replace q5_7_2 = 4 if ustrtrim(q5_7_2_raw) == "4"
replace q5_7_2 = 5 if ustrtrim(q5_7_2_raw) == "5"
replace q5_7_2 = .r if ustrtrim(q5_7_2_raw) == "-99"
replace q5_7_2 = .d if ustrtrim(q5_7_2_raw) == "6"
replace q5_7_2 = .u if q5_7_2 == . & !missing(ustrtrim(q5_7_2_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_7_2 == .u)
label values q5_7_2 vl_agree5
label variable q5_7_2 "South Asia hope: Youth political participation"
char q5_7_2[source_name] "q5_7_2"
char q5_7_2[question_en] "5.7.2 I am hopeful about South Asia’s future because of greater youth participation in politics in South Asia."
char q5_7_2[question_ne] "५.७.२ दक्षिण एसियाली राजनीतिमा युवाहरूको बढ्दो सहभागिताका कारण म दक्षिण एसियाली क्षेत्रको भविष्यप्रति आशावादी छु।"
notes q5_7_2: 5.7.2 I am hopeful about South Asia’s future because of greater youth participation in politics in South Asia.
notes q5_7_2: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_7_2_raw for original code.
order q5_7_2, before(q5_7_2_raw)
label variable q5_7_2_raw "Original code: q5_7_2"

* q5_7_3: agree5
rename q5_7_3 q5_7_3_raw
generate double q5_7_3 = .
replace q5_7_3 = 1 if ustrtrim(q5_7_3_raw) == "1"
replace q5_7_3 = 2 if ustrtrim(q5_7_3_raw) == "2"
replace q5_7_3 = 3 if ustrtrim(q5_7_3_raw) == "3"
replace q5_7_3 = 4 if ustrtrim(q5_7_3_raw) == "4"
replace q5_7_3 = 5 if ustrtrim(q5_7_3_raw) == "5"
replace q5_7_3 = .r if ustrtrim(q5_7_3_raw) == "-99"
replace q5_7_3 = .d if ustrtrim(q5_7_3_raw) == "6"
replace q5_7_3 = .u if q5_7_3 == . & !missing(ustrtrim(q5_7_3_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_7_3 == .u)
label values q5_7_3 vl_agree5
label variable q5_7_3 "South Asia hope: Improved democracy"
char q5_7_3[source_name] "q5_7_3"
char q5_7_3[question_en] "5.7.3 I am hopeful about South Asia’s future because of the state of the democracy has improved in South Asia."
char q5_7_3[question_ne] "५.७.३ दक्षिण एसियामा लोकतन्त्रको अवस्था सुधार भएकाले म दक्षिण एसियाली क्षेत्रको भविष्यप्रति आशावादी छु।"
notes q5_7_3: 5.7.3 I am hopeful about South Asia’s future because of the state of the democracy has improved in South Asia.
notes q5_7_3: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_7_3_raw for original code.
order q5_7_3, before(q5_7_3_raw)
label variable q5_7_3_raw "Original code: q5_7_3"

* q5_7_4: agree5
rename q5_7_4 q5_7_4_raw
generate double q5_7_4 = .
replace q5_7_4 = 1 if ustrtrim(q5_7_4_raw) == "1"
replace q5_7_4 = 2 if ustrtrim(q5_7_4_raw) == "2"
replace q5_7_4 = 3 if ustrtrim(q5_7_4_raw) == "3"
replace q5_7_4 = 4 if ustrtrim(q5_7_4_raw) == "4"
replace q5_7_4 = 5 if ustrtrim(q5_7_4_raw) == "5"
replace q5_7_4 = .r if ustrtrim(q5_7_4_raw) == "-99"
replace q5_7_4 = .d if ustrtrim(q5_7_4_raw) == "6"
replace q5_7_4 = .u if q5_7_4 == . & !missing(ustrtrim(q5_7_4_raw))
replace qc_unknown_codes = qc_unknown_codes + (q5_7_4 == .u)
label values q5_7_4 vl_agree5
label variable q5_7_4 "South Asia hope: Economic/employment prospects"
char q5_7_4[source_name] "q5_7_4"
char q5_7_4[question_en] "5.7.4  I am hopeful about South Asia’s future because economic and employment prospect is in increasing trend."
char q5_7_4[question_ne] "५.७.४ आर्थिक तथा रोजगारीका सम्भावना बढ्दो क्रममा रहेकाले म दक्षिण एसियाली क्षेत्रको भविष्यप्रति आशावादी छु।"
notes q5_7_4: 5.7.4  I am hopeful about South Asia’s future because economic and employment prospect is in increasing trend.
notes q5_7_4: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See q5_7_4_raw for original code.
order q5_7_4, before(q5_7_4_raw)
label variable q5_7_4_raw "Original code: q5_7_4"

* Lossless numeric conversion. Abort rather than silently discard malformed input.
foreach v in age submission_id source_index gps_latitude gps_longitude gps_altitude gps_accuracy {
    destring `v', replace
}
clonevar ward_raw = ward
forvalues i = 0/9 {
    local nd = uchar(2406 + `i')
    replace ward = subinstr(ward, "`nd'", "`i'", .)
}
replace ward = ustrtrim(ward)
destring ward, replace
label variable ward "Ward number"
label variable ward_raw "Ward: original response, including Nepali digits"
clonevar local_government_raw = local_government
replace local_government = ustrlower(ustrtrim(ustrregexra(local_government, "\s+", " ")))
label variable local_government "Local government: normalized case and whitespace only"
label variable local_government_raw "Local government: original spelling"

* Dates: source interview date is a calendar date; interview time has +05:45 offset.
rename interview_date interview_date_raw
generate double interview_date = daily(substr(interview_date_raw,1,10),"YMD")
replace interview_date = daily(interview_date_raw,"DMY") if missing(interview_date)
format interview_date %tdCCYY-NN-DD
assert !missing(interview_date) if !missing(interview_date_raw)
label variable interview_date "Interview date (local calendar date)"
rename interview_time interview_time_raw
generate double interview_time = clock(substr(interview_time_raw,1,12),"hms")
format interview_time %tcHH:MM:SS
assert !missing(interview_time) if !missing(interview_time_raw)
label variable interview_time "Interview local time of day (+05:45), milliseconds"
generate double interview_datetime = cofd(interview_date) + interview_time
format interview_datetime %tcCCYY-NN-DD_HH:MM:SS
label variable interview_datetime "Interview date and time: local (+05:45)"
generate double submission_datetime = clock(submission_datetime_raw,"YMDhms")
format submission_datetime %tcCCYY-NN-DD_HH:MM:SS
assert !missing(submission_datetime) if !missing(submission_datetime_raw)
label variable submission_datetime "Submission datetime as exported; timezone not specified"
notes submission_datetime: Source has no timezone suffix. No timezone adjustment or duration is inferred.

* Eligibility and data-quality checks, with records retained.
generate byte qc_age = !inrange(age,18,35) | age != floor(age)
generate byte qc_eligibility = consent_agree != 1 | screener != 1 | qc_age
generate byte qc_ward = !missing(ward) & (ward < 1 | ward != floor(ward))
generate byte qc_location_numeric = !missing(real(local_government))
generate byte qc_gps = !inrange(gps_latitude,-90,90) | !inrange(gps_longitude,-180,180) | gps_accuracy < 0 | missing(gps_accuracy)
generate byte qc_education_routing = education == 7 & missing(edu_masters_raw)
duplicates tag submission_id, generate(qc_duplicate_id)
duplicates tag submission_uuid, generate(qc_duplicate_uuid)


* Per-question routing status follows the supplied form; no skips are imputed.
generate byte __ap = (1)
replace __ap = . if (0)
generate byte __route_consent_agree = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(consent_agree_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(consent_agree_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(consent_agree_raw))
drop __ap
generate byte __ap = ((consent_agree_raw == "1"))
replace __ap = . if (missing(consent_agree_raw))
replace __ap = 0 if missing(consent_agree_raw) & __route_consent_agree == 0
generate byte __route_screener = __ap
generate byte ms_screener = cond(missing(screener_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_screener missing_status
label variable ms_screener "Form routing/missingness: screener"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(screener_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(screener_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(screener_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_interview_date = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(interview_date_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(interview_date_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(interview_date_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_interview_time = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(interview_time_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(interview_time_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(interview_time_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_interviewer = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(interviewer_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(interviewer_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_province = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(province_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(province_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_local_government = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(local_government_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(local_government_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_ward = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(ward_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(ward_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_age = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(age))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(age))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(age))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_gender = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(gender_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(gender_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(gender_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (gender_raw == "3"))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(gender_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(gender_raw) & __route_gender == 0
generate byte __route_gender_other = __ap
generate byte ms_gender_other = cond(missing(gender_other),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_gender_other missing_status
label variable ms_gender_other "Form routing/missingness: gender_other"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(gender_other))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(gender_other))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_education = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(education_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(education_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(education_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (education_raw != "-99"))
replace __ap = . if (missing(education_raw) | missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(education_raw) & __route_education == 0
generate byte __route_edu_school = __ap
generate byte ms_edu_school = cond(missing(edu_school_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_edu_school missing_status
label variable ms_edu_school "Form routing/missingness: edu_school"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(edu_school_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(edu_school_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (education_raw != "-99"))
replace __ap = . if (missing(education_raw) | missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(education_raw) & __route_education == 0
generate byte __route_edu_plus2 = __ap
generate byte ms_edu_plus2 = cond(missing(edu_plus2_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_edu_plus2 missing_status
label variable ms_edu_plus2 "Form routing/missingness: edu_plus2"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(edu_plus2_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(edu_plus2_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (education_raw == "6" | education_raw == "7" | education_raw == "8"))
replace __ap = . if (missing(education_raw) | missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(education_raw) & __route_education == 0
replace __ap = 0 if missing(education_raw) & __route_education == 0
replace __ap = 0 if missing(education_raw) & __route_education == 0
generate byte __route_edu_bachelors = __ap
generate byte ms_edu_bachelors = cond(missing(edu_bachelors_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_edu_bachelors missing_status
label variable ms_edu_bachelors "Form routing/missingness: edu_bachelors"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(edu_bachelors_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(edu_bachelors_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (education_raw == "6" | education_raw == "8"))
replace __ap = . if (missing(education_raw) | missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(education_raw) & __route_education == 0
replace __ap = 0 if missing(education_raw) & __route_education == 0
generate byte __route_edu_masters = __ap
generate byte ms_edu_masters = cond(missing(edu_masters_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_edu_masters missing_status
label variable ms_edu_masters "Form routing/missingness: edu_masters"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(edu_masters_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(edu_masters_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_ethnicity = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(ethnicity_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(ethnicity_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_religious_belief = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(religious_belief_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(religious_belief_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(religious_belief_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (religious_belief_raw == "1"))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(religious_belief_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(religious_belief_raw) & __route_religious_belief == 0
generate byte __route_religion = __ap
generate byte ms_religion = cond(missing(religion_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_religion missing_status
label variable ms_religion "Form routing/missingness: religion"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(religion_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(religion_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_marital_status = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(marital_status_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(marital_status_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(marital_status_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_life_place = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(life_place_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(life_place_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(life_place_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_family_abroad = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(family_abroad_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(family_abroad_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(family_abroad_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (family_abroad_raw == "1"))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(family_abroad_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(family_abroad_raw) & __route_family_abroad == 0
generate byte __route_family_returned = __ap
generate byte ms_family_returned = cond(missing(family_returned_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_family_returned missing_status
label variable ms_family_returned "Form routing/missingness: family_returned"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(family_returned_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(family_returned_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_migration_plan = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(migration_plan_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(migration_plan_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(migration_plan_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (migration_plan_raw == "1"))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(migration_plan_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(migration_plan_raw) & __route_migration_plan == 0
generate byte __route_abroad_purpose = __ap
generate byte ms_abroad_purpose = cond(missing(abroad_purpose_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_abroad_purpose missing_status
label variable ms_abroad_purpose "Form routing/missingness: abroad_purpose"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(abroad_purpose_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(abroad_purpose_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (migration_plan_raw == "2"))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(migration_plan_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(migration_plan_raw) & __route_migration_plan == 0
generate byte __route_nepal_plan = __ap
generate byte ms_nepal_plan = cond(missing(nepal_plan_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_nepal_plan missing_status
label variable ms_nepal_plan "Form routing/missingness: nepal_plan"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(nepal_plan_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(nepal_plan_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_1 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_1_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_2 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_2_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_2_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_2_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (age >= 22))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(age))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if age < 22
generate byte __route_q2_4 = __ap
generate byte ms_q2_4 = cond(missing(q2_4_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_q2_4 missing_status
label variable ms_q2_4 "Form routing/missingness: q2_4"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_4_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (q2_4_raw == "2"))
replace __ap = . if (missing(q2_4_raw) | missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(q2_4_raw) & __route_q2_4 == 0
generate byte __route_q2_4_1 = __ap
generate byte ms_q2_4_1 = cond(missing(q2_4_1_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_q2_4_1 missing_status
label variable ms_q2_4_1 "Form routing/missingness: q2_4_1"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_4_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_4_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (q2_4_1_raw == "others_please_specify"))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(q2_4_1_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(q2_4_1_raw) & __route_q2_4_1 == 0
generate byte __route_q2_4_1_other = __ap
generate byte ms_q2_4_1_other = cond(missing(q2_4_1_other),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_q2_4_1_other missing_status
label variable ms_q2_4_1_other "Form routing/missingness: q2_4_1_other"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_4_1_other))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_4_1_other))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (age >= 22 & q2_4_raw == "1"))
replace __ap = . if (missing(q2_4_raw) | missing(consent_agree_raw) | missing(screener_raw) | missing(age))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if age < 22
replace __ap = 0 if missing(q2_4_raw) & __route_q2_4 == 0
generate byte __route_q2_5 = __ap
generate byte ms_q2_5 = cond(missing(q2_5_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_q2_5 missing_status
label variable ms_q2_5 "Form routing/missingness: q2_5"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_5_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_5_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_5_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (q2_5_raw == "2"))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(q2_5_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(q2_5_raw) & __route_q2_5 == 0
generate byte __route_q2_5_1 = __ap
generate byte ms_q2_5_1 = cond(missing(q2_5_1_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_q2_5_1 missing_status
label variable ms_q2_5_1 "Form routing/missingness: q2_5_1"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_5_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_5_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (q2_5_1_raw == "others_please_specify"))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(q2_5_1_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(q2_5_1_raw) & __route_q2_5_1 == 0
generate byte __route_q2_5_1_other = __ap
generate byte ms_q2_5_1_other = cond(missing(q2_5_1_other),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_q2_5_1_other missing_status
label variable ms_q2_5_1_other "Form routing/missingness: q2_5_1_other"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_5_1_other))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_5_1_other))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (age >= 22))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(age))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if age < 22
generate byte __route_q2_6 = __ap
generate byte ms_q2_6 = cond(missing(q2_6_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_q2_6 missing_status
label variable ms_q2_6 "Form routing/missingness: q2_6"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_6_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_6_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_6_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (q2_6_raw == "2"))
replace __ap = . if (missing(q2_6_raw) | missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(q2_6_raw) & __route_q2_6 == 0
generate byte __route_q2_6_1 = __ap
generate byte ms_q2_6_1 = cond(missing(q2_6_1_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_q2_6_1 missing_status
label variable ms_q2_6_1 "Form routing/missingness: q2_6_1"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_6_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_6_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (q2_6_1_raw == "others_please_specify"))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(q2_6_1_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(q2_6_1_raw) & __route_q2_6_1 == 0
generate byte __route_q2_6_1_other = __ap
generate byte ms_q2_6_1_other = cond(missing(q2_6_1_other),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_q2_6_1_other missing_status
label variable ms_q2_6_1_other "Form routing/missingness: q2_6_1_other"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_6_1_other))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_6_1_other))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_7 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_7_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_7_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_7_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1" & (q2_7_raw == "3" | q2_7_raw == "4"))
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw) | missing(q2_7_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
replace __ap = 0 if missing(q2_7_raw) & __route_q2_7 == 0
replace __ap = 0 if missing(q2_7_raw) & __route_q2_7 == 0
generate byte __route_q2_7_1 = __ap
generate byte ms_q2_7_1 = cond(missing(q2_7_1_raw),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))
label values ms_q2_7_1 missing_status
label variable ms_q2_7_1 "Form routing/missingness: q2_7_1"
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_7_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_7_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_8_1 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_8_1_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_8_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_8_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_8_2 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_8_2_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_8_2_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_8_2_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_8_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_8_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_8_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_8_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_8_4 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_8_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_8_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_8_4_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_8_5 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_8_5_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_8_5_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_8_5_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_8_6 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_8_6_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_8_6_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_8_6_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q2_9 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q2_9_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q2_9_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q2_9_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_1_1 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_1_1_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_1_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_1_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_1_2 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_1_2_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_1_2_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_1_2_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_1_2_001 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_1_2_001_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_1_2_001_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_1_2_001_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_1_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_1_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_1_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_1_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_1_3_001 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_1_3_001_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_1_3_001_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_1_3_001_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_1_4 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_1_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_1_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_1_4_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_1_5 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_1_5_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_1_5_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_1_5_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_1_6 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_1_6_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_1_6_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_1_6_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_1_7 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_1_7_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_1_7_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_1_7_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_2 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_2_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_2_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_2_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_4 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_4_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_5 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_5_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_5_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_5_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_6 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_6_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_6_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_6_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_7 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_7_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_7_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_7_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_8 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_8_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_8_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_8_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_9 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_9_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_9_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_9_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_10_11 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_10_11_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_10_11_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_10_11_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_10_11_001 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_10_11_001_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_10_11_001_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_10_11_001_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_10_12 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_10_12_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_10_12_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_10_12_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_10_13 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_10_13_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_10_13_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_10_13_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_10_14 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_10_14_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_10_14_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_10_14_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_10_15 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_10_15_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_10_15_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_10_15_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_10_16 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_10_16_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_10_16_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_10_16_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_10_17 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_10_17_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_10_17_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_10_17_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_11_1 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_11_1_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_11_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_11_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_11_2 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_11_2_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_11_2_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_11_2_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_11_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_11_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_11_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_11_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q3_11_4 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q3_11_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q3_11_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q3_11_4_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_1 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_1_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_2_1 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_2_1_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_2_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_2_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_2_2 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_2_2_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_2_2_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_2_2_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_2_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_2_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_2_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_2_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_2_4 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_2_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_2_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_2_4_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_2_5 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_2_5_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_2_5_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_2_5_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_2_6 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_2_6_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_2_6_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_2_6_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_2_7 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_2_7_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_2_7_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_2_7_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_2_8 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_2_8_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_2_8_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_2_8_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_4 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_4_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_5 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_5_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_5_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_5_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_6 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_6_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_6_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_6_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_7 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_7_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_7_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_7_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q4_8 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q4_8_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q4_8_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q4_8_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_1 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_1_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_2_1 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_2_1_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_2_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_2_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_2_2 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_2_2_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_2_2_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_2_2_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_2_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_2_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_2_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_2_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_2_4 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_2_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_2_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_2_4_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_2_5 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_2_5_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_2_5_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_2_5_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_2_6 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_2_6_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_2_6_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_2_6_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_4 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_4_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_5 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_5_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_5_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_5_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_6_1 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_6_1_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_6_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_6_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_6_2 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_6_2_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_6_2_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_6_2_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_6_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_6_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_6_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_6_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_6_4 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_6_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_6_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_6_4_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_6_5 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_6_5_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_6_5_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_6_5_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_6_6 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_6_6_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_6_6_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_6_6_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_6_7 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_6_7_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_6_7_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_6_7_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_7_1 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_7_1_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_7_1_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_7_1_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_7_2 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_7_2_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_7_2_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_7_2_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_7_3 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_7_3_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_7_3_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_7_3_raw))
drop __ap
generate byte __ap = (consent_agree_raw == "1" & screener_raw == "1")
replace __ap = . if (missing(consent_agree_raw) | missing(screener_raw))
replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")
generate byte __route_q5_7_4 = __ap
replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing(q5_7_4_raw))
replace qc_required_missing = qc_required_missing + (__ap == 1 & missing(q5_7_4_raw))
replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing(q5_7_4_raw))
drop __ap

drop __route_*
label variable qc_unknown_codes "Count of response codes absent from supplied choices"
label variable qc_required_missing "Count of missing required responses within form routing"
label variable qc_applicable_missing "Count of missing responses within form routing (incl optional)"
label variable qc_skip_conflicts "Count of responses outside supplied form routing"
label variable qc_age "Age outside 18-35 or noninteger/missing"
label variable qc_eligibility "Consent, screener or age eligibility issue"
label variable qc_ward "Ward nonpositive or noninteger"
label variable qc_location_numeric "Local government entered as a number"
label variable qc_gps "GPS outside global bounds or invalid/missing accuracy"
label variable qc_education_routing "Master's second year: Master's institution blank (form excludes)"
label variable qc_duplicate_id "Other records sharing submission ID"
label variable qc_duplicate_uuid "Other records sharing submission UUID"
foreach v in qc_age qc_eligibility qc_ward qc_location_numeric qc_gps qc_education_routing {
    label values `v' qc
}
generate byte qc_review = qc_unknown_codes > 0 | qc_required_missing > 0 | qc_skip_conflicts > 0 | qc_age | qc_eligibility | qc_ward | qc_location_numeric | qc_gps | qc_education_routing | qc_duplicate_id > 0 | qc_duplicate_uuid > 0
label variable qc_review "At least one substantive data-quality flag; review required"
label values qc_review qc
label data "Youth and Aspirations Perception Survey: cleaned, review flags retained"
notes _dta: All original records retained. Source snapshot preserves all 155 Excel columns.
notes _dta: Full English and Nepali question text stored in variable characteristics; English in notes.
notes _dta: .r refusal; .d explicit don't know; .u unmapped response; . ordinary blank. ms_* distinguishes routing from item missingness.
notes _dta: Numeric substantive choice codes and scale direction retained. String choices mapped explicitly in do-file. Do not interpret category means as scale scores without defining the scale.
notes _dta: Duplicate question numbering in section 3 is retained in question text; original unique form names identify separate items.
notes _dta: User confirmed religion code 41 = Buddhist. Geography receives case/whitespace normalization only. Education routing omission flagged, not filled.
notes _dta: User requested that treatment of the 13 older-version provincial-voting responses remain pending. Answers are retained and flagged; no exclusion is implied.
order source_row submission_id submission_uuid interview_date interview_time interviewer province local_government ward age gender education
sort source_row
assert _N == `imported_rows'
isid source_row
isid submission_id
isid submission_uuid
compress
save "$data_clean/survey_cleaned.dta", replace

* Record-level audit and geography inventory, generated from the saved data.
preserve
keep source_row submission_id submission_uuid form_version qc_* ms_* religion_raw education edu_masters_raw local_government_raw ward_raw
export delimited using "$output/cleaning_review.csv", replace
restore
preserve
contract province local_government_raw local_government, freq(responses)
decode province, generate(province_label)
sort province local_government
export delimited using "$output/local_government_review.csv", replace
restore
preserve
describe, replace clear
export delimited using "$output/stata_variable_dictionary.csv", replace
restore
describe
summarize qc_*
tabulate form_version, missing
tabulate religion, missing
tabulate education, missing
count if qc_review
display as result "Records requiring review: " r(N)
display as result "Cleaning completed; original observations retained: " _N
log close

