# Getting and Cleaning Data Course Project code:

# Install R packages:
packages <- c('base', 'curl', 'plyr', 'dplyr', 'data.table', 'httr', 'magrittr', 'reshape2', 'utils')
sapply(packages, require, character.only = TRUE, quietly = TRUE)

fileName# setwd:
setwd("~/Desktop/Coursera_R/GetCleanDataCourseProject")

# Name a directory to save data to:
fileName <- "get_Dataset.zip"

# Create the local empty directory named above to store the Raw Data:
if (!file.exists(fileName)) {
# Assign a handle to the url data location & download the zip file containing the data
fileUrl <- “https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip”
download.file(fileUrl, fileName, method = "curl")
}

if (!file.exists("UCI HAR Dataset")) {
    unzip(fileName)
}
