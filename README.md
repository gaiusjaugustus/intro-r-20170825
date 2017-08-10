# R Workshop: August 26-27, 2017

This repository acts as a companion for the R programming portion of the  Software Carpentry Workshop being held at University of Arizona.

# Content

* [Day 1 Part 1: First baby steps](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/01_ImportingData.Rmd)
    * [What is R & R Studio?](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/01_ImportingData.Rmd#what-is-r)
    * [Importing datasets into dataframes](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/01_ImportingData.Rmd#reading-in-data)
    * [Manipulating data with dplyr](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/01_ImportingData.Rmd#dplyr)
* [Day 1 Part 2: Reporting and working through problems](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/02_HelpDataTypesFactors.Rmd)
     * [Getting Help and dealing with errors](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/02_HelpDataTypesFactors.Rmd#help-files)
     * [Data Types & Structures](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/02_HelpDataTypesFactors.Rmd#6-data-types)
     * [Factors](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/02_HelpDataTypesFactors.Rmd#factors)
     * [R Markdown Crash Course](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/02_HelpDataTypesFactors.Rmd#r-markdown)
* [Day 2 Part 3: Automating the automatron](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/03_ForLoopsIfElseFunctions.Rmd)
     * [For Loops](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/03_ForLoopsIfElseFunctions.Rmd#for-loops)
     * [If/Else Statements](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/03_ForLoopsIfElseFunctions.Rmd#if-else-statments)
     * [Writing Functions](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/03_ForLoopsIfElseFunctions.Rmd#functions)
* [Day 2 Part 4: Making pretties](https://github.com/gaiusjaugustus/intro-r-20170825/blob/master/04_Plotting.Rmd)
     * ggplot2 basics
     * Scatterplots
     * Histograms
     * Boxplots


# Let's do this!!!!

Please do the following to prepare for the R portion of the workshop.  

## 1. Clone the repo one of 2 ways

## Using git

There are two ways to do this, the first using the command line.

1. In your **Terminal** (Mac) or **Git Bash** (Windows), type `cd` and press `Enter`.  This takes you back to your home directory.
2. Identify your **home directory** on the command line (`pwd` to find your present working directory) 
3. On the [main page of the repo](https://github.com/gaiusjaugustus/intro-r-20170825), press the green button that says **Clone or download**.
4. Click the **copy to clipboard** button that is next to the URL
5. Back in your **terminal**, type `git clone URL` where the URL is the what is in your clipboard.
6. **Check your work** by using `ls` to verify that there is now a folder called `intro-r-20170825` in your home directory.


## Unzip the repo

1. In your **Terminal** (Mac) or **Git Bash** (Windows), type `cd` and press `Enter`.  This takes you back to your home directory.
2. Identify your **home directory** on the command line (`pwd` to find your present working directory) 
3. On the [main page of the repo](https://github.com/gaiusjaugustus/intro-r-20170825), press the green button that says **Clone or download**.
4. Click the **Download Zip** link and download the file.
5. **Unzip the downloaded archive** into your home directory (that you identified in step 2).
6. **Check your work** by going to your home directory and verifying there is now a folder called `intro-r-20170825` there.


## 2. Install packages

Open RStudio and run the following lines of code in the box labelled `Console`.  You should see a `>` at the beginning of the line where you can type.  This installs additional functionality to R so that we can do all sorts of cool stuff!

```
install.packages(c("knitr", "scales", "ggthemes", "tidyverse", "readxl"))
```