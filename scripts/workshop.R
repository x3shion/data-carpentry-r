## Use this file to follow along with the live coding exercises.
## The csv file containing the data is in the 'data/' directory.
## If you want to save plots you created, place them in the 'figures/' directory.
## You can create additional R files in the 'scripts/' directory.

## Load packages first
library(tidyverse)

## Conflicts can indicate same functions across different packages, including R

## Data needs to be imported first into R and saves it 
interviews <- read_csv("data/SAFI_clean.csv", na="NULL") ## The dataset has many missing values, so these missing values have to be defined
## na="NULL" missing values are coded as NULL in the csv

## read_csv function is unique to the tidyverse package
## read.csv function will convert all character data to factors
  ## use interviews <- read.csv("data/SAFI_clean.csv", na = "NULL", stringsAsFactors = FALSE) in base R
  ## Can also set option in base R using options(stringsAsFactors = FALSE) followed by interviews <- read.csv("data/SAFI_clean.csv", na = "NULL")

## The readout should identify columns and the type of data (e.g. character, date, integer) that it includes

## A couple of ways to temporarily view data
interviews ## Summarizes and prints data as a dataframe in the console
as.data.frame(interviews) ## prints data as is in the console
view(interviews) ## opens a spreadsheet view of data
read_csv2(interviews) ## Understands the usage of ; instead of , in CSVs from countries that use , as a decimal e.g. Germany

## Inspecting data
dim(interviews) ## Dimensions of the data: rows x columns
nrow(interviews) ## Number of rows
ncol(interviews) ## Number of columns

head(interviews) ## Prints first 6 rows
head(as.data.frame(interviews))

tail(interviews) ## Prints the last 6 rows

names(interviews) ## Prints column heads

str(interviews) ## Gives brief string summary representation of the object
summary(interviews) ## Summarizes data per column including min, max, median, mean

## Accessing data in specific columns of the dataframe: Environment tab > Data > shows number of variables
interviews[1, 1] ## Accessing specific data in which row and which column; e.g. row 1 column 1
interviews[1, 6]
interviews[1:5, 6] ## Data from the first 5 rows in the 6th column
interviews[1, 1:4] ## Data from the first row in columns 1 to 4
interviews[1, ] ## Data from all the columns in the first row
interviews[, 6] ## Data from all rows for column 6
interviews[6] ## Data from column 6
interviews["respondent_wall_type"] ## Data from column titled "___"
interviews[, -1] ## Output does not print the first column

## Exercise
interviews_100 <- interviews[100, ] ## Create a data frame that contains data in row 100 of the interviews dataset
nrow(interviews_100) 
tail(interviews_100) ## Comparing what is printed as the last row with the original dataset
tail(interviews)

(interviews_last <- interviews[131, ]) ## Creates a data frame that contains data in the last row (which is 131) of the interviews dataset
(interviews_last <- interviews[nrow(interviews), ]) ## Creates a data frame that contains data in the last row because nrow(interviews) will return the value of 131, which IS the last row

## Use nrow() to extract the row that is in the middle of the data set
interviews_middle <- interviews[round(nrow(interviews)/2), ]
interviews_middle <- interviews[ceiling(nrow(interviews)/2), ] ## Ceiling() always rounds up

## Use nrow() to reproduct head()
interviews[-(7:nrow(interviews)), ] ## Remember that '-' excludes whatever you tell it to

## Factors
## Often used for categorical variables

respondent_floor_type <- factor(c("earth", "cement", "cement", "earth")) # Creates a vector containing 4 elements. The factor function then converts the vector into a factor.

# R will automatically sort the levels of a factor
levels(respondent_floor_type) ## This function reports the types of levels for a factor in alphabetical order
nlevels(respondent_floor_type) ## This function reports the number of levels for a factor

# To assign priority for levels of a factor
respondent_floor_type <- factor(respondent_floor_type, levels = c("earth", "cement"))

# Levels can be changed
levels(respondent_floor_type)[2] <- "brick" ## [2] denotes/"extracts" the 2nd level, which is cement, and assign it as cement

as.character(respondent_floor_type) ## Converts the data to characters

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990)) ## Stores these years as a categorical variable and NOT the number "1990"
  ## Have to designate this because R does not understand the concept of "years" and would read the input as the number 1990
as.numeric(year_fct) ## Stores the data as NUMBERS that can be manipulated rather than categories that hold meaning
  ## Level 3 indicates 1990
  ## Level number is assigned in ascending order
as.character(year_fct)
as.numeric(as.character(year_fct)) 

as.numeric(levels(year_fct))[year_fct] 
  ## Converts the levels of year_fct into numbers
  ## Subsetting using [year_fct] uses the VALUE of those levels (e.g. 1 = 1990) to index these numbers

## To extract a column from the dataset; the dataset_name$column_name
affect_conflict <- interviews$affect_conflicts  ## OR
affect_conflict <- interviews[[ , "affect_conflicts"]] ## Try not to use row or column numbers because if you change your dataset all the numbers will change

## Convert this column of data into a factor
affect_conflict <- factor(affected_conflict)

## Graphical representation of the NUMBER of times (frequency) that these levels appear
plot(affect_conflict) ## Orders categories in alphabetical manner; NAs are also excluded

## To reorder the categories in a more sensible manner
affect_conflicts <- interviews$affect_conflicts 
affect_conflicts[is.na(affect_conflicts)] <- "undetermined" ## Convert NA values to NA category by selecting missing values with is.na and then assign them as "undetermined"
affect_conflicts <- factor(affect_conflicts) ## Converts levels to factors

plot(affect_conflicts)


## Exercise: Rename more_once to "more than once" and replot from least frequent to most frequent, followed by undetermined

# Change levels
levels(affect_conflicts)[2] <- "more than once" ## [2] denotes/"extracts" the 2nd level, which is more_once, and assigns/renames it as "more than once"

# Assign priority for levels of a factor
affect_conflicts <- factor(affect_conflicts, levels = c("never", "once", "more than once", "frequently", "undetermined"))

plot(affect_conflicts)
