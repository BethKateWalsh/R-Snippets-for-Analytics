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

# Get numerical data only
data <- iris %>% select(1:4)

# PCA functions
data.pca <- prcomp(data, center=TRUE, scale=TRUE)
summary(data.pca)
str(data.pca)
ggbiplot(data.pca)

# Train and test
index_split <- floor(0.80*nrow(data))
train_index_split <- sample(seq_len(nrow(data)), size=index_split)
train <- data[train_index_split, ]
test <- data[-train_index_split, ]

#Principle Component Regression
#
#
pcr_model <- pcr(Petal.Width ~.,
                 data = train, 
                 scale = TRUE)
summary(pcr_model)
# Pick number of componets
pcr_pred <- predict(pcr_model, test, ncomp = 3)
# RMSE
rmse(actual = test$Petal.Width, predicted = as.numeric(pcr_pred))
