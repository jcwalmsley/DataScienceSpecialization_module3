# Getting and Cleaning Data Course Project code:

# Configure installation R packages:
packages <- c(“base”, “curl”, “plyr”, “dplyr”, “data.table”, “http”, “magrittr”, “reshape2”, “tidyr”, “utils”)
sapply(packages, require, character.only = TRUE, quietly = TRUE)


# setwd:
setwd(“~/Desktop/Coursera_R/GetCleanDataCourseProject”)



# Create local empty directory if none exists to store the Raw Data:
if (!file.exists(ProjData)) {
	dir.create(ProData)
}

# Assign a handle to the url data location:
url <- “https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip”
projRawData <- “Dataset.zip”

# Download Raw Data Zip file:
download.file(url, file.path(ProData, projRawData))

