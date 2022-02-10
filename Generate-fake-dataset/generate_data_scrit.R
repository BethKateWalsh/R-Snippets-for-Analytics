# Import libraries
library(writexl)

# Create dataframe of 2500 transactions
# Id, Vendor, PurchaseYear, PurchaseDate, PriceUnit, Currency
transaction <- data.frame(Id = seq(1,2500), 
                    Vendor = sample(c("Adobe","SWO","VMWare", "unknown"), 2500, replace=TRUE, prob = c(0.284, 0.694, 0.016, 0.006)),
                    PurchaseYear = sample(2001:2022, size=2500, replace=TRUE),
                    PurchaseDate = sample(1:6, size=2500, replace=TRUE),
                    PriceUnit = sample(1:1346, size=2500, replace=TRUE),
                    Currency = sample(c("EUR","USD","CHF"), 2500, replace=TRUE))
head(transaction)

# Add the location of the file
write_xlsx(transaction, "~/Documents/GitHub/R-Snippets-for-Analytics/Generate-fake-dataset/transactions.xlsx")



