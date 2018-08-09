library(tidyverse)
library(dplyr)




#Split the date clm
seperate_1 <- separate(maturity1, Sampling_date, "day", "month", "year", sep = "/" )
head(seperate_1)

head(maturity1)

#This works but I have lost my orginal data...there is a true false satement that I cant get working
data1 <- maturity1 %>%
  separate(Sampling_date, c("Day", "Month", "Year"), sep = '/')
data1

#Trying to keep my orginal data set - havent got it going
head(maturity2_a_rename)
separate

data2 <- maturity2_a_rename %>%
  separate(GFV, c("Day", "Month", "Year"), sep = '/', remove = FALSE)
data2

#Rename the data clm 
head(maturity)
play_year <- select(maturity, Year)
head(play_year)
type(play_year)

play_year$Year <- as.factor(play_year$Year)
head(play_year)

