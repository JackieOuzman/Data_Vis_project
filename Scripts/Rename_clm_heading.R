#Tidy version of day 1 notes
library(tidyverse)
library(dplyr)
maturity <- read_csv("Raw_data/Taylors_maturity_2015_2016.csv")
spec(maturity)
head(maturity)

#dropping clms? seems to work??

maturity2_a <- select(maturity, -starts_with("X"))
head(maturity2_a)
spec(maturity2_a)

#rename clm headings
#maturity_1 $sampling event <- gsub('\\s+', '', maturity1 $sampling event)
#maturity1$sampling event

names(maturity1)[1:5] = c("Year", "sampling_event", "Sampling_date", "GFV", "Sample")
head(maturity1)
ncol(maturity1)
maturity2 = rename(maturity2, Country = `Country Name`)

maturity2_a_rename <- rename(maturity2, 'sampling event'  = "sampling_event", )
head(maturity2_a_rename)


#This works...
names(maturity2_a_rename)<-str_replace_all(names(maturity2_a_rename), c(" " = "." , "," = "" ))
head(maturity2_a_rename)

names(maturity1)<-str_replace_all(names(maturity1), c(" " = "_" ))
head(maturity1)


#Split the date clm
seperate_1 <- separate(maturity1, Sampling_date, "day", "month", "year", sep = "/" )
head(seperate_1)
