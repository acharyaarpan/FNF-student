# Survey cleaning notes

Run `0_master.do` in Stata 17. It executes the single cleaning file, `2_prep/cleaning.do`. The three earlier prep files are preserved and are no longer invoked. No additional Stata packages are required.

The cleaned dataset is `1_data/2_clean/survey_cleaned.dta`. It retains all 884 submissions, original response codes, metadata, GPS information and record-level review flags. It is a working research dataset with unresolved review items, not a declaration that every response is valid for analysis. The raw Excel workbook is unchanged.

## Survey structure

The supplied questionnaire and XLSForm define consent and screening, interview details, and five substantive sections:

1. Demographics, education, family migration and future plans.
2. Political interest, voting and civic participation.
3. Political stability in Nepal: causes, assessments, risks and hopes.
4. Nepal's Gen-Z protests: attention, perceived causes and effects.
5. Youth protests and political stability in South Asia.

Section 3 contains repeated printed question numbers and form names that do not consistently match the printed numbers. Each separate item retains its unique form identifier. Short labels identify the subject; full question text identifies the original wording. No items are combined or renumbered by inference.

## Changes and conventions

- Every retained survey field has a readable label. Full English and Nepali question wording is stored in variable characteristics, and English wording is also stored in Stata variable notes. For example, use `notes q3_1_2_001` or `char list q3_1_2_001[]` to inspect its description.
- Categorical responses receive the supplied choice labels. Substantive numeric codes and scale directions are retained. String-coded categories receive explicit numeric mappings documented in the do-file and value-label dictionary. Province numbers follow the supplied list order, **not official province numbering**.
- Refusals become `.r`; explicit “don't know” options become `.d`. These are Stata extended missing values so they are not included in ordinary means. Mixed categories such as “don't know/unsure” and “neutral/not sure” retain their original codes and labels. Ordinary blanks remain `.` for numeric variables or empty strings for text.
- `_raw` companions preserve original category codes and text where transformed. `.u` is reserved for an unmapped response and triggers a review flag. The current run has no unmapped responses. Blank optional fields and routing skips are not assigned substantive answers.
- The user confirmed that religion code `41` means Buddhist. It maps to numeric code 4 with the Buddhist label; `religion_raw` retains `41`.
- Local-government names receive whitespace and case normalization only, as requested. No spelling variants, abbreviations, translations or ambiguous places are merged. Ward numbers convert Nepali digits to Arabic digits and become numeric.
- Interview dates and times become Stata date/time variables. Interview time explicitly carries the source +05:45 offset. Submission timestamps preserve the underlying Excel date and fractional day; their timezone is unspecified in the export, so no timezone conversion or interview-duration estimate is made.
- The 27 empty instruction/section columns and obsolete empty province/ethnicity/religion columns are removed only after assertions confirm that they are empty. All 155 original columns remain represented in `survey_source_snapshot.dta`; the original Excel remains authoritative. The snapshot renders date cells as readable date/time strings without discarding submission time.
- No observations are deleted, imputed or deduplicated. IDs and row counts are checked. No weights, composite scales, geographic assignments or eligibility exclusions are invented.

## Review items

**Master's institution question:** The supplied form's `survey!H24` displays `edu_masters` when education is 6 or 8, excluding code 7 (Master's second year). All 35 code-7 respondents have a blank answer across both recorded form versions. All 70 code-6 respondents and the one code-8 respondent answered. `qc_education_routing` flags these 35 omissions. The blanks are retained; no institution type is inferred.

**Provincial voting:** The supplied form displays `q2_5` only when age is at least 22 and federal voting (`q2_4`) is Yes. Thirteen respondents from the older form version have provincial-voting answers despite federal voting being No. This includes one provincial Yes response. At the user's request, their treatment remains pending further review. The original answers are retained and identified by `ms_q2_5 == 4` and `qc_skip_conflicts > 0`. A routing flag does not establish that the respondent's answer is wrong.

**Local-government entry:** Original Excel row 684 contains `28` as the local-government name, with Sudurpaschim recorded and ward 5. Its correction is pending user clarification; `qc_location_numeric` flags it. The source value is retained. The full inventory of original and normalized place names is in `local_government_review.csv` for spelling review.

`qc_review` identifies the union of substantive flags, including the above items. It is not an automatic exclusion rule. Optional missing answers are counted separately in `qc_applicable_missing` and do not automatically set `qc_review`. Flags can overlap.

## Missingness and routing

For questions with a display rule, `ms_*` provides the following status, calculated from original parent responses and the supplied form's rules:

| Code | Meaning |
|---|---|
| 0 | Answered within form routing |
| 1 | Missing but expected by form routing |
| 2 | Missing outside form routing |
| 3 | Missing; routing cannot be determined |
| 4 | Answered outside form routing |
| 5 | Answered; routing cannot be determined |

An explicit refusal or don't-know response counts as answered for routing completeness even though its cleaned numeric value is extended missing. Follow-up blanks caused by a skipped parent are classified as routing skips, not unexplained item nonresponse. The status reflects the supplied form, not reconstructed historical form logic.

## Files and verification

- `cleaning_review.csv`: one row per submission, original row/ID references, review flags and routing statuses.
- `local_government_review.csv`: observed original/normalized place-name combinations and frequencies, with province labels.
- `survey_dictionary.csv`: source-to-clean name crosswalk, concise labels, bilingual question text, types and form display rules.
- `value_label_dictionary.csv`: source choice codes, clean Stata codes and bilingual labels. Religion source code `41` is an additional user-confirmed alias of documented code `4_1`; both clean to 4.
- `stata_variable_dictionary.csv`: actual saved dataset variable names, types, formats and labels, including derived fields.
- `4_log/survey_cleaning.log`: full Stata execution log.
- `validation_summary.json`: independent source-to-output validation results.

The pipeline checks source headers, row preservation, unique submission IDs, numeric parsing, date parsing, code mappings, required responses and routing. Independent Python checks compare all original source cells, category transformations, dates, ward digit conversion, geography normalization and key routing cases against the Stata output. Review decisions should be recorded in the do-file and followed by a rerun of the master file.
