# Getting and Cleaning Data Course Project code:

# Configure installation R packages:
packages <- c(“base”, “curl”, “plyr”, “dplyr”, “data.table”, “http”, “magrittr”, “reshape2”, “tidyr”, “utils”)
sapply(packages, require, character.only = TRUE, quietly = TRUE)


# setwd:
setwd(“~/Desktop/Coursera_R/GetCleanDataCourseProject”)

# Name a directory to save data to:
smartphoneData <- "get_Dataset.zip"

# Create the local empty directory named above to store the Raw Data:
if (!file.exists(smartphoneData)) {
# Assign a handle to the url data location & download the zip file containing the data
fileUrl <- “https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip”
download.file(fileUrl, smartphoneData, method = "curl")
}

