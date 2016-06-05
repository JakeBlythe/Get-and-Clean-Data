
#### Getting and Cleaning Data assignment

setwd("/Users/jacobburns/Documents/Coursera data science/UCI HAR Dataset")

## reading in test files
subjecttest <- read.table("./test/subject_test.txt")
str(subjecttest)
head(subjecttest)

xtest <- read.table("./test/X_test.txt")
str(xtest)
head(xtest)

ytest <- read.table("./test/Y_test.txt")
str(ytest)
head(ytest)

## creating Test dataset
testset <- cbind(subjecttest, ytest, xtest)
str(testset)



## reading in train files
subjecttrain <- read.table("./train/subject_train.txt")
str(subjecttrain)

xtrain <- read.table("./train/X_train.txt")
str(xtrain)

ytrain <- read.table("./train/Y_train.txt")
str(ytrain)

## creating Train dataset
trainset <- cbind(subjecttrain, ytrain, xtrain)
str(trainset)


## merging the Train and Test datasets
fullset <- rbind(trainset, testset)
str(fullset)


## adding names to V1, V2 (subject and activity) as well as V3-V563 (features)
features1 <- read.table("features.txt")
V1 <- c(1,2)
V2 <- c("subject", "activity")
features2 <- data.frame(V1, V2)

features <- rbind(features2, features1)

features <- features[, 2]

names(fullset) <- features


## retaining only those features measuring the mean or standard deviation
grep("mean|std", names(fullset), value=T)

reducedset <- fullset[,grep("activity|subject|mean|std", names(fullset))]

analysisset <- reducedset[,!grepl("meanFreq", names(reducedset))]


## making the activity levels sufficiently descriptive in the dataset
analysisset$activity <- factor(analysisset$activity)
levels(analysisset$activity) <- c('walking','walking_upstairs',
                      'walking_downstairs','sitting',
                      'standing','laying')




###### Step 5


