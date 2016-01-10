# Revised run_anlaysis.R code for Getting and Cleaning Data Course Project, jw, dtd 60101

# Start by cleaning up the workspace
#===================================
rm(list=ls())
ls()

#===================================
# Next set the working directory
# setwd("~./Desktop/Coursera_R/GetCleanDataCourseProject")

#===================================
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

#====================================
# Next give a handle to Url of the data source then download and open the assignment zip file from the local working directory
 if (!file.exists("UCI HAR Dataset")) {
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	zipfile="UCI HAR Dataset.zip"
	download.file(fileUrl, destfile=zipfile, method = "curl")

#====================================
# Get time stamp on dowload
	dateDownLoaded <- date()
	dateDownLoaded

#=====================================
# Next unzip the UCI HAR Dataset data files form the local working directory
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
# combine the train set of subject ids with activity ids
a <- cbind(trainZ, trainY)
a
# =================================
# combine the test set of subject ids with activity ids
b <- cbind(testZ, testY)
b
# =================================
# combine the training subject id and activity id rows with
# the test subject id and activity id rows
c <- rbind(a,b)
c
#====================================
# rename the columns of the merged rows (a,b)
names(c) <- c("ID", "V1")
c[1:5,]

#===================================
# combine the train data rows with the test data rows
d <- rbind(trainX, testX)
d

#===================================
# join the activity names with the activity ids and subjects df
f <- activities
f
g <- join(c, f)
g
head(g)
#===================================
# set the column names of g
names(g) <- c("subjectID", "activityID", "activityName")
#===================================
# rename g to observ; indicating observation columns
observ <- g[-2]
dim(observ)
head(observ)

#===================================
# merge the observations with the dataset d to give allData
allData <- cbind(observ, d)
head(allData)[1:12]
dim(allData)

#===================================
# select only columns (subjectID, activityName, mean, std) & remove any duplicates
allDataVarNames <- names(allData)
length(allDataVarNames)
varNamesIndex <- grepl("(ID$)|(Name$)|(mean\\(\\))|(std\\(\\))", allDataVarNames)
varNamesIndex
allData2 <- allData[!varNamesIndex==FALSE]
dim(allData2)

#===================================
# remove duplicate columns if any exist
allData3 <- allData2[, !duplicated(colnames(allData2))]
dim(allData3)

#===================================
# set variable / column names to lower case
names(allData3) <- tolower(names(allData3))
names(allData3)

#===================================
# group by subject and activity, then summarize by mean
library(dplyr)
G <- group_by(allData3, subjectID, activityName)
tidyD <- summarise_each(G, funs(mean))
tidyD
summary(tidyD)
date()

#===================================
# write output to a file called tidyData.txt
write.table(tidyD, "tidyData.txt", row.names = FALSE, quote = FALSE, sep = "\t")
date()
# [1] "Sun Jan 10 14:02:06 2016"





