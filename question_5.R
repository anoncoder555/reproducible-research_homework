library(readr)
# install.packages("dplyr")
library(dplyr)

# Question 5 (a)
Q5_data <- read_csv("question-5-data/Cui_etal2014.csv")

View(Q5_data)

dim(Q5_data)
# Columns = 13
# Rows = 33

# Question 5 (b)
colnames(Q5_data)

transformed_data <- Q5_data %>% 
  mutate(log_volume = log(`Virion volume (nm×nm×nm)`), log_g_length = log(`Genome length (kb)`))

# Question 5 (c)
# To get the exponent (β) and scaling factor (α) of the allometric law for dsDNA viruses, we must first fit a linear model

linear_model <- lm(log_volume ~ log_g_length, data = transformed_data)

summary(linear_model)
# Intercept = 7.0748 
exp(7.0748)
# = 1181.807

# Slope = 1.5152

# Question 5 (d)

# library(ggplot2)

ggplot(aes(x = log_g_length, y= log_volume), data = transformed_data) +
  geom_point() +
  geom_smooth(method = "lm", se = T, color = "blue", size = 0.7) +
  labs(
    x = "log[Genome length (kb)]",
    y = "log[Virion volume (nm3)]"
  ) +
  theme_light() +
  theme(
    axis.title = element_text(
    hjust = 0.5,        
    size = 9,
    face = "bold")
    )

# Question 5 (e)

1181.807*(300^1.5152)
# Volume = 6697006

## Commit and push changes to github ##

sink(file = "package-versions.txt")
sessionInfo()
sink()

