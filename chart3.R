library(ggplot2)
library(dplyr)

data <- read.csv("Checkouts_by_Title.csv")

usage_summary <- data %>% 
  group_by(UsageClass) %>% 
  summarize(TotalCheckouts = sum(Checkouts))

chart3 <- ggplot(usage_summary, aes(x = "", y = TotalCheckouts, fill = UsageClass)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Composition of Checkouts by Usage Class", fill = "Usage Class") +
  theme_void()





