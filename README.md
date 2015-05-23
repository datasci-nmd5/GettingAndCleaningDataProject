# GettingAndCleaningDataProject
Repository for the Getting and Cleaning Data Course Project

# Assignment
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).

# Repo Files and Scripts
## README.md
### Format
Markdown file.

### Purpose
To describe the intent of the project and the files included within this repository to fulfill the objectives of the project.

### Use
Read the file with a text editor.

## run_analysis.R
### Format
R Script

### Purpose
To accomplish the stated assignment objectives above and return the tidy data set created in Step 5.

### Use
1. User must have the following R packages installed on their computer (install.packages()) and available for sourcing into R via the script:
  + data.table
  + reshape2
  + dplyr
2. User must ensure their R console is open to their preferred working directory (setwd()) - what that is is inconsequential to the script.
3. User must source the run_analysis.R script into R.
4. The script will run and write the tidy data set described in Step 5 as "GCDCourseProjectTidyDataOutput.txt" to the working directory.

* Note: It is not required that the user download and unzip the files used as source data for the project, but is not hindered if the user does so. The script will check to see if the zipped and unzipped files exist in the working and appropriate subdirectories. If they do, it will skip repetition of the download and unzipping actions and proceed directly to reading in the existing files. If they do not, it will download and unzip them itself before proceeding.

### Outputs
GCDCourseProjectTidyDataOutput.txt, which includes a tidy set of the means of each of the various mean and standard deviation measurements, grouped by Subject ID and Activity Name.


## CodeBook.md
### Format
Markdown file.

### Purpose
To describe the variables, the data, and any transformations or work that are performed by the script to clean up the data.

### Use
Read the file with a text editor.



