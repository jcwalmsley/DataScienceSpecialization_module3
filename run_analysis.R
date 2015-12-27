# Getting and Cleaning Data Course Project R code:

# Install R packages:

packages <- c('base', 'curl', 'plyr', 'dplyr', 'data.table', 'httr', 'magrittr', 'reshape2', 'utils')
sapply(packages, require, character.only = TRUE, quietly = TRUE)

# setwd:

setwd("~/Desktop/Coursera_R/GetCleanDataCourseProject")

# Create the local empty directory named above to store the Raw Data:

if (!file.exists(UCI HAR Dataset)) {
	create.dir(UCI HAR Dataset)
}
	
# Assign handle to the data location URL

fileUrl <- “https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip”

# Download the data

download.file(fileUrl, UHI HAR Dataset, method = "curl")

