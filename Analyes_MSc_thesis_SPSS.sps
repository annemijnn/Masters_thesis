* Encoding: UTF-8.
SET Small=0.0001 THREADS=AUTO TVars=Both SIGLESS=YES TNumbers=Both ONumbers=Both DIGITGROUPING=No TLook=None FOOTNOTE=ON SUMMARY=None OVars=Both TFit=Both LEADZERO=No ODISPLAY=tables TABLERENDER=light.

* Encoding: UTF-8.
cd "G:\FSW\FIL\DATA USE\DATA temp\".
get file "GINPS_v7.sav".
get file "G:\FSW\FIL\DATA USE\DATA temp\GINPSlong2022.sav".

* check if asample and focw oversamples are in the data set.
fre asample focw.
cross asample focw by year.
select if asample > 0 and focw ne 1. 
fre asample focw.

* add weights to corresponding years.
if year = 2002 weight = aweight.
if year = 2004 weight = bweight.
if year = 2006 weight = cweight.
if year = 2008 weight = dweight.
if year = 2010 weight = eweight.
if year = 2012 weight = fweight.
if year = 2014 weight = gweight.
if year = 2016 weight = iweight.
if year = 2019 weight = jweight.
if year = 2021 weight = kweight.

* check weights + delete outliers (creating wweight).
fre weight.
des weight.
graph / histogram = weight.
recode weight (lo thru .26 = .26) (2.37 thru hi = 2.37) (else = copy) into wweight.
fre wweight.
corr weight wweight.

des wweight.
fre year.
means wweight by year.

* check for board member positions.
fre vnone vaman vaadm.
weight by wweight.
fre vnone vaman vaadm.

cross vaman vaadm by vnone.
cross vaman by vaadm.

* create variables for volunteering.
des vsr vhl vsoc vedu vca vcom vnghb ven vna vea vpol vtu vref vch vethnm vrec vdev voth vnone.
count norgvol = vsr vhl vsoc vedu vca vcom vnghb ven vna vea vpol vtu vref vch vethnm vrec vdev voth (1).
fre norgvol.
if norgvol = 0 vnone = 1.
cross norgvol by vnone.
recode norgvol (1 thru hi = 1) (else = 0) into vol.
cross vol by vnone.

cross female by vol / cells = count row / stat = chi.
cross female by vol by year/ cells = count row / stat = chi.

* create variable for board member/coordinator position.
compute vboard = vaman.
if vnone = 1 vboard = -1. 
variable label vboard 'board member or coordinator'.
value labels vboard -1 'no volunteer work' 0 'volunteer but no board member or coordinator' 1 'volunteer board member or coordinator'.
cross vboard by vnone.

cross year by vboard / cells = count row.

cross female by vboard / cells = count row / stat = chi.

* create variables for several sectors.
COMPUTE development_aid_and_human_rights=vref + vdev + vethnm.
COMPUTE nature_and_environment=ven + vna.
COMPUTE wellbeing = vsr + vsoc + vcom + vnghb + vrec + vpol + vtu.

* calculate how many women volunteer per sector.
temp.
select if norgvol =1.
cross animals by female / cells = count row.
cross arts_and_culture by female / cells = count row.
cross education_and_research by female / cells = count row.
cross health by female / cells = count row.
cross religion_and_ideology by female / cells = count row.
cross development_aid_and_human_rights by female / cells = count row.
cross nature_and_environment by female / cells = count row.
cross wellbeing by female / cells = count row.

* calculate how many women are volunteers and board members.
temp.
select if vboard > -1.
cross female by vboard by year / cells = count row / stat = chi.

temp.
select if vnone = 0.
cross female by vboard / cells = count row / stat = chi.

temp.
select if vboard > -1.
cross female by vboard / cells = count row / stat=chi.

* check how many women are board members across education levels.
cross educ by vboard / cells = count row.

temp.
select if vboard > -1.
cross female by vboard by educ / cells = count row.

* check how many women are board members across provinces.
cross prov by vboard / cells = count row.

temp.
select if vboard > -1.
cross female by vboard by prov / cells = count row / stat = chi.

* check how many women are board members across socioeconomic statuses. 
cross ses by vboard / cells = count row / stat = chi.

temp.
select if vboard > -1.
cross female by vboard by ses / cells = count row.

* check how many women volunteers/are board members with the number of children per household.
cross chldhh by vboard / cells = count row / stat = chi.

temp.
select if vboard > -1.
cross female by vboard by chldhh / cells = count row / stat = chi.
 
* check how many women work in the non-profit sector.
cross female by wnprof / cells = count row.

* check how often women are asked to engage in volunteer work.
cross female by vask / cells = count row.

temp.
select if vboard > -1.
cross female by vask by vboard / cells = count row.

cross female by vol by vaskw / cells = count row.
