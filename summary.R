library(dplyr)

# Load the data
data <- read.csv("Checkouts_by_Title.csv")

# Total checkouts of BOOK
book_checkouts <- data %>%
  filter(MaterialType == "BOOK") %>%
  summarize(total_checkouts = sum(Checkouts)) %>%
  pull(total_checkouts)

# Total checkouts of EBOOK
ebook_checkouts <- data %>%
  filter(MaterialType == "EBOOK") %>%
  summarize(total_checkouts = sum(Checkouts)) %>%
  pull(total_checkouts)

# Average number of checkouts for each item
avg_checkouts <- data %>%
  summarize(avg_checkouts = mean(Checkouts)) %>%
  pull(avg_checkouts)

# Most checkouts book
most_checkouts_ebook <- data %>%
  filter(MaterialType == "EBOOK") %>%
  arrange(desc(Checkouts)) %>%
  slice(1)

# Average number of checkouts for each e-book
avg_checkouts_ebook <- data %>%
  filter(MaterialType == "EBOOK") %>%
  summarize(avg_checkouts = mean(Checkouts)) %>%
  pull(avg_checkouts)

# Average number of checkouts for each book
avg_checkouts_book <- data %>%
  filter(MaterialType == "BOOK") %>%
  summarize(avg_checkouts = mean(Checkouts)) %>%
  pull(avg_checkouts)

# The most checkouts e-book
most_checkouts_ebook <- data %>%
  filter(MaterialType == "EBOOK") %>%
  arrange(desc(Checkouts)) %>%
  slice(1) %>%
  pull(Title)

# The most checkouts book
most_checkouts_book <- data %>%
  filter(MaterialType == "BOOK") %>%
  arrange(desc(Checkouts)) %>%
  slice(1) %>%
  pull(Title)

# Total checkouts of Great Gatsby print book
gatsby_book_checkouts <- data %>%
  filter(MaterialType == "BOOK" & grepl("Great Gatsby", Title)) %>%
  summarize(total_checkouts = sum(Checkouts)) %>%
  pull(total_checkouts)

# Total checkouts of Great Gatsby e-book
gatsby_ebook_checkouts <- data %>%
  filter(MaterialType == "EBOOK" & grepl("Great Gatsby", Title)) %>%
  summarize(total_checkouts = sum(Checkouts)) %>%
  pull(total_checkouts)

