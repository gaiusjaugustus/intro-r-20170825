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
# For instance, say I want the avg. life expectance for each continent
for(c in unique(gapminder$continent)){
     life.min <- min(gapminder[gapminder$continent == c, 'lifeExp'])
     life.max <- max(gapminder[gapminder$continent == c, 'lifeExp'])
     print(paste0('The life expectancy in ',c,' is ',life.min,' to ',life.max))
}

# You can nest for loops as well
for(c in unique(gapminder$continent)){
     for(y in unique(gapminder$year)) {
          life.min <- min(gapminder[gapminder$continent == c & gapminder$year == y,
                                    'lifeExp'])
          life.max <- max(gapminder[gapminder$continent == c & gapminder$year == y,
                                    'lifeExp'])
          print(paste0('The life expectancy in ',y,' in ',c,' is ',
                       life.min,' to ',life.max))
     }
}

### Problems with for loops ----

# For loops are very usefule for certain data types, but at times can become very slow
# Below are some rules for using for loops as opposed to apply functions (which we are
# going to talk about next)

# 1. Don't use a loop when a vectorized alternative already exists
# 2. Don't grow objects (via c, cbind, etc) during the loop 
# 3. Allocate an object to hold the results and fill it in during the loop

#<< apply function family >>------------------------------------------------------------

