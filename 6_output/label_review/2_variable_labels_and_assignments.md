# 2. Variables and labels used previously

Variable labels describe a variable. Value labels describe the categories of a numeric variable. Text, date and continuous numeric fields receive variable labels but no category label set.

## Original survey fields and metadata

| Original name | Name used | Variable label used | Value-label set |
|---|---|---|---|
| consent_agree | consent_agree | Consent to participate | vl_yes_no |
| screener | screener | Eligible: age 18-35 and student at sampled institution | vl_screener |
| interview_date | interview_date | Interview date (local calendar date) | None |
| interview_time | interview_time | Interview local time of day (+05:45), milliseconds | None |
| Interviewer_Name | interviewer | Interviewer | vl_xq9zw28 |
| Province | province | Province (explicit codes follow supplied choice-list order) | vl_ar01j09 |
| local_government | local_government | Local government: normalized case and whitespace only | None |
| ward | ward | Ward number | None |
| age | age | 1.1 Age in completed years | None |
| gender | gender | 1.2 Gender | vl_gender |
| gender_other | gender_other | 1.2 Gender: other, specified | None |
| education | education | 1.3 Current education level and year | vl_education |
| edu_school | edu_school | 1.3.1 SLC/SEE school: private or public | vl_private_public |
| edu_plus2 | edu_plus2 | 1.3.2 Plus-two institution: private or public | vl_private_public |
| edu_bachelors | edu_bachelors | 1.3.3 Bachelor's institution: private or public | vl_private_public |
| edu_masters | edu_masters | 1.3.4 Master's or higher institution: private or public | vl_private_public |
| _1_4_What_is_your_caste_ethnicity | ethnicity | 1.4 Caste/ethnicity | vl_cp3qw00 |
| religious_belief | religious_belief | 1.5 Considers self a person with religious beliefs | vl_yes_no_unsure |
| _1_6_Which_religion_do_you_identify_with | religion | 1.6 Religion | vl_hn9bp27 |
| marital_status | marital_status | 1.7 Marital status | vl_marital |
| life_place | life_place | 1.8 Urban/rural location of most of life | vl_urban_rural |
| family_abroad | family_abroad | 1.9 Close family member has lived or lives abroad | vl_yes_no_pns |
| family_returned | family_returned | 1.9.1 Family member abroad returned permanently | vl_yes_no_dk_pns |
| migration_plan | migration_plan | 1.10 Plans to go abroad or stay in Nepal | vl_migration_plan |
| abroad_purpose | abroad_purpose | 1.10.1a Purpose of going abroad | vl_abroad_purpose |
| nepal_plan | nepal_plan | 1.10.1b Plans while staying in Nepal | vl_nepal_plan |
| q2_1 | q2_1 | 2.1 Agreement: politics is central to living in Nepal | vl_agree5 |
| q2_2 | q2_2 | 2.2 Frequency of following political news | vl_newsfreq |
| q2_3 | q2_3 | 2.3 Active involvement in politics/political organizations | vl_yes_no_pns |
| q2_4 | q2_4 | 2.4 Voted in 2022 federal election | vl_vote |
| q2_4_1 | q2_4_1 | 2.4.1 Reason for not voting: federal | vl_nonvote_reason |
| Others_Please_Specify | q2_4_1_other | 2.4.1 Other reason for not voting: federal | None |
| q2_5 | q2_5 | 2.5 Voted in 2022 provincial election | vl_vote |
| q2_5_1 | q2_5_1 | 2.5.1 Reason for not voting: provincial | vl_nonvote_reason |
| Others_please_specify_001 | q2_5_1_other | 2.5.1 Other reason for not voting: provincial | None |
| q2_6 | q2_6 | 2.6 Voted in 2022 local election | vl_vote |
| q2_6_1 | q2_6_1 | 2.6.1 Reason for not voting: local | vl_nonvote_reason |
| Others_please_specify_002 | q2_6_1_other | 2.6.1 Other reason for not voting: local | None |
| q2_7 | q2_7 | 2.7 Likelihood of voting in 2027 local elections | vl_future_vote |
| q2_7_1 | q2_7_1 | 2.7.1 Reason unlikely to vote in 2027 local elections | vl_unlikely_reason |
| q2_8_1 | q2_8_1 | 2.8.1 Past 12 months: Attended campaign/rally | vl_civic_yes_no |
| q2_8_2 | q2_8_2 | 2.8.2 Past 12 months: Volunteered for party/campaign | vl_civic_yes_no |
| q2_8_3 | q2_8_3 | 2.8.3 Past 12 months: Joined protest/demonstration | vl_civic_yes_no |
| q2_8_4 | q2_8_4 | 2.8.4 Past 12 months: Joined public meeting/discussion | vl_civic_yes_no |
| q2_8_5 | q2_8_5 | 2.8.5 Past 12 months: Contacted elected representative | vl_civic_yes_no |
| q2_8_6 | q2_8_6 | 2.8.6 Past 12 months: Joined ward user committee | vl_civic_yes_no |
| q2_9 | q2_9 | 2.9 Confidence in influencing government decisions | vl_confidence |
| q3_1_1 | q3_1_1 | Nepal instability cause: Government changes/party conflict | vl_agree5 |
| q3_1_2 | q3_1_2 | Nepal instability cause: Policy formulation failure | vl_agree5 |
| q3_1_2_001 | q3_1_2_001 | Nepal instability cause: Policy implementation failure | vl_vx7xv18 |
| q3_1_3 | q3_1_3 | Nepal instability cause: Corruption | vl_agree5 |
| q3_1_3_001 | q3_1_3_001 | Nepal instability cause: Lack of accountability | vl_fx1wd71 |
| q3_1_4 | q3_1_4 | Nepal instability cause: Protests/violence/civic unrest | vl_agree5 |
| q3_1_5 | q3_1_5 | Nepal instability cause: Transfers of government officials | vl_agree5 |
| q3_1_6 | q3_1_6 | Nepal instability cause: Conflict between government tiers | vl_agree5 |
| q3_1_7 | q3_1_7 | Nepal instability cause: Foreign/external influence | vl_agree5 |
| q3_2 | q3_2 | 3.2 Political stability of Nepal today | vl_stability |
| q3_3 | q3_3 | 3.3 Nepal stability compared with one year ago | vl_comparison |
| q3_4 | q3_4 | 3.4 Nepal stability compared with five years ago | vl_comparison |
| q3_5 | q3_5 | 3.5 Expected Nepal stability in five years | vl_comparison |
| q3_6 | q3_6 | 3.6 Likelihood government changes within one year | vl_likelihood |
| q3_7 | q3_7 | 3.7 Likelihood government changes before next federal election | vl_likelihood |
| q3_8 | q3_8 | 3.8 Likelihood of major political event within five years | vl_likelihood |
| q3_9 | q3_9 | 3.9 Likelihood of new political force within five years | vl_likelihood |
| q3_10_11 | q3_10_11 | Nepal stability risk: Corruption | vl_agree5 |
| q3_10_11_001 | q3_10_11_001 | Nepal stability risk: Lack of accountability | vl_sn7om92 |
| q3_10_12 | q3_10_12 | Nepal stability risk: Unemployment/economic opportunities | vl_agree5 |
| q3_10_13 | q3_10_13 | Nepal stability risk: Political exclusion | vl_agree5 |
| q3_10_14 | q3_10_14 | Nepal stability risk: Rising cost of living | vl_agree5 |
| q3_10_15 | q3_10_15 | Nepal stability risk: Social media misinformation | vl_agree5 |
| q3_10_16 | q3_10_16 | Nepal stability risk: Foreign/external influence | vl_agree5 |
| q3_10_17 | q3_10_17 | Nepal stability risk: Ethnic/religious conflict | vl_agree5 |
| q3_11_1 | q3_11_1 | Nepal hope: Governance/anti-corruption reforms | vl_agree5 |
| q3_11_2 | q3_11_2 | Nepal hope: Youth political participation | vl_agree5 |
| q3_11_3 | q3_11_3 | Nepal hope: Improved democracy | vl_agree5 |
| q3_11_4 | q3_11_4 | Nepal hope: Economic/employment prospects | vl_agree5 |
| q4_1 | q4_1 | 4.1 Attention to September 8 Gen-Z protest and subsequent politics | vl_follow_genz |
| q4_2_1 | q4_2_1 | Gen-Z protest cause: Corruption | vl_agree5 |
| q4_2_2 | q4_2_2 | Gen-Z protest cause: Poor public services | vl_agree5 |
| q4_2_3 | q4_2_3 | Gen-Z protest cause: Unemployment/economic opportunities | vl_agree5 |
| q4_2_4 | q4_2_4 | Gen-Z protest cause: Rising cost of living | vl_agree5 |
| q4_2_5 | q4_2_5 | Gen-Z protest cause: Distrust of leaders/parties/institutions | vl_agree5 |
| q4_2_6 | q4_2_6 | Gen-Z protest cause: Nepotism/elite capture | vl_agree5 |
| q4_2_7 | q4_2_7 | Gen-Z protest cause: Social media ban | vl_agree5 |
| q4_2_8 | q4_2_8 | Gen-Z protest cause: Foreign/external influence | vl_agree5 |
| q4_3 | q4_3 | 4.3 Gen-Z protest: turning point in political history | vl_agree5 |
| q4_4 | q4_4 | 4.4 Gen-Z protest: greater youth civic/political participation | vl_agree5 |
| q4_5 | q4_5 | 4.5 Gen-Z protest: youth voices included in mainstream politics | vl_agree5 |
| q4_6 | q4_6 | 4.6 Gen-Z protest: increased public support for RSP | vl_agree5 |
| q4_7 | q4_7 | 4.7 Current government represents youth interests | vl_agree5 |
| q4_8 | q4_8 | 4.8 Government will continue to advance youth interests | vl_agree5 |
| q5_1 | q5_1 | 5.1 Attention to protests in other Asian countries | vl_south_follow |
| q5_2_1 | q5_2_1 | South Asia dissent cause: Governance/corruption/public services | vl_agree6 |
| q5_2_2 | q5_2_2 | South Asia dissent cause: Unemployment/economic opportunities | vl_agree6 |
| q5_2_3 | q5_2_3 | South Asia dissent cause: Distrust of leaders/parties/institutions | vl_agree6 |
| q5_2_4 | q5_2_4 | South Asia dissent cause: Political exclusion | vl_agree6 |
| q5_2_5 | q5_2_5 | South Asia dissent cause: Nepotism/elite capture | vl_agree6 |
| q5_2_6 | q5_2_6 | South Asia dissent cause: Foreign/external influence | vl_agree6 |
| q5_3 | q5_3 | 5.3 Protests in one country encourage others in South Asia | vl_agree5 |
| q5_4 | q5_4 | 5.4 Political stability of South Asia today | vl_south_stability |
| q5_5 | q5_5 | 5.5 Optimism for South Asian stability over next five years | vl_optimism |
| q5_6_1 | q5_6_1 | South Asia stability risk: Corruption/lack of accountability | vl_agree5 |
| q5_6_2 | q5_6_2 | South Asia stability risk: Unemployment/economic opportunities | vl_agree5 |
| q5_6_3 | q5_6_3 | South Asia stability risk: Political exclusion | vl_agree5 |
| q5_6_4 | q5_6_4 | South Asia stability risk: Rising cost of living | vl_agree5 |
| q5_6_5 | q5_6_5 | South Asia stability risk: Social media misinformation | vl_agree5 |
| q5_6_6 | q5_6_6 | South Asia stability risk: Foreign/external influence | vl_agree5 |
| q5_6_7 | q5_6_7 | South Asia stability risk: Ethnic/religious conflict | vl_agree5 |
| q5_7_1 | q5_7_1 | South Asia hope: Governance/anti-corruption reforms | vl_agree5 |
| q5_7_2 | q5_7_2 | South Asia hope: Youth political participation | vl_agree5 |
| q5_7_3 | q5_7_3 | South Asia hope: Improved democracy | vl_agree5 |
| q5_7_4 | q5_7_4 | South Asia hope: Economic/employment prospects | vl_agree5 |
| Record_your_current_location | gps_raw | Original GPS point: latitude longitude altitude accuracy | None |
| _Record_your_current_location_latitude | gps_latitude | GPS latitude (decimal degrees) | None |
| _Record_your_current_location_longitude | gps_longitude | GPS longitude (decimal degrees) | None |
| _Record_your_current_location_altitude | gps_altitude | GPS altitude (metres) | None |
| _Record_your_current_location_precision | gps_accuracy | GPS horizontal accuracy (metres) | None |
| _id | submission_id | Submission ID (Kobo) | None |
| _uuid | submission_uuid | Submission UUID (Kobo) | None |
| _submission_time | submission_datetime_raw | Submission date and time: source value, timezone unspecified | None |
| _validation_status | validation_status | Submission validation status | None |
| _notes | submission_notes | Submission notes | None |
| _status | submission_status | Submission status | None |
| _submitted_by | submitted_by | Account submitting the response | None |
| __version__ | form_version | Form version identifier | None |
| _tags | submission_tags | Submission tags | None |
| meta/rootUuid | root_uuid | Root submission UUID | None |
| _index | source_index | Original export row index | None |

## Additional fields created by the previous pipeline

These are not questionnaire variables. They are listed for completeness and do not need to be recreated for a labelling-only restart.

| Added variable | Variable label used | Value-label set |
|---|---|---|
| source_row | Row in original Excel workbook, including header | None |
| consent_agree_raw | Original code: consent_agree | None |
| screener_raw | Original code: screener | None |
| interview_date_raw | Interview date | None |
| interview_time_raw | Interview time | None |
| interviewer_raw | Original code: interviewer | None |
| province_raw | Original code: province | None |
| gender_raw | Original code: gender | None |
| education_raw | Original code: education | None |
| edu_school_raw | Original code: edu_school | None |
| edu_plus2_raw | Original code: edu_plus2 | None |
| edu_bachelors_raw | Original code: edu_bachelors | None |
| edu_masters_raw | Original code: edu_masters | None |
| ethnicity_raw | Original code: ethnicity | None |
| religious_belief_raw | Original code: religious_belief | None |
| religion_raw | Original code: religion | None |
| marital_status_raw | Original code: marital_status | None |
| life_place_raw | Original code: life_place | None |
| family_abroad_raw | Original code: family_abroad | None |
| family_returned_raw | Original code: family_returned | None |
| migration_plan_raw | Original code: migration_plan | None |
| abroad_purpose_raw | Original code: abroad_purpose | None |
| nepal_plan_raw | Original code: nepal_plan | None |
| q2_1_raw | Original code: q2_1 | None |
| q2_2_raw | Original code: q2_2 | None |
| q2_3_raw | Original code: q2_3 | None |
| q2_4_raw | Original code: q2_4 | None |
| q2_4_1_raw | Original code: q2_4_1 | None |
| q2_5_raw | Original code: q2_5 | None |
| q2_5_1_raw | Original code: q2_5_1 | None |
| q2_6_raw | Original code: q2_6 | None |
| q2_6_1_raw | Original code: q2_6_1 | None |
| q2_7_raw | Original code: q2_7 | None |
| q2_7_1_raw | Original code: q2_7_1 | None |
| q2_8_1_raw | Original code: q2_8_1 | None |
| q2_8_2_raw | Original code: q2_8_2 | None |
| q2_8_3_raw | Original code: q2_8_3 | None |
| q2_8_4_raw | Original code: q2_8_4 | None |
| q2_8_5_raw | Original code: q2_8_5 | None |
| q2_8_6_raw | Original code: q2_8_6 | None |
| q2_9_raw | Original code: q2_9 | None |
| q3_1_1_raw | Original code: q3_1_1 | None |
| q3_1_2_raw | Original code: q3_1_2 | None |
| q3_1_2_001_raw | Original code: q3_1_2_001 | None |
| q3_1_3_raw | Original code: q3_1_3 | None |
| q3_1_3_001_raw | Original code: q3_1_3_001 | None |
| q3_1_4_raw | Original code: q3_1_4 | None |
| q3_1_5_raw | Original code: q3_1_5 | None |
| q3_1_6_raw | Original code: q3_1_6 | None |
| q3_1_7_raw | Original code: q3_1_7 | None |
| q3_2_raw | Original code: q3_2 | None |
| q3_3_raw | Original code: q3_3 | None |
| q3_4_raw | Original code: q3_4 | None |
| q3_5_raw | Original code: q3_5 | None |
| q3_6_raw | Original code: q3_6 | None |
| q3_7_raw | Original code: q3_7 | None |
| q3_8_raw | Original code: q3_8 | None |
| q3_9_raw | Original code: q3_9 | None |
| q3_10_11_raw | Original code: q3_10_11 | None |
| q3_10_11_001_raw | Original code: q3_10_11_001 | None |
| q3_10_12_raw | Original code: q3_10_12 | None |
| q3_10_13_raw | Original code: q3_10_13 | None |
| q3_10_14_raw | Original code: q3_10_14 | None |
| q3_10_15_raw | Original code: q3_10_15 | None |
| q3_10_16_raw | Original code: q3_10_16 | None |
| q3_10_17_raw | Original code: q3_10_17 | None |
| q3_11_1_raw | Original code: q3_11_1 | None |
| q3_11_2_raw | Original code: q3_11_2 | None |
| q3_11_3_raw | Original code: q3_11_3 | None |
| q3_11_4_raw | Original code: q3_11_4 | None |
| q4_1_raw | Original code: q4_1 | None |
| q4_2_1_raw | Original code: q4_2_1 | None |
| q4_2_2_raw | Original code: q4_2_2 | None |
| q4_2_3_raw | Original code: q4_2_3 | None |
| q4_2_4_raw | Original code: q4_2_4 | None |
| q4_2_5_raw | Original code: q4_2_5 | None |
| q4_2_6_raw | Original code: q4_2_6 | None |
| q4_2_7_raw | Original code: q4_2_7 | None |
| q4_2_8_raw | Original code: q4_2_8 | None |
| q4_3_raw | Original code: q4_3 | None |
| q4_4_raw | Original code: q4_4 | None |
| q4_5_raw | Original code: q4_5 | None |
| q4_6_raw | Original code: q4_6 | None |
| q4_7_raw | Original code: q4_7 | None |
| q4_8_raw | Original code: q4_8 | None |
| q5_1_raw | Original code: q5_1 | None |
| q5_2_1_raw | Original code: q5_2_1 | None |
| q5_2_2_raw | Original code: q5_2_2 | None |
| q5_2_3_raw | Original code: q5_2_3 | None |
| q5_2_4_raw | Original code: q5_2_4 | None |
| q5_2_5_raw | Original code: q5_2_5 | None |
| q5_2_6_raw | Original code: q5_2_6 | None |
| q5_3_raw | Original code: q5_3 | None |
| q5_4_raw | Original code: q5_4 | None |
| q5_5_raw | Original code: q5_5 | None |
| q5_6_1_raw | Original code: q5_6_1 | None |
| q5_6_2_raw | Original code: q5_6_2 | None |
| q5_6_3_raw | Original code: q5_6_3 | None |
| q5_6_4_raw | Original code: q5_6_4 | None |
| q5_6_5_raw | Original code: q5_6_5 | None |
| q5_6_6_raw | Original code: q5_6_6 | None |
| q5_6_7_raw | Original code: q5_6_7 | None |
| q5_7_1_raw | Original code: q5_7_1 | None |
| q5_7_2_raw | Original code: q5_7_2 | None |
| q5_7_3_raw | Original code: q5_7_3 | None |
| q5_7_4_raw | Original code: q5_7_4 | None |
| qc_unknown_codes | Count of response codes absent from supplied choices | None |
| qc_required_missing | Count of missing required responses within form routing | None |
| qc_skip_conflicts | Count of responses outside supplied form routing | None |
| qc_applicable_missing | Count of missing responses within form routing (incl optional) | None |
| ward_raw | Ward: original response, including Nepali digits | None |
| local_government_raw | Local government: original spelling | None |
| interview_datetime | Interview date and time: local (+05:45) | None |
| submission_datetime | Submission datetime as exported; timezone not specified | None |
| qc_age | Age outside 18-35 or noninteger/missing | qc |
| qc_eligibility | Consent, screener or age eligibility issue | qc |
| qc_ward | Ward nonpositive or noninteger | qc |
| qc_location_numeric | Local government entered as a number | qc |
| qc_gps | GPS outside global bounds or invalid/missing accuracy | qc |
| qc_education_routing | Master's second year: Master's institution blank (form excludes) | qc |
| qc_duplicate_id | Other records sharing submission ID | None |
| qc_duplicate_uuid | Other records sharing submission UUID | None |
| ms_screener | Form routing/missingness: screener | missing_status |
| ms_gender_other | Form routing/missingness: gender_other | missing_status |
| ms_edu_school | Form routing/missingness: edu_school | missing_status |
| ms_edu_plus2 | Form routing/missingness: edu_plus2 | missing_status |
| ms_edu_bachelors | Form routing/missingness: edu_bachelors | missing_status |
| ms_edu_masters | Form routing/missingness: edu_masters | missing_status |
| ms_religion | Form routing/missingness: religion | missing_status |
| ms_family_returned | Form routing/missingness: family_returned | missing_status |
| ms_abroad_purpose | Form routing/missingness: abroad_purpose | missing_status |
| ms_nepal_plan | Form routing/missingness: nepal_plan | missing_status |
| ms_q2_4 | Form routing/missingness: q2_4 | missing_status |
| ms_q2_4_1 | Form routing/missingness: q2_4_1 | missing_status |
| ms_q2_4_1_other | Form routing/missingness: q2_4_1_other | missing_status |
| ms_q2_5 | Form routing/missingness: q2_5 | missing_status |
| ms_q2_5_1 | Form routing/missingness: q2_5_1 | missing_status |
| ms_q2_5_1_other | Form routing/missingness: q2_5_1_other | missing_status |
| ms_q2_6 | Form routing/missingness: q2_6 | missing_status |
| ms_q2_6_1 | Form routing/missingness: q2_6_1 | missing_status |
| ms_q2_6_1_other | Form routing/missingness: q2_6_1_other | missing_status |
| ms_q2_7_1 | Form routing/missingness: q2_7_1 | missing_status |
| qc_review | At least one substantive data-quality flag; review required | qc |