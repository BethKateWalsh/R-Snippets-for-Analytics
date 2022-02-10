library(dplyr)
library(datasets)
library(ggplot2)
library(Metrics)
library(pls)

data(iris)
str(iris)
colnames(iris)

# Train and test
# 80/20 split
index_split <-  floor(0.80 * nrow(iris))

# Split the trianing set
train_index_split <- sample(seq_len(nrow(iris)), size = index_split)
train <- iris[train_index_split, ]
test <- iris[-train_index_split, ]

# Simple regression model
quick_lm <- lm(Petal.Width~., data = train)
summary(quick_lm)
lm_pred <-  predict(quick_lm, test)
rmse(actual = test$Petal.Width, predicted = as.numeric(lm_pred))

# Principle Component Analysis
#
#
pcr_model <- pcr(Petal.Width  ~.,
                 data = train,
                 scale = TRUE, 
                 validation = "CV")
summary(pcr_model)
# Pick number of componets- 1
pcr_pred <-  predict(pcr_model, test, ncomp = 1)
# values between 0.2 and 0.5 
rmse(actual = test$Petal.Width, predicted = as.numeric(pcr_pred))




