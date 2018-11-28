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
