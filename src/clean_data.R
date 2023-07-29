# Load data 
library(tidyverse) 


# Clean data 
raw_data <- read_csv("../data/raw/data.csv")
clean_data <- raw_data[, 2:9]
clean_data[clean_data == ""] <- NA
clean_data <- drop_na(clean_data)

# Save cleaned data 
write.csv(clean_data, file = "./data/processed/clean_data.csv", row.names = FALSE)
