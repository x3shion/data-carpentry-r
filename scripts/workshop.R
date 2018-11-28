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

