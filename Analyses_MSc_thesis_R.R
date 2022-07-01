# Load necessary packages
library(tidyverse)
library(readxl)
library(openxlsx)
library(haven)
library(DemografixeR)
library(tmap)
library(ggpubr)
library(stats)
library(lm.beta)

# Set working directory
setwd("~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data")

# Import data sets
persons = read_excel("persons_output_v3.xlsx")
sectors = read_excel("sectors_output.xlsx")

# Delete unnecessary columns
persons = select(persons, -c(rvt13:rvt20, ledenraad26:ledenraad30, controlecommissie5))

# Merge data sets
merged_persec = inner_join(persons, sectors, by="organisation")

# Selection of board members + delete those without board members
board_members = select(merged_persec, c(organisation, main_sector, bestuur1:bestuur20))
board_members = board_members[!(is.na(board_members$bestuur1) | board_members$bestuur1==""), ]

# Everything to lower case
board_members = board_members %>%
  mutate_if(is.character, str_to_lower)

# Clean the data, only keep first names
split1 = strsplit((board_members$bestuur1), " ")
board1 = sapply(split1, "[", 1)

split2 = strsplit((board_members$bestuur2), " ")
board2 = sapply(split2, "[", 1)

split3 = strsplit((board_members$bestuur3), " ")
board3 = sapply(split3, "[", 1)

split4 = strsplit((board_members$bestuur4), " ")
board4 = sapply(split4, "[", 1)

split5 = strsplit((board_members$bestuur5), " ")
board5 = sapply(split5, "[", 1)

split6 = strsplit((board_members$bestuur6), " ")
board6 = sapply(split6, "[", 1)

split7 = strsplit((board_members$bestuur7), " ")
board7 = sapply(split7, "[", 1)

split8 = strsplit((board_members$bestuur8), " ")
board8 = sapply(split8, "[", 1)

split9 = strsplit((board_members$bestuur9), " ")
board9 = sapply(split9, "[", 1)

split10 = strsplit((board_members$bestuur10), " ")
board10 = sapply(split10, "[", 1)

split11 = strsplit((board_members$bestuur11), " ")
board11 = sapply(split11, "[", 1)

split12 = strsplit((board_members$bestuur12), " ")
board12 = sapply(split12, "[", 1)

split13 = strsplit((board_members$bestuur13), " ")
board13 = sapply(split13, "[", 1)

split14 = strsplit((board_members$bestuur14), " ")
board14 = sapply(split14, "[", 1)

split15 = strsplit((board_members$bestuur15), " ")
board15 = sapply(split15, "[", 1)

split16 = strsplit((board_members$bestuur16), " ")
board16 = sapply(split16, "[", 1)

split17 = strsplit((board_members$bestuur17), " ")
board17 = sapply(split17, "[", 1)

split18 = strsplit((board_members$bestuur18), " ")
board18 = sapply(split18, "[", 1)

split19 = strsplit((board_members$bestuur19), " ")
board19 = sapply(split19, "[", 1)

split20 = strsplit((board_members$bestuur20), " ")
board20 = sapply(split20, "[", 1)

board_members = cbind(board1, board2, board3, board4, board5, board6, board7, board8, board9, board10, 
                      board11, board12, board13, board14, board15, board16, board17, board18, board19, 
                      board20, board_members[, -c(3:22)])

# rearrange columns
board_members = board_members[, c(21,22,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)]

# Initials deleted in SPSS, now loading and cleaning that data set
board_members2 = read_sav("~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board_members2.sav")
board_members2 = select(board_members2, c(organisation:board13))
board_members2 = lapply(board_members2, gsub, pattern="\\.", replacement="")
board_members2 = bind_rows(board_members2)
board_members2 = board_members2[!(is.na(board_members2$board1) | board_members2$board1==""), ]
board_members2 = board_members2 %>%
  mutate_all(na_if, "")

# automatically assign gender to first names using the DemografixeR package
board1 = genderize(name=board_members2$board1, country_id="NL", simplify=F, meta=F)
board2 = genderize(name=board_members2$board2, country_id="NL", simplify=F, meta=F)
board3 = genderize(name=board_members2$board3, country_id="NL", simplify=F, meta=F)
board4 = genderize(name=board_members2$board4, country_id="NL", simplify=F, meta=F)
board5 = genderize(name=board_members2$board5, country_id="NL", simplify=F, meta=F)
board6 = genderize(name=board_members2$board6, country_id="NL", simplify=F, meta=F)
board7 = genderize(name=board_members2$board7, country_id="NL", simplify=F, meta=F)
board8 = genderize(name=board_members2$board8, country_id="NL", simplify=F, meta=F)
board9 = genderize(name=board_members2$board9, country_id="NL", simplify=F, meta=F)
board10 = genderize(name=board_members2$board10, country_id="NL", simplify=F, meta=F)
board11 = genderize(name=board_members2$board11, country_id="NL", simplify=F, meta=F)
board12 = genderize(name=board_members2$board12, country_id="NL", simplify=F, meta=F)
board13 = genderize(name=board_members2$board13, country_id="NL", simplify=F, meta=F)

# write all the API results to a new data set
write.csv(board1, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board1.csv")
write.csv(board2, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board2.csv")
write.csv(board3, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board3.csv")
write.csv(board4, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board4.csv")
write.csv(board5, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board5.csv")
write.csv(board6, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board6.csv")
write.csv(board7, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board7.csv")
write.csv(board8, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board8.csv")
write.csv(board9, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board9.csv")
write.csv(board10, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board10.csv")
write.csv(board11, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board11.csv")
write.csv(board12, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board12.csv")
write.csv(board13, "~/Vrije universiteit (Amsterdam)/Year 2/P4+5+6 - Master's Thesis in Societal Resilience/data/board13.csv")

# read all the csv files again
board1 = read.csv("board1.csv")
board2 = read.csv("board2.csv")
board3 = read.csv("board3.csv")
board4 = read.csv("board4.csv")
board5 = read.csv("board5.csv")
board6 = read.csv("board6.csv")
board7 = read.csv("board7.csv")
board8 = read.csv("board8.csv")
board9 = read.csv("board9.csv")
board10 = read.csv("board10.csv")
board11 = read.csv("board11.csv")
board12 = read.csv("board12.csv")
board13 = read.csv("board13.csv")

# replace the board columns in board_members2 with the genders
board1 = board1 %>%
  rename(gender1 = gender)
board2 = board2 %>%
  rename(gender2 = gender)
board3 = board3 %>%
  rename(gender3 = gender)
board4 = board4 %>%
  rename(gender4 = gender)
board5 = board5 %>%
  rename(gender5 = gender)
board6 = board6 %>%
  rename(gender6 = gender)
board7 = board7 %>%
  rename(gender7 = gender)
board8 = board8 %>%
  rename(gender8 = gender)
board9 = board9 %>%
  rename(gender9 = gender)
board10 = board10 %>%
  rename(gender10 = gender)
board11 = board11 %>%
  rename(gender11 = gender)
board12 = board12 %>%
  rename(gender12 = gender)
board13 = board13 %>%
  rename(gender13 = gender)

board_members2 = cbind(board_members2, board1[c("gender1")])
board_members2 = cbind(board_members2, board2[c("gender2")])
board_members2 = cbind(board_members2, board3[c("gender3")])
board_members2 = cbind(board_members2, board4[c("gender4")])
board_members2 = cbind(board_members2, board5[c("gender5")])
board_members2 = cbind(board_members2, board6[c("gender6")])
board_members2 = cbind(board_members2, board7[c("gender7")])
board_members2 = cbind(board_members2, board8[c("gender8")])
board_members2 = cbind(board_members2, board9[c("gender9")])
board_members2 = cbind(board_members2, board10[c("gender10")])
board_members2 = cbind(board_members2, board11[c("gender11")])
board_members2 = cbind(board_members2, board12[c("gender12")])
board_members2 = cbind(board_members2, board13[c("gender13")])

board_members2 = select(board_members2, c(organisation, main_sector, gender1:gender13))

# recode male = 0 & female = 1
board_members2 = board_members2 %>%
  mutate(gender1 = recode(board_members2$gender1, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender2 = recode(board_members2$gender2, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender3 = recode(board_members2$gender3, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender4 = recode(board_members2$gender4, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender5 = recode(board_members2$gender5, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender6 = recode(board_members2$gender6, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender7 = recode(board_members2$gender7, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender8 = recode(board_members2$gender8, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender9 = recode(board_members2$gender9, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender10 = recode(board_members2$gender10, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender11 = recode(board_members2$gender11, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender12 = recode(board_members2$gender12, "male" = 0, "female" = 1))
board_members2 = board_members2 %>%
  mutate(gender13 = recode(board_members2$gender13, "male" = 0, "female" = 1))

# calculate percentage of female >> done this in excel
write.xlsx(board_members2, file = "board_members2.xlsx")
board_members3 = read.xlsx("board_members2.xlsx")

# summary statistics
mean(board_members3$perc_female)
summary(board_members3$perc_female)

board_members3 %>%
  group_by(main_sector) %>%
  count(perc_female > 0.49)

aggregate(x = board_members3$perc_female, 
          by = list(board_members3$main_sector),
          FUN = mean)

# make a map
tmap_mode("plot")
data("NLD_prov")

perc_women = c(39, 60, 44, 45, 56, 33, 50, 48, 49, 34, 48, 49)

NLD_prov$perc_women = map_data$perc_women

tm_shape(NLD_prov) +
  tm_polygons("perc_women", palette = "RdYlBu")

tm_shape(NLD_prov) +
  tm_polygons(col = "perc_women", 
              style = "fixed",
              breaks = c(30, 40, 50, 60, 70),
              legend.hist = TRUE) +
  tm_layout(legend.outside = TRUE) 

tm_shape(NLD_prov) +
  tm_polygons(col = "perc_women", 
              style = "fixed",
              breaks = c(30, 35, 40, 45, 50, 55, 60, 65))

# combine board_members with background info from PBO data set
anbis_clean = read.xlsx("anbis_clean2.xlsx")

anbis_clean = anbis_clean %>%
  mutate_if(is.character, str_to_lower)

board_info = merge(board_members3, anbis_clean, by = "organisation")
board_info2 = board_info %>%
  select(c(1, 2, 16, 17, 24, 25, 35, 38, 39, 43, 44, 45, 46))

# add religiosity per municipality + highly educated persons per municipality
religion = read_xlsx("religie_gemeenten.xlsx")
religion = religion %>%
  select(c(gemeente, religiositeit)) %>%
  mutate_if(is.character, str_to_lower) %>%
  rename(city = gemeente)

education_level = read_xlsx("opleidingsniveau_gemeenten.xlsx")
education_level = education_level %>%
  select(c(gemeente, perc_hoogopgeleiden)) %>%
  mutate_if(is.character, str_to_lower) %>%
  rename(city = gemeente)

board_info3 = merge(x=board_info2,y=education_level,by="city",all=TRUE)
board_info3 = merge(x=board_info3,y=religion, by="city",all=T)
board_info3 = board_info3[!(is.na(board_info3$organisation) | board_info3$organisation==""), ]
board_info3 = board_info3[, c(2,3,4,5,6,7,1,8,9,10,11,12,13,14,15)]

# some summary statistics
summary(board_info3$religiositeit)
sd(board_info3$religiositeit, na.rm=T)

summary(board_info3$perc_hoogopgeleiden)
sd(board_info3$perc_hoogopgeleiden, na.rm=T)

summary(board_info3$perc_female_sector)
sd(board_info3$perc_female_sector)

summary(board_info3$employees)
sd(board_info3$employees)

summary(lm_model$foundationAge)
sd(lm_model$foundationAge)

summary(board_info3$perc_female)
sd(board_info3$perc_female)

t.test(board_info3$religiositeit, mu = 0, alternative = "two.sided")
t.test(board_info3$perc_hoogopgeleiden, mu = 0, alternative = "two.sided")
t.test(board_info3$employees, mu = 0, alternative = "two.sided")
t.test(board_info3$foundationAge, mu = 0, alternative = "two.sided")

female_sector = tibble(main_sector = c('dieren', 'kunst en cultuur', 'internationale hulp en mensenrechten', 'onderwijs en onderzoek',
                                         'gezondheid', 'natuur en milieu', 'religie en levensbeschouwing', 'welzijn'),
                       perc_female_board = c(56, 30.9, 37.5, 44.4, 42.5, 32.5, 27.6, 39.7), 
                       perc_female_volunteer = c(65.8, 55.2, 66, 42.6, 57.3, 43.2, 45.7, 67.3))

t.test(female_sector$perc_female_board, mu = 0, alternative = "two.sided")
sd(female_sector$perc_female_board)
t.test(female_sector$perc_female_volunteer, mu = 0, alternative = "two.sided")
sd(female_sector$perc_female_volunteer)
t.test(female_sector$perc_female_board, female_sector$perc_female_volunteer, alternative = "two.sided", var.equal = F)

# regressions
perc_female_sector = tibble(main_sector = c('dieren', 'kunst en cultuur', 'internationale hulp en mensenrechten', 
                            'onderwijs en onderzoek', 'gezondheid', 'natuur en milieu', 'religie en levensbeschouwing', 'welzijn'),
                            perc_female_sector = c(65.8, 42.6, 57.3, 67.3, 66.0, 43.2, 55.2, 45.7))
board_info3 = merge(x=board_info3, y=perc_female_sector,by="main_sector",all=T)
board_info3 = board_info3[, c(2,1,3,4,5,6,7,8,9,10,11,12,13,14,15,16)]
board_info3 = board_info3 %>%
  select(-c(8, 9, 12, 13)) %>%
  na.omit()
board_info3 = transform(board_info3, religiositeit = as.numeric(religiositeit))

board_info3 = read.xlsx("board_info3.xlsx")

lm_model = board_info3 %>%
  select(-c(rsin, financial.year, foundationDate)) %>%
  na.omit()

res_sector = model.matrix(~main_sector, data = lm_model)
res_city = model.matrix(~city, data = lm_model)

year_model = lm(perc_female ~ foundationAge, lm_model)
summary(year_model)
lm.beta(year_model)

year_employees_model = lm(perc_female ~ foundationAge + employees, lm_model)
summary(year_employees_model)
lm.beta(year_employees_model)

year_sector_model = lm(perc_female ~ foundationAge + perc_female_sector, lm_model)
summary(year_sector_model)
lm.beta(year_sector_model)

year_employees_sector_model = lm(perc_female ~ foundationAge + employees + perc_female_sector, lm_model)
summary(year_employees_sector_model)
lm.beta(year_employees_sector_model)

education_model = lm(perc_female ~ perc_hoogopgeleiden, lm_model)
summary(education_model)
lm.beta(education_model)

education_sector_model = lm(perc_female ~ perc_hoogopgeleiden + perc_female_sector, lm_model)
summary(education_sector_model)
lm.beta(education_sector_model)

religion_model = lm(perc_female ~ religiositeit, lm_model)
summary(religion_model)
lm.beta(religion_model)

religion_sector_model = lm(perc_female ~ religiositeit + perc_female_sector, lm_model)
summary(religion_sector_model)
lm.beta(religion_sector_model)

all_model = lm(perc_female ~ foundationAge + employees + perc_female_sector + perc_hoogopgeleiden + religiositeit, lm_model)
summary(all_model)
lm.beta(all_model)
