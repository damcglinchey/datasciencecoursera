# Code Book for data frames output by clean_UCI_HAR_dataset() in run_analysis.R

This file describes data subsetted from the "Human Activity Recognition Using Smartphone Data" from the UCI Machine Learning Repository (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), further referred to as "UCI HAR".

## Study Design

The input data for this study can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and comes from the UCI Machine Learning Repository. The data comes from analysis of accelerometer and gyroscope 3-axial raw signals from 30 subjects between the ages 19-48 performing 6 activities. These sensor signals were pre-processed by applying noise filters and then sampling in fixed-width sliding windows. For more details, see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The above study contains a "test" and "train" sample of data on 128 variables from 30 subjects. Here both the test and train data sets are merged into one data sample.

In the data sample a set of variables were estimated from each of the 33 processed signals. Each of the 33 processed signals are described later. Of the set of variables estimated from these signals included in the UCI HAR data, two were chosen. The `mean()` and `std()` of each signal was selected for each subject, activity, and datapoint.

After obtaining this subset of the UCI HAR data, the average value of each of the 66 variables (33 signals for each mean and std) was computed for each activity performed by a subject. This gives a final sample of 6 activities x 30 subjects for each of 33 signals x 2 variables (66 by 180).

A description of the output data format and variables is defined below.

## Code book

The study described above produces two data tables. The first, labelled "FullData" here, contains variables for each measurement recorded for each subject and activity. The second data table, labelled "SummaryData" here, contains the mean values of each variable in FullData calculated for each subject and activity.

The below description of the signals is taken from `feautres_info.txt` included in the UCI HAR data.

 > The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

 > Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

 > Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

 > These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### FullData

- SubjectID: ID of the subject, ranging from 1-3: 
- Activity:  Name of the Activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
- tBodyAcc.mean.X: 
- tBodyAcc.mean.Y: 
- tBodyAcc.mean.Z: 
- tGravityAcc.mean.X: 
- tGravityAcc.mean.Y: 
- tGravityAcc.mean.Z: 
- tBodyAccJerk.mean.X: 
- tBodyAccJerk.mean.Y: 
- tBodyAccJerk.mean.Z: 
- tBodyGyro.mean.X: 
- tBodyGyro.mean.Y: 
- tBodyGyro.mean.Z: 
- tBodyGyroJerk.mean.X: 
- tBodyGyroJerk.mean.Y: 
- tBodyGyroJerk.mean.Z: 
- tBodyAccMag.mean: 
- tGravityAccMag.mean: 
- tBodyAccJerkMag.mean: 
- tBodyGyroMag.mean: 
- tBodyGyroJerkMag.mean: 
- fBodyAcc.mean.X: 
- fBodyAcc.mean.Y: 
- fBodyAcc.mean.Z: 
- fBodyAccJerk.mean.X: 
- fBodyAccJerk.mean.Y: 
- fBodyAccJerk.mean.Z: 
- fBodyGyro.mean.X: 
- fBodyGyro.mean.Y: 
- fBodyGyro.mean.Z: 
- fBodyAccMag.mean: 
- fBodyBodyAccJerkMag.mean: 
- fBodyBodyGyroMag.mean: 
- fBodyBodyGyroJerkMag.mean: 
- tBodyAcc.std.X: 
- tBodyAcc.std.Y: 
- tBodyAcc.std.Z: 
- tGravityAcc.std.X: 
- tGravityAcc.std.Y: 
- tGravityAcc.std.Z: 
- tBodyAccJerk.std.X: 
- tBodyAccJerk.std.Y: 
- tBodyAccJerk.std.Z: 
- tBodyGyro.std.X: 
- tBodyGyro.std.Y: 
- tBodyGyro.std.Z: 
- tBodyGyroJerk.std.X: 
- tBodyGyroJerk.std.Y: 
- tBodyGyroJerk.std.Z: 
- tBodyAccMag.std: 
- tGravityAccMag.std: 
- tBodyAccJerkMag.std: 
- tBodyGyroMag.std: 
- tBodyGyroJerkMag.std: 
- fBodyAcc.std.X: 
- fBodyAcc.std.Y: 
- fBodyAcc.std.Z: 
- fBodyAccJerk.std.X: 
- fBodyAccJerk.std.Y: 
- fBodyAccJerk.std.Z: 
- fBodyGyro.std.X: 
- fBodyGyro.std.Y: 
- fBodyGyro.std.Z: 
- fBodyAccMag.std: 
- fBodyBodyAccJerkMag.std: 
- fBodyBodyGyroMag.std: 
- fBodyBodyGyroJerkMag.std": 

### SummaryData

"SubjectID" - ID of the subject, ranging from 1-30
"Activity" - Name of the Activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
"mean.tBodyAcc.mean.X"
"mean.tBodyAcc.mean.Y"
"mean.tBodyAcc.mean.Z"
"mean.tGravityAcc.mean.X"
"mean.tGravityAcc.mean.Y"
"mean.tGravityAcc.mean.Z"
"mean.tBodyAccJerk.mean.X"
"mean.tBodyAccJerk.mean.Y"
"mean.tBodyAccJerk.mean.Z"
"mean.tBodyGyro.mean.X"
"mean.tBodyGyro.mean.Y"
"mean.tBodyGyro.mean.Z"
"mean.tBodyGyroJerk.mean.X"
"mean.tBodyGyroJerk.mean.Y"
"mean.tBodyGyroJerk.mean.Z"
"mean.tBodyAccMag.mean"
"mean.tGravityAccMag.mean"
"mean.tBodyAccJerkMag.mean"
"mean.tBodyGyroMag.mean"
"mean.tBodyGyroJerkMag.mean"
"mean.fBodyAcc.mean.X"
"mean.fBodyAcc.mean.Y"
"mean.fBodyAcc.mean.Z"
"mean.fBodyAccJerk.mean.X"
"mean.fBodyAccJerk.mean.Y"
"mean.fBodyAccJerk.mean.Z"
"mean.fBodyGyro.mean.X"
"mean.fBodyGyro.mean.Y"
"mean.fBodyGyro.mean.Z"
"mean.fBodyAccMag.mean"
"mean.fBodyBodyAccJerkMag.mean"
"mean.fBodyBodyGyroMag.mean"
"mean.fBodyBodyGyroJerkMag.mean"
"mean.tBodyAcc.std.X"
"mean.tBodyAcc.std.Y"
"mean.tBodyAcc.std.Z"
"mean.tGravityAcc.std.X"
"mean.tGravityAcc.std.Y"
"mean.tGravityAcc.std.Z"
"mean.tBodyAccJerk.std.X"
"mean.tBodyAccJerk.std.Y"
"mean.tBodyAccJerk.std.Z"
"mean.tBodyGyro.std.X"
"mean.tBodyGyro.std.Y"
"mean.tBodyGyro.std.Z"
"mean.tBodyGyroJerk.std.X"
"mean.tBodyGyroJerk.std.Y"
"mean.tBodyGyroJerk.std.Z"
"mean.tBodyAccMag.std"
"mean.tGravityAccMag.std"
"mean.tBodyAccJerkMag.std"
"mean.tBodyGyroMag.std"
"mean.tBodyGyroJerkMag.std"
"mean.fBodyAcc.std.X"
"mean.fBodyAcc.std.Y"
"mean.fBodyAcc.std.Z"
"mean.fBodyAccJerk.std.X"
"mean.fBodyAccJerk.std.Y"
"mean.fBodyAccJerk.std.Z"
"mean.fBodyGyro.std.X"
"mean.fBodyGyro.std.Y"
"mean.fBodyGyro.std.Z"
"mean.fBodyAccMag.std"
"mean.fBodyBodyAccJerkMag.std"
"mean.fBodyBodyGyroMag.std"
"mean.fBodyBodyGyroJerkMag.std" 
