# Getting and Cleaning Data Course Project R code:

# Clean workspace:
rm(list=ls())

# Install R packages:
packages <- c('base', 'curl', 'plyr', 'dplyr', 'data.table', 'httr', 'magrittr', 'reshape2', 'utils')
sapply(packages, require, character.only = TRUE, quietly = TRUE)


# Create an empty directory for storing the zipped files:
if (!file.exists("UCI HAR Dataset")) {
	dir.create("UCI HAR Dataset")
}

# Assign a handle to the data source URL
motionDataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"

# Download the data
download.file(motionDataUrl, destfile = "./Desktop/Coursera_R/UCI HAR Dataset", method = "curl")
list.files("./UCI HAR Dataset")

# setwd:
setwd("~/Desktop/Coursera_R/GetCleanDataCourseProject/UCI HAR Dataset")
ls()
