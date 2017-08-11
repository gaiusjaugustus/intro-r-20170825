## Script created as part of Software carpentry workshop on basic R code
## August 26-27, 2017 at the University of Arizona
## http://swcarpentry.github.io/r-novice-inflammation/15-supp-loops-in-depth/

#--Read in gapminder data frame from yesterday
library(readr)
#--Raed in gapminder data frame from yesterday
gapminder <- read_delim('datasets/gapminder.txt',
                        delim = "\t", escape_double = FALSE, trim_ws = TRUE)

#<< For Loops >>------------------------------------------------------------------------

# For loops are used to apply the same function calls to a collection of objects

# For instance, say I want the avg. life expectance for each continent
for(c in unique(gapminder$continent)){
     life.min <- min(gapminder[gapminder$continent == c, 'lifeExp'])
     life.max <- max(gapminder[gapminder$continent == c, 'lifeExp'])
     print(paste0('The life expectancy in ',c,' is ',life.min,' to ',life.max))
}

# [1] "The life expectancy in Asia is 28.801 to 82.603"
# [1] "The life expectancy in Europe is 43.585 to 81.757"
# [1] "The life expectancy in Africa is 23.599 to 76.442"

# Here we are taking each element in unique(gapminder$continent) and sequentially 
# assigning it to the variable c (which is completely arbitrary). The variable c is
# then used in the code to perform a function.

#--Nesting for loops -------------------------

# You can nest for loops as well
for(c in unique(gapminder$continent)){
     for(y in unique(gapminder$year)){
          life.min <- min(gapminder[gapminder$continent == c & gapminder$year == y,
                                    'lifeExp'])
          life.max <- max(gapminder[gapminder$continent == c & gapminder$year == y,
                                    'lifeExp'])
          print(paste0('The life expectancy in ',y,' in ',c,' is ',
                       life.min,' to ',life.max))
     }
}

# [1] "The life expectancy in 1952 in Asia is 28.801 to 65.39"
# [1] "The life expectancy in 1957 in Asia is 30.332 to 67.84"
# ...
# [1] "The life expectancy in 1952 in Africa is 30 to 52.724"
# [1] "The life expectancy in 1957 in Africa is 31.57 to 58.089"

# Here for each value of c (a.k.a each value of unique(gapminder$continent)), we will
# also loop through each value of y (a.k.a unique(gapminder$year))


### Problems with for loops ----

# For loops are very usefule for certain data types, but at times can become very slow
# Below are some rules for using for loops as opposed to apply functions (which we are
# going to talk about next)

# 1. Don't use a loop when a vectorized alternative already exists
# 2. Don't grow objects (via c, cbind, etc) during the loop 
# 3. Allocate an object to hold the results and fill it in during the loop

# An alternative to for loops is the apply family of functions

#<< apply function family >>------------------------------------------------------------

# apply: apply over the margins of an array (e.g. the rows or col. of a matrix)
# lapply: apply over an object and return a list
# sapply: apply over an object and return a simplified object 
# vapply: similar to sapply but you specify the type of object returned by the iterations

# Each of these has an argument FUN which takes a function to apply to wach element of
# the object

# Tutorial: https://www.datacamp.com/community/tutorials/r-tutorial-apply-family#gs.qC44Rnc

apply(gapminder[c(4:5)], 2, function(x) mean(x))

# In this function, we are applying the function mean() to the 4th and 5th column of
# the gapminder data frame
# The second argument, 2, refers to columns; passing a 1 would reference rows
# This applies the function to each column giving us a column mean

# pass multiple functions using {} or c()
apply(gapminder[c(4:5)],2, function(x) { log(mean(x)) * 3})
apply(gapminder[c(4:5)],2, function(x) c(min(x), max(x), mean(x), sd(x)))

# apply can even be used in conjunction with loops
for(c in unique(gapminder$continent)){
     for(y in unique(gapminder$year)){
          c.y <- apply(gapminder[gapminder$continent == c & gapminder$year == y,
                                 'lifeExp'], 2, function(x) c(min(x), max(x)))
          print(c(c,y,c.y))
          
     }
}

# Let's look at how much time the apply function takes versus solely using a for loop
# apply function
system.time(for(c in unique(gapminder$continent)){
     for(y in unique(gapminder$year)){
          c.y <- apply(gapminder[gapminder$continent == c & gapminder$year == y,
                                 'lifeExp'], 2, function(x) c(min(x), max(x)))
          print(c(c,y,c.y))
          
     }
})
# user    system  elapsed 
# 0.101   0.008   0.107 

# for loop
system.time(for(c in unique(gapminder$continent)){
     for(y in unique(gapminder$year)){
          life.min <- min(gapminder[gapminder$continent == c & gapminder$year == y,
                                    'lifeExp'])
          life.max <- max(gapminder[gapminder$continent == c & gapminder$year == y,
                                    'lifeExp'])
          print(paste0('The life expectancy in ',y,' in ',c,' is ',
                       life.min,' to ',life.max))
     }
})
# user    system  elapsed 
# 0.159   0.012   0.169 


# sapply
sapply(1:3, function(x) x^2)
# returns a vector
# passing argument simplify = F; would return a list (same output as lapply)

# lapply
lapply(1:3, function(x) x^2)
# similar to sapply, but returns a list

#<< If else statments >>---------------------------------------------------------------

#--If statments -------------
# When coding sometimes you want a particular function to be applied if a condition
# is true and sometimes a different function if it is not. To do this you need to use
# an if or if...else statment

# In a simple if statment, a function is executed if the test expression is true
# while it is ignored entirely if it is false

x <- 5
if (x > 0) {
     print('Positive number')
}

# Lets try this with the gapminder dataset. 
# The world mean life expectancy is 71.5 years. Lets have a 'Greater than avg.' statment
# returned if the value within the 'lifeExp' col exceeds that.
for(x in gapminder$lifeExp){
     if(x > 71.5){
          print(paste0(x, ' is greater than avg.'))
     }
}

# [1] "72 is greater than avg."
# [1] "71.581 is greater than avg."
# [1] "72.95 is greater than avg."
# [1] "75.651 is greater than avg."

#--If...else statment ---------------

# The basic syntax is 
# if (test_expression) {
# statement1
# } else {
#      statement2
# }

# Here the else statement2 is only used if the first test expression is false, if the 
# first test expression is true then statement1 will be run

x <- -5
if(x > 0) {
     print('Positive number')
} else {
     print('Negative number')
}

# [1] "Negative number"

# You can nest as man if...else statments as you want.

x <- 0
if(x > 0) {
     print('Positive number')
} else if (x < 0) {
     print('Negative number')
} else {
     print('Zero')
}

# [1] "Zero"

#<< Functions >> ----------------------------------------------------------------------
# Functions are a piece of code written to carry out a specified task; they allow you
# to incorporate sets of instructions that you want to use mutliple times or, if you
# have a complex set of instructions, keep it together within a small program

# For example, the base R function mean() gives you a simple way to get an average;
# when you read your script you can immediately tell what the code will do.

# Without that your code would look like this:

sum(gapminder['lifeExp'])/nrow(gapminder)
mean(gapminder$lifeExp)

# Let's build our own function
# We are going to make a function that will calculate the means as above:

my_mean <- function(data,col){
     mean <- sum(data[col])/nrow(data)
     return(mean)
}

my_mean(gapminder,'lifeExp')
my_mean(gapminder, 'gdpPercap')

# Let's build a new function that will convert a temperature in fahrenheit to kelvin:

fahr_to_kelvin <- function(temp){
     kelvin <- ((temp -32) * (5/9) + 273.15)
     return(kelvin)
     # we have to use return to send results outside of the function otherwise we see no
     # output
}

# Here we have created a function with one argument (temp) and have assigned that 
# function to or named it 'fahr_to_kelvin'. The body of the function, between the {},
# is what the function actually does

# When we call this function, the value we input is assigned to the object temp and 
# is fed through the code within the body.

fahr_to_kelvin(32)
# 273.15

fahr_to_kelvin(212)
# 373.15

