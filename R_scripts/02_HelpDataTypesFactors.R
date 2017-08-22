## Script created as part of Software carpentry workshop on basic R code
## August 26-27, 2017 at the University of Arizona

#----------------------------------------------------------------------------------------
# Help files-----
#----------------------------------------------------------------------------------------

# Let's look at importing some more data, this time from a dataset called gapminder.

# We can read in this dataset with the following command:

library(readr)
gapminder <- read_delim(file = "datasets/gapminder.txt", 
                        delim = "\t", escape_double = FALSE, trim_ws = TRUE)

# But how did I know which arguments to provide?
# We can access the help file for any function with:
help(read_delim)

# The help information shows up in the Help tab of your RStudio window.

# An additional method to search for help is using a '?' before the command you have a
# questions about. A double '??' will search all help pages for the characters you entered

?read_delim

??read_delim

# Note: Commonly-used arguments in commonly-used functions quickly become familiar. But
# because R can do so much, even experts refer to the help system all the time when
# coding; no-one learns every detail of every function

#----------------------------------------------------------------------------------------
# Errors-----
#----------------------------------------------------------------------------------------

# `Errors` come up when a process cannot run until the problem is fixed.

# `Warnings` come up when a process can continue running, but the output might not occur
# the way you expect.

#----------------------------------------------------------------------------------------
# Data types-----
#----------------------------------------------------------------------------------------

#<< 1. Character >> ---------------------------------------------------------------------

# Surround with quotes, can be any keyboard character
c <- 'Hello world! 123'
class(c)
# [1] "character"

typeof(c)
# [1] "character"

#<< 2. Numeric >> -----------------------------------------------------------------------

# No quotes, can be any number, decimal, or whole numbers
n <- 3.4

class(n)
# [1] "numeric"

#<< 3. Integer >> -----------------------------------------------------------------------

# No quotes, can be any whole number. Place an L behind it, otherwise R will read it as a
# numeric
i <- 2L

class(i)
# [1] "integer"

#<< 4. Complex >> -----------------------------------------------------------------------

# Can use notation like + -, and values like i for imaginary units in complex numbers.
comp <- 1+4i

class(comp)
# [1] "complex"

#<< 5. Logical >> -----------------------------------------------------------------------

# Are equal to either TRUE or FALSE in all caps
l <- TRUE

l <- FALSE

class(l)
# [1] "logical"

#<< 6. List >> --------------------------------------------------------------------------

# Holds multiple of the above data types, including other lists. surround with list()
mylist <- list(chars = 'c', nums = 1.4, logicals=TRUE, anotherList = list(a = 'a', b = 2))

class(mylist)
# [1] "list"

#**Note: Don't forget that the command str() also lists the class of each column within a
# data frame. It is good to use to make sure all of your data was imported correctly.

#----------------------------------------------------------------------------------------
# Data Structures-----
#----------------------------------------------------------------------------------------

#<< 1. Atomic Vector >> -----------------------------------------------------------------
# Use c() notation (stands for combine). All elements of a vector have to be of the same
# type.

log_vector <- c(TRUE, TRUE, FALSE, TRUE)

char_vector <- c("Uwe", "Gaius", "Liz")

char_vector <- c(char_vector, "Helper1", NA) #NA represents empty data

char_vector
# [1] "Uwe"     "Gaius"   "Liz"     "Helper1" NA

length(char_vector)
# [1] 5

class(char_vector)
# [1] "character"

anyNA(char_vector)
# [1] TRUE

# When data is mixed, R tries to convert the data to what it thinks makes most sense.

mixed <- c("True", TRUE)
mixed 
# [1] "True" "TRUE"
# It has converted the logical to a character

# Using as.datatype (also, as.logical, as.character, as.factor, etc) will make R try to
# force it to be the this data type.

as.logical(mixed) 
# [1] TRUE TRUE

#<< 2. Lists >> ------------------------------------------------------------------------
# Lists are like vectors except that you can use multiple data types. Make a list using
# the list() function.

my_list <- list(1, "A", TRUE)

my_list
# [[1]]
# [1] 1
# 
# [[2]]
# [1] "A"
# 
# [[3]]
# [1] TRUE

# We can access a value of a list by referencing the index or by using the label.

my_list[1]
# [[1]]
# [1] 1

phonebook <- list(name="Gaius", phone="111-1111", age=27)

phonebook["name"]
# $name
# [1] "Gaius"

#<< 3. Matrices >> ----------------------------------------------------------------------
# Matrices are 2 dimensional structures that hold only one data type. Using ncol and nrow,
# you can define its shape. You can fill in the matrix by assigning to data. By default,
# it fills in by column, but you can change this using the byrow argument.

m <- matrix(nrow=2, ncol=3)

m
#      [,1] [,2] [,3]
# [1,]   NA   NA   NA
# [2,]   NA   NA   NA

m <- matrix(data=1:6, nrow=2, ncol=3)

m
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

m <- matrix(data=1:6, nrow=2, ncol=3, byrow=TRUE)

m
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

#<< 4. Data frames >> -------------------------------------------------------------------

# Data Frames are like matrices, but can hold multiple data types.

# Vectors are to lists as matrices are to data frames
# Remember the files we imported using read_csv and read_delim? These are data frames.

df <- data.frame(id=letters[1:10], x=1:10, y=11:20)

df
#    id  x  y
# 1   a  1 11
# 2   b  2 12
# 3   c  3 13
# 4   d  4 14
# 5   e  5 15
# 6   f  6 16
# 7   g  7 17
# 8   h  8 18
# 9   i  9 19
# 10  j 10 20

class(df)
# [1] "data.frame"

typeof(df)
# [1] "list"

head(df)
#   id x  y
# 1  a 1 11
# 2  b 2 12
# 3  c 3 13
# 4  d 4 14
# 5  e 5 15
# 6  f 6 16

tail(df)
#    id  x  y
# 5   e  5 15
# 6   f  6 16
# 7   g  7 17
# 8   h  8 18
# 9   i  9 19
# 10  j 10 20

nrow(df)
# [1] 10

ncol(df)
# [1] 3

str(df)
# 'data.frame':	10 obs. of  3 variables:
#  $ id: Factor w/ 10 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10
#  $ x : int  1 2 3 4 5 6 7 8 9 10
#  $ y : int  11 12 13 14 15 16 17 18 19 20

summary(df)
#       id          x               y        
# a      :1   Min.   : 1.00   Min.   :11.00  
# b      :1   1st Qu.: 3.25   1st Qu.:13.25  
# c      :1   Median : 5.50   Median :15.50  
# d      :1   Mean   : 5.50   Mean   :15.50  
# e      :1   3rd Qu.: 7.75   3rd Qu.:17.75  
# f      :1   Max.   :10.00   Max.   :20.00  
# (Other):4                                  

names(df)
# [1] "id" "x"  "y" 

#----------------------------------------------------------------------------------------
# Factors-----
#----------------------------------------------------------------------------------------
# Factors are very useful when running statistics, and also clog up memory less than
# character vectors.

# They do this by storing each unique value as an integer, which takes up less space in
# memory than characters in a string. Then it references that integer to the corresponding
# string so that it is human readable.

state <- factor(c("Arizona", "Colorado", "Arizona"))

state
# [1] Arizona  Colorado Arizona 
# Levels: Arizona Colorado

nlevels(state)
# [1] 2

levels(state)
# [1] "Arizona"  "Colorado"

# Factors by default don't actually have hierarchy. That is to say, Arizona is not more or
# less than Colorado. But sometimes we want factors to have hierarchy (e.g. low comes
# before medium comes before high).

ratings <- factor(c("low", "high", "medium", "low"))

ratings
# [1] low    high   medium low   
# Levels: high low medium

# If we look for the minimum of the factors, we get an error because they are not ordered

min(ratings) 
# Error in Summary.factor(c(2L, 1L, 3L, 2L), na.rm = FALSE) : 
# ‘min’ not meaningful for fact

levels(ratings)
# [1] "high"   "low"    "medium"

# We can add an order by putting ordered=TRUE into the arguments of the factor() function.
# Then when we run min(), it understands that "low" is the minimum value. Notice that the
# levels change to less than symbols, showing there is a hierarchy.

ratings <- factor(ratings, levels=c("low", "medium", "high"), ordered=TRUE)

levels(ratings)
# [1] "low"    "medium" "high"  

min(ratings)
# [1] low
# Levels: low < medium < high

# When we run the str() function on a dataframe with factors, notice that it lists the
# type as a Factor and tells us how many levels it has. Summary lists each factor level 
# and tells us how many are in each group.

survey <- data.frame(number=c(1,2,2, 1, 2), group=c("A", "B","A", "A", "B"))

str(survey)
# 'data.frame':	5 obs. of  2 variables:
#  $ number: num  1 2 2 1 2
#  $ group : Factor w/ 2 levels "A","B": 1 2 1 1 2

summary(survey)
#     number    group
# Min.   :1.0   A:3  
# 1st Qu.:1.0   B:2  
# Median :2.0        
# Mean   :1.6        
# 3rd Qu.:2.0        
# Max.   :2.0   

# A useful command to count how many values overlap is the table() function. Here we see
# that 2 rows in the table have a 1 in the number column and an A in the group column, but
# there are 0 rows that have a B and a 1.

table(survey$number, survey$group)
#   A B
# 1 2 0
# 2 1 2

