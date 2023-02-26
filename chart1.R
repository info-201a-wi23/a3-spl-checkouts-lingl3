library(ggplot2)

data <- read.csv("https://data.seattle.gov/resource/tmmm-ytt6.csv?$query=SELECT%0A%20%20%60usageclass%60%2C%0A%20%20%60checkouttype%60%2C%0A%20%20%60materialtype%60%2C%0A%20%20%60checkoutyear%60%2C%0A%20%20%60checkoutmonth%60%2C%0A%20%20%60checkouts%60%2C%0A%20%20%60title%60%2C%0A%20%20%60isbn%60%2C%0A%20%20%60creator%60%2C%0A%20%20%60subjects%60%2C%0A%20%20%60publisher%60%2C%0A%20%20%60publicationyear%60%0AWHERE%20%60checkoutyear%60%20%3E%3D%202022", stringsAsFactors = FALSE)

monthly_checkouts <- data %>%
  filter(MaterialType %in% c("BOOK", "EBOOK")) %>%
  group_by(MaterialType, CheckoutYear, CheckoutMonth) %>%
  summarise(total_checkouts = sum(Checkouts), .groups = "drop")

chart1 <- ggplot(monthly_checkouts, aes(x = as.Date(paste0(CheckoutYear,"-",CheckoutMonth,"-01")), y = total_checkouts, color = MaterialType, group = MaterialType)) +
  geom_line() +
  labs(title = "Monthly Checkouts Over Time by MaterialType", x = "Checkout Date", y = "Total Checkouts", color = "Category") +
  scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
