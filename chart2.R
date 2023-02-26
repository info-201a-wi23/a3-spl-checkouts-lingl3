library(ggplot2)
library(dplyr)

data <- read.csv("https://data.seattle.gov/resource/tmmm-ytt6.csv?$query=SELECT%0A%20%20%60usageclass%60%2C%0A%20%20%60checkouttype%60%2C%0A%20%20%60materialtype%60%2C%0A%20%20%60checkoutyear%60%2C%0A%20%20%60checkoutmonth%60%2C%0A%20%20%60checkouts%60%2C%0A%20%20%60title%60%2C%0A%20%20%60isbn%60%2C%0A%20%20%60creator%60%2C%0A%20%20%60subjects%60%2C%0A%20%20%60publisher%60%2C%0A%20%20%60publicationyear%60%0AWHERE%20%60checkoutyear%60%20%3E%3D%202022")

total_checkouts <- data %>%
  group_by(YearMonth = paste(CheckoutYear, CheckoutMonth, sep = "-")) %>%
  summarise(TotalCheckouts = sum(Checkouts))

chart2 <- ggplot(data = total_checkouts, aes(x = YearMonth, y = TotalCheckouts, group = 1)) +
  geom_line(color = "blue", size = 1) +
  labs(title = "Total Checkouts per Month",
       x = "Year-Month",
       y = "Total Checkouts") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        legend.title = element_blank())
