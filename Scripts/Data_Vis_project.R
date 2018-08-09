library(tidyverse)
library(ggplot2)
library(dplyr)
maturity_data <- read_csv("Raw_data/Taylors_maturity_2015_2016.csv")

head(maturity_data)


maturity_data_clean <- maturity_data[,colSums(is.na(maturity_data))<nrow(maturity_data)]
head(maturity_data_clean)

#maturity_data_2 <- Filter(function(x19)!all(is.na(x19)), maturity_data_2)
#maturity_data"$X30", maturity_data"$x31" <- NULL
#head(maturity_data)
#select_data <- maturity_data (0)
#head(maturity_data_2)

#head(maturity_data)
#maturity_data$X30<- NULL
#maturity_data[15]<- NULL

#create an empty plot
ggplot(data = maturity_data_clean, aes(x = brix, y = pH))
ggplot(data = maturity_data_clean, aes(x = sampling date, y = pH))


# df = dataframe
# old.var.name = The name you don't like anymore
# new.var.name = The name you want to get
#names(df)[names(df) == 'old.var.name'] <- 'new.var.name'

names(maturity_data_clean)[names(maturity_data_clean) == 'sampling event'] <- 'sampling_event'

head(maturity_data_clean)

names(maturity_data_clean)[names(maturity_data_clean) == 'Sampling date'] <- 'Sampling_date'
names(maturity_data_clean)[names(maturity_data_clean) == 'GPS sampling  pt ID'] <- 'GPS_sampling_pt_ID'
names(maturity_data_clean)[names(maturity_data_clean) == 'bunch wt'] <- 'bunch_wt'
names(maturity_data_clean)[names(maturity_data_clean) == 'Mean berry wt'] <- 'Mean_berry_wt'
names(maturity_data_clean)[names(maturity_data_clean) == 'berries/bunch'] <- 'berries_per_bunch'
names(maturity_data_clean)[names(maturity_data_clean) == 'Phenolic per berry Wt'] <- 'Phenolic_per_berry_Wt'
names(maturity_data_clean)[names(maturity_data_clean) == 'Colour per berry'] <- 'Colour_per_berry'
names(maturity_data_clean)[names(maturity_data_clean) == 'Phenolic per berry'] <- 'Phenolic_per_berry'

##ggplot(data = maturity_data, aes(x = Sampling date, y = pH))

ggplot(data = maturity_data_clean, aes(x = Sampling_date, y = pH, colour=Year)) +
geom_point()
#need to change data type for date

ggplot(data = maturity_data_clean, aes(x = sampling_event, y = pH, colour=Year)) +
  geom_point()
#need to change the data type for year too


str(maturity_data_clean)

nrow(maturity_data_clean)
ncol(maturity_data_clean)

dim(maturity_data_clean)

ls(maturity_data_clean)

typeof(maturity_data_clean$Year)
typeof(maturity_data_clean$Sampling_date)
head(maturity_data_clean)

#drop variable
#maturity_data drop_na(data, )

#drop.cols <- c('x31', 'x30')
#maturity_data %>% select(-drop.cols)

#drop.cols <- c(x31,x30) maturity_data %>% select()
drop_na (maturity_data, X27)
#that worked
drop_na (maturity_data, seq ('X21':'X22'))

head(maturity_data)

drop_na (maturity_data, )
##Leave the drop stuff for now





##Generate a new variable with 
str(maturity_data_clean)
## create a new clm with GPS_sampling_pt_ID and Year
unq_ID <- select(maturity_data_clean,Year)
print(unq_ID)

#Advice from Kersensa still not working

maturity_data_clean <- maturity_data_clean %>%
  unite(ID, Year, GPS_sampling_pt_ID)
str(maturity_data_clean)

#Ian method
#maturity_data_clean %>%
#  mutate(ID_1 = )

