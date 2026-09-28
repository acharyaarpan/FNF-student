* One 100% stacked bar per Gen-Z protest cause
* Each bar shows the full response distribution for that cause.

* Check that response codes are 1=Strongly disagree through 5=Strongly agree
tab q4_2_1, missing

local causes q4_2_1 q4_2_2 q4_2_3 q4_2_4 q4_2_5 q4_2_6 q4_2_7 q4_2_8
local labels `" "Corruption" "Poor public services" "Unemployment / economic opportunities" "Rising cost of living" "Distrust of leaders / parties" "Nepotism / elite capture" "Social media ban" "Foreign / external influence" "'

* Calculate the percent in each of the five response categories
tempfile plotdata
tempname post
postfile `post' byte cause byte response double percent using `plotdata', replace

local i = 0
foreach v of local causes {
    local ++i
    quietly count if !missing(`v')
    local denominator = r(N)

    forvalues r = 1/5 {
        quietly count if `v' == `r'
        local pct = 100 * r(N) / `denominator'
        post `post' (`i') (`r') (`pct')
    }
}
postclose `post'
use `plotdata', clear

* Order the segments from left to right
gen double start = .
bysort cause (response): replace start = sum(percent) - percent

gen double center = start + percent/2
gen str8 pct_label = string(percent, "%3.0f") + "%"

* Display labels only when a segment is wide enough to fit them
gen str12 inside_label = pct_label if percent >= 7

twoway ///
    (bar percent start if response==1, horizontal base(0) barwidth(.72) color(red%70) lcolor(white)) ///
    (bar percent start if response==2, horizontal base(0) barwidth(.72) color(red%35) lcolor(white)) ///
    (bar percent start if response==3, horizontal base(0) barwidth(.72) color(gs12) lcolor(white)) ///
    (bar percent start if response==4, horizontal base(0) barwidth(.72) color(green%35) lcolor(white)) ///
    (bar percent start if response==5, horizontal base(0) barwidth(.72) color(green%70) lcolor(white)) ///
    (scatter cause center, msymbol(none) mlabel(inside_label) mlabcolor(black) mlabsize(small)), ///
    xlabel(0(10)100, grid glcolor(gs14) format(%3.0f)) ///
    ylabel(1 `"`: word 1 of `labels''"' ///
           2 `"`: word 2 of `labels''"' ///
           3 `"`: word 3 of `labels''"' ///
           4 `"`: word 4 of `labels''"' ///
           5 `"`: word 5 of `labels''"' ///
           6 `"`: word 6 of `labels''"' ///
           7 `"`: word 7 of `labels''"' ///
           8 `"`: word 8 of `labels''"', ///
           angle(0) noticks labsize(small)) ///
    yscale(reverse) ///
    ytitle("") ///
    xtitle("Percent of respondents") ///
    title("Perceived causes of the Gen-Z protest") ///
    legend(order(1 "Strongly disagree" 2 "Disagree" 3 "Neutral" ///
                 4 "Agree" 5 "Strongly agree") rows(1) size(small)) ///
    graphregion(color(white)) plotregion(color(white)) ///
    name(genz_causes, replace)

graph export "genz_protest_causes.png", width(2200) replace