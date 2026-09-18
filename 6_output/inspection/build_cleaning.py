"""Build an explicit, standalone Stata do-file from the supplied XLSForm.
Only inspects workbooks; all respondent cleaning is executed by Stata.
"""
from pathlib import Path
import re, json, csv, ast
import openpyxl

ROOT=Path('.')
survey_rows=[ast.literal_eval(s) for s in (ROOT/'6_output/inspection/actSpgaAGJmEJWoGmeU4Fz_survey.txt').read_text(encoding='utf-8').splitlines()]
survey=[dict(zip(survey_rows[0],r)) for r in survey_rows[1:]]
fields={r['name']:r for r in survey if r['name']}
choices={}
for r in [ast.literal_eval(s) for s in (ROOT/'6_output/inspection/actSpgaAGJmEJWoGmeU4Fz_choices.txt').read_text(encoding='utf-8').splitlines()][1:]:
    choices.setdefault(r[0],[]).append((str(r[1]),r[2],r[3]))
headers=[s.split('\t')[1] for s in (ROOT/'6_output/inspection/raw-data-student_Youth and Aspir.txt').read_text(encoding='utf-8').splitlines()]
rename={'Interviewer_Name':'interviewer','Province':'province','_1_4_What_is_your_caste_ethnicity':'ethnicity','_1_6_Which_religion_do_you_identify_with':'religion','Others_Please_Specify':'q2_4_1_other','Others_please_specify_001':'q2_5_1_other','Others_please_specify_002':'q2_6_1_other','Record_your_current_location':'gps_raw','_Record_your_current_location_latitude':'gps_latitude','_Record_your_current_location_longitude':'gps_longitude','_Record_your_current_location_altitude':'gps_altitude','_Record_your_current_location_precision':'gps_accuracy','_id':'submission_id','_uuid':'submission_uuid','_submission_time':'submission_datetime_raw','_validation_status':'validation_status','_notes':'submission_notes','_status':'submission_status','_submitted_by':'submitted_by','__version__':'form_version','_tags':'submission_tags','meta/rootUuid':'root_uuid','_index':'source_index'}
short={
'submission_id':'Submission ID (Kobo)','submission_uuid':'Submission UUID (Kobo)','root_uuid':'Root submission UUID','source_index':'Original export row index','interviewer':'Interviewer','province':'Province (explicit codes follow supplied choice-list order)','local_government':'Local government','ward':'Ward number','gps_raw':'Original GPS point: latitude longitude altitude accuracy','gps_latitude':'GPS latitude (decimal degrees)','gps_longitude':'GPS longitude (decimal degrees)','gps_altitude':'GPS altitude (metres)','gps_accuracy':'GPS horizontal accuracy (metres)','validation_status':'Submission validation status','submission_notes':'Submission notes','submission_status':'Submission status','submitted_by':'Account submitting the response','form_version':'Form version identifier','submission_tags':'Submission tags','submission_datetime_raw':'Submission date and time: source value, timezone unspecified',
'consent_agree':'Consent to participate','screener':'Eligible: age 18-35 and student at sampled institution',
'age':'1.1 Age in completed years','gender':'1.2 Gender','gender_other':'1.2 Gender: other, specified',
'education':'1.3 Current education level and year','edu_school':'1.3.1 SLC/SEE school: private or public','edu_plus2':'1.3.2 Plus-two institution: private or public','edu_bachelors':"1.3.3 Bachelor's institution: private or public",'edu_masters':"1.3.4 Master's or higher institution: private or public",
'ethnicity':'1.4 Caste/ethnicity','religious_belief':'1.5 Considers self a person with religious beliefs','religion':'1.6 Religion','marital_status':'1.7 Marital status','life_place':'1.8 Urban/rural location of most of life','family_abroad':'1.9 Close family member has lived or lives abroad','family_returned':'1.9.1 Family member abroad returned permanently','migration_plan':'1.10 Plans to go abroad or stay in Nepal','abroad_purpose':'1.10.1a Purpose of going abroad','nepal_plan':'1.10.1b Plans while staying in Nepal',
'q2_1':'2.1 Agreement: politics is central to living in Nepal','q2_2':'2.2 Frequency of following political news','q2_3':'2.3 Active involvement in politics/political organizations','q2_4':'2.4 Voted in 2022 federal election','q2_5':'2.5 Voted in 2022 provincial election','q2_6':'2.6 Voted in 2022 local election','q2_4_1':'2.4.1 Reason for not voting: federal','q2_5_1':'2.5.1 Reason for not voting: provincial','q2_6_1':'2.6.1 Reason for not voting: local','q2_4_1_other':'2.4.1 Other reason for not voting: federal','q2_5_1_other':'2.5.1 Other reason for not voting: provincial','q2_6_1_other':'2.6.1 Other reason for not voting: local','q2_7':'2.7 Likelihood of voting in 2027 local elections','q2_7_1':'2.7.1 Reason unlikely to vote in 2027 local elections','q2_9':'2.9 Confidence in influencing government decisions',
'q3_2':'3.2 Political stability of Nepal today','q3_3':'3.3 Nepal stability compared with one year ago','q3_4':'3.4 Nepal stability compared with five years ago','q3_5':'3.5 Expected Nepal stability in five years','q3_6':'3.6 Likelihood government changes within one year','q3_7':'3.7 Likelihood government changes before next federal election','q3_8':'3.8 Likelihood of major political event within five years','q3_9':'3.9 Likelihood of new political force within five years','q4_1':'4.1 Attention to September 8 Gen-Z protest and subsequent politics','q4_3':'4.3 Gen-Z protest: turning point in political history','q4_4':'4.4 Gen-Z protest: greater youth civic/political participation','q4_5':'4.5 Gen-Z protest: youth voices included in mainstream politics','q4_6':'4.6 Gen-Z protest: increased public support for RSP','q4_7':'4.7 Current government represents youth interests','q4_8':'4.8 Government will continue to advance youth interests','q5_1':'5.1 Attention to protests in other Asian countries','q5_3':'5.3 Protests in one country encourage others in South Asia','q5_4':'5.4 Political stability of South Asia today','q5_5':'5.5 Optimism for South Asian stability over next five years'}
for names,prefix,topics in [
(['q3_1_1','q3_1_2','q3_1_2_001','q3_1_3','q3_1_3_001','q3_1_4','q3_1_5','q3_1_6','q3_1_7'],'Nepal instability cause',['Government changes/party conflict','Policy formulation failure','Policy implementation failure','Corruption','Lack of accountability','Protests/violence/civic unrest','Transfers of government officials','Conflict between government tiers','Foreign/external influence']),
(['q3_10_11','q3_10_11_001','q3_10_12','q3_10_13','q3_10_14','q3_10_15','q3_10_16','q3_10_17'],'Nepal stability risk',['Corruption','Lack of accountability','Unemployment/economic opportunities','Political exclusion','Rising cost of living','Social media misinformation','Foreign/external influence','Ethnic/religious conflict']),
([f'q4_2_{i}' for i in range(1,9)],'Gen-Z protest cause',['Corruption','Poor public services','Unemployment/economic opportunities','Rising cost of living','Distrust of leaders/parties/institutions','Nepotism/elite capture','Social media ban','Foreign/external influence']),
([f'q5_2_{i}' for i in range(1,7)],'South Asia dissent cause',['Governance/corruption/public services','Unemployment/economic opportunities','Distrust of leaders/parties/institutions','Political exclusion','Nepotism/elite capture','Foreign/external influence']),
([f'q5_6_{i}' for i in range(1,8)],'South Asia stability risk',['Corruption/lack of accountability','Unemployment/economic opportunities','Political exclusion','Rising cost of living','Social media misinformation','Foreign/external influence','Ethnic/religious conflict'])]:
    for n,t in zip(names,topics):short[n]=f'{prefix}: {t}'
for sec,region in [('3_11','Nepal'),('5_7','South Asia')]:
    for i,t in enumerate(['Governance/anti-corruption reforms','Youth political participation','Improved democracy','Economic/employment prospects'],1):short[f'q{sec}_{i}']=f'{region} hope: {t}'
for i,t in enumerate(['Attended campaign/rally','Volunteered for party/campaign','Joined protest/demonstration','Joined public meeting/discussion','Contacted elected representative','Joined ward user committee'],1):short[f'q2_8_{i}']=f'2.8.{i} Past 12 months: {t}'
def quote(x):return '"'+str(x or '').replace('"',"'").replace('`',"'").replace('$','USD ').replace('\n',' ').replace('\r',' ')+'"'
def labelclean(x):
    x=x.strip().replace('Dont Know',"Don't know").replace('Don’t know',"Don't know").replace('Preder not to say','Prefer not to say').replace('Prefer not say','Prefer not to say').replace('Bagamati','Bagmati')
    if x=='हालेको तर कुन तहमा हालेको थाहा छैन':x='Voted, but does not know at which level'
    return x
out=[]
def emit(s=''):out.append(s)
emit('''* Youth and Aspirations Perception Survey: reproducible cleaning
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
''')
for i,h in enumerate(headers,1):
    col=openpyxl.utils.get_column_letter(i)
    emit(f'assert {col}[1] == {quote(h)}')
    emit(f'rename {col} src{i:03}')
    emit(f'label variable src{i:03} {quote(h[:80])}')
emit('''drop in 1
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
save "$data_clean/survey_source_snapshot.dta", replace''')
active=[];dictionary=[]
for i,h in enumerate(headers,1):
    r=fields.get(h)
    if (r and r['type']=='note') or h in ['province','ethnicity','religion']:
        emit(f'assert missing(src{i:03})\ndrop src{i:03}')
        continue
    n=rename.get(h,h)
    assert len(n)<=32,n
    emit(f'rename src{i:03} {n}')
    active.append((h,n,r))
    desc=r['label::English (en)'] if r else h
    lab=short.get(n,desc if len(desc)<=80 else n.replace('_',' ').capitalize())
    emit(f'label variable {n} {quote(lab)}')
    emit(f'char {n}[source_name] {quote(h)}')
    emit(f'notes {n}: {desc.replace(chr(10)," ")}')
    if r:
        emit(f'char {n}[question_en] {quote(desc)}')
        emit(f'char {n}[question_ne] {quote(r["label::Nepali (ne)"])}')
        emit(f'char {n}[form_type] {quote(r["type"])}')
        emit(f'char {n}[form_relevant] {quote(r["relevant"])}')
    dictionary.append({'source_column':i,'source_name':h,'clean_name':n,'label':lab,'question_en':desc,'question_ne':r['label::Nepali (ne)'] if r else '', 'form_type':r['type'] if r else 'metadata','relevant':r['relevant'] if r else ''})
emit('''
* Reusable flags. These identify review cases; they never overwrite responses.
generate int qc_unknown_codes = 0
generate int qc_required_missing = 0
generate int qc_skip_conflicts = 0
generate int qc_applicable_missing = 0
label define qc 0 "No" 1 "Yes"
label define missing_status 0 "Answered" 1 "Missing: expected by form routing" 2 "Missing: outside form routing" 3 "Missing: routing undetermined" 4 "Answered outside form routing" 5 "Answered: routing undetermined"
''')
maps={}
for lst,items in choices.items():
    mapping=[]
    used={int(c) for c,_,_ in items if re.fullmatch(r'-?\d+',c)}
    for j,(c,l,ne) in enumerate(items,1):
        l=labelclean(l)
        if c=='-99' or c=='prefer_not_to_say':v='.r'
        elif l.lower() in ["don't know"] or c=='dont_know':v='.d'
        elif re.fullmatch(r'-?\d+',c):v=c
        elif c=='4_1':v='4'
        elif c=='others_please_specify':v='96'
        else:v=str(j)
        mapping.append((c,v,l,ne))
    maps[lst]=mapping
    defs={v:l for c,v,l,ne in mapping}
    defs.update({'.r':'Prefer not to say','.d':"Don't know",'.u':'Unmapped source response (review)'})
    emit('label define vl_'+lst+' '+' '.join(v+' '+quote(l) for v,l in defs.items()))
for h,n,r in active:
    if not r or not r['type'].startswith('select_one '):continue
    lst=r['type'].split()[1]
    emit(f'\n* {n}: {lst}\nrename {n} {n}_raw\ngenerate double {n} = .')
    for c,v,l,ne in maps[lst]:emit(f'replace {n} = {v} if ustrtrim({n}_raw) == {quote(c)}')
    if n=='religion':emit('if `buddhist_41_confirmed\' == 1 {\n    replace religion = 4 if ustrtrim(religion_raw) == "41"\n}')
    emit(f'replace {n} = .u if {n} == . & !missing(ustrtrim({n}_raw))')
    emit(f'replace qc_unknown_codes = qc_unknown_codes + ({n} == .u)')
    emit(f'label values {n} vl_{lst}')
    emit(f'label variable {n} {quote(short.get(n,r["label::English (en)"][:80]))}')
    emit(f'char {n}[source_name] {quote(h)}\nchar {n}[question_en] {quote(r["label::English (en)"])}\nchar {n}[question_ne] {quote(r["label::Nepali (ne)"])}')
    emit(f'notes {n}: {r["label::English (en)"]}')
    emit(f'notes {n}: .r = refusal; .d = explicit do not know; .u = unresolved source code. Mixed uncertainty categories retain source codes. See {n}_raw for original code.')
    emit(f'order {n}, before({n}_raw)')
    emit(f'label variable {n}_raw {quote("Original code: "+n)}')
emit('''
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
replace local_government = ustrlower(ustrtrim(ustrregexra(local_government, "\\s+", " ")))
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
''')
# Evaluate routing using raw codes, preserving form semantics and parent uncertainty.
name_map={h:n for h,n,r in active}
def rel(expr):
    expr=expr.replace(' and ',' & ').replace(' or ',' | ')
    expr=re.sub(r"\$\{([^}]+)\}\s*(!=|=)\s*'([^']*)'",lambda m:f'{name_map[m[1]]}_raw '+('==' if m[2]=='=' else '!=')+' '+quote(m[3]),expr)
    expr=expr.replace('${age}','age')
    return expr
emit('\n* Per-question routing status follows the supplied form; no skips are imputed.')
for h,n,r in active:
    if not r or r['type'] in ['note','geopoint']:continue
    relevant=r['relevant']
    is_main=h not in ['consent_agree','screener']
    conditions=[];deps=[]
    if is_main:conditions=['consent_agree_raw == "1"','screener_raw == "1"'];deps=['consent_agree_raw','screener_raw']
    if relevant:
        conditions.append('('+rel(relevant)+')')
        deps += [name_map[k]+('_raw' if k!='age' else '') for k in re.findall(r'\$\{([^}]+)\}',relevant)]
    observed=n+'_raw' if r['type'].startswith('select_one ') or n in ['ward','local_government','interview_date','interview_time'] else n
    cond=' & '.join(conditions) or '1'
    unknown=' | '.join('missing('+d+')' for d in set(deps)) or '0'
    # Only emit status columns for routed questions, aggregate checks for all questions.
    emit(f'generate byte __ap = ({cond})\nreplace __ap = . if ({unknown})')
    if is_main:emit('replace __ap = 0 if (!missing(consent_agree_raw) & consent_agree_raw != "1") | (!missing(screener_raw) & screener_raw != "1")')
    if relevant and '${age} >= 22' in relevant:emit('replace __ap = 0 if age < 22')
    if relevant:
        for parent in re.findall(r'\$\{([^}]+)\}',relevant):
            pn=name_map[parent]
            if parent!='age':emit(f'replace __ap = 0 if missing({pn}_raw) & __route_{pn} == 0')
    emit(f'generate byte __route_{n} = __ap')
    if relevant:
        status='ms_'+n
        emit(f'generate byte {status} = cond(missing({observed}),cond(missing(__ap),3,cond(__ap==1,1,2)),cond(missing(__ap),5,cond(__ap==0,4,0)))')
        emit(f'label values {status} missing_status\nlabel variable {status} {quote("Form routing/missingness: "+n)}')
    emit(f'replace qc_applicable_missing = qc_applicable_missing + (__ap == 1 & missing({observed}))')
    if str(r['required']).lower()=='true':emit(f'replace qc_required_missing = qc_required_missing + (__ap == 1 & missing({observed}))')
    emit(f'replace qc_skip_conflicts = qc_skip_conflicts + (__ap == 0 & !missing({observed}))\ndrop __ap')
emit('''
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
''')
(ROOT/'2_prep/cleaning.do').write_text('\n'.join(out)+'\n',encoding='utf-8')
with (ROOT/'6_output/survey_dictionary.csv').open('w',newline='',encoding='utf-8-sig') as f:
    writer=csv.DictWriter(f,fieldnames=list(dictionary[0]));writer.writeheader();writer.writerows(dictionary)
with (ROOT/'6_output/value_label_dictionary.csv').open('w',newline='',encoding='utf-8-sig') as f:
    writer=csv.writer(f);writer.writerow(['choice_list','source_code','stata_code','label_en','label_ne'])
    for lst,mapping in maps.items():
        for c,v,l,ne in mapping:writer.writerow([lst,c,v,l,ne])
print('Generated do-file and dictionaries:',len(active),'source fields retained')
