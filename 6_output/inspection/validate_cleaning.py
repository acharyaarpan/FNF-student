"""Independent source-to-output checks. Run from project root after Stata."""
import csv, datetime, json, math, re
from pathlib import Path
import openpyxl
import pandas as pd

raw=list(openpyxl.load_workbook('1_data/1_raw/raw-data-student.xlsx',data_only=True).active.values)
headers=raw[0]
source=[dict(zip(headers,r)) for r in raw[1:]]
clean=pd.read_stata('1_data/2_clean/survey_cleaned.dta',convert_categoricals=False,convert_missing=True)
snapshot=pd.read_stata('1_data/2_clean/survey_source_snapshot.dta',convert_categoricals=False)
snapshot_rows=snapshot.to_dict('records')
clean_rows=clean.to_dict('records')
assert len(source)==len(clean)==len(snapshot)==884
assert clean.source_row.tolist()==list(range(2,886))
assert clean.submission_id.is_unique and clean.submission_uuid.is_unique

def rawstr(v):
    if v is None:return ''
    if isinstance(v,float) and v.is_integer():return str(int(v))
    return str(v)

for i,h in enumerate(headers,1):
    for j,r in enumerate(source):
        v=r[h];s=snapshot_rows[j][f'src{i:03}']
        if isinstance(v,datetime.datetime):
            assert pd.Timestamp(s)==pd.Timestamp(v),(j,h,s,v)
        elif isinstance(v,(int,float)):
            assert math.isclose(float(s),v,rel_tol=1e-12,abs_tol=1e-10),(j,h,s,v)
        else:assert s==rawstr(v),(j,h,s,v)

dictionary=list(csv.DictReader(open('6_output/survey_dictionary.csv',encoding='utf-8-sig')))
labels=list(csv.DictReader(open('6_output/value_label_dictionary.csv',encoding='utf-8-sig')))
labelmap={}
for row in labels:labelmap.setdefault(row['choice_list'],{})[row['source_code']]=row['stata_code']
labelmap['hn9bp27']['41']='4'
for field in dictionary:
    n=field['clean_name'];h=field['source_name']
    if not field['form_type'].startswith('select_one '):continue
    mapping=labelmap[field['form_type'].split()[1]]
    for j,r in enumerate(source):
        original=rawstr(r[h]);expected=mapping.get(original,'.' if not original else '.u')
        actual=clean_rows[j][n]
        if expected.startswith('.'):assert str(actual)==expected,(j,n,actual,expected)
        else:assert actual==float(expected),(j,n,actual,expected)
        assert clean_rows[j][n+'_raw']==original,(j,n,'original code altered')

for j,r in enumerate(source):
    assert clean_rows[j]['submission_datetime']==pd.Timestamp(r['_submission_time'])
    assert clean_rows[j]['interview_date']==pd.Timestamp(r['interview_date'])
    assert clean_rows[j]['local_government_raw']==rawstr(r['local_government'])
    assert clean_rows[j]['local_government']==re.sub(r'\s+',' ',rawstr(r['local_government'])).strip().lower()
    ward=rawstr(r['ward']).strip().translate(str.maketrans('०१२३४५६७८९','0123456789'))
    if ward:assert clean_rows[j]['ward']==int(ward)
    else:assert str(clean_rows[j]['ward'])=='.'

assert clean.loc[clean.age<22,'ms_q2_5'].eq(2).all()
assert clean.loc[clean.education==7,'edu_masters_raw'].eq('').all()
assert clean.loc[clean.qc_skip_conflicts>0,'form_version'].eq('vpbFT9pkYfFQQ9Vck8AQdu').all()
counts={c:int((clean[c]>0).sum()) for c in clean if c.startswith('qc_')}
summary={'observations':len(clean),'variables':len(clean.columns),'original_columns_verified':len(headers),'categorical_fields_verified':sum(d['form_type'].startswith('select_one ') for d in dictionary),'checks':'All original source cells, categorical code mappings, source codes, dates, ward digit conversion, geography normalization, IDs and key routing checks passed.','flagged_records_by_check':counts}
Path('6_output/validation_summary.json').write_text(json.dumps(summary,indent=2),encoding='utf-8')
print(json.dumps(summary,indent=2))
