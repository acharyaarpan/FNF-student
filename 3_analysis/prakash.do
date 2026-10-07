use "$analysis/data_prakash.dta", clear 

*Few additions; On economic opportunities
*Q.Which category by age and education agree that Nepal lacks economic and employment opportunities
	tab age_cohort if q3_10_12 == 1 | q3_10_12 == 2 
	tab q3_10_12 == 1 | q3_10_12 == 2 

*Q. If you believe unemployment/economic opportunity cause unstability, living in Nepal?
	tab migration_plan if q3_10_12 == 1 | q3_10_12 == 2 

*If hopeful about economic and employment opportunities(3.11.4), going abroad or not

*If unemployment and lack of economic opportunites reasons behind Gen-Z





*Few Additions; Cost of Living
*Against age and Education

*Cost of living = Agree and then going abroad.

*Cost of Living behind protest




