# dplyr and tidyr 
  # Functions are faster than just using base R

library(tidyverse)

# Good practice to reload data
interviews <- read_csv("data/SAFI_clean.csv", na="NULL")

# Core functions used to manipulate data

select(interviews, village, no_membrs, years_liv) 
  # Selects columns in (dataset, column1, column2...) and creates a new dataframe

select(interviews, village:rooms)
  # Selects columns "village" TO "rooms" from the interviews dataset and creates a new dataframe