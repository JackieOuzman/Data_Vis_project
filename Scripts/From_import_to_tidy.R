library(tidyverse)
library(dplyr)

maturity_data <- read_csv("Raw_data/Taylors_maturity_2015_2016.csv")
View(maturity_data)
glimpse(maturity_data)

#Tidy data Step1 data I want to use
mat_tidy1 <- select(maturity_data,c(1:18))
head(mat_tidy1)


#Alt approach to step 1                
test1_1 <- select(maturity_data, -starts_with("X"))
head(test1_1)
str(test1_1)

#Tidy data step2 white space in heading removed
#I am trying to make a new df with the new names and to keep the old - cant do it!
mat_tidy2 <- 
names(mat_tidy1) <-str_replace_all(names(mat_tidy1), c(" " = "_" ))
str(mat_tidy2)

#names(maturity2_a_rename)<-str_replace_all(names(maturity2_a_rename), c(" " = "." , "," = "" ))
names(mat_tidy1) <-str_replace_all(names(mat_tidy1), c(" " = "_", "/" = "_" ))
glimpse(mat_tidy1)

#Tidy data step3 make a unquie ID
#Step 3a dupliacte Year coloumn to create Year_1

#use play data test1_1 to create new df test1_3
test1_3 <- test1_1 %>%
  mutate(Year_a = Year)

head(test1_3)
#so this works now make it into factor
test1_3$Year_a <- as.factor(test1_3$Year_a)

#use my real data create a new clm
mat_tidy1 <- mat_tidy1 %>%
  mutate(Year_a = Year)

mat_tidy1$Year_a <- as.factor(mat_tidy1$Year_a)
head(mat_tidy1)

#3b make unquie ID
#use test data first test1_3
glimpse(test1_3)

test1_3b <- test1_3 %>%
  unite(ID, Year, Sample)
head(test1_3b)
#3b make unquie ID
#use real data
glimpse(mat_tidy1)

mat_tidy3 <- mat_tidy1 %>%
  unite(ID, Year, GPS_sampling__pt_ID)

head(mat_tidy3)

#4 of makeing data tidy - split date column out 
mat_tidy4 <- mat_tidy3 %>%
  separate(Sampling_date, c("Day", "Month", "Year"), sep = '/')
mat_tidy4

head(mat_tidy4)

#change char to intergers
mat_tidy4$Day <- as.integer(mat_tidy4$Day)
mat_tidy4$Month <- as.integer(mat_tidy4$Month)
mat_tidy4$Year <- as.integer(mat_tidy4$Year)
glimpse(mat_tidy4)





