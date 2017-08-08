## Script created as part of Software carpentry workshop on basic R code
## August 26-27, 2017 at the University of Arizona

#<< Install and load packages >> -------------------------------------------------------
# You will need to install packages the first time you use them. After they are installed
# you only need to use the library command to load them as the packages are saved locally
# Comment out install.packages after you have installed readr
install.packages('readr')
library(readr)

#<< Read in data >> --------------------------------------------------------------------
dat.dir <- '~/Documents/2017Fall/Software_carpentry_workshop/intro-r-20170825/datasets/'
mammals <- read_delim(file = paste0(dat.dir, '01_mammals.txt'), 
                      delim = "\t", escape_double = FALSE, trim_ws = TRUE)
View(mammals)

#<< Ways to look at data >> -------------------------------------------------------------

# str() tells you the structure of an object (i.e., it's size, the classes of the data)
str(mammals)
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	62 obs. of  3 variables:
#      $ Animal: chr  "Arctic fox" "Owl monkey" "Mountain beaver" "Cow" ...
# $ body  : num  3.38 0.48 1.35 465 36.33 ...
# $ brain : num  44.5 15.5 8.1 423 119.5 ...

# summary() will provide basic summary statistics for each column within your data
summary(mammals)
# Animal               body              brain        
# Length:62          Min.   :   0.005   Min.   :   0.14  
# Class :character   1st Qu.:   0.600   1st Qu.:   4.25  
# Mode  :character   Median :   3.342   Median :  17.25  
#                    Mean   : 198.790   Mean   : 283.13  
#                    3rd Qu.:  48.203   3rd Qu.: 166.00  
#                    Max.   :6654.000   Max.   :5712.00

# There are also built in functions which allow you to explore your data. Here we use
# a $ sign to access a single column of our data rather than the whole data frame
min(mammals$brain)
# [1] 0.14

median(mammals$brain)
# 17.25

max(mammals$brain)
# 5712

# You can use $ to access existing data (as above) or create new data columns
mammals$brainkg <- mammals$brain/1000

# Now lets see how our data looks
str(mammals)
# ’data.frame’: 62 obs. of 3 variables:
# $ body : num 3.38 0.48 1.35 465 36.33 ...
# $ brain : num 44.5 15.5 8.1 423 119.5 ...
# $ brainkg: num 0.0445 0.0155 0.0081 0.423 0.1195 ...

summary(mammals$brainkg)
# Min.     1st Qu. Median Mean    3rd Qu. Max.
# 0.00014 0.00425 0.01725 0.28310 0.16600 5.71200