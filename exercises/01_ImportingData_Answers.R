## 01 Importing data exercise answers

# Multiple choice -----------------------------------------------------------------

# Which of the following will NOT return TRUE?
# A. FALSE == FALSE
# B. 10-5 == sqrt(25)
# C. TRUE > FALSE
# D. 'a' > 'b'


FALSE == FALSE
# [1] TRUE

10-5 == sqrt(25)
# [1] TRUE

TRUE > FALSE
# [1] TRUE

'a' > 'b'
# [1] FALSE

# `TRUE` is greater than `FALSE` because R in the background actually uses 1 to represent
# `TRUE` and 0 to represent `FALSE`.  Also, `'b'` is greater than `'a'` because it's later
# in the alphabet. In other words, the 2nd letter is greater than the 1st letter.  This
# is helpful for ordering alphabetically, which we'll see later.


# Multiple choice -----------------------------------------------------------------

# What is the output when we execute the following code?
x <- 3
y <- 2
y <- 17.4

x+y

# A. [1] 3  2  17.4
# B. [1] 22.4
# C. [1] 20.4 <- Answer
# D. [1] 5 

# Exercise 1 -----------------------------------------------------------------

# Import the gapminder data frame again.
# 
# Use `str()` to look at the structure of the dataframe and `summary()` to get information about the variables.
# 
# * What are its columns?
# * How many rows and columns are there?
# * What is the earliest year in the `year` column?
# * What is the average life expectancy?
# * What is the largest population?

gapminder <- read_delim("datasets/gapminder.txt", 
                        "\t", escape_double = FALSE, trim_ws = TRUE)

str(gapminder)
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1704 obs. of  6 variables:
# $ country  : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
# $ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
# $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
# $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
# $ pop      : int  8425333 9240934 10267083 11537966 13079460 14880372 12881816 13867957 16317921 22227415 ...
# $ gdpPercap: num  779 821 853 836 740 ...

dim(gapminder)

# * What are its columns? 

colnames(gapminder)
names(gapminder)
str(gapminder)
# [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"

# * How many rows and columns are there?

dim(gapminder)
# [1] 1704    6

# * What is the earliest year in the `year` column?

min(gapminder$year)
# [1] 1952

# * What is the average life expectancy?

mean(gapminder$lifeExp)
# [1] 59.47444

# * What is the largest population?

max(gapminder$pop)
# [1] 1318683096



# Exercise 2 -----------------------------------------------------------------

# Reimport the `gapminder` dataframe:
     
# Create a new dataframe that contains only country names, years, and life expectancies of
# the `gapminder` dataset. Use this new dataframe to calculate minimum & maximum
# expectancies.

gapminder <- read_delim("datasets/gapminder.txt", 
                        "\t", escape_double = FALSE, trim_ws = TRUE)

# dplyr
new.gapminder <- gapminder %>% select(country, year, lifeExp)

new.gapminder %>% select(lifeExp) %>% min()
# [1] 23.599

new.gapminder %>% select(lifeExp) %>% max()
# [1] 82.603

# base R
new.gapminder <- gapminder[c('country','year','lifeExp')]
new.gapminder <- gapminder[c(1,3,4)]

min(new.gapminder$lifeExp)
# [1] 23.599

max(new.gapminder$lifeExp)
# [1] 82.603