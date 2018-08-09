#Tidy version of day 1 notes
library(tidyverse)
library(dplyr)
maturity <- read_csv("Raw_data/Taylors_maturity_2015_2016.csv")
spec(maturity)
head(maturity)


#Use drop function to remove empty clms
maturity %>%
drop(X19, X20)
#This is not working for me I think the clm function here is only selecting NA search in row 
#in which you sepcficy the clm

maturity %>%
  
drop_na(maturity)


#What about selecting data?

#This selects data that i list
test_subset <- select(maturity, Year, POINT_X, POINT_Y)
head(test_subset)

#this selects data that starts with Y
tes_subset1 <- select(test_subset, starts_with("Y"))
head(tes_subset1)

#this selects data that starts with X
test_subset2 <- select(maturity, starts_with("X"))

head(test_subset2)

#Now how to remove it...
test_subset3 <- select(maturity, -starts_with("X"))

head(test_subset3)
#put this into the maturity data not just test

maturity1 <- select(maturity, -starts_with("X"))

head(maturity1)
