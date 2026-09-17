* 
*------------------------------------------------------------------------------*
*           		 Master do file to clean FNF			           *
/*

	Author:				Arpan
	Date created:		16th Sep 2026
	Date updated:		16th Sep 2026
	Last updated by:	Arpan

	Notes:
						This is a templet master do file.
			
	Dependencies:		This do file is not dependendent on any other do files.

*/

*------------------------------------------------------------------------------*
**#							STATA setups       								    
*------------------------------------------------------------------------------*

local dofilename "0_master"
version 17
clear all
macro drop _all
cap log close
set rmsg on	
set more off
cap clear frames

	
*--------------------------------------------------------------------------*
	**# Folder macros (global)
	
	if "`c(username)'" == "ACER" {
		global workspace "C:/Users/ACER/OneDrive - Samriddhi Foundation/Projects/FNF"
	}
	
	if "`c(username)'" == "HP" {
		global workspace "C:\Users\HP\OneDrive\Fnf"
	}
	
	if "`c(username)'" == "pprak" {
			global workspace "C:/Users/pprak/OneDrive/Desktop/FNF-student"
	}
	
		**# Sub folder macros (global)
	global data 			"$workspace/1_data"
		gl data_raw 		"$data/1_raw"
		gl data_clean		"$data/2_clean"
	global prep				"$workspace/2_prep"
	global	analysis		"$workspace/3_analysis"	
	global	log				"$workspace/4_log"
	global	doc				"$workspace/5_documentation"
	global	output			"$workspace/6_output"
	
	
*--------------------------------------------------------------------------*
	**# Macros check
	
	** No need to change following codes
	if "$workspace" == "" {
		di as error "Please set up workspace directory"
		exit
	} 
	
	*--------------------------------------------------------------------------*
	**# Packages check
	
	** Setting ado path
	adopath + "${prep}/ado"
	adopath + "${analysis}/ado"
	
	** List all required packages below as local. !! No SPACES in package name !!
	local packages "estout texify"
	
	foreach package in `packages' {
		cap which `package'
		if _rc {
			if "`package'"=="estout" {
				** Steps to install specific package
				ssc install estout
			}
			if "`package'"=="texify" {
				** Steps to install specific package
				ssc install texify
			}
			else {
				di as error "Need to install following package: `package'"
				search `package'
			}
		}
	}
	
	*--------------------------------------------------------------------------*
	**# Date/time macro (global)
	** Following is useful for hourly log purpose
	local datehour =ustrregexra(regexr("`c(current_date)'"," 20","") +"_"+regexr("`c(current_time)'",":[0-9]+:[0-9]+","")," ","") //saves string in 4Mar23_13 format, equivalent to 4th march 2023, 13 hour.
	
*------------------------------------------------------------------------------*
**#							Setting directory
/*
	Please avoid changing directory frequently during a STATA session. 
	Subsequent do files might be dependent on setting of directory to "workspace"
	folder. This avoids breakage of scripts. In cases where changing directory 
	is unavoidable, do change them back to "workspace" folder.
*/      								    
*------------------------------------------------------------------------------*

cd "$workspace"

*Work1: Cleaning for consumption

doedit "$prep/cleaning.do"

*------------------------------------------------------------------------------*		
**#							End of do file
*------------------------------------------------------------------------------*
	exit
*------------------------------------------------------------------------------*
