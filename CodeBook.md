# GettingAndCleaningDataProject - Code Book
Code Book for the Getting and Cleaning Data Course Project

# Sections
Sections within this document are as follows:
* Assignment
* Study Design
  * Inputs
    * R Packages
    * General Files
    * Specific Files
  * Data Manipulation
  * Outputs
* Code Book
  * General Data Overview
    * Measurements
    * Preprocessing
  * Raw Variables
  * Tidy Variables
    * <Variable Name for each variable>
      * Description
      * Values
      * Units

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

# Study Design
The description in the Assignment section offers an overview of the basic steps taken to transition the data from the raw to the tidy data set, but more specific details as to the approach are included here. 

## Inputs
### R Packages
The following R packages are required to execute the run_analysis.R script:
1. data.table
2. reshape2
3. dplyr

### General Files
The zipped file containing both raw and manipulated data files as well as documentation can be found at the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Specific Files
Once the file from the URL specified in the General Inputs section is downloaded and uzipped, the following files are used by the run_analysis.R script:
1. "X_test.txt" -- Test data set.
2. "subject_test.txt" -- Subject IDs for the test data set.
3. "y_test.txt" -- Activity IDs for the test data set.
4. "X_train.txt" -- Training data set.
5. "subject_train.txt" -- Subject IDs for the training data set
6. "y_train.txt" -- Activity IDs for the training data set
7. "features.txt" -- Variable names for the test/train data sets.
8. "activity_labels.txt" -- Links Activity IDs with Activity Names.

## Data Manipulation
For complete details, please review the documentation included with the downloaded and unzipped dataset for the manipulation conducted on the files used for this analysis and the documentation within the run_analysis.R script for the precise manipulations accomplished therein. A summary of the manipulation of the Specific Files used as inputs for the run_analysis.R script is as follows.

Using the files identified in the Specific Files subsection of the Inputs section of this document, the following actions are performed to create and output a tidy data set:
1. Variables were renamed with the appropriate names, per the file descriptions themselves and linkages provided in the features.txt and activity_labels.txt.
2. SubjectIDs, ActivityIDs&Names, data sets were merged into a single table each for the test data and the training data.
3. The resulting test data table and training table were then merged together into a single data table for analysis.
4. Using this single merged data table, another table was then created that contained only the Subject IDs, the Activity Names, and the measurement variables containing either "mean" or "std" (for standard deviation) in their variable names.
5. Using this subsetted data table, the tidy data set was then produced by taking the mean of each of the individual measurement variables as grouped by Subject ID and Activity Name.
6. This tidy data table is written to a file entitled "GCDCourseProjectTidyDataOutput.txt" within the user's working directory.

## Outputs
1. "GCDCourseProjectTidyDataOutput.txt" -- Includes a tidy set of the means of each of the various mean and standard deviation measurements, grouped by Subject ID and Activity Name. Detailed information on the variables within can be located within the Tidy Data Variables section within this document.

# Code Book
## General Data Overview
In all cases, it is recommended that the reader review the original documentation provided with the files downloaded and unzipped from the URL found in the Study Design/Inputs/General Files section of this document for the original descriptions of all variables. The data contained herein is an interpreted summarization of those documents. The "README.txt" and "features_info.txt", in particular, should prove informative and precise.
The data used to produce the variables in subsequent subsections was measured and pre-processed as follows.

### Measurements
* The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years.
* Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
* Using its embedded accelerometer and gyroscope, the experimenters captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
* The experiments were video-recorded to label the data manually.
* The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Preprocessing
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
* The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
     + These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
     + Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
     + Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
* Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
* Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
* Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
* These signals were used to estimate variables of the feature vector for each pattern, and '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

This data was then further processed in the run_analysis.R script by taking the mean for each measurement variable representing a mean or standard deviation, when grouped by Subject ID and Activity Name.

## Raw Data Variables
A full description of the full set of the raw data variables can be located within the various documents that will be downloaded and unzipped as part of the script to the "UCI HAR Dataset" subdirectory (and its subdirectories) within your working directory. The "README.txt" and "features_info.txt", in particular, should prove informative.

## Tidy Data Variables
### SubjectIDs
#### Description
Identifies the subject who performed the activity for each window sample.
#### Values
Integer ranging 1-30
#### Units
N/A

### ActivityNames
#### Description
Label/description of the activity performed for each window sample.
#### Values
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING
#### Units
N/A

### tBodyAcc-mean()-X
#### Description
Mean of the time domain signal measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAcc-mean()-Y
#### Description
Mean of the time domain signal measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAcc-mean()-Z
#### Description
Mean of the time domain signal measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tGravityAcc-mean()-X
#### Description
Mean of the time domain signal measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tGravityAcc-mean()-Y
#### Description
Mean of the time domain signal measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tGravityAcc-mean()-Z
#### Description
Mean of the time domain signal measuring the gravity linear accelerationduring the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAccJerk-mean()-X
#### Description
Mean of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAccJerk-mean()-Y
#### Description
Mean of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAccJerk-mean()-Z
#### Description
Mean of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyro-mean()-X
#### Description
Mean of the time domain signal measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyro-mean()-Y
#### Description
Mean of the time domain signal measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyro-mean()-Z
#### Description
Mean of the time domain signal measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyroJerk-mean()-X
#### Description
Mean of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyroJerk-mean()-Y
#### Description
Mean of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyroJerk-mean()-Z
#### Description
Mean of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAccMag-mean()
#### Description
Mean of the magnitudes of the time domain signal measuring the body linear acceleration during the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tGravityAccMag-mean()
#### Description
Mean of the magnitudes of the time domain signal measuring the gravity linear accelerationduring the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAccJerkMag-mean()
#### Description
Mean of the magnitudes of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyroMag-mean()
#### Description
Mean of the magnitudes of the time domain signal measuring the body linear acceleration during the designated activity per the gyroscope.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyroJerkMag-mean()
#### Description
Mean of the magnitudes of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the gyroscope.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAcc-mean()-X
#### Description
Mean of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAcc-mean()-Y
#### Description
Mean of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAcc-mean()-Z
#### Description
Mean of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAcc-meanFreq()-X
#### Description
Weighted average of the frequency components to obtain a mean frequency of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAcc-meanFreq()-Y
#### Description
Weighted average of the frequency components to obtain a mean frequency of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAcc-meanFreq()-Z
#### Description
Weighted average of the frequency components to obtain a mean frequency of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccJerk-mean()-X
#### Description
Mean of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccJerk-mean()-Y
#### Description
Mean of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccJerk-mean()-Z
#### Description
Mean of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccJerk-meanFreq()-X
#### Description
Weighted average of the frequency components to obtain a mean frequency of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccJerk-meanFreq()-Y
#### Description
Weighted average of the frequency components to obtain a mean frequency of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccJerk-meanFreq()-Z
#### Description
Weighted average of the frequency components to obtain a mean frequency of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyGyro-mean()-X
#### Description
Mean of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyGyro-mean()-Y
#### Description
Mean of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyGyro-mean()-Z
#### Description
Mean of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyGyro-meanFreq()-X
#### Description
Weighted average of the frequency components to obtain a mean frequency of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyGyro-meanFreq()-Y
#### Description
Weighted average of the frequency components to obtain a mean frequency of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyGyro-meanFreq()-Z
#### Description
Weighted average of the frequency components to obtain a mean frequency of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccMag-mean()
#### Description
Mean of the magnitudes of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccMag-meanFreq()
#### Description
Weighted average of the frequency components to obtain a mean frequency of the magnitudes of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyBodyAccJerkMag-mean()
#### Description
Mean of the magnitudes of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyBodyAccJerkMag-meanFreq()
#### Description
Weighted average of the frequency components to obtain a mean frequency of the magnitudes of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyBodyGyroMag-mean()
#### Description
Mean of the magnitudes of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyBodyGyroMag-meanFreq()
#### Description
Weighted average of the frequency components to obtain a mean frequency of the magnitudes of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyBodyGyroJerkMag-mean()
#### Description
Mean of the magnitudes of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyBodyGyroJerkMag-meanFreq()
#### Description
Weighted average of the frequency components to obtain a mean frequency of the magnitudes of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### angle(tBodyAccMean,gravity)
#### Description
Mean of the angle() vector between the specified signals which themselves are represented by additional vectors obtained by averaging the signals in a signal window samples.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians.

### angle(tBodyAccJerkMean),gravityMean)
#### Description
Mean of the angle() vector between the specified signals which themselves are represented by additional vectors obtained by averaging the signals in a signal window samples.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians.

### angle(tBodyGyroMean,gravityMean)
#### Description
Mean of the angle() vector between the specified signals which themselves are represented by additional vectors obtained by averaging the signals in a signal window samples.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians.

### angle(tBodyGyroJerkMean,gravityMean)
#### Description
Mean of the angle() vector between the specified signals which themselves are represented by additional vectors obtained by averaging the signals in a signal window samples.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians.

### angle(X,gravityMean)
#### Description
Mean of the angle() vector between the specified signals which themselves are represented by additional vectors obtained by averaging the signals in a signal window samples.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians.

### angle(Y,gravityMean)
#### Description
Mean of the angle() vector between the specified signals which themselves are represented by additional vectors obtained by averaging the signals in a signal window samples.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians.

### angle(Z,gravityMean)
#### Description
Mean of the angle() vector between the specified signals which themselves are represented by additional vectors obtained by averaging the signals in a signal window samples.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians.

### tBodyAcc-std()-X
#### Description
Standard Deviation of the time domain signal measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAcc-std()-Y
#### Description
Standard Deviation of the time domain signal measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAcc-std()-Z
#### Description
Standard Deviation of the time domain signal measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tGravityAcc-std()-X
#### Description
Standard Deviation of the time domain signal measuring the gravity linear accelerationduring the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tGravityAcc-std()-Y
#### Description
Standard Deviation of the time domain signal measuring the gravity linear accelerationduring the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tGravityAcc-std()-Z
#### Description
Standard Deviation of the time domain signal measuring the gravity linear accelerationduring the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAccJerk-std()-X
#### Description
Standard Deviation of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAccJerk-std()-Y
#### Description
Standard Deviation of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAccJerk-std()-Z
#### Description
Standard Deviation of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyro-std()-X
#### Description
Standard Deviation of the time domain signal measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyro-std()-Y
#### Description
Standard Deviation of the time domain signal measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyro-std()-Z
#### Description
Standard Deviation of the time domain signal measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyroJerk-std()-X
#### Description
Standard Deviation of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyroJerk-std()-Y
#### Description
Standard Deviation of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyroJerk-std()-Z
#### Description
Standard Deviation of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAccMag-std()
#### Description
Standard Deviation of the magnitudes of the time domain signal measuring the body linear acceleration during the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tGravityAccMag-std()
#### Description
Standard Deviation of the magnitudes of the time domain signal measuring the gravity linear accelerationduring the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyAccJerkMag-std()
#### Description
Standard Deviation of the magnitudes of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyroMag-std()
#### Description
Standard Deviation of the magnitudes of the time domain signal measuring the body linear acceleration during the designated activity per the gyroscope.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### tBodyGyroJerkMag-std()
#### Description
Standard Deviation of the magnitudes of the jerk signals derived over time by measuring the body linear acceleration during the designated activity per the gyroscope.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAcc-std()-X
#### Description
Standard Deviation of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAcc-std()-Y
#### Description
Standard Deviation of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAcc-std()-Z
#### Description
Standard Deviation of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccJerk-std()-X
#### Description
Standard Deviation of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccJerk-std()-Y
#### Description
Standard Deviation of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccJerk-std()-Z
#### Description
Standard Deviation of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyGyro-std()-X
#### Description
Standard Deviation of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the X direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyGyro-std()-Y
#### Description
Standard Deviation of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Y direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyGyro-std()-Z
#### Description
Standard Deviation of the frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope for the axial signal in the Z direction.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyAccMag-std()
#### Description
Standard Deviation of the magnitudes of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyBodyAccJerkMag-std()
#### Description
Standard Deviation of the magnitudes of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the accelerometer.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyBodyGyroMag-std()
#### Description
Standard Deviation of the magnitudes of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

### fBodyBodyGyroJerkMag-std()
#### Description
Standard Deviation of the magnitudes of the jerk signals derived from frequency domain signals per an applied Fast Fourier Transform (FFT) measuring the body linear acceleration during the designated activity per the gyroscope.
#### Values
Features are normalized and bounded within [-1,1].
#### Units
Radians/second.

