#Course Project for Getting and Cleaning Data

#ASSIGNMENT:
##The purpose of this project is to demonstrate your ability to collect, 
##work with, and clean a data set. The goal is to prepare tidy data that 
##can be used for later analysis. You will be graded by your peers on a series 
##of yes/no questions related to the project. You will be required to submit: 
###1) a tidy data set as described below, 
###2) a link to a Github repository with your script for performing the analysis, 
###3) a code book that describes the variables, the data, and any transformations 
###or work that you performed to clean up the data called CodeBook.md. You should 
###also include a README.md in the repo with your scripts. This repo explains how
###all of the scripts work and how they are connected.  

##One of the most exciting areas in all of data science right now is wearable 
##computing - see for example this article . Companies like Fitbit, Nike, and 
##Jawbone Up are racing to develop the most advanced algorithms to attract new 
##users. The data linked to from the course website represent data collected from 
##the accelerometers from the Samsung Galaxy S smartphone. A full description is 
##available at the site where the data was obtained:
###http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##Here are the data for the project: 
###https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##You should create one R script called run_analysis.R that does the following. 
###1. Merges the training and the test sets to create one data set.
###2.Extracts only the measurements on the mean and standard deviation for each 
###measurement.
###3. Uses descriptive activity names to name the activities in the data set
###4. Appropriately labels the data set with descriptive variable names.
###5. From the data set in step 4, creates a second, independent tidy data set 
###with the average of each variable for each activity and each subject.

##Please upload the tidy data set created in step 5 of the instructions. 
##Please upload your data set as a txt file created with write.table() using 
##row.name=FALSE (do not cut and paste a dataset directly into the text box, 
##as this may cause errors saving your submission).


#SCRIPTED SOLUTION:
##Important Note: steps are executed out of order from those identified in the
##the assignment, but are identified with labels corresponding to assignment.

##STEP 0: Set up -- load necessary packages, extract data, read in tables.
###Load Packages
library(data.table)
library(reshape2)
library(dplyr)

###Set file paths, URL, and file names of interest
Home <- getwd() #current working directory
unzHome <- file.path (home, "UCI HAR Dataset") #subdir created when file is unzipped
testHome <- file.path (unzhome, "test") #subdir created for test data
trainHome <- file.path (unzhome, "train") # subdir created for train data

###Set file URL path for data file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

###ID File Names for use in the remainder of the script
####Zipped data file obtained from fileURL
fileName <- "GCDProjectDataset.zip"

####Unzipped Files of interest
testFileName <- "X_test.txt" #Test set.
testSubjectIDsName <- "subject_test.txt" #Test labels -- subject IDs.
testActivityIDsName <- "y_test.txt" #Training labels -- activity IDs.

trainFileName <- "X_train.txt" #Training set.
trainSubjectIDsName <- "subject_train.txt" #Training labels -- subject IDs.
trainActivityIDsName <- "y_train.txt" #Training labels -- activity IDs

featuresName <- "features.txt" #List of all features -- variable names for test/train data sets.
activityLabelsName <- "activity_labels.txt" #Links activity ID with activity name.

####Check if zip file was already downloaded; if not download it.
if(!file.exists(filename)){
        setInternet2(use = TRUE)
        download.file(fileURL, destfile=fileName)  
}

###Check if file was already unzipped; if not unzip it.
if(!file.exists(unzHome)) {
        unzip(filename)
}

###Read data, Subject IDs, and Activity Labels files for test and train data into R.
####Read data tables from unzipped test and train files of interest into R by  
####using read.table function and converting the resulting data frame into a
####data table so data.table package functions can be applied.

testDT <- data.table(read.table(file.path(testHome,testFileName)))
testSubjectIDsDT <- data.table(read.table(file.path(testHome,testSubjectIDsName)))
testActivityIDsDT <- data.table(read.table(file.path(testHome,testActivityIDsName)))

trainDT <- data.table(read.table(file.path(trainHome,trainFileName)))
trainSubjectIDsDT <- data.table(read.table(file.path(trainHome,trainSubjectIDsName)))
trainActivityIDsDT <- data.table(read.table(file.path(trainHome,trainActivityIDsName)))

featuresDT <- data.table(read.table(file.path(unzHome,featuresName)))
activityLabelsDT <- data.table(read.table(file.path(unzHome,activityLabelsName)))
## STEP 0 (setup) COMPLETE


##STEP 1: Merge the training and the test sets to create one data set.
###Note: This accomplishes Step 3 and Step 4 as well in terms of renaming variables.
###Found it to be more intuitive to include this as part of the initial data merges, 
###before merging the larger data sets. Those aspects are labeled accordingly.

###RENAME VARIABLES using relationships gleaned from README
####Rename variables within SubjectIDs, ActivityIDs, & Activity Labels data tables
testSubjectIDsDT <- rename(testSubjectIDsDT, SubjectIDs = V1)
testActivityIDsDT <- rename(testActivityIDsDT, ActivityIDs = V1)
trainSubjectIDsDT <- rename(trainSubjectIDsDT, SubjectIDs = V1)
trainActivityIDsDT <- rename(trainActivityIDsDT, ActivityIDs = V1)
activityLabelsDT <- rename(activityLabelsDT, ActivityIDs = V1, ActivityNames = V2)

####Rename variables within test and train data tables using features table
####(Step 4 - rename variables)
featuresDTchar <- lapply(featuresDT,as.character) #change to character vectors for use in renaming
testDTrn <- setnames(testDT, names(testDT),featuresDTchar$V2) #(Step 4 - rename variables)
trainDTrn <- setnames(trainDT, names(trainDT),featuresDTchar$V2) #(Step 4 - rename variables)

###Merge ActivityIDs and ActivityLabels data tables into combined tables for test and train
setkey(testActivityIDsDT, ActivityIDs)
setkey(trainActivityIDsDT, ActivityIDs)
setkey(activityLabelsDT, ActivityIDs)

####(Step 3 - add activity names)
testActivityIDsLabelsDT <- merge(testActivityIDsDT, activityLabelsDT) #(Step 3 - add activity names)
trainActivityIDsLabelsDT <- merge(trainActivityIDsDT, activityLabelsDT) #(Step 3 - add activity names)

###Cbind test subjectIDs, activityIDsLabels, DTrn data tables into single data table --> testMergedDT
testMergedDT <- cbind(testSubjectIDsDT,testActivityIDsLabelsDT, testDTrn)

###Cbind train subjectIDs, activityIDsLabels, DTrn data tables into single data table --> trainMergedDT
trainMergedDT <- cbind(trainSubjectIDsDT,trainActivityIDsLabelsDT, trainDTrn)

###Rbind testMerged adn trainMerged data tables into single data table --> mergedDT
mergedDT <- rbind(testMergedDT, trainMergedDT)
## STEP 1 (and Step 3 and Step 4) COMPLETE


##STEP 2: Extract only the following for each measurement: mean [mean()] and 
##standard deviation [std()]

###Select only SubjectIDs, ActivityIDs, ActivityNames, and columns containing
##either "mean" or "std"
mergedDT_meanstd <- select(mergedDT, SubjectIDs, ActivityNames, 
                           contains("mean"), contains("std"))
mergedDT_meanstdSorted <- arrange(mergedDT_meanstd, SubjectIDs, ActivityNames)

##STEP 2 COMPLETE


##STEP 3: Use descriptive activity names to name the activities in the data set.
###Accomplished as part of STEP 1 group above - denoted with "(Step 3 - add activity names)"
###Found it to be more intuitive to update names prior to merging the larger data sets
###and subsetting (i.e., before manipulation begins to reduce chance of unintended
###resort or change of order of rows/columns).
##STEP 3 COMPLETE (as part of Step 1)


##STEP 4: Appropriately label the data set with descriptive variable names.
###Accomplished as part of STEP 1 group above - denoted with "(Step 4 - rename variables)".
###Found it to be more intuitive to update names prior to merging the larger data sets
###and subsetting (i.e., before manipulation begins to reduce chance of unintended
###resort or change of order of rows/columns).
##STEP 4 COMPLETE (as part of Step 1)

##STEP 5: From the data set in step 4, create a second, independent tidy data set 
##with the average of each variable for each activity and each subject.
tidyData <- mergedDT_meanstdSorted %>% 
        group_by(SubjectIDs, ActivityNames) %>% 
        summarise_each(funs(mean(., na.rm = TRUE)))

##STEP 5 COMPLETE


##STEP 6 -- write tidy data from STEP 5 to txt file created with write.table() 
##using row.name=FALSE
###Intentionally allowing overwrite of file content even if exists already.
tidyDataName <- "GCDCourseProjectTidyDataOutput.txt"
outputPath <- file.path(home,tidyDataName)
write.table(tidyData, outputPath, row.name=FALSE)
##STEP 6 COMPLETE

##SCRIPTED SOLUTION COMPLETE

#Course Project for Getting and Cleaning Data Complete