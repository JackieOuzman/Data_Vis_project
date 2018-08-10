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

###now working with data called mat_tidy4

glimpse(mat_tidy4)
##make an empty plot
ggplot(data=mat_tidy4, aes(x = sampling_event, y = brix))

##make an empty plot now with data in it
ggplot(data=mat_tidy4, aes(x = sampling_event, y = brix, colour = Year_a))+
  geom_point(alpha = 0.3)
#same as above with some labels
ggplot(data=mat_tidy4, aes(x = GFV, y = brix, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Brix",title = ("maturity of grapes"),colour = "Year") +
    theme(axis.text.x=element_blank(), axis.ticks.x = element_blank())

#X = GFV and Y = Brix
#same as above with some labels but try and get background white
ggplot(data=mat_tidy4, aes(x = GFV, y = brix, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Brix",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                       colour = "black"))

glimpse(mat_tidy4) 

#X = GFV and Y = pH
ggplot(data=mat_tidy4, aes(x = GFV, y = pH, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "pH",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
        
#X = GFV and Y = TA
ggplot(data=mat_tidy4, aes(x = GFV, y = TA, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "TA",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))

#X = GFV and Y = bunch_wt
ggplot(data=mat_tidy4, aes(x = GFV, y = bunch_wt, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Bunch weight",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
#X = GFV and Y = Mean_berry_wt
ggplot(data=mat_tidy4, aes(x = GFV, y = Mean_berry_wt, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Mean berry weight",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
#X = GFV and Y = Colour_per_berry_Wt
ggplot(data=mat_tidy4, aes(x = GFV, y = Colour_per_berry_Wt, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Colour per berry weight",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))

#X = GFV and Y = Phenolic_per_berry_Wt
ggplot(data=mat_tidy4, aes(x = GFV, y = Phenolic_per_berry_Wt, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Phenolic per berry weight",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))


##check out how samples are behaving through time
#sample vs brix through sampling event
glimpse(mat_tidy4)
ggplot(data=mat_tidy4, aes(x = Sample, y = brix, colour = Year_a))+
  geom_point(alpha = 0.5) + facet_wrap(~ sampling_event)+
labs(x = "sample location",y = "Brix",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
glimpse(mat_tidy4)
#east vs north through sampling event
ggplot(data=mat_tidy4, aes(x = POINT_X, y = POINT_Y, colour = brix))+
  geom_point(alpha = 0.5) + facet_wrap(~ Year_a ~ sampling_event) 
##try and only show 2015 data

 

glimpse(mat_tidy4)

##filter data by year 2015 and brix
mat_tidy4 %>%
    filter(Year_a == "2015") %>%
  ggplot(aes(x = POINT_X, y = POINT_Y, colour = brix)) +
  geom_point(size = 1.5) +
  facet_wrap(~ GFV) + 
  labs(                                      
    x = "Easting",
    y = "Northing",
    title = "2015",
    colour = "brix") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
##filter data by year 2016 and brix
mat_tidy4 %>%
  filter(Year_a == "2016") %>%
  ggplot(aes(x = POINT_X, y = POINT_Y, colour = brix)) +
  geom_point(size = 1.5) +
  facet_wrap(~ GFV) + 
  labs(                                      
    x = "Easting",
    y = "Northing",
    title = "2016",
    colour = "brix") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))

##try and remove the effects of time? plot each GFV on at a time 2509

mat_tidy4 %>%
  filter(GFV == "3277") %>%
  ggplot(aes(x = POINT_X, y = POINT_Y, colour = brix)) +
  geom_point(size = 2.5) +
  labs(                                      
    x = "Easting",
    y = "Northing",
    title = "Harvest 2015",
    colour = "brix") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))

mat_tidy4 %>%
  filter(GFV == "3499") %>%
  ggplot(aes(x = POINT_X, y = POINT_Y, colour = brix)) +
  geom_point(size = 2.5) +
  labs(                                      
    x = "Easting",
    y = "Northing",
    title = "Harvest 2016",
    colour = "brix") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))

##bunch_wt for 2015
mat_tidy4 %>%
  filter(Year_a == "2015") %>%
  ggplot(aes(x = POINT_X, y = POINT_Y, colour = bunch_wt)) +
  geom_point(size = 2.5) +
  facet_wrap(~ GFV) + 
  labs(                                      
    x = "Easting",
    y = "Northing",
    title = "2015",
    colour = "Bunch weight") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
##bunch_wt for 2016
mat_tidy4 %>%
  filter(Year_a == "2016") %>%
  ggplot(aes(x = POINT_X, y = POINT_Y, colour = bunch_wt)) +
  geom_point(size = 2.5) +
  facet_wrap(~ GFV) + 
  labs(                                      
    x = "Easting",
    y = "Northing",
    title = "2016",
    colour = "Bunch weight") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))

##Grape variable vs grape variable
glimpse(mat_tidy4)
#Brix vs pH
mat_tidy4 %>%
  ggplot(aes(x = brix, y = pH, colour = GFV, shape = Year_a)) +
  geom_point(size = 2.5, alpha =0.8) +
  labs(                                      
    x = "Brix",
    y = "pH",
    title = "",
    colour = "Degree days", 
    shape = "Year") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
#Brix vs TA
mat_tidy4 %>%
  ggplot(aes(x = brix, y = TA, colour = GFV, shape = Year_a)) +
  geom_point(size = 2.0, alpha =0.8) +
  labs(                                      
    x = "Brix",
    y = "TA",
    title = "",
    colour = "Degree days", 
    shape = "Year") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
glimpse(mat_tidy4)

#Brix vs bunch_wt
mat_tidy4 %>%
  ggplot(aes(x = brix, y = bunch_wt, colour = GFV, shape = Year_a)) +
  geom_point(size = 2.0, alpha =0.8) +
  labs(                                      
    x = "Brix",
    y = "Bunch weight",
    title = "",
    colour = "Degree days", 
    shape = "Year") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
#Brix vs Mean_berry_wt
mat_tidy4 %>%
  ggplot(aes(x = brix, y = Mean_berry_wt, colour = GFV, shape = Year_a)) +
  geom_point(size = 2.0, alpha =0.8) +
  labs(                                      
    x = "Brix",
    y = "Mean berry weight",
    title = "",
    colour = "Degree days", 
    shape = "Year") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
#Brix vs Colour_per_berry_Wt
mat_tidy4 %>%
  ggplot(aes(x = brix, y = Colour_per_berry_Wt, colour = GFV, shape = Year_a)) +
  geom_point(size = 2.0, alpha =0.8) +
  labs(                                      
    x = "Brix",
    y = "Colour per berry weight",
    title = "",
    colour = "Degree days", 
    shape = "Year") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
#Phenolic_per_berry_Wt
mat_tidy4 %>%
  ggplot(aes(x = brix, y = Phenolic_per_berry_Wt, colour = GFV, shape = Year_a)) +
  geom_point(size = 2.0, alpha =0.8) +
  labs(                                      
    x = "Brix",
    y = "Phenolic per berry weight",
    title = "",
    colour = "Degree days", 
    shape = "Year") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))


#pH vs TA
mat_tidy4 %>%
  ggplot(aes(x = pH, y = TA, colour = GFV, shape = Year_a)) +
  geom_point(size = 2.0, alpha =0.8) +
  labs(                                      
    x = "pH",
    y = "TA",
    title = "",
    colour = "Degree days", 
    shape = "Year") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))


#pH vs colour
mat_tidy4 %>%
  ggplot(aes(x = pH, y = Colour_per_berry_Wt, colour = GFV, shape = Year_a)) +
  geom_point(size = 2.0, alpha =0.8) +
  labs(                                      
    x = "pH",
    y = "Colour per berry Wt",
    title = "",
    colour = "Degree days", 
    shape = "Year") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
#phenolics vs colour
mat_tidy4 %>%
  ggplot(aes(x = Phenolic_per_berry_Wt, y = Colour_per_berry_Wt, colour = GFV, shape = Year_a)) +
  geom_point(size = 2.0, alpha =0.8) +
  labs(                                      
    x = "Phenolic per berry Wt",
    y = "Colour per berry Wt",
    title = "",
    colour = "Degree days", 
    shape = "Year") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
###Extra to add

mat_tidy4 %>%
  filter(GFV > "3000") %>%
  ggplot(aes(x = POINT_X, y = POINT_Y, colour = brix, shape = Year_a)) +
  geom_point(size = 1.5, alpha = 0.5) +
  labs(                                      
    x = "Easting",
    y = "Northing",
    title = "Late season sampling",
    colour = "brix") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_text (),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
