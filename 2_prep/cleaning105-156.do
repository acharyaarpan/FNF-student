*------------------------------------------------------------------------------*
*            	Cleaning for consumption in NLSS			                   *
/*

	Author:				Arpan
	Date created:		17th Sep 2026
	Date updated:		17th Sep 2026
	Last Updated by:	Arpan

	Notes:				
			
	Dependencies:		Run 0_master before

*/


{
*------------------------------------------------------------------------------*
**#							STATA setups       								    
*------------------------------------------------------------------------------*
clear
cap clear frames
set more off
set rmsg on
local dofilename "01_data_cleaning"
cap log close
	
	*--------------------------------------------------------------------------*
	**# Import macros (global)
	
	*--------------------------------------------------------------------------*
	**# Export macros (global)
	
	*--------------------------------------------------------------------------*
	**# Programs
	
	*--------------------------------------------------------------------------*
	**# Macros check
	
	** No need to change following codes
	if "$workspace" == "" {
		di as error "Please set up workspace directory"
		exit
	} 
	
	*--------------------------------------------------------------------------*
	**# Date/time macro (global)
	
	** Following is useful for hourly log purpose
	local datehour =ustrregexra(regexr("`c(current_date)'"," 20","")+"_"+regexr("`c(current_time)'",":[0-9]+:[0-9]+","")," ","") //saves string in 4Mar23_13 format, equivalent to 4th march 2023, 13 hour.
	
*------------------------------------------------------------------------------*
**#							Log start       								    
*------------------------------------------------------------------------------*	
	
	log using "$log/`dofilename'_`datehour'", replace
	
}	
*------------------------------------------------------------------------------*
**#Load the dataset

import excel "$data_raw\raw-data-student.xlsx", sheet("Youth and Aspirations Percep...") firstrow



log close




