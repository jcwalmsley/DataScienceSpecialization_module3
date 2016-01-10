# Revised run_anlaysis.R code for Getting and Cleaning Data Course Project, jw, dtd 60101



# Start by cleaning up the workspace
rm(list=ls())
ls()

# Next set the working directory
setwd("~./Desktop/Coursera_R/GetCleanDataCourseProject")

# Next identify and load the required R packaqes for manipulate and analysis
packages <- c('base', 'curl', 'dcast', 'Hmisc', 'plyr', 'dplyr', 'data.table', 'httr', 'knitr', 'magrittr', 'reshape2', 'utils')
sapply(packages, require, character.only=T, quietly=T)

# Next give a handle to Url of the data source then download and open the assignment zip file from the local working directory
 if (!file.exists("UCI HAR Dataset")) {
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	zipfile="UCI HAR Dataset.zip"
	download.file(fileUrl, destfile=zipfile, method = "curl")
	dateDownLoaded <- date()
	dateDownLoaded
	ls()
# Next unzip the UCI HAR Dataset data files form the local working directory
	unzip("UCI HAR Dataset.zip", exdir = ".")
	list.files("UCI HAR Dataset")
}
ls()

# =====
# Read and assign a new variable name to each of the data sets below
trainXraw <- read.table("./UCI HAR Dataset/train/X_train.txt")
testXraw <- read.table("./UCI HAR Dataset/test/X_test.txt")

trainYraw <- read.table("./UCI HAR Dataset/train/y_train.txt")
testYraw <- read.table("./UCI HAR Dataset/test/y_test.txt")

trainSubjectRaw <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testSubjectRaw <- read.table("./UCI HAR Dataset/test/subject_test.txt")

activitiesRaw <- read.table("./UCI HAR Dataset/activity_labels.txt")
featuresRaw <- read.table("./UCI HAR Dataset/features.txt")




# ======
dim(trainXraw)
str(trainXraw)

dim(testXraw)
str(testXraw)

dim(trainYraw)
str(trainYraw)

dim(testYraw)
str(testYraw)

dim(trainSubjectRaw)
str(trainSubjectRaw)

dim(testSubjectRaw)
str(testSubjectRaw)

dim(activitiesRaw) # 6 rows, 2 colums
activitiesC1 <- tolower(activitiesRaw) # change all string characteres to lower case
str(activitiesC1) # list of activity names (1:6) otherwise row identifiers of the activity measured on that row of data; Note: merge or join with dataX based on common activity ids
head(activitiesC1)
# Next remove the "_" in the two walking_ strings and shorten the descirption to up or down instead of upstairs or downstairs
grepsub


dim(featuresRaw)
featuresC1 <- tolower(featuresRaw) # change all string characters to lower case
str(featuresC1) # list of measurement names (1:561) otherwise column names of the raw data Note after keeping only the colums containing the mean and std measurements these names can be modified to conform to the best practices naming rules of self identification
summary(featuresC1)
head(featuresC1)
table(featuresC1)



# Join the train and test datasets by (X, Y, and Subject) using rbind for each group
xC2 <- rbind(trainXraw, testXraw)
dim(xC2)

str(xC2) # Variable measuresments (1:561)
summary(xC2)


yC2 <- rbind(trainYraw, testYraw)
str(yC2) 	# activity id numbers (1:6)
dim(yC2)
str(yC2)
summary(yC2)

subjectC2 <- rbind(trainSubjectRaw, testSubjectRaw)
dim(subjectC2)
str(subjectC2)  # subject id numbers (1:30)
summary(subjectC2)

Combine3sxy <- cbind(subjectC2, xC2, yC2)
str(Combine3sxy)
summary(Combine3sxy)
Combine3sxy
# names(cData)[1] <- "subjectID"
# names(cData)[563] <- "activityID"

# create column names for [subject, activity & feature] variables
nameSubject <- c("subjectID")
nameActivity <- c("activityID", "activityName")
nameFeatures <- c("featureID", "featureName")

# Add the activity names by joining  activityNames with Combine3sxy by the activity id  common to both data sets

nameActivity <- tolower(nameActivity)
dim(nameActivity)
str(nameActivity)


# sxyCombine4 <- join(nameActivity, Combine3sxy, by="V1")

# Add the variable / column names for columns 3:563 by rbinding namesFeatures to
sxyCombine5 <- rbind(sxyCombine4, nameFeatures)

dim(featuresF)
str(featuresF)

# Next convert all strings to lower case, remove duplicates, then drop the colums after column 3 that do not contain either mean or std



# Apply appropriate lables to describe the subjects and activities
# Apply appropriate lables to describe the data set variable names


# With the results from steps 1-7, creates a second, independent tidy data set called 'tidy.txt' with the average of each mean and standard deviation for each activity and each subject.





