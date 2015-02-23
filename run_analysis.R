setwd("~/Desktop/coursera/data science/rprog/UCI HAR Dataset")

# load training set
train <- read.table("train/X_train.txt")
train_sub <- read.table("train/subject_train.txt")
train_y <- read.table("train/y_train.txt")

# combine into single data frame
train$id <- train_sub$V1
train$activity <- train_y$V1

# load test set
test <- read.table("test/X_test.txt")
test_sub <- read.table("test/subject_test.txt")
test_y <- read.table("test/y_test.txt")

# add subject and activity
test$id <- test_sub$V1
test$activity <- test_y$V1

# append test and training sets
full <- rbind(train, test)

# find mean and std features
features <- read.table("features.txt")
means <- grep("mean",features$V2)
stds <- grep("std", features$V2)

# keep means and standard deviations, along with activity and id
relevant <- sort(c(means, stds, 562, 563))
final <- full[,relevant]

# give activities descriptive names
activities <-  c("walking", "walkingUpstairs", "walkingDownstairs", "sitting", "standing", "lying")
final$activity <- factor(final$activity, labels = activities)

# rename variables from VX to original names feature list
features$V2 <- as.character(features$V2)
cnames <- c(features$V2[c(means, stds)], "id", "activity")
names(final) <- cnames

# get the mean of all variables by activity and subject id, then output as table
library(dplyr)
finalOut <- final %>% group_by(id, activity) %>% summarise_each(funs(mean))

write.table(finalOut, file="submit.txt", row.names=F)

