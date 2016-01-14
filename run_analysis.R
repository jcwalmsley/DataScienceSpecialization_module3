# Revised run_anlaysis.R code for Getting and Cleaning Data
# Course Project, jw, dtd 60101

# Start by cleaning up the workspace
# ==================================
rm(list=ls())
ls()

# ==================================
# Next set the working directory
# setwd("~./Desktop/Coursera_R/GetCleanDataCourseProject")

# ==================================
# Load the following R packaqes
library(base)
library(curl)
library(plyr)
library(dplyr)
library(data.table)
library(httr)
library(knitr)
library(magrittr)
library(reshape2)
library(stringi)
library(stringr)
library(utils)

# ===================================
# Next give a handle to Url of the data source then download
# and open the assignment zip file from the local working directory
 if (!file.exists("UCI HAR Dataset")) {
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	zipfile="UCI HAR Dataset.zip"
	download.file(fileUrl, destfile=zipfile, method = "curl")

# ===================================
# Get time stamp on dowload
	dateDownLoaded <- date()
	dateDownLoaded

# ====================================
# Next unzip the UCI HAR Dataset data files form the local
# working directory
	unzip("UCI HAR Dataset.zip", exdir = ".")
	list.files("UCI HAR Dataset")
}
ls()

# =================================
# Read and assign a new variable name to each of the data sets below
trainZ <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

testZ <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
testY <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

trainX <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
testX <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)

features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
ls()

# ==================================
# combine by columns; the -train sets- of (subjects or Z)
# with (activities or Y)
subAct1 <- cbind(trainZ, trainY)
subAct1
# ==================================
# combine by columns; the -test sets- of (subject or Z)
# with (activity or Y)
subAct2 <- cbind(testZ, testY)
subAct2
# ==================================
# combine by rows; (subAct1 & subAct2) and asign to "subAct"
subAct <- rbind(subAct1, subAct2)
subAct

# ==================================
# rename the columns of "subAct"
colnames(subAct) <- c("ID", "V1")
head(subAct)

# ==================================
# combine by rows; train and test datasets of "X" and assign
# to "observ" = observations
observ <- rbind(trainX, testX)
head(observ)

# ==================================
# join "subAct" with the activity descriptions = "activities"
# by variable "V1" and assign to "pA" = population & activities
pA <- join(subAct, activities)
head(pA)


# ==================================
# rename columns of (pA):
names(pA) <- c("subjectID", "activityID", "activityName")
head(pA)

# ==================================
# set values of "activityName to lower case
pA$activityName <- tolower(pA$activityName)
pA

# ==================================
# merge "subAct" with "observ" by column bind resulting
# in full raw data set and assign to "allData"
allData <- cbind(pA, observ)
head(allData)[1:12]

# ==================================
# remove column 2 "activityID" from (allData) assign results to
# "dataT1" = (subject, activites and values)
dataT1 <- (allData)[-2]
head(dataT1)[1:30]

# ==================================
# set "features" = the observation values column names to lowercase
varNames <- tolower(features[,2])
varNames

# ==================================
# concatenate the column names vector of "pA" and "observ"
# for the new data set "allData" and assign to "allColumnNames"
allColumnNames <- c("subjectID", "activityName", varNames)
head(allColumnNames)
length(allColumnNames)

# ==================================
# set the column names for "dataT1" = subjects, activities and
# observation values
names(dataT1) <- allColumnNames
head(dataT1)[1:8]
tail(dataT1)

# ==================================
# select from "dataT1" (subjectID, activityName, plus only
# columns containing (mean or std) and assign results to "dataT2"
index <- grepl("(ID$)|(Name$)|(mean\\(\\))|(std\\(\\))", allColumnNames)
index
dataT2 <- dataT1[,index==TRUE]
dim(dataT2)
head(dataT2)[1:15]

# ==================================
# if any exist, remove duplicate columns and assign
# results to "finalData"
finalData <- dataT2[, !duplicated(colnames(dataT2))]
head(finalData)
dim(finalData)

# ==================================
# group "finalData" by subject and activity assign the
# results to "groupedData" then summarize by mean and
# assign new results to "tidyData"
library(dplyr)
groupedData <- group_by(finalData, subjectID, activityName)
tidyData <- summarise_each(groupedData, funs(mean))
dim(tidyData)
summary(tidyData)
tidyData

# ==================================
# take "tidyData" and write it as output to a file
# called "tidyData.txt"
write.table(tidyData, "tidyData.txt", row.names = FALSE, quote = FALSE, sep = "\t")
date()
# [1] "Tue Jan 12 23:17:43 2016"
<<<<<<< Updated upstream


=======
>>>>>>> Stashed changes





