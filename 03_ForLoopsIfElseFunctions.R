## Script created as part of Software carpentry workshop on basic R code
## August 26-27, 2017 at the University of Arizona

dat.dir <- '~/Documents/2017Fall/Software_carpentry_workshop/intro-r-20170825/datasets/'

#--Read in mammals data frame from yesterday
library(readr)
mammals <- read_delim(file = paste0(dat.dir,'01_mammals.txt'), 
                      delim = "\t", escape_double = FALSE, trim_ws = TRUE)

#--Raed in gapminder data frame from yesterday
gapminder <- read_delim(paste0(dat.dir, '02_gapminder.txt'),
                        delim = "\t", escape_double = FALSE, trim_ws = TRUE)

#<< For Loops >>------------------------------------------------------------------------

# Used to apply the same function calls to a collection of objects

