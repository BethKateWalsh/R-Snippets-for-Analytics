library(readxl)
library(dplyr)
library(ggplot2)

products <- read_excel('~/Documents/GitHub/R-Snippets-for-Analytics/Generate-fake-dataset/transactions.xlsx')

colnames(products)

# Total Percentages
totals <- products %>% 
  count(Vendor) %>%
  mutate(Percent = n / sum(n) * 100) %>%
  arrange(-Percent)
ggplot(totals, aes(x="", y=Percent, fill=Vendor)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)
ggplot(totals, aes(x=Percent, y=reorder(Vendor, Percent))) +
  geom_bar(stat="identity")

# Basic line plot
Vendor_year <- products %>% count(PurchaseYear, Vendor, sort = TRUE)
ggplot(data=Vendor_year, aes(x=PurchaseYear, y=n, group=Vendor)) +
  geom_line(aes(color=Vendor)) + 
  ggtitle("Count of products by year")

# Basic hort bar stacked
Currencys <- products %>%count(Vendor, Currency, sort = TRUE)
ggplot(Currencys, aes(fill=Currency, y=n, x=Vendor)) + 
  geom_bar(position="fill", stat="identity") + coord_flip()


