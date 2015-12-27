# Getting and Cleaning Data Course Project R code:
 
# Clean workspace:
# rm(list=ls())
ls()

# setwd:
setwd("~/Desktop/Coursera_R/GetCleanDataCourseProject")
ls()

# Install R packages:
packages <- c('base', 'curl', 'plyr', 'dplyr', 'data.table', 'httr', 'magrittr', 'reshape2', 'utils')
sapply(packages, require, character.only = TRUE, quietly = TRUE)

# Assign handle to source URL, download the data to directory called "data"
if (!file.exists("phoneData")) {
	fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	zipfile="phoneData.zip"
	download.file(fileUrl, destfile = zipfile, method = "curl")
	dateDownloaded <- date()
	dateDownloadedls
	ls()
	unzip("phoneData.zip", exdir = ".")
	list.files("UCI HAR Dataset")
 }

# filespath <- "C:/Users/jamescwalmsley/Desktop/Coursera_R/GetCleanDataCourseProject/UCIHAR"

# READ
subtest <- read.table("./UCIHAR/test/subject_test.txt")
xtest <- read.table("./UCIHAR/test/X_test.txt")
ytest <- read.table("./UCIHAR/test/y_test.txt")
subtrain <- read.table("./UCIHAR/train/subject_train.txt")
xtrain <- read.table("./UCIHAR/train/X_train.txt")
ytrain <- read.table("./UCIHAR/train/y_train.txt")
features <- read.table("./UCIHAR/features.txt")[,2]
activities <- read.table("./UCIHAR/activity_labels.txt")[,2]
 

# MERGE
xmerg <- rbind(xtrain, xtest)
ymerg <- rbind(ytrain, ytest)
submerg <- rbind(subtrain, subtest)
fullmerg <- cbind(submerg, ymerg, xmerg)

# RENAME COLUMNS
featureNames <- as.character(features[,2])
newCols <- c("subject", "activity", featureNames)
colnames(fullmerg) <- newCols

# EXTRACT MEAN & STD
meanCols <- grep("mean()", colnames(fullmerg))
stdCols <- grep("std()", colnames(fullmerg))
finalCols <- c(meancols, stdcols)
finalCols <- sort(finalCols)
finalCols
df1 <- fullmerg[, c(1, 2, finalCols)]
df1
df2 <- df1 %>% select(-contains("meanFreq")) 
dim(df2) # 10299r, 68c
dim(fullmerg) # 10299r, 563c

# REFINE RESULTS
tidyData.txt <- data.frame
df2 <- aggregate(. ~subject + activity, fullmerg, mean)
df2 <- df2[order(df2$subject, df2$activity),]
write.table(df2, file = "tidyData.txt", row.names=FALSE)
