# 1. Value-label definitions used previously

This is an inventory of the previous implementation, not an approved specification for a fresh cleaning run. Source choice codes and Stata codes are shown separately.

The previous implementation converted refusal codes to `.r` and explicit don’t-know choices to `.d`. Those are data recodes, not merely labels. Every survey label set also defined `.r`, `.d` and `.u`, even when those choices were absent from that question. These extra definitions should not be treated as questionnaire options. Province and interviewer numbers were assigned in source choice-list order.

## qc

| Source code | Stata code | Label text |
|---|---|---|
| Derived audit status | 0 | No |
| Derived audit status | 1 | Yes |

```stata
label define qc 0 "No" 1 "Yes"
```

## missing_status

| Source code | Stata code | Label text |
|---|---|---|
| Derived audit status | 0 | Answered |
| Derived audit status | 1 | Missing: expected by form routing |
| Derived audit status | 2 | Missing: outside form routing |
| Derived audit status | 3 | Missing: routing undetermined |
| Derived audit status | 4 | Answered outside form routing |
| Derived audit status | 5 | Answered: routing undetermined |

```stata
label define missing_status 0 "Answered" 1 "Missing: expected by form routing" 2 "Missing: outside form routing" 3 "Missing: routing undetermined" 4 "Answered outside form routing" 5 "Answered: routing undetermined"
```

## vl_yes_no

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Yes |
| 2 | 2 | No |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_yes_no 1 "Yes" 2 "No" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_screener

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Yes |
| 2 | 2 | No |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_screener 1 "Yes" 2 "No" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_xq9zw28

| Source code | Stata code | Label text |
|---|---|---|
| biwash | 1 | Biwash |
| buddhi | 2 | Buddhi |
| janak | 3 | Janak |
| januka | 4 | Januka |
| kanti | 5 | Kanti |
| manju | 6 | Manju |
| nabin | 7 | Nabin |
| pankaj | 8 | Pankaj |
| sagar | 9 | Sagar |
| shreeya | 10 | Shreeya |
| sumitra | 11 | Sumitra |
| susmita | 12 | Susmita |
| usha | 13 | Usha |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_xq9zw28 1 "Biwash" 2 "Buddhi" 3 "Janak" 4 "Januka" 5 "Kanti" 6 "Manju" 7 "Nabin" 8 "Pankaj" 9 "Sagar" 10 "Shreeya" 11 "Sumitra" 12 "Susmita" 13 "Usha" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_ar01j09

| Source code | Stata code | Label text |
|---|---|---|
| koshi | 1 | Koshi |
| madhesh | 2 | Madhesh |
| bagamati | 3 | Bagmati |
| gandaki | 4 | Gandaki |
| lumbini | 5 | Lumbini |
| sudurpaschim | 6 | Sudurpaschim |
| karnali | 7 | Karnali |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_ar01j09 1 "Koshi" 2 "Madhesh" 3 "Bagmati" 4 "Gandaki" 5 "Lumbini" 6 "Sudurpaschim" 7 "Karnali" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_gender

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Male |
| 2 | 2 | Female |
| 3 | 3 | Others |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_gender 1 "Male" 2 "Female" 3 "Others" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_education

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Bachelors 1st year |
| 2 | 2 | Bachelors 2nd year |
| 3 | 3 | Bachelors 3rd year |
| 4 | 4 | Bachelors 4th year |
| 5 | 5 | Bachelors 5th year |
| 6 | 6 | Masters 1st year |
| 7 | 7 | Masters 2nd year |
| 8 | 8 | PHD |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_education 1 "Bachelors 1st year" 2 "Bachelors 2nd year" 3 "Bachelors 3rd year" 4 "Bachelors 4th year" 5 "Bachelors 5th year" 6 "Masters 1st year" 7 "Masters 2nd year" 8 "PHD" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_private_public

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Private |
| 2 | 2 | Public |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_private_public 1 "Private" 2 "Public" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_cp3qw00

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Bhramin/Chettri |
| 2 | 2 | Dalit |
| 3 | 3 | Janajati |
| 4 | 4 | Muslim |
| 5 | 5 | Madhesi |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_cp3qw00 1 "Bhramin/Chettri" 2 "Dalit" 3 "Janajati" 4 "Muslim" 5 "Madhesi" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_yes_no_unsure

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Yes |
| 2 | 2 | No |
| 3 | 3 | Not Sure |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_yes_no_unsure 1 "Yes" 2 "No" 3 "Not Sure" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_hn9bp27

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Hindu |
| 2 | 2 | Muslim |
| 3 | 3 | Christian |
| 4_1, 41 (user-confirmed alias) | 4 | Buddhist |
| 5 | 5 | Others |
| prefer_not_to_say | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_hn9bp27 1 "Hindu" 2 "Muslim" 3 "Christian" 4 "Buddhist" 5 "Others" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_marital

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Never Married |
| 2 | 2 | Married |
| 3 | 3 | Divorced/separated/widowed |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_marital 1 "Never Married" 2 "Married" 3 "Divorced/separated/widowed" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_urban_rural

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Urban |
| 2 | 2 | Rural |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_urban_rural 1 "Urban" 2 "Rural" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_yes_no_pns

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Yes |
| 2 | 2 | No |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_yes_no_pns 1 "Yes" 2 "No" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_yes_no_dk_pns

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Yes |
| 2 | 2 | No |
| 3 | 3 | Don't know/Unsure |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_yes_no_dk_pns 1 "Yes" 2 "No" 3 "Don't know/Unsure" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_migration_plan

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Go Abroad |
| 2 | 2 | Stay in Nepal |
| 3 | 3 | Don't know/Unsure |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_migration_plan 1 "Go Abroad" 2 "Stay in Nepal" 3 "Don't know/Unsure" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_abroad_purpose

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Study |
| 2 | 2 | Work |
| 3 | 3 | Study and Work |
| 4 | 4 | Travel |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_abroad_purpose 1 "Study" 2 "Work" 3 "Study and Work" 4 "Travel" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_nepal_plan

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Study Further |
| 2 | 2 | Seek a Job |
| 3 | 3 | Start a business |
| 4 | 4 | Study and Seek a job |
| 5 | 5 | Study and Start a business |
| 6 | 6 | Seek a job and Start a business |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_nepal_plan 1 "Study Further" 2 "Seek a Job" 3 "Start a business" 4 "Study and Seek a job" 5 "Study and Start a business" 6 "Seek a job and Start a business" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_agree5

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Strongly agree |
| 2 | 2 | Agree |
| 3 | 3 | Neutral |
| 4 | 4 | Disagree |
| 5 | 5 | Strongly disagree |
| -99 | .r | Prefer not to say |
| 6 | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_agree5 1 "Strongly agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly disagree" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_newsfreq

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Daily |
| 2 | 2 | Several times a week |
| 3 | 3 | Weekly |
| 4 | 4 | Occasionally |
| 5 | 5 | Never |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_newsfreq 1 "Daily" 2 "Several times a week" 3 "Weekly" 4 "Occasionally" 5 "Never" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_vote

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Yes |
| 2 | 2 | No |
| 3 | 3 | Voted, but does not know at which level |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_vote 1 "Yes" 2 "No" 3 "Voted, but does not know at which level" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_nonvote_reason

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Did not register |
| 3 | 3 | Away from registered voting location |
| 4 | 4 | Health/family issue |
| 5 | 5 | Not interested in voting process |
| 6 | 6 | Did not trust political parties/candidates |
| 7 | 7 | Intentionally boycotted the election |
| 8 | 8 | My vote would make no difference |
| -99 | .r | Prefer not to say |
| others_please_specify | 96 | Others Please Specify |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_nonvote_reason 1 "Did not register" 3 "Away from registered voting location" 4 "Health/family issue" 5 "Not interested in voting process" 6 "Did not trust political parties/candidates" 7 "Intentionally boycotted the election" 8 "My vote would make no difference" .r "Prefer not to say" 96 "Others Please Specify" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_future_vote

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Very Likely |
| 2 | 2 | Somewhat Likely |
| 3 | 3 | Somewhat unlikely |
| 4 | 4 | Very unlikely |
| 5 | .d | Don't know |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_future_vote 1 "Very Likely" 2 "Somewhat Likely" 3 "Somewhat unlikely" 4 "Very unlikely" .d "Don't know" .r "Prefer not to say" .u "Unmapped source response (review)"
```

## vl_unlikely_reason

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Did not register |
| 2 | 2 | Away from registered voting location |
| 3 | 3 | Not interested in voting process |
| 4 | 4 | Do not trust political parties/candidates |
| 5 | 5 | Intentionally boycott the election |
| 6 | 6 | My vote would make no difference |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_unlikely_reason 1 "Did not register" 2 "Away from registered voting location" 3 "Not interested in voting process" 4 "Do not trust political parties/candidates" 5 "Intentionally boycott the election" 6 "My vote would make no difference" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_civic_yes_no

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Yes |
| 2 | 2 | No |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_civic_yes_no 1 "Yes" 2 "No" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_confidence

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Very confident |
| 2 | 2 | Confident |
| 3 | 3 | Neutral |
| 4 | 4 | Not confident |
| 5 | 5 | Not at all confident |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_confidence 1 "Very confident" 2 "Confident" 3 "Neutral" 4 "Not confident" 5 "Not at all confident" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_vx7xv18

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Strongly agree |
| 2 | 2 | Agree |
| 3 | 3 | Neutral |
| 4 | 4 | Disagree |
| 5 | 5 | Strongly disagree |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_vx7xv18 1 "Strongly agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly disagree" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_fx1wd71

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Strongly agree |
| 2 | 2 | Agree |
| 3 | 3 | Neutral |
| 4 | 4 | Disagree |
| 5 | 5 | Strongly disagree |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_fx1wd71 1 "Strongly agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly disagree" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_stability

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Very stable |
| 2 | 2 | Stable |
| 3 | 3 | Neutral |
| 4 | 4 | Unstable |
| 5 | 5 | Very unstable |
| -99 | .r | Prefer not to say |
| 6 | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_stability 1 "Very stable" 2 "Stable" 3 "Neutral" 4 "Unstable" 5 "Very unstable" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_comparison

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Much more stable |
| 2 | 2 | Somewhat more stable |
| 3 | 3 | About the same |
| 4 | 4 | Somewhat less stable |
| 5 | 5 | Much less stable |
| -99 | .r | Prefer not to say |
| 6 | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_comparison 1 "Much more stable" 2 "Somewhat more stable" 3 "About the same" 4 "Somewhat less stable" 5 "Much less stable" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_likelihood

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Very Likely |
| 2 | 2 | Somewhat Likely |
| 3 | 3 | Neutral/ Not sure |
| 4 | 4 | Somewhat unlikely |
| 5 | 5 | Very unlikely |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_likelihood 1 "Very Likely" 2 "Somewhat Likely" 3 "Neutral/ Not sure" 4 "Somewhat unlikely" 5 "Very unlikely" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_sn7om92

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Strongly agree |
| 2 | 2 | Agree |
| 3 | 3 | Neutral |
| 4 | 4 | Disagree |
| 5 | 5 | Strongly disagree |
| -99 | .r | Prefer not to say |
| dont_know | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_sn7om92 1 "Strongly agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly disagree" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_follow_genz

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Engaged directly |
| 2 | 2 | Very closely |
| 3 | 3 | Somewhat closely |
| 4 | 4 | Heard but followed very little |
| 5 | 5 | Not at all |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_follow_genz 1 "Engaged directly" 2 "Very closely" 3 "Somewhat closely" 4 "Heard but followed very little" 5 "Not at all" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_south_follow

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Very Closely |
| 2 | 2 | Somewhat Closely |
| 3 | 3 | Not very Closely |
| 4 | 4 | Not at all |
| -99 | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_south_follow 1 "Very Closely" 2 "Somewhat Closely" 3 "Not very Closely" 4 "Not at all" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_agree6

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Strongly Agree |
| 2 | 2 | Agree |
| 3 | 3 | Neutral |
| 4 | 4 | Disagree |
| 5 | 5 | Strongly disagree |
| -99 | .r | Prefer not to say |
| 6 | .d | Don't know |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_agree6 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly disagree" .r "Prefer not to say" .d "Don't know" .u "Unmapped source response (review)"
```

## vl_south_stability

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Very Stable |
| 2 | 2 | Stable |
| 3 | 3 | Neutral |
| 4 | 4 | Unstable |
| 5 | 5 | Very Unstable |
| 6 | .d | Don't know |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_south_stability 1 "Very Stable" 2 "Stable" 3 "Neutral" 4 "Unstable" 5 "Very Unstable" .d "Don't know" .r "Prefer not to say" .u "Unmapped source response (review)"
```

## vl_optimism

| Source code | Stata code | Label text |
|---|---|---|
| 1 | 1 | Very Optimistic |
| 2 | 2 | Somewhat Optimistic |
| 3 | 3 | Neutral |
| 4 | 4 | Somewhat Pessimistic |
| 5 | 5 | Very Pessimistic |
| 6 | .d | Don't know |
| No corresponding choice in this list; added definition | .r | Prefer not to say |
| No corresponding choice in this list; added definition | .u | Unmapped source response (review) |

```stata
label define vl_optimism 1 "Very Optimistic" 2 "Somewhat Optimistic" 3 "Neutral" 4 "Somewhat Pessimistic" 5 "Very Pessimistic" .d "Don't know" .r "Prefer not to say" .u "Unmapped source response (review)"
```
