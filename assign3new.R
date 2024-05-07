# DATASET PREP STEP

library(tidyr) 
library(dplyr)

library(readxl)
default_of_credit_card_clients <- read_excel("data/default of credit card clients.xls")
View(default_of_credit_card_clients)
dt <- default_of_credit_card_clients

head(dt)
tail(dt)

# overview of the data
str(dt)
summary(dt)

# Removing duplicates
data <- distinct(dt)
View(data)

#missing data for all columns 

# Select relevant columns
columns_to_check <- c('ID', 'EDUCATION', 'LIMIT_BAL', 'SEX', 'MARRIAGE', 'AGE', 
                      'PAY_0', 'PAY_2', 'PAY_3', 'PAY_4', 'PAY_5', 'PAY_6', 
                      'BILL_AMT1', 'BILL_AMT2', 'BILL_AMT3', 'BILL_AMT4', 'BILL_AMT5', 'BILL_AMT6', 
                      'PAY_AMT1', 'PAY_AMT2', 'PAY_AMT3', 'PAY_AMT4', 'PAY_AMT5', 'PAY_AMT6', 
                      'default payment next month')

missing_summary <- data %>%
  select(all_of(columns_to_check)) %>%
  summarise(across(everything(), list(
    NonMissing = ~sum(!is.na(.)),  # Count of non-missing values
    Missing = ~sum(is.na(.))       # Count of missing values
  )))

# View the results ----> no missing values
View(missing_summary)

#DATASET CLEANING STEP
## continue from here like column renames, removals etc