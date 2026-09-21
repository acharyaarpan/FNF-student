* Preserve original
clonevar local_government_raw = local_government

* Clean text without losing words
gen strL local_government_clean = ustrlower(ustrtrim(local_government_raw))
replace local_government_clean = ustrregexra(local_government_clean, "\s+", " ")
replace local_government_clean = ustrregexra(local_government_clean, "\.+$", "")
replace local_government_clean = ustrtrim(local_government_clean)

* New standardized variables
gen str30 lg_name = ""
gen str30 lg_type = ""
gen byte lg_review = 0
gen str80 lg_review_note = ""

* Municipality/local government name
replace lg_name = "Banepa"        if ustrregexm(local_government_clean, "^banepa($| )")
replace lg_name = "Biratnagar"    if ustrregexm(local_government_clean, "^biratnagar($| )")
replace lg_name = "Birendranagar" if ustrregexm(local_government_clean, "^birendranagar($| )")
replace lg_name = "Butwal"        if ustrregexm(local_government_clean, "^(butwal|butawal)($| )")
replace lg_name = "Chandragiri"   if ustrregexm(local_government_clean, "^chandragir(i|u)($| )")
replace lg_name = "Dhangadhi"     if ustrregexm(local_government_clean, "^dhang")
replace lg_name = "Janakpurdham"  if ustrregexm(local_government_clean, "^janakpur")
replace lg_name = "Kathmandu"     if ustrregexm(local_government_clean, "^kathmandu") ///
    | local_government_clean == "काठमाडौं महानगरपालिका"
replace lg_name = "Kirtipur"      if ustrregexm(local_government_clean, "^kirtipur($| )")
replace lg_name = "Lalitpur"      if ustrregexm(local_government_clean, "^lalitpur($| )")
replace lg_name = "Mahalaxmi"     if ustrregexm(local_government_clean, "^mahalaxmi($| )")
replace lg_name = "Pokhara"       if ustrregexm(local_government_clean, "^pokhar")
replace lg_name = "Siddharthanagar" if ustrregexm(local_government_clean, "^sid+hart|^siddhart|^siddharth|^siddhartha")
replace lg_name = "Tarakeshwar"   if ustrregexm(local_government_clean, "^tarke|^tarake") ///
    | local_government_clean == "तारकेश्वर नगरपालिका"
replace lg_name = "Tokha"         if ustrregexm(local_government_clean, "^tokh")

* Municipality type
replace lg_type = "Metropolitan City" if ///
    ustrregexm(local_government_clean, "mahanagar|mahangar|metropolitan") ///
    & !ustrregexm(local_government_clean, "sub metropolitan|sub metro|submetro")

replace lg_type = "Sub-Metropolitan City" if ///
    ustrregexm(local_government_clean, "sub metropolitan|sub metro|submetro|sub metropoliticity|metro politicity|up na pa|up no pa")

replace lg_type = "Municipality" if ///
    ustrregexm(local_government_clean, "municipality|nagarpalika|nagar palika|nagarpa|na pa") ///
    & lg_type == ""

* Known official types where respondent only gave place name
replace lg_type = "Municipality" if inlist(lg_name, "Banepa", "Chandragiri", "Kirtipur", "Mahalaxmi", "Siddharthanagar", "Tarakeshwar", "Tokha") ///
    & lg_type == ""

replace lg_type = "Sub-Metropolitan City" if inlist(lg_name, "Butwal", "Dhangadhi", "Janakpurdham", "Pokhara") ///
    & lg_type == ""

replace lg_type = "Metropolitan City" if inlist(lg_name, "Biratnagar", "Kathmandu", "Lalitpur") ///
    & lg_type == ""

replace lg_type = "Municipality" if lg_name == "Birendranagar" & lg_type == ""

* Flag unresolved or suspicious entries
replace lg_review = 1 if lg_name == "" & !missing(local_government_clean)
replace lg_review_note = "Could not standardize local government name" if lg_review == 1

replace lg_review = 1 if inlist(local_government_clean, "28", "birendra")
replace lg_review_note = "Needs manual confirmation" if inlist(local_government_clean, "28", "birendra")

* Check what remains
tab local_government_clean if lg_name == "", missing
tab lg_name, missing
tab lg_type, missing

list local_government_raw local_government_clean lg_name lg_type lg_review_note if lg_review == 1, noobs
	
	
replace lg_name = "Chandragiri" 		if local_government_clean ==  "chandraguri municipality"
replace lg_name = "Birendranagar" 		if local_government_clean == "birendra"
replace lg_name = "Pokhara" 			if local_government_clean == "pokh"
replace lg_name = "Siddharthanagar" 	if local_government_clean == "sidartha na pa"

replace lg_type = " Municipality" 			if local_government_clean == "chandraguri municipality"
replace lg_type = "Municipality" 			if local_government_clean == "birendra"
replace lg_type = "Sub-Metropolitan City" 	if local_government_clean == "pokh"
replace lg_type = "Municipality" 			if local_government_clean == "sidartha na pa"

order lg_name lg_type, after(local_government)
drop local_government_raw lg_review lg_review_note local_government_clean local_government

