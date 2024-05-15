library(tidyverse)
library(readr)
data <- read_csv('/lirneasia/projects/lacuna/data/raw/LA_social_safety_nets_sample.csv')
data_long <- data |> 
  select(-c(in_sample)) |> 
  mutate(ACCOUNT_NO = as.character(ACCOUNT_NO)) |> 
  pivot_longer(cols = starts_with('20'), 
               names_to = 'year-month', 
               values_to = 'consumption', 
               values_drop_na = T) |> 
  separate('year-month', 
           into=c('year','month'), 
           sep = 4)
  write_csv(data_long, '/lirneasia/projects/lacuna/data/processed/LA_social_safety_nets_sample_LONG.csv')
