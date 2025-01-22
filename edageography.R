library(haven)
library(tidyverse)
qualtrics <- read_sav("/Users/gregorymatthews/Dropbox/resiliencygit/bwnjoy_20220217_qualtrics.sav")
View(qualtrics)

1. Region differences (as defined by the US census) (https://www2.census.gov/geo/pdfs/maps-data/maps/reference/us_regdiv.pdf)
2. Then repeat but for Chicago. 

#Variables of interest
#Well diet score: well_score
#flag_gooddiet (1 for welldiet_score \> 60, 0 otherwise)
#flag_htn, 
#cancer
#hld
#bmi is there (>30 obese)
#flag_depress
#discrim_life_1 : discrim_life_5
#brs score = resiliency
#foodins_scores
#pss_score = perceived stress score
#aces_score
#commstress_score = community stress score



#Latitude and longitude

#bis is black idenity scale



