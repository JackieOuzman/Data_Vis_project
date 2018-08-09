Taylors maturity sampling data visulaiation
================

*Add in table of contents when I work out how*
==============================================

-   Set up Git

-   import data and make tidy

-   display data

Setting up working environmnets.
================================

Working directory and folders
-----------------------------

In my DATASCHOOL working directory, I created a new folders to organise my work.

I have a folder for my raw data, scripts and figures.

Using the drop down in R studio I have also created files, in which I will do my work.

These files are:

-   Create a new project in R studio

-   Create a new script file in R

-   Create a new markdown file

The advantage of creating a new project in R studio is that I am prompted to create a git repository

Creating a GIT repository.
--------------------------

When I select create a new project in R studio, I go onto create a new directory and new project, here is a small checkbox 'create git repository'. Once this is selcted I can go to R studio Termial to double check that I have respository.

In the terminal $git status \#\# Next step is to go to GitHub log in, and create a new repostitory.

I selecetd public

Simply follow the instructions

'....or push on existing repository from command line'

copy the code and paste in R studio terminal - done!

This part is setting up a repsoitory on Github which allows my work to be pushed from my local computer to Github - Safe and sound!

Staging, commiting and pushing in R studio
------------------------------------------

Again R studio makes things easy for me!

Git pane has a list of my files.

Checkbox allows me to stage the files and then commit.

Adding a comment on the commit window.

At the end of the day I can push my files to Github using the push icon in the git window.

Importing data.
===============

-   Import tidyverse and ggplot2 (note tidyverse already had ggplot2)

-   Import dplyer

-   Import my data using read\_csv

``` r
library(tidyverse)
```

    ## -- Attaching packages ------------------------------------------------------- tidyverse 1.2.1 --

    ## v ggplot2 3.0.0     v purrr   0.2.5
    ## v tibble  1.4.2     v dplyr   0.7.6
    ## v tidyr   0.8.1     v stringr 1.3.1
    ## v readr   1.1.1     v forcats 0.3.0

    ## -- Conflicts ---------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(dplyr)

maturity_data <- read_csv("Raw_data/Taylors_maturity_2015_2016.csv")
```

    ## Warning: Missing column names filled in: 'X19' [19], 'X20' [20],
    ## 'X21' [21], 'X22' [22], 'X23' [23], 'X24' [24], 'X25' [25], 'X26' [26],
    ## 'X27' [27], 'X28' [28], 'X29' [29], 'X30' [30], 'X31' [31]

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_character(),
    ##   Year = col_integer(),
    ##   `sampling event` = col_integer(),
    ##   GFV = col_integer(),
    ##   Sample = col_integer(),
    ##   `GPS sampling  pt ID` = col_integer(),
    ##   POINT_X = col_double(),
    ##   POINT_Y = col_double(),
    ##   pH = col_double(),
    ##   TA = col_double(),
    ##   brix = col_double(),
    ##   `bunch wt` = col_double(),
    ##   `Mean berry wt` = col_double(),
    ##   `berries/bunch` = col_integer(),
    ##   `Colour per berry Wt` = col_double(),
    ##   `Phenolic per berry Wt` = col_double(),
    ##   `Colour per berry` = col_double(),
    ##   `Phenolic per berry` = col_double()
    ## )

    ## See spec(...) for full column specifications.

Check out what my data looks like
=================================

I have a few options here;

\*head()

\*str()

\*View(maturity\_data)

\*glimps

``` r
#str(maturity_data)
#head(maturity_data)
#View(maturity_data)
glimpse(maturity_data)
```

    ## Observations: 450
    ## Variables: 31
    ## $ Year                    <int> 2015, 2015, 2015, 2015, 2015, 2015, 20...
    ## $ `sampling event`        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,...
    ## $ `Sampling date`         <chr> "14/01/2015", "14/01/2015", "14/01/201...
    ## $ GFV                     <int> 2414, 2414, 2414, 2414, 2414, 2414, 24...
    ## $ Sample                  <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,...
    ## $ `GPS sampling  pt ID`   <int> 101, 102, 103, 104, 105, 106, 107, 108...
    ## $ POINT_X                 <dbl> 286331.7, 286382.4, 286425.7, 286473.1...
    ## $ POINT_Y                 <dbl> 6236797, 6236810, 6236821, 6236833, 62...
    ## $ pH                      <dbl> 2.724, 2.685, 2.789, 2.801, 2.695, 2.7...
    ## $ TA                      <dbl> 16.579, 16.699, 15.729, 15.304, 22.389...
    ## $ brix                    <dbl> 12.1, 12.1, 12.4, 12.4, 10.7, 11.9, 12...
    ## $ `bunch wt`              <dbl> 121.55, 158.68, 148.42, 143.55, 100.64...
    ## $ `Mean berry wt`         <dbl> 1.153, 1.139, 1.268, 1.392, 1.023, 0.9...
    ## $ `berries/bunch`         <int> 105, 139, 117, 103, 98, 99, 107, 106, ...
    ## $ `Colour per berry Wt`   <dbl> 0.187, 0.204, 0.249, 0.218, 0.109, 0.1...
    ## $ `Phenolic per berry Wt` <dbl> 1.156, 1.221, 1.142, 1.111, 1.126, 1.1...
    ## $ `Colour per berry`      <dbl> 0.214, 0.243, 0.332, 0.293, 0.116, 0.1...
    ## $ `Phenolic per berry`    <dbl> 1.324, 1.456, 1.523, 1.495, 1.194, 1.1...
    ## $ X19                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X20                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X21                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X22                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X23                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X24                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X25                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X26                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X27                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X28                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X29                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X30                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ X31                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA...

Make my data tidy.
==================

I have a number of problem with my data that needs to be fixed:

1.  I have coloumn that need to be removed that have NA

2.  I have coloumn headings with white spaces

3.  I don't have a unquie ID coloumn

4.  My date coloumn is not represented at a date rather a string. I should consider splitting this coloumn out to day, month, year

Consider creating a new data coloumn that has year as factor.

1.Select data I want to use / remove the data I don't want.
-----------------------------------------------------------

``` r
mat_tidy1 <- select(maturity_data,c(1:18))
glimpse(mat_tidy1)
```

    ## Observations: 450
    ## Variables: 18
    ## $ Year                    <int> 2015, 2015, 2015, 2015, 2015, 2015, 20...
    ## $ `sampling event`        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,...
    ## $ `Sampling date`         <chr> "14/01/2015", "14/01/2015", "14/01/201...
    ## $ GFV                     <int> 2414, 2414, 2414, 2414, 2414, 2414, 24...
    ## $ Sample                  <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,...
    ## $ `GPS sampling  pt ID`   <int> 101, 102, 103, 104, 105, 106, 107, 108...
    ## $ POINT_X                 <dbl> 286331.7, 286382.4, 286425.7, 286473.1...
    ## $ POINT_Y                 <dbl> 6236797, 6236810, 6236821, 6236833, 62...
    ## $ pH                      <dbl> 2.724, 2.685, 2.789, 2.801, 2.695, 2.7...
    ## $ TA                      <dbl> 16.579, 16.699, 15.729, 15.304, 22.389...
    ## $ brix                    <dbl> 12.1, 12.1, 12.4, 12.4, 10.7, 11.9, 12...
    ## $ `bunch wt`              <dbl> 121.55, 158.68, 148.42, 143.55, 100.64...
    ## $ `Mean berry wt`         <dbl> 1.153, 1.139, 1.268, 1.392, 1.023, 0.9...
    ## $ `berries/bunch`         <int> 105, 139, 117, 103, 98, 99, 107, 106, ...
    ## $ `Colour per berry Wt`   <dbl> 0.187, 0.204, 0.249, 0.218, 0.109, 0.1...
    ## $ `Phenolic per berry Wt` <dbl> 1.156, 1.221, 1.142, 1.111, 1.126, 1.1...
    ## $ `Colour per berry`      <dbl> 0.214, 0.243, 0.332, 0.293, 0.116, 0.1...
    ## $ `Phenolic per berry`    <dbl> 1.324, 1.456, 1.523, 1.495, 1.194, 1.1...

Note I played around with a number of other option. I was not convinced it worked It looked like this worked when you run head but when you run str you get the orginal list.

``` r
#test1_1 <- select(maturity, -starts_with("X"))
#head(test1_1)
```

2.Remove the white spaces in heading names.
===========================================

This can be done one at a time using this function.

names(maturity\_data\_clean)\[names(maturity\_data\_clean) == 'sampling event'\] &lt;- 'sampling\_event'

But much better way is to use this function.

``` r
names(mat_tidy1) <-str_replace_all(names(mat_tidy1), c(" " = "_", "/" = "_" ))
glimpse(mat_tidy1)
```

    ## Observations: 450
    ## Variables: 18
    ## $ Year                  <int> 2015, 2015, 2015, 2015, 2015, 2015, 2015...
    ## $ sampling_event        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
    ## $ Sampling_date         <chr> "14/01/2015", "14/01/2015", "14/01/2015"...
    ## $ GFV                   <int> 2414, 2414, 2414, 2414, 2414, 2414, 2414...
    ## $ Sample                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1...
    ## $ GPS_sampling__pt_ID   <int> 101, 102, 103, 104, 105, 106, 107, 108, ...
    ## $ POINT_X               <dbl> 286331.7, 286382.4, 286425.7, 286473.1, ...
    ## $ POINT_Y               <dbl> 6236797, 6236810, 6236821, 6236833, 6236...
    ## $ pH                    <dbl> 2.724, 2.685, 2.789, 2.801, 2.695, 2.744...
    ## $ TA                    <dbl> 16.579, 16.699, 15.729, 15.304, 22.389, ...
    ## $ brix                  <dbl> 12.1, 12.1, 12.4, 12.4, 10.7, 11.9, 12.0...
    ## $ bunch_wt              <dbl> 121.55, 158.68, 148.42, 143.55, 100.64, ...
    ## $ Mean_berry_wt         <dbl> 1.153, 1.139, 1.268, 1.392, 1.023, 0.976...
    ## $ berries_bunch         <int> 105, 139, 117, 103, 98, 99, 107, 106, 13...
    ## $ Colour_per_berry_Wt   <dbl> 0.187, 0.204, 0.249, 0.218, 0.109, 0.134...
    ## $ Phenolic_per_berry_Wt <dbl> 1.156, 1.221, 1.142, 1.111, 1.126, 1.153...
    ## $ Colour_per_berry      <dbl> 0.214, 0.243, 0.332, 0.293, 0.116, 0.131...
    ## $ Phenolic_per_berry    <dbl> 1.324, 1.456, 1.523, 1.495, 1.194, 1.131...

**Help I would like to make a new df with the new headings but I cant get this to work for me**

3.Create a unquie ID.
=====================

**3a create a new data coloum for year as float**

``` r
mat_tidy1 <- mat_tidy1 %>%
  mutate(Year_a = Year)

mat_tidy1$Year_a <- as.factor(mat_tidy1$Year_a)
glimpse(mat_tidy1)
```

    ## Observations: 450
    ## Variables: 19
    ## $ Year                  <int> 2015, 2015, 2015, 2015, 2015, 2015, 2015...
    ## $ sampling_event        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
    ## $ Sampling_date         <chr> "14/01/2015", "14/01/2015", "14/01/2015"...
    ## $ GFV                   <int> 2414, 2414, 2414, 2414, 2414, 2414, 2414...
    ## $ Sample                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1...
    ## $ GPS_sampling__pt_ID   <int> 101, 102, 103, 104, 105, 106, 107, 108, ...
    ## $ POINT_X               <dbl> 286331.7, 286382.4, 286425.7, 286473.1, ...
    ## $ POINT_Y               <dbl> 6236797, 6236810, 6236821, 6236833, 6236...
    ## $ pH                    <dbl> 2.724, 2.685, 2.789, 2.801, 2.695, 2.744...
    ## $ TA                    <dbl> 16.579, 16.699, 15.729, 15.304, 22.389, ...
    ## $ brix                  <dbl> 12.1, 12.1, 12.4, 12.4, 10.7, 11.9, 12.0...
    ## $ bunch_wt              <dbl> 121.55, 158.68, 148.42, 143.55, 100.64, ...
    ## $ Mean_berry_wt         <dbl> 1.153, 1.139, 1.268, 1.392, 1.023, 0.976...
    ## $ berries_bunch         <int> 105, 139, 117, 103, 98, 99, 107, 106, 13...
    ## $ Colour_per_berry_Wt   <dbl> 0.187, 0.204, 0.249, 0.218, 0.109, 0.134...
    ## $ Phenolic_per_berry_Wt <dbl> 1.156, 1.221, 1.142, 1.111, 1.126, 1.153...
    ## $ Colour_per_berry      <dbl> 0.214, 0.243, 0.332, 0.293, 0.116, 0.131...
    ## $ Phenolic_per_berry    <dbl> 1.324, 1.456, 1.523, 1.495, 1.194, 1.131...
    ## $ Year_a                <fct> 2015, 2015, 2015, 2015, 2015, 2015, 2015...

\*\*3b create a new data coloum that combines Year and GPS\_sampling\_\_pt\_ID\*\*

``` r
mat_tidy3 <- mat_tidy1 %>%
  unite(ID, Year, GPS_sampling__pt_ID)

glimpse(mat_tidy3)
```

    ## Observations: 450
    ## Variables: 18
    ## $ ID                    <chr> "2015_101", "2015_102", "2015_103", "201...
    ## $ sampling_event        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
    ## $ Sampling_date         <chr> "14/01/2015", "14/01/2015", "14/01/2015"...
    ## $ GFV                   <int> 2414, 2414, 2414, 2414, 2414, 2414, 2414...
    ## $ Sample                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1...
    ## $ POINT_X               <dbl> 286331.7, 286382.4, 286425.7, 286473.1, ...
    ## $ POINT_Y               <dbl> 6236797, 6236810, 6236821, 6236833, 6236...
    ## $ pH                    <dbl> 2.724, 2.685, 2.789, 2.801, 2.695, 2.744...
    ## $ TA                    <dbl> 16.579, 16.699, 15.729, 15.304, 22.389, ...
    ## $ brix                  <dbl> 12.1, 12.1, 12.4, 12.4, 10.7, 11.9, 12.0...
    ## $ bunch_wt              <dbl> 121.55, 158.68, 148.42, 143.55, 100.64, ...
    ## $ Mean_berry_wt         <dbl> 1.153, 1.139, 1.268, 1.392, 1.023, 0.976...
    ## $ berries_bunch         <int> 105, 139, 117, 103, 98, 99, 107, 106, 13...
    ## $ Colour_per_berry_Wt   <dbl> 0.187, 0.204, 0.249, 0.218, 0.109, 0.134...
    ## $ Phenolic_per_berry_Wt <dbl> 1.156, 1.221, 1.142, 1.111, 1.126, 1.153...
    ## $ Colour_per_berry      <dbl> 0.214, 0.243, 0.332, 0.293, 0.116, 0.131...
    ## $ Phenolic_per_berry    <dbl> 1.324, 1.456, 1.523, 1.495, 1.194, 1.131...
    ## $ Year_a                <fct> 2015, 2015, 2015, 2015, 2015, 2015, 2015...

4. My date coloumn is not represented at a date rather a string.
================================================================

I should consider splitting this coloumn out to day, month, year.

``` r
mat_tidy4 <- mat_tidy3 %>%
  separate(Sampling_date, c("Day", "Month", "Year"), sep = '/')
mat_tidy4
```

    ## # A tibble: 450 x 20
    ##    ID    sampling_event Day   Month Year    GFV Sample POINT_X POINT_Y
    ##    <chr>          <int> <chr> <chr> <chr> <int>  <int>   <dbl>   <dbl>
    ##  1 2015~              1 14    01    2015   2414      1 286332.  6.24e6
    ##  2 2015~              1 14    01    2015   2414      2 286382.  6.24e6
    ##  3 2015~              1 14    01    2015   2414      3 286426.  6.24e6
    ##  4 2015~              1 14    01    2015   2414      4 286473.  6.24e6
    ##  5 2015~              1 14    01    2015   2414      5 286583.  6.24e6
    ##  6 2015~              1 14    01    2015   2414      6 286631.  6.24e6
    ##  7 2015~              1 14    01    2015   2414      7 286667.  6.24e6
    ##  8 2015~              1 14    01    2015   2414      8 286729.  6.24e6
    ##  9 2015~              1 14    01    2015   2414      9 286759.  6.24e6
    ## 10 2015~              1 14    01    2015   2414     10 286779.  6.24e6
    ## # ... with 440 more rows, and 11 more variables: pH <dbl>, TA <dbl>,
    ## #   brix <dbl>, bunch_wt <dbl>, Mean_berry_wt <dbl>, berries_bunch <int>,
    ## #   Colour_per_berry_Wt <dbl>, Phenolic_per_berry_Wt <dbl>,
    ## #   Colour_per_berry <dbl>, Phenolic_per_berry <dbl>, Year_a <fct>

``` r
head(mat_tidy4)
```

    ## # A tibble: 6 x 20
    ##   ID    sampling_event Day   Month Year    GFV Sample POINT_X POINT_Y    pH
    ##   <chr>          <int> <chr> <chr> <chr> <int>  <int>   <dbl>   <dbl> <dbl>
    ## 1 2015~              1 14    01    2015   2414      1 286332.  6.24e6  2.72
    ## 2 2015~              1 14    01    2015   2414      2 286382.  6.24e6  2.68
    ## 3 2015~              1 14    01    2015   2414      3 286426.  6.24e6  2.79
    ## 4 2015~              1 14    01    2015   2414      4 286473.  6.24e6  2.80
    ## 5 2015~              1 14    01    2015   2414      5 286583.  6.24e6  2.70
    ## 6 2015~              1 14    01    2015   2414      6 286631.  6.24e6  2.74
    ## # ... with 10 more variables: TA <dbl>, brix <dbl>, bunch_wt <dbl>,
    ## #   Mean_berry_wt <dbl>, berries_bunch <int>, Colour_per_berry_Wt <dbl>,
    ## #   Phenolic_per_berry_Wt <dbl>, Colour_per_berry <dbl>,
    ## #   Phenolic_per_berry <dbl>, Year_a <fct>

These columns are char I want them to be intergers

``` r
mat_tidy4$Day <- as.integer(mat_tidy4$Day)
mat_tidy4$Month <- as.integer(mat_tidy4$Month)
mat_tidy4$Year <- as.integer(mat_tidy4$Year)
glimpse(mat_tidy4)
```

    ## Observations: 450
    ## Variables: 20
    ## $ ID                    <chr> "2015_101", "2015_102", "2015_103", "201...
    ## $ sampling_event        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
    ## $ Day                   <int> 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, ...
    ## $ Month                 <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
    ## $ Year                  <int> 2015, 2015, 2015, 2015, 2015, 2015, 2015...
    ## $ GFV                   <int> 2414, 2414, 2414, 2414, 2414, 2414, 2414...
    ## $ Sample                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1...
    ## $ POINT_X               <dbl> 286331.7, 286382.4, 286425.7, 286473.1, ...
    ## $ POINT_Y               <dbl> 6236797, 6236810, 6236821, 6236833, 6236...
    ## $ pH                    <dbl> 2.724, 2.685, 2.789, 2.801, 2.695, 2.744...
    ## $ TA                    <dbl> 16.579, 16.699, 15.729, 15.304, 22.389, ...
    ## $ brix                  <dbl> 12.1, 12.1, 12.4, 12.4, 10.7, 11.9, 12.0...
    ## $ bunch_wt              <dbl> 121.55, 158.68, 148.42, 143.55, 100.64, ...
    ## $ Mean_berry_wt         <dbl> 1.153, 1.139, 1.268, 1.392, 1.023, 0.976...
    ## $ berries_bunch         <int> 105, 139, 117, 103, 98, 99, 107, 106, 13...
    ## $ Colour_per_berry_Wt   <dbl> 0.187, 0.204, 0.249, 0.218, 0.109, 0.134...
    ## $ Phenolic_per_berry_Wt <dbl> 1.156, 1.221, 1.142, 1.111, 1.126, 1.153...
    ## $ Colour_per_berry      <dbl> 0.214, 0.243, 0.332, 0.293, 0.116, 0.131...
    ## $ Phenolic_per_berry    <dbl> 1.324, 1.456, 1.523, 1.495, 1.194, 1.131...
    ## $ Year_a                <fct> 2015, 2015, 2015, 2015, 2015, 2015, 2015...

Plotting data
-------------

Make an empty plot

``` r
ggplot(data=mat_tidy4, aes(x = sampling_event, y = brix))
```

![](write_up_v2_files/figure-markdown_github/make%20an%20empty%20plot%20before%20adding%20data-1.png) Now fill my plot

``` r
ggplot(data=mat_tidy4, aes(x = sampling_event, y = brix, colour = Year_a))+
  geom_point(alpha = 0.3)
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/fill%20plot%20with%20sampling%20event%20vs%20brix-1.png) Each year had a number of sampling events which occured through the season. In 2015 we sampled 30 vines on 7 seperate events In 2016 we sampled 30 vines on 8 seperate events Plotting by event makes the data points sit onto of each other. Plotting by date (on the x axis) will mean that there is a big gap between years. I have calulated the growing degree days for each year, based on weather data, this could be a way of displaying the x axis.

``` r
ggplot(data=mat_tidy4, aes(x = GFV, y = brix, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Brix",title = ("maturity of grapes"),colour = "Year") +
    theme(axis.text.x=element_text(), axis.ticks.x = element_blank())
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/fill%20plot%20with%20GFV%20vs%20brix-1.png)

Formatting...

``` r
ggplot(data=mat_tidy4, aes(x = GFV, y = brix, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Brix",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/same%20as%20above%20with%20formatting-1.png) Try all the grape properties...

``` r
#X = GFV and Y = pH
ggplot(data=mat_tidy4, aes(x = GFV, y = pH, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "pH",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/plot%20all%20the%20grape%20properties-1.png)

``` r
#X = GFV and Y = TA
ggplot(data=mat_tidy4, aes(x = GFV, y = TA, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "TA",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/plot%20all%20the%20grape%20properties-2.png)

``` r
#X = GFV and Y = bunch_wt
ggplot(data=mat_tidy4, aes(x = GFV, y = bunch_wt, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Bunch weight",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
```

![](write_up_v2_files/figure-markdown_github/plot%20all%20the%20grape%20properties-3.png)

``` r
#X = GFV and Y = Mean_berry_wt
ggplot(data=mat_tidy4, aes(x = GFV, y = Mean_berry_wt, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Mean berry weight",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
```

![](write_up_v2_files/figure-markdown_github/plot%20all%20the%20grape%20properties-4.png)

``` r
#X = GFV and Y = Colour_per_berry_Wt
ggplot(data=mat_tidy4, aes(x = GFV, y = Colour_per_berry_Wt, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Colour per berry weight",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
```

![](write_up_v2_files/figure-markdown_github/plot%20all%20the%20grape%20properties-5.png)

``` r
#X = GFV and Y = Phenolic_per_berry_Wt
ggplot(data=mat_tidy4, aes(x = GFV, y = Phenolic_per_berry_Wt, colour = Year_a))+
  geom_point(alpha = 0.3) +
  labs(x = "Degree days",y = "Phenolic per berry weight",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
```

![](write_up_v2_files/figure-markdown_github/plot%20all%20the%20grape%20properties-6.png)

Grape properties change through the season.
===========================================

For grape properties such as brix, pH, TA and colour variation over the season seems to be stronger than variation of the 30 vines sampled.

For the other properties the plots show a huge variation per sampling location, which seems to dominate how the property changes over time.

Can I check this with the grape property Brix?

Plot brix for each sample point.
--------------------------------

``` r
ggplot(data=mat_tidy4, aes(x = Sample, y = brix, colour = Year_a))+
  geom_point(alpha = 0.5) + facet_wrap(~ sampling_event)+
labs(x = "sample location",y = "Brix",title = ("maturity of grapes"),colour = "Year") +
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(), 
        axis.ticks.x = element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/plot%20by%20sample%20location-1.png) This is saying the early in the season differences between location and year is not as obvious as late in the year. This is quite a broad generalisation.

Need to overlay with something else? Should look at how these sample location were picked. Something to add to my data set!

Perhaps I can see more if I look at what is happening per year?

``` r
mat_tidy4 %>%
    filter(Year_a == "2015") %>%
  ggplot(aes(x = POINT_X, y = POINT_Y, colour = brix)) +
  geom_point(size = 2.5) +
  facet_wrap(~ GFV) + 
  labs(                                      
    x = "Easting",
    y = "Northing",
    title = "2015",
    colour = "Brix") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
```

![](write_up_v2_files/figure-markdown_github/unnamed-chunk-1-1.png)

2016

``` r
mat_tidy4 %>%
  filter(Year_a == "2016") %>%
  ggplot(aes(x = POINT_X, y = POINT_Y, colour = brix)) +
  geom_point(size = 2.5) +
  facet_wrap(~ GFV) + 
  labs(                                      
    x = "Easting",
    y = "Northing",
    title = "2016",
    colour = "Brix") +
  theme(panel.grid = element_blank(), #remove panel lines
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = "white",
                                        colour = "black"))
```

![](write_up_v2_files/figure-markdown_github/unnamed-chunk-2-1.png)

What I really want to see is each pane with its own scale, its hard to remove the effect of time on these graphs.

Harvest sampling is pretty important.

``` r
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
```

![](write_up_v2_files/figure-markdown_github/brix%20at%20harvest%20by%20location%202015-1.png)

``` r
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
```

![](write_up_v2_files/figure-markdown_github/brix%20at%20harvest%20by%20location%202016-1.png)

What about some other grape property that is more variable through time?

``` r
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
```

![](write_up_v2_files/figure-markdown_github/Bunch%20weight%20for%202015-1.png) \`\`\`

``` r
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
```

![](write_up_v2_files/figure-markdown_github/Bunch%20weight%20for%202016-1.png)

I think I can see Jesus!
========================

Plotting grape variable agaist each other.
------------------------------------------

``` r
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
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/Brix%20vs%20all%20most-1.png)

``` r
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
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/Brix%20vs%20all%20most-2.png)

``` r
glimpse(mat_tidy4)
```

    ## Observations: 450
    ## Variables: 20
    ## $ ID                    <chr> "2015_101", "2015_102", "2015_103", "201...
    ## $ sampling_event        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
    ## $ Day                   <int> 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, ...
    ## $ Month                 <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
    ## $ Year                  <int> 2015, 2015, 2015, 2015, 2015, 2015, 2015...
    ## $ GFV                   <int> 2414, 2414, 2414, 2414, 2414, 2414, 2414...
    ## $ Sample                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1...
    ## $ POINT_X               <dbl> 286331.7, 286382.4, 286425.7, 286473.1, ...
    ## $ POINT_Y               <dbl> 6236797, 6236810, 6236821, 6236833, 6236...
    ## $ pH                    <dbl> 2.724, 2.685, 2.789, 2.801, 2.695, 2.744...
    ## $ TA                    <dbl> 16.579, 16.699, 15.729, 15.304, 22.389, ...
    ## $ brix                  <dbl> 12.1, 12.1, 12.4, 12.4, 10.7, 11.9, 12.0...
    ## $ bunch_wt              <dbl> 121.55, 158.68, 148.42, 143.55, 100.64, ...
    ## $ Mean_berry_wt         <dbl> 1.153, 1.139, 1.268, 1.392, 1.023, 0.976...
    ## $ berries_bunch         <int> 105, 139, 117, 103, 98, 99, 107, 106, 13...
    ## $ Colour_per_berry_Wt   <dbl> 0.187, 0.204, 0.249, 0.218, 0.109, 0.134...
    ## $ Phenolic_per_berry_Wt <dbl> 1.156, 1.221, 1.142, 1.111, 1.126, 1.153...
    ## $ Colour_per_berry      <dbl> 0.214, 0.243, 0.332, 0.293, 0.116, 0.131...
    ## $ Phenolic_per_berry    <dbl> 1.324, 1.456, 1.523, 1.495, 1.194, 1.131...
    ## $ Year_a                <fct> 2015, 2015, 2015, 2015, 2015, 2015, 2015...

``` r
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
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/Brix%20vs%20all%20most-3.png)

``` r
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
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/Brix%20vs%20all%20most-4.png)

``` r
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
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/Brix%20vs%20all%20most-5.png)

``` r
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
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/Brix%20vs%20all%20most-6.png)

Do pH and TA have relationship?

``` r
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
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
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
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](write_up_v2_files/figure-markdown_github/unnamed-chunk-3-2.png)

``` r
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
```

![](write_up_v2_files/figure-markdown_github/unnamed-chunk-3-3.png)
