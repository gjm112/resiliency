library(haven)
library(tidyverse)
qualtrics <- read_sav("/Users/gregorymatthews/Dropbox/resiliencygit/bwnjoy_20220217_qualtrics.sav")

qualtrics <- qualtrics %>% mutate(Region = case_when(State %in% c("Washington","Oregon","California","Montana",
                                                                  "Idaho","Nevada","Arizona","Utah","Wyoming",
                                                                  "Colorado","New Mexico") ~ "West",
                                                     State %in% c("North Dakota", "South Dakota","Nebraska","Kansas",
                                                                  "Minnesota","Iowa","Missouri","Wisconsin","Illinois",
                                                                  "Indiana","Michigan","Ohio") ~ "Midwest",
                                                     State %in% c("Texas","Oklahoma","Arkansas","Louisiana",
                                                                  "Kentucky","Tennessee","Mississippi","Alabama",
                                                                  "Florida","Georgia","South Carolina","North Carolina",
                                                                  "Virginia", "West Virginia","Maryland","Delware","District of Columbia") ~ "South",
                                                     State %in% c("Maine","Massachusetts","Connecticut","Vermont","New Hampshire",
                                                                  "New York","Pennsylvania","New Jersey") ~ "Northeast"
  
))

qualtrics$Region <- as.factor(qualtrics$Region)

sort(table(qualtrics$State),decreasing = TRUE)
sort(table(qualtrics$Region),decreasing = TRUE)

#Data viz: 
ggplot(aes(x = Region, y = well_score), data = qualtrics) + geom_boxplot() + theme_bw()
ggplot(aes(x = Region, y = bmi), data = qualtrics) + geom_boxplot() + theme_bw()
ggplot(aes(fill = Region, x = bmi), data = qualtrics) + geom_histogram() + theme_bw() + facet_wrap(~Region) + geom_vline(xintercept = 30, color = rgb(0,0,0,0.5))

qualtrics %>% group_by(Region) %>% summarize(mean_bmi = mean(bmi, na.rm = TRUE), 
                                             sd_bmi = sd(bmi, na.rm = TRUE), 
                                             prop_gt_30 = mean(bmi > 30, na.rm = TRUE), 
                                             n_bmi = sum(!is.na(bmi)), 
                                             n = n())

qualtrics <- qualtrics %>% mutate(flag_gooddiet = well_score > 60)
prop.table(table(qualtrics$Region, qualtrics$flag_gooddiet),1)
chisq.test(table(qualtrics$Region, qualtrics$flag_gooddiet))

table(qualtrics$Region, qualtrics$flag_htn)
prop.table(table(qualtrics$Region, qualtrics$flag_htn),1)
chisq.test(table(qualtrics$Region, qualtrics$flag_htn), simulate.p.value = TRUE)

table(qualtrics$Region, qualtrics$flag_cancer)
prop.table(table(qualtrics$Region, qualtrics$flag_cancer),1)
chisq.test(table(qualtrics$Region, qualtrics$flag_cancer), simulate.p.value = TRUE)

table(qualtrics$Region, qualtrics$flag_hld)
prop.table(table(qualtrics$Region, qualtrics$flag_hld),1)
chisq.test(table(qualtrics$Region, qualtrics$flag_hld), simulate.p.value = TRUE)

table(qualtrics$Region, qualtrics$bmi > 30)
prop.table(table(qualtrics$Region, qualtrics$bmi > 30),1)
chisq.test(table(qualtrics$Region, qualtrics$bmi > 30), simulate.p.value = TRUE)



#Could we look at midwest vs other?  

#Go through and do EDA.  

1. Region differences (as defined by the US census) (https://www2.census.gov/geo/pdfs/maps-data/maps/reference/us_regdiv.pdf)
2. Then repeat but for Chicago. 



#Variable state
#One way ANOVA on well diet score.
mod <- lm(well_score ~ Region, data = qualtrics)
summary(mod)

mod <- lm(log(bmi) ~ Region, data = qualtrics)
summary(mod)
plot(mod)



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



