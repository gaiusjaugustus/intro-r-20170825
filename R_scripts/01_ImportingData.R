## Script created as part of Software carpentry workshop on basic R code
## August 26-27, 2017 at the University of Arizona

#<< Install and load packages >> -------------------------------------------------------
# You will need to install packages the first time you use them. After they are installed
# you only need to use the library command to load them as the packages are saved locally
# Comment out install.packages after you have installed readr

#<< Read in data >> --------------------------------------------------------------------

#--Read in data using function read_delim as part of readr library
library(readr)
gapminder <- read_delim(file = "datasets/gapminder.txt", 
                        delim = "\t", escape_double = FALSE, trim_ws = TRUE)
View(gapminder)

#--Read in data using function read.csv available with base R
# Default for this function is for comma separated files, but we are modifying it to 
# read a tab separate text file
gapminder2 <- read.csv(file = "datasets/gapminder.txt", header=TRUE, sep = "\t",
                       stringsAsFactors = FALSE)

# Are the two files the same? Let's check.
gapminder == gapminder2
#      country continent year lifeExp  pop gdpPercap
# [1,]    TRUE      TRUE TRUE    TRUE TRUE      TRUE
# [2,]    TRUE      TRUE TRUE    TRUE TRUE      TRUE
# [3,]    TRUE      TRUE TRUE    TRUE TRUE      TRUE
# [4,]    TRUE      TRUE TRUE    TRUE TRUE      TRUE
# [5,]    TRUE      TRUE TRUE    TRUE TRUE      TRUE
# [6,]    TRUE      TRUE TRUE    TRUE TRUE      TRUE
# [7,]    TRUE      TRUE TRUE    TRUE TRUE      TRUE
# [8,]    TRUE      TRUE TRUE    TRUE TRUE      TRUE
# [ reached getOption("max.print") -- omitted #### rows ]

#<< Ways to look at data >> -------------------------------------------------------------

# str() tells you the structure of an object (i.e., it's size, the classes of the data)
str(gapminder)
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1704 obs. of  6 variables:
#  $ country  : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
#  $ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
#  $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...

# summary() will provide basic summary statistics for each column within your data
summary(gapminder)
#   country           continent              year         lifeExp           pop           
# Length:1704        Length:1704        Min.   :1952   Min.   :23.60   Min.   :6.001e+04
# Class :character   Class :character   1st Qu.:1966   1st Qu.:48.20   1st Qu.:2.794e+06 
# Mode  :character   Mode  :character   Median :1980   Median :60.71   Median :7.024e+06 
#                                       Mean   :1980   Mean   :59.47   Mean   :2.960e+07 
#                                       3rd Qu.:1993   3rd Qu.:70.85   3rd Qu.:1.959e+07 
#                                       Max.   :2007   Max.   :82.60   Max.   :1.319e+09 

# There are also built in functions which allow you to explore your data. Here we use
# a $ sign to access a single column of our data rather than the whole data frame
min(gapminder$lifeExp)
# [1] 23.599

median(gapminder$lifeExp)
# [1] 60.7125

max(gapminder$lifeExp)
# [1] 82.603

# min(), median(), and max() are functions and are used to perform a particular task on a
# set of data

# There are also more sophisticated functions like plotting.
plot(gapminder$lifeExp, gapminder$gdpPercap)

#----------------------------------------------------------------------------------------
# Dataframes-----
#----------------------------------------------------------------------------------------

# You can use $ to access existing columns of data (as above) or create new data columns
gapminder$lifeExpMonths <- gapminder$lifeExp*12

# Now lets see how our data looks
str(gapminder)
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1704 obs. of  7 variables:
#  $ country      : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
#  $ continent    : chr  "Asia" "Asia" "Asia" "Asia" ...
#  $ year         : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
#  $ lifeExp      : num  28.8 30.3 32 34 36.1 ...
#  $ pop          : int  8425333 9240934 10267083 11537966 13079460 14880372 12881816 13867957 16317921 22227415 ...
#  $ gdpPercap    : num  779 821 853 836 740 ...
#  $ lifeExpMonths: num  346 364 384 408 433 ...

summary(gapminder$lifeExpMonths)
#  Min.   1st Qu.  Median    Mean    3rd Qu.    Max. 
#  283.2  578.4    728.5     713.7   850.1      991.2 

# You can assign values to existing columns, but this will over write these columns 
# without a warning. Let's make a new column with 0 as the entry

gapminder$newcolumn <- 0
gapminder['newcolumn']

# A tibble: 1,704 x 1
# newcolumn
# <dbl>
#      1         0
# 2         0
# 3         0
# 4         0
# 5         0
# 6         0
# 7         0
# 8         0
# 9         0
# 10         0
# # ... with 1,694 more rows

# Now let's delete that column and the life expectancy in months column created above
gapminder$newcolumn <- NULL
gapminder$lifeExpMonths <- NULL

# Let's look at some other functions that are useful for summarizing data frames and
# their columns

names(gapminder)
# [1] "country"       "continent"     "year"          "lifeExp"       "pop"           "gdpPercap"    
# [7] "lifeExpMonths"

dim(gapminder) # dim is short for dimension
# [1] 1704 7

length(gapminder$lifeExp) # how many rows in our dataset?
# [1] 1704

min(gapminder$lifeExp)
# [1] 23.599

max(gapminder$lifeExp)
# [1] 82.603

range(gapminder$lifeExp)
# [1] 23.599 82.603

mean(gapminder$lifeExp)
# [1] 59.47444

sd(gapminder$lifeExp) # sd is short for standard deviation
# [1] 12.91711

median(gapminder$lifeExp)
# [1] 60.7125

median(gapminder$li) # uses pattern-matching (but hard to debug later)
# [1] 60.7125

#----------------------------------------------------------------------------------------
# Using the script window-----
#----------------------------------------------------------------------------------------

# While fine for occasional use, entering every command ‘by hand’ is error-prone, and
#quickly gets tedious. A much better approach is to use a Script window – open one with
#Ctrl-Shift-N, or the drop-down menus;

# R scripts end with the extension .R
# You can run the current line (or selected lines) with Ctrl-Enter, or Ctrl-R
# **An important notice: From now on, we assume you are using a script editor.

# If you run a line of code and you are missing a bracket you can hit the ESC key to 
# stop that line

#----------------------------------------------------------------------------------------
# Subsetting-----
#----------------------------------------------------------------------------------------
#<< Base R >>--------------------------------------------------------------------------
#Suppose we were interested in the life expectancy (i.e. 4th column) for 1957 for
#Afganistan in the years 1952, 1962, and 1977 (i.e. rows 1, 3, and 5). How to select
#these multiple elements?

gapminder[c(1, 3, 5), 4]
# A tibble: 3 × 1
#   lifeExp
#     <dbl>
# 1  28.801
# 2  31.997
# 3  36.088 # check these against data view

# c(1, 3, 5) is a vector which is a sequence of data elements of the same basic type, so
# this is a vector of numbers. It is created using the combine function, c()

length(c(1, 3, 5))
# [1] 3

str(c(1, 3, 5))
# num [1:3] 1 3 5

# We can select these rows and all columns using the following code
gapminder[c(1, 3, 5),]
# A tibble: 3 × 6
#       country continent  year lifeExp      pop gdpPercap
#         <chr>     <chr> <int>   <dbl>    <int>     <dbl>
# 1 Afghanistan      Asia  1952  28.801  8425333  779.4453
# 2 Afghanistan      Asia  1962  31.997 10267083  853.1007
# 3 Afghanistan      Asia  1972  36.088 13079460  739.9811

# a very useful special form of vector is created using a colon; this is similar to
# using a '-', as in 1-10 which means 1 through 10.
1:10
# [1] 1 2 3 4 5 6 7 8 9 10

6:2
# [1] 6 5 4 3 2

-1:-3
# [1] -1 -2 -3

# Lets use this tupe of vector to select data in a data frame
gapminder[20:22, 3:4]
# A tibble: 3 x 2
#    year lifeExp
#   <int>   <dbl>
# 1  1987  72.000
# 2  1992  71.581
# 3  1997  72.950

# Negative values correpond to dropping those rows/columns
# Let's drop everything but the first two rows
gapminder[-3:-1704,] 
# A tibble: 2 x 7
#       country continent  year lifeExp     pop gdpPercap lifeExpMonths
#         <chr>     <chr> <int>   <dbl>   <int>     <dbl>         <dbl>
# 1 Afghanistan      Asia  1952  28.801 8425333  779.4453       345.612
# 2 Afghanistan      Asia  1957  30.332 9240934  820.8530       363.984

# R can also store logicals (i.e. TRUE and FALSE) in addition to numbers and strings
# Let's try making a new vector with elements that are TRUE if life expectancy is
# greater than 71.5 and FALSE otherwise.

is.above.avg <- gapminder$lifeExp > 71.5

# Let's see how many of the total were TRUE and how many were FALSE
# table() will create a count table from a vector of categorical data
table(is.above.avg)
# is.above.avg
# FALSE  TRUE 
#  1329   375 

# Which countries and during what years were these? (And what was the avg. life 
# expectancy?)

gapminder[is.above.avg,] # just the rows for which is.above.avg is TRUE
# A tibble: 375 x 7
#      country continent  year lifeExp      pop gdpPercap lifeExpMonths
#        <chr>     <chr> <int>   <dbl>    <int>     <dbl>         <dbl>
#  1   Albania    Europe  1987  72.000  3075321  3738.933       864.000
#  2   Albania    Europe  1992  71.581  3326498  2497.438       858.972
#  3   Albania    Europe  1997  72.950  3428038  3193.055       875.400
#  4   Albania    Europe  2002  75.651  3508512  4604.212       907.812
#  5   Albania    Europe  2007  76.423  3600523  5937.030       917.076
#  6   Algeria    Africa  2007  72.301 33333216  6223.367       867.612
#  7 Argentina  Americas  1992  71.868 33958947  9308.419       862.416
#  8 Argentina  Americas  1997  73.275 36203463 10967.282       879.300
#  9 Argentina  Americas  2002  74.340 38331121  8797.641       892.080
# 10 Argentina  Americas  2007  75.320 40301927 12779.380       903.840

# combining TRUE/FALSE (rows) and numbers (columns)
gapminder[is.above.avg,4]
# A tibble: 375 x 1
#    lifeExp
#      <dbl>
#  1  72.000
#  2  71.581
#  3  72.950
#  4  75.651
#  5  76.423
#  6  72.301
#  7  71.868
#  8  73.275
#  9  74.340
# 10  75.320

# Instead of specifying rows/columns of interest by number, or through vectors of 
# TRUEs/FALSEs, we can also just give the names – as character strings, or vectors of
# character strings.

gapminder[,'lifeExp']
# A tibble: 1,704 x 1
#    lifeExp
#      <dbl>
#  1  28.801
#  2  30.332
#  3  31.997
#  4  34.020
#  5  36.088
#  6  38.438
#  7  39.854
#  8  40.822
#  9  41.674
# 10  41.763
# # ... with 1,694 more rows

gapminder[gapminder$country == 'Gabon',c("lifeExp","gdpPercap")]
# A tibble: 12 x 2
#    lifeExp gdpPercap
#      <dbl>     <dbl>
#  1  37.003  4293.476
#  2  38.999  4976.198
#  3  40.489  6631.459
#  4  44.598  8358.762
#  5  48.690 11401.948
#  6  52.790 21745.573
#  7  56.564 15113.362
#  8  60.190 11864.408
#  9  61.366 13522.158
# 10  60.461 14722.842
# 11  56.761 12521.714
# 12  56.735 13206.485

gapminder[gapminder$country == 'Gabon',4] # okay to mix & match
# A tibble: 12 x 1
#    lifeExp
#      <dbl>
#  1  37.003
#  2  38.999
#  3  40.489
#  4  44.598
#  5  48.690
#  6  52.790
#  7  56.564
#  8  60.190
#  9  61.366
# 10  60.461
# 11  56.761
# 12  56.735

#----------------------------------------------------------------------------------------
# Dplyr-----
#----------------------------------------------------------------------------------------

# Base R gives us several ways to subset our data, which is in the online notes.
# However, we are going to introduce you to an other package in the tidyverse called
# dplyr which makes manipulating datasets a little easier for beginners.

# If you haven't already, install dplyr
install.packages("dplyr")

# Don't forget to load the package so we can use its functionality
library(dplyr)

# dplyr works by piping commands, like you learned to do in the command line.
# Instead of the pipe |, we use %>%.

gapminder %>% select(lifeExp) %>% min()
# [1] 23.599

min(gapminder$lifeExp)
# [1] 23.599

# An important difference between dplyr and base R is when use character strings we
# don't need to enclose them in quotation marks as we did above
# (i.e. gapminder[,'lifeExp'] in base R)

# dplyr also comes with ways to subset our data.
# Let's use it to select a single column.
     
gapminder %>% select(lifeExp)
# A tibble: 1,704 x 1
#    lifeExp
#      <dbl>
#  1  28.801
#  2  30.332
#  3  31.997
#  4  34.020
#  5  36.088
#  6  38.438
#  7  39.854
#  8  40.822
#  9  41.674
# 10  41.763
# # ... with 1,694 more rows

# If we want to make a new column, use mutate. We will need to assign the output to
# a new column if we want to keep the changes

gapminder <- gapminder %>% mutate(NewColumn = lifeExp * 12)
gapminder

# A tibble: 1,704 x 8
#        country continent  year lifeExp      pop gdpPercap lifeExpMonths NewColumn
#          <chr>     <chr> <int>   <dbl>    <int>     <dbl>         <dbl>     <dbl>
#  1 Afghanistan      Asia  1952  28.801  8425333  779.4453       345.612   345.612
#  2 Afghanistan      Asia  1957  30.332  9240934  820.8530       363.984   363.984
#  3 Afghanistan      Asia  1962  31.997 10267083  853.1007       383.964   383.964
#  4 Afghanistan      Asia  1967  34.020 11537966  836.1971       408.240   408.240
#  5 Afghanistan      Asia  1972  36.088 13079460  739.9811       433.056   433.056
#  6 Afghanistan      Asia  1977  38.438 14880372  786.1134       461.256   461.256
#  7 Afghanistan      Asia  1982  39.854 12881816  978.0114       478.248   478.248
#  8 Afghanistan      Asia  1987  40.822 13867957  852.3959       489.864   489.864
#  9 Afghanistan      Asia  1992  41.674 16317921  649.3414       500.088   500.088
# 10 Afghanistan      Asia  1997  41.763 22227415  635.3414       501.156   501.156
# ... with 1,694 more rows

# If we want to select all columns except 1, we can do that with the '-' operator.
# So we are selecting all columns except the column specified

gapminder <- gapminder %>% select(-NewColumn)
gapminder
# A tibble: 1,704 x 7
#        country continent  year lifeExp      pop gdpPercap lifeExpMonths
#          <chr>     <chr> <int>   <dbl>    <int>     <dbl>         <dbl>
#  1 Afghanistan      Asia  1952  28.801  8425333  779.4453       345.612
#  2 Afghanistan      Asia  1957  30.332  9240934  820.8530       363.984
#  3 Afghanistan      Asia  1962  31.997 10267083  853.1007       383.964
#  4 Afghanistan      Asia  1967  34.020 11537966  836.1971       408.240
#  5 Afghanistan      Asia  1972  36.088 13079460  739.9811       433.056
#  6 Afghanistan      Asia  1977  38.438 14880372  786.1134       461.256
#  7 Afghanistan      Asia  1982  39.854 12881816  978.0114       478.248
#  8 Afghanistan      Asia  1987  40.822 13867957  852.3959       489.864
#  9 Afghanistan      Asia  1992  41.674 16317921  649.3414       500.088
# 10 Afghanistan      Asia  1997  41.763 22227415  635.3414       501.156
# ... with 1,694 more rows

# Now what about rows? For this we use te filter commands:

gapminder %>% filter(lifeExp > 71.5)
# A tibble: 375 x 7
#      country continent  year lifeExp      pop gdpPercap lifeExpMonths
#        <chr>     <chr> <int>   <dbl>    <int>     <dbl>         <dbl>
#  1   Albania    Europe  1987  72.000  3075321  3738.933       864.000
#  2   Albania    Europe  1992  71.581  3326498  2497.438       858.972
#  3   Albania    Europe  1997  72.950  3428038  3193.055       875.400
#  4   Albania    Europe  2002  75.651  3508512  4604.212       907.812
#  5   Albania    Europe  2007  76.423  3600523  5937.030       917.076
#  6   Algeria    Africa  2007  72.301 33333216  6223.367       867.612
#  7 Argentina  Americas  1992  71.868 33958947  9308.419       862.416
#  8 Argentina  Americas  1997  73.275 36203463 10967.282       879.300
#  9 Argentina  Americas  2002  74.340 38331121  8797.641       892.080
# 10 Argentina  Americas  2007  75.320 40301927 12779.380       903.840
# ... with 365 more rows

# We can pipe several commands together, just like with the command line.

gapminder %>% 
     select(lifeExp, country) %>% 
     filter(lifeExp > 71.5) %>% 
     mutate(lifeExpdays = lifeExp * 365)
# A tibble: 375 x 3
#    lifeExp   country lifeExpdays
#      <dbl>     <chr>       <dbl>
#  1  72.000   Albania    26280.00
#  2  71.581   Albania    26127.07
#  3  72.950   Albania    26626.75
#  4  75.651   Albania    27612.61
#  5  76.423   Albania    27894.40
#  6  72.301   Algeria    26389.87
#  7  71.868 Argentina    26231.82
#  8  73.275 Argentina    26745.38
#  9  74.340 Argentina    27134.10
# 10  75.320 Argentina    27491.80
# ... with 365 more rows

# What is happening here is the output from the previous line is fed into the next line.
# If you want to save the output you need to assign it to a new object; we can do this
# by adding -> gapminder2 at the end of the mutate line
# (i.e. gapminder %>% 
#         select(lifeExp, country) %>% 
#         filter(lifeExp > 71.5) %>% 
#         mutate(lifeExpdays = lifeExp * 365)) -> gapminder2

# We can also use outside information to help subset data.

two.countries <- c('Kenya', 'Gibon')

gapminder %>% filter(country %in% two.countries)
# A tibble: 12 x 7
#    country continent  year lifeExp      pop gdpPercap lifeExpMonths
#      <chr>     <chr> <int>   <dbl>    <int>     <dbl>         <dbl>
#  1   Kenya    Africa  1952  42.270  6464046  853.5409       507.240
#  2   Kenya    Africa  1957  44.686  7454779  944.4383       536.232
#  3   Kenya    Africa  1962  47.949  8678557  896.9664       575.388
#  4   Kenya    Africa  1967  50.654 10191512 1056.7365       607.848
#  5   Kenya    Africa  1972  53.559 12044785 1222.3600       642.708
#  6   Kenya    Africa  1977  56.155 14500404 1267.6132       673.860
#  7   Kenya    Africa  1982  58.766 17661452 1348.2258       705.192
#  8   Kenya    Africa  1987  59.339 21198082 1361.9369       712.068
#  9   Kenya    Africa  1992  59.285 25020539 1341.9217       711.420
# 10   Kenya    Africa  1997  54.407 28263827 1360.4850       652.884
# 11   Kenya    Africa  2002  50.992 31386842 1287.5147       611.904
# 12   Kenya    Africa  2007  54.110 35610177 1463.2493       649.320

# The %in% code will search all lines in the column country for all charcter strings in
# the two.countries file and will return a TRUE if it finds an one of them.
