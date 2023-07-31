# Load libraries 
library(readr)
library(magrittr)
library(ggplot2)
library(dplyr)

# Load the cleaned data
clean_data <- read_csv("./data/processed/clean_data.csv", show_col_types = FALSE)

# Spending Score Count by Marital Status Bar Chart  
spending_score_martial_bar_chart <- clean_data |>
  group_by(Ever_Married, Spending_Score) |>
  summarize(count = n(), .groups = "drop") |>
  ggplot(aes(x = Ever_Married, y = count, fill = Spending_Score)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.6) +
  scale_fill_manual(values = c("High" = "cadetblue3", "Average" = "orange", "Low" = "gray")) + 
  labs(title = "Spending Score by Marital Status Bar Chart", x = "Whether Ever Married", y = "Count", fill = "Spending Score") + 
  geom_text(aes(label = count), position = position_dodge(width = 0.8), vjust = -0.5)
ggsave(filename = "./results/eda1.png", plot = spending_score_martial_bar_chart, dpi = 300)


# Age Distribution by Profession Boxplot 
age_profession_boxplot <- ggplot(clean_data, aes(x = Profession, y= Age)) +
  geom_boxplot(fill = "orange", color = "black", alpha = 0.5) +
  labs(title = "Age Distribution by Profession Boxplot", x = "Profession", y = "Age") + 
  stat_summary(fun.y=mean, geom="point", shape=23, size=2)
ggsave(filename = "./results/eda2.png", plot = age_profession_boxplot, dpi = 300)
