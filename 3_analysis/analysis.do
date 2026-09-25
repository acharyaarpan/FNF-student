version 17
clear all
set more off

* Load the cleaned student survey. The first path works after 0_master.do;
* the second works when this file is run from the project root.
capture confirm file "$data_clean/student_survey_cleaned.dta"
if !_rc {
    use "$data_clean/student_survey_cleaned.dta", clear
}
else {
    use "1_data/2_clean/student_survey_cleaned.dta", clear
}


*------------------------------------------------------------------------------*
**# Descriptive distributions
*------------------------------------------------------------------------------*

tabulate age_cohort
tabulate gender
tabulate education
tabulate ethnicity
tabulate religion, missing
tabulate marital_status
tabulate life_place


* Public/private institution type at each education stage.
preserve

keep edu_school edu_plus2 edu_bachelors edu_masters
generate long respondent_id = _n

rename (edu_school edu_plus2 edu_bachelors edu_masters) ///
       (institution1 institution2 institution3 institution4)

reshape long institution, i(respondent_id) j(education_stage)

label define education_stage_descriptive_lbl ///
    1 "SLC/SEE" ///
    2 "+2" ///
    3 "Bachelor's" ///
    4 "Master's or higher", replace

label values education_stage education_stage_descriptive_lbl
label variable education_stage "Education level"
label variable institution "Institution type"

* Remove inapplicable and unanswered observations.
drop if missing(institution)

* Counts and percentages within each educational level.
tabulate education_stage institution, row

restore


*------------------------------------------------------------------------------*
**# Analysis-variable construction
*------------------------------------------------------------------------------*

* Do not overwrite the original survey variables. Drop only variables generated
* by this analysis file so the file can be rerun in the same Stata session.
foreach var in politics5 politics3 news_frequent news3 rural female ///
    family_abroad_bin school_path education_stage education_progress ///
    religion3 analysis_sample {
    capture drop `var'
}


* Outcome: higher values indicate stronger agreement that politics is central.
* Original q2_1 codes 1=strongly agree through 5=strongly disagree.
* Codes 6 (prefer not to say) and 7 (don't know) remain missing.
generate byte politics5 = 6 - q2_1 if inrange(q2_1, 1, 5)

label define politics5_lbl ///
    1 "Strongly disagree" ///
    2 "Disagree" ///
    3 "Neutral" ///
    4 "Agree" ///
    5 "Strongly agree", replace

label values politics5 politics5_lbl
label variable politics5 ///
    "Agreement that politics is central to living in Nepal"

* Collapsed outcome for the robustness ordered-probit model.
generate byte politics3 = .
replace politics3 = 1 if inlist(q2_1, 4, 5)
replace politics3 = 2 if q2_1 == 3
replace politics3 = 3 if inlist(q2_1, 1, 2)

label define politics3_lbl ///
    1 "Disagree" ///
    2 "Neutral" ///
    3 "Agree", replace

label values politics3 politics3_lbl
label variable politics3 "Agreement that politics is central: three categories"


* News consumption: the preferred binary specification.
generate byte news_frequent = .
replace news_frequent = 1 if inlist(q2_2, 1, 2)
replace news_frequent = 0 if inlist(q2_2, 3, 4, 5)

label define news_frequent_lbl ///
    0 "Infrequent or none" ///
    1 "Frequent", replace

label values news_frequent news_frequent_lbl
label variable news_frequent "Frequently follows political news"

* Three-category news variable retained for sensitivity analysis.
* The almost-none category is small, so it is not used in the main models.
generate byte news3 = .
replace news3 = 1 if q2_2 == 5
replace news3 = 2 if inlist(q2_2, 3, 4)
replace news3 = 3 if inlist(q2_2, 1, 2)

label define news3_lbl ///
    1 "Almost none" ///
    2 "Infrequent" ///
    3 "Frequent", replace

label values news3 news3_lbl
label variable news3 "Frequency of following political news"


* Urban is the reference category; rural equals one.
generate byte rural = .
replace rural = 0 if life_place == 1
replace rural = 1 if life_place == 2

label define rural_lbl 0 "Urban" 1 "Rural", replace
label values rural rural_lbl
label variable rural "Spent most of life in a rural area"


* Male is the reference category; female equals one.
generate byte female = .
replace female = 0 if gender == 1
replace female = 1 if gender == 2

label define female_lbl 0 "Male" 1 "Female", replace
label values female female_lbl
label variable female "Respondent is female"


* No family member abroad is the reference category.
generate byte family_abroad_bin = .
replace family_abroad_bin = 1 if family_abroad == 1
replace family_abroad_bin = 0 if family_abroad == 2

label define family_abroad_lbl 0 "No" 1 "Yes", replace
label values family_abroad_bin family_abroad_lbl
label variable family_abroad_bin "Close family member has lived abroad"


* SLC/SEE and +2 public/private trajectory.
* The mixed category is nominal and is not treated as a numeric midpoint.
generate byte school_path = .
replace school_path = 1 if edu_school == 2 & edu_plus2 == 2
replace school_path = 2 if ///
    (edu_school == 1 & edu_plus2 == 2) | ///
    (edu_school == 2 & edu_plus2 == 1)
replace school_path = 3 if edu_school == 1 & edu_plus2 == 1

label define school_path_lbl ///
    1 "Public at both stages" ///
    2 "Mixed public/private" ///
    3 "Private at both stages", replace

label values school_path school_path_lbl
label variable school_path "SLC/SEE and +2 school-sector trajectory"


* Education enters the main model as three stages rather than as a continuous
* scale. This avoids assuming that every educational transition is equally sized.
generate byte education_stage = .
replace education_stage = 1 if inlist(education, 1, 2)
replace education_stage = 2 if inlist(education, 3, 4, 5)
replace education_stage = 3 if inlist(education, 6, 7, 8)

label define education_control_lbl ///
    1 "Bachelor's years 1-2" ///
    2 "Bachelor's years 3-5" ///
    3 "Master's or PhD", replace

label values education_stage education_control_lbl
label variable education_stage "Current education stage"

* Retain an ordered education variable for a later sensitivity model.
generate byte education_progress = education
label variable education_progress "Ordered education progression"


* Broad religion control. Prefer-not-to-say remains missing.
generate byte religion3 = .
replace religion3 = 1 if religion == 1
replace religion3 = 2 if inlist(religion, 2, 3, 5, 41)
replace religion3 = 3 if inlist(religious_belief, 2, 3)

label define religion3_lbl ///
    1 "Hindu" ///
    2 "Other religion" ///
    3 "No or uncertain religious belief", replace

label values religion3 religion3_lbl
label variable religion3 "Broad religion category"


* Use one common estimation sample in every model so changes across columns are
* due to added predictors rather than changes in the observations analyzed.
generate byte analysis_sample = !missing( ///
    politics5, rural, school_path, news_frequent, family_abroad_bin, ///
    female, age, education_stage, ethnicity, religion3, Province)
label variable analysis_sample "Common ordered-probit estimation sample"


*------------------------------------------------------------------------------*
**# Coding and sample checks
*------------------------------------------------------------------------------*

tabulate q2_1 politics5, missing
tabulate q2_1 politics3, missing
tabulate q2_2 news_frequent, missing
tabulate q2_2 news3, missing
tabulate life_place rural, missing
tabulate gender female, missing
tabulate family_abroad family_abroad_bin, missing
tabulate edu_school edu_plus2, row
tabulate school_path, missing
tabulate education education_stage, missing
tabulate religion religion3, missing
tabulate politics5 if analysis_sample

assert inrange(politics5, 1, 5) if !missing(politics5)
assert inrange(politics3, 1, 3) if !missing(politics3)
assert inlist(news_frequent, 0, 1) if !missing(news_frequent)
assert inlist(rural, 0, 1) if !missing(rural)
assert inlist(female, 0, 1) if !missing(female)
assert inlist(family_abroad_bin, 0, 1) if !missing(family_abroad_bin)

count if analysis_sample


*------------------------------------------------------------------------------*
**# Ordered-probit estimation
*------------------------------------------------------------------------------*

* Controls used in every model. Age is continuous; education is categorical.
* Reference groups are male, early bachelor's, Brahmin/Chettri and Hindu.
local controls ///
    i.female c.age ib1.education_stage ib1.ethnicity ib1.religion3 i.Province

* Predictor-specific adjusted models.
oprobit politics5 i.rural `controls' if analysis_sample
estimates store OP1_rural

oprobit politics5 ib1.school_path `controls' if analysis_sample
estimates store OP2_school

oprobit politics5 i.news_frequent `controls' if analysis_sample
estimates store OP3_news

oprobit politics5 i.family_abroad_bin `controls' if analysis_sample
estimates store OP4_abroad

* Joint background-characteristics model, before conditioning on news use.
oprobit politics5 ///
    i.rural ib1.school_path i.family_abroad_bin ///
    `controls' if analysis_sample
estimates store OP5_background

* Fully adjusted model with all four focal predictors.
oprobit politics5 ///
    i.rural ib1.school_path i.news_frequent i.family_abroad_bin ///
    `controls' if analysis_sample
estimates store OP6_full

* Robustness model using disagree/neutral/agree as the ordered outcome.
oprobit politics3 ///
    i.rural ib1.school_path i.news_frequent i.family_abroad_bin ///
    `controls' if analysis_sample
estimates store OP7_three_category
