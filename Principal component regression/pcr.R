library(dplyr)
library(datasets)
library(ggplot2)
library(Metrics)
library(pls)
library(tidyverse)
library(devtools)
library(ggbiplot)

data(iris)
str(iris)
colnames(iris)

# Exclude categorical dataas works best with numeric
data <-  iris %>% select(1:4)

# Check out variance
# One feature accounts for the most variance
data.pca <- prcomp(data, center = TRUE,scale. = TRUE)
summary(data.pca)
str(data.pca)
ggbiplot(data.pca)

# Train and test
# 80/20 split
index_split <-  floor(0.80 * nrow(data))

# Split the trianing set
train_index_split <- sample(seq_len(nrow(data)), size = index_split)
train <- data[train_index_split, ]
test <- data[-train_index_split, ]

# Principle Component Analysis
#
#
pcr_model <- pcr(Petal.Width  ~.,
                 data = train,
                 scale = TRUE, 
                 tranFun = Hellinger)
summary(pcr_model)
# Pick number of componets- 1
pcr_pred <-  predict(pcr_model, test, ncomp = 1)
# values between 0.2 and 0.5 
rmse(actual = test$Petal.Width, predicted = as.numeric(pcr_pred))



