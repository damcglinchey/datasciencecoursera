# Code Book for data frames output by clean_UCI_HAR_dataset() in run_analysis.R

This file describes data subsetted from the "Human Activity Recognition Using Smartphone Data" from the UCI Machine Learning Repository (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), further referred to as "UCI HAR".

## Study Design

The input data for this study can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and comes from the UCI Machine Learning Repository. The data comes from analysis of accelerometer and gyroscope 3-axial raw signals from 30 subjects between the ages 19-48 performing 6 activities. These sensor signals were pre-processed by applying noise filters and then sampling in fixed-width sliding windows. For more details, see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The above study contains a "test" and "train" sample of data on 128 variables from 30 subjects. Here both the test and train data sets are merged into one data sample.

In the data sample a set of variables were estimated from each of the 33 processed signals. Each of the 33 processed signals are described later. Of the set of variables estimated from these signals included in the UCI HAR data, two were chosen. The `mean()` and `std()` of each signal was selected for each subject, activity, and data point.

After obtaining this subset of the UCI HAR data, the average value of each of the 66 variables (33 signals for each mean and std) was computed for each activity performed by a subject. This gives a final sample of 6 activities x 30 subjects for each of 33 signals x 2 variables (66 by 180).

A description of the output data format and variables is defined below.

## Code book

The study described above produces two data tables. The first, labeled "FullData" here, contains variables for each measurement recorded for each subject and activity. The second data table, labeled "SummaryData" here, contains the mean values of each variable in FullData calculated for each subject and activity.

The below description of the signals is taken from `feautres_info.txt` included in the UCI HAR data.

 > The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

 > Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

 > Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

 > These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Here "body" refers to results due to actions of the subject, rather than passive forces, such as gravity.

### FullData

- SubjectID: ID of the subject, ranging from 1-3: 
- Activity:  Name of the Activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
- tBodyAcc.mean.X: Mean of acceleration due to the body in the X direction over time
- tBodyAcc.mean.Y: Mean of acceleration due to the body in the Y direction over time
- tBodyAcc.mean.Z: Mean of the acceleration due to the body in the Z direction over time
- tGravityAcc.mean.X: Mean of the acceleration due to gravity in the X direction over time
- tGravityAcc.mean.Y: Mean of the acceleration due to gravity in the Y direction over time
- tGravityAcc.mean.Z: Mean of the acceleration due to gravity in the Z direction over time 
- tBodyAccJerk.mean.X: Mean of the jerk due to the body in the X direction over time 
- tBodyAccJerk.mean.Y: Mean of the jerk due to the body in the Y direction over time
- tBodyAccJerk.mean.Z: Mean of the jerk due to the body in the Z direction over time
- tBodyGyro.mean.X: Mean of the angular acceleration due to the body in the X direction over time
- tBodyGyro.mean.Y: Mean of the angular acceleration due to the body in the Y direction over time
- tBodyGyro.mean.Z: Mean of the angular acceleration due to the body in the Z direction over time 
- tBodyGyroJerk.mean.X: Mean of the angular jerk due to the body in the X direction over time
- tBodyGyroJerk.mean.Y: Mean of the angular jerk due to the body in the Y direction over time
- tBodyGyroJerk.mean.Z: Mean of the angular jerk due to the body in the Z direction over time
- tBodyAccMag.mean: Mean of the magnitude of the acceleration vector due to the body over time
- tGravityAccMag.mean: Mean of the magnitude of the acceleration vector due to gravity over time
- tBodyAccJerkMag.mean: Mean of the magnitude of the jerk vector due to the body over time
- tBodyGyroMag.mean: Mean of the magnitude of the angular acceleration vector due to the body over time
- tBodyGyroJerkMag.mean: Mean of the magnitude of the angular jerk vector due to the body over time
- fBodyAcc.mean.X: Mean of the frequency determined from a FFT of the acceleration due to the body in the X direction
- fBodyAcc.mean.Y: Mean of the frequency determined from a FFT of the acceleration due to the body in the Y direction
- fBodyAcc.mean.Z: Mean of the frequency determined from a FFT of the acceleration due to the body in the Z direction
- fBodyAccJerk.mean.X: Mean of the frequency determined from a FFT of the jerk due to the body in the X direction
- fBodyAccJerk.mean.Y: Mean of the frequency determined from a FFT of the jerk due to the body in the Y direction
- fBodyAccJerk.mean.Z: Mean of the frequency determined from a FFT of the jerk due to the body in the Z direction
- fBodyGyro.mean.X: Mean of the frequency determined from a FFT of the angular acceleration due to the body in the X direction
- fBodyGyro.mean.Y: Mean of the frequency determined from a FFT of the angular acceleration due to the body in the Y direction
- fBodyGyro.mean.Z: Mean of the frequency determined from a FFT of the angular acceleration due to the body in the Z direction
- fBodyAccMag.mean: Mean of the frequency determined from a FFT of the magnitude of the acceleration vector due to the body
- fBodyBodyAccJerkMag.mean: Mean of the frequency determined from a FFT of the magnitude of the jerk vector due to the body
- fBodyBodyGyroMag.mean: Mean of the frequency determined from a FFT of the magnitude of the angular acceleration vector due to the body
- fBodyBodyGyroJerkMag.mean: Mean of the frequency determined from a FFT of the magnitude of the angular jerk due to the body
- tBodyAcc.std.X: Standard deviation of acceleration due to the body in the X direction over time
- tBodyAcc.std.Y: Standard deviation of acceleration due to the body in the Y direction over time
- tBodyAcc.std.Z: Standard deviation of the acceleration due to the body in the Z direction over time
- tGravityAcc.std.X: Standard deviation of the acceleration due to gravity in the X direction over time
- tGravityAcc.std.Y: Standard deviation of the acceleration due to gravity in the Y direction over time
- tGravityAcc.std.Z: Standard deviation of the acceleration due to gravity in the Z direction over time 
- tBodyAccJerk.std.X: Standard deviation of the jerk due to the body in the X direction over time 
- tBodyAccJerk.std.Y: Standard deviation of the jerk due to the body in the Y direction over time
- tBodyAccJerk.std.Z: Standard deviation of the jerk due to the body in the Z direction over time
- tBodyGyro.std.X: Standard deviation of the angular acceleration due to the body in the X direction over time
- tBodyGyro.std.Y: Standard deviation of the angular acceleration due to the body in the Y direction over time
- tBodyGyro.std.Z: Standard deviation of the angular acceleration due to the body in the Z direction over time 
- tBodyGyroJerk.std.X: Standard deviation of the angular jerk due to the body in the X direction over time
- tBodyGyroJerk.std.Y: Standard deviation of the angular jerk due to the body in the Y direction over time
- tBodyGyroJerk.std.Z: Standard deviation of the angular jerk due to the body in the Z direction over time
- tBodyAccMag.std: Standard deviation of the magnitude of the acceleration vector due to the body over time
- tGravityAccMag.std: Standard deviation of the magnitude of the acceleration vector due to gravity over time
- tBodyAccJerkMag.std: Standard deviation of the magnitude of the jerk vector due to the body over time
- tBodyGyroMag.std: Standard deviation of the magnitude of the angular acceleration vector due to the body over time
- tBodyGyroJerkMag.std: Standard deviation of the magnitude of the angular jerk vector due to the body over time
- fBodyAcc.std.X: Standard deviation of the frequency determined from a FFT of the acceleration due to the body in the X direction
- fBodyAcc.std.Y: Standard deviation of the frequency determined from a FFT of the acceleration due to the body in the Y direction
- fBodyAcc.std.Z: Standard deviation of the frequency determined from a FFT of the acceleration due to the body in the Z direction
- fBodyAccJerk.std.X: Standard deviation of the frequency determined from a FFT of the jerk due to the body in the X direction
- fBodyAccJerk.std.Y: Standard deviation of the frequency determined from a FFT of the jerk due to the body in the Y direction
- fBodyAccJerk.std.Z: Standard deviation of the frequency determined from a FFT of the jerk due to the body in the Z direction
- fBodyGyro.std.X: Standard deviation of the frequency determined from a FFT of the angular acceleration due to the body in the X direction
- fBodyGyro.std.Y: Standard deviation of the frequency determined from a FFT of the angular acceleration due to the body in the Y direction
- fBodyGyro.std.Z: Standard deviation of the frequency determined from a FFT of the angular acceleration due to the body in the Z direction
- fBodyAccMag.std: Standard deviation of the frequency determined from a FFT of the magnitude of the acceleration vector due to the body
- fBodyBodyAccJerkMag.std: Standard deviation of the frequency determined from a FFT of the magnitude of the jerk vector due to the body
- fBodyBodyGyroMag.std: Standard deviation of the frequency determined from a FFT of the magnitude of the angular acceleration vector due to the body
- fBodyBodyGyroJerkMag.std: Standard deviation of the frequency determined from a FFT of the magnitude of the angular jerk due to the body


### SummaryData

- SubjectID: ID of the subject, ranging from 1-30
- Activity: Name of the Activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- mean.tBodyAcc.mean.X: Mean of the mean acceleration due to the body in the X direction over time for a given subject and activity
- mean.tBodyAcc.mean.Y: Mean of the mean acceleration due to the body in the Y direction over time for a given subject and activity
- mean.tBodyAcc.mean.Z: Mean of the mean acceleration due to the body in the Z direction over time for a given subject and activity
- mean.tGravityAcc.mean.X: Mean of the mean acceleration due to gravity in the X direction over time for a given subject and activity
- mean.tGravityAcc.mean.Y: Mean of the mean acceleration due to gravity in the Y direction over time for a given subject and activity
- mean.tGravityAcc.mean.Z: Mean of the mean acceleration due to gravity in the Z direction over time  for a given subject and activity
- mean.tBodyAccJerk.mean.X: Mean of the mean jerk due to the body in the X direction over time  for a given subject and activity
- mean.tBodyAccJerk.mean.Y: Mean of the mean jerk due to the body in the Y direction over time for a given subject and activity
- mean.tBodyAccJerk.mean.Z: Mean of the mean jerk due to the body in the Z direction over time for a given subject and activity
- mean.tBodyGyro.mean.X: Mean of the mean angular acceleration due to the body in the X direction over time for a given subject and activity
- mean.tBodyGyro.mean.Y: Mean of the mean angular acceleration due to the body in the Y direction over time for a given subject and activity
- mean.tBodyGyro.mean.Z: Mean of the mean angular acceleration due to the body in the Z direction over time  for a given subject and activity
- mean.tBodyGyroJerk.mean.X: Mean of the mean angular jerk due to the body in the X direction over time for a given subject and activity
- mean.tBodyGyroJerk.mean.Y: Mean of the mean angular jerk due to the body in the Y direction over time for a given subject and activity
- mean.tBodyGyroJerk.mean.Z: Mean of the mean angular jerk due to the body in the Z direction over time for a given subject and activity
- mean.tBodyAccMag.mean: Mean of the mean magnitude of the acceleration vector due to the body over time for a given subject and activity
- mean.tGravityAccMag.mean: Mean of the mean magnitude of the acceleration vector due to gravity over time for a given subject and activity
- mean.tBodyAccJerkMag.mean: Mean of the mean magnitude of the jerk vector due to the body over time for a given subject and activity
- mean.tBodyGyroMag.mean: Mean of the mean magnitude of the angular acceleration vector due to the body over time for a given subject and activity
- mean.tBodyGyroJerkMag.mean: Mean of the mean magnitude of the angular jerk vector due to the body over time for a given subject and activity
- mean.fBodyAcc.mean.X: Mean of the mean frequency determined from a FFT of the acceleration due to the body in the X direction for a given subject and activity
- mean.fBodyAcc.mean.Y: Mean of the mean frequency determined from a FFT of the acceleration due to the body in the Y direction for a given subject and activity
- mean.fBodyAcc.mean.Z: Mean of the mean frequency determined from a FFT of the acceleration due to the body in the Z direction for a given subject and activity
- mean.fBodyAccJerk.mean.X: Mean of the mean frequency determined from a FFT of the jerk due to the body in the X direction for a given subject and activity
- mean.fBodyAccJerk.mean.Y: Mean of the mean frequency determined from a FFT of the jerk due to the body in the Y direction for a given subject and activity
- mean.fBodyAccJerk.mean.Z: Mean of the mean frequency determined from a FFT of the jerk due to the body in the Z direction for a given subject and activity
- mean.fBodyGyro.mean.X: Mean of the mean frequency determined from a FFT of the angular acceleration due to the body in the X direction for a given subject and activity
- mean.fBodyGyro.mean.Y: Mean of the mean frequency determined from a FFT of the angular acceleration due to the body in the Y direction for a given subject and activity
- mean.fBodyGyro.mean.Z: Mean of the mean frequency determined from a FFT of the angular acceleration due to the body in the Z direction for a given subject and activity
- mean.fBodyAccMag.mean: Mean of the mean frequency determined from a FFT of the magnitude of the acceleration vector due to the body for a given subject and activity
- mean.fBodyBodyAccJerkMag.mean: Mean of the mean frequency determined from a FFT of the magnitude of the jerk vector due to the body for a given subject and activity
- mean.fBodyBodyGyroMag.mean: Mean of the mean frequency determined from a FFT of the magnitude of the angular acceleration vector due to the body for a given subject and activity
- mean.fBodyBodyGyroJerkMag.mean: Mean of the mean frequency determined from a FFT of the magnitude of the angular jerk due to the body for a given subject and activity
- mean.tBodyAcc.std.X: Mean of the standard deviation of acceleration due to the body in the X direction over time for a given subject and activity
- mean.tBodyAcc.std.Y: Mean of the standard deviation of acceleration due to the body in the Y direction over time for a given subject and activity
- mean.tBodyAcc.std.Z: Mean of the standard deviation of the acceleration due to the body in the Z direction over time for a given subject and activity
- mean.tGravityAcc.std.X: Mean of the standard deviation of the acceleration due to gravity in the X direction over time for a given subject and activity
- mean.tGravityAcc.std.Y: Mean of the standard deviation of the acceleration due to gravity in the Y direction over time for a given subject and activity
- mean.tGravityAcc.std.Z: Mean of the standard deviation of the acceleration due to gravity in the Z direction over time  for a given subject and activity
- mean.tBodyAccJerk.std.X: Mean of the standard deviation of the jerk due to the body in the X direction over time  for a given subject and activity
- mean.tBodyAccJerk.std.Y: Mean of the standard deviation of the jerk due to the body in the Y direction over time for a given subject and activity
- mean.tBodyAccJerk.std.Z: Mean of the standard deviation of the jerk due to the body in the Z direction over time for a given subject and activity
- mean.tBodyGyro.std.X: Mean of the standard deviation of the angular acceleration due to the body in the X direction over time for a given subject and activity
- mean.tBodyGyro.std.Y: Mean of the standard deviation of the angular acceleration due to the body in the Y direction over time for a given subject and activity
- mean.tBodyGyro.std.Z: Mean of the standard deviation of the angular acceleration due to the body in the Z direction over time  for a given subject and activity
- mean.tBodyGyroJerk.std.X: Mean of the standard deviation of the angular jerk due to the body in the X direction over time for a given subject and activity
- mean.tBodyGyroJerk.std.Y: Mean of the standard deviation of the angular jerk due to the body in the Y direction over time for a given subject and activity
- mean.tBodyGyroJerk.std.Z: Mean of the standard deviation of the angular jerk due to the body in the Z direction over time for a given subject and activity
- mean.tBodyAccMag.std: Mean of the standard deviation of the magnitude of the acceleration vector due to the body over time for a given subject and activity
- mean.tGravityAccMag.std: Mean of the standard deviation of the magnitude of the acceleration vector due to gravity over time for a given subject and activity
- mean.tBodyAccJerkMag.std: Mean of the standard deviation of the magnitude of the jerk vector due to the body over time for a given subject and activity
- mean.tBodyGyroMag.std: Mean of the standard deviation of the magnitude of the angular acceleration vector due to the body over time for a given subject and activity
- mean.tBodyGyroJerkMag.std: Mean of the standard deviation of the magnitude of the angular jerk vector due to the body over time for a given subject and activity
- mean.fBodyAcc.std.X: Mean of the standard deviation of the frequency determined from a FFT of the acceleration due to the body in the X direction for a given subject and activity
- mean.fBodyAcc.std.Y: Mean of the standard deviation of the frequency determined from a FFT of the acceleration due to the body in the Y direction for a given subject and activity
- mean.fBodyAcc.std.Z: Mean of the standard deviation of the frequency determined from a FFT of the acceleration due to the body in the Z direction for a given subject and activity
- mean.fBodyAccJerk.std.X: Mean of the standard deviation of the frequency determined from a FFT of the jerk due to the body in the X direction for a given subject and activity
- mean.fBodyAccJerk.std.Y: Mean of the standard deviation of the frequency determined from a FFT of the jerk due to the body in the Y direction for a given subject and activity
- mean.fBodyAccJerk.std.Z: Mean of the standard deviation of the frequency determined from a FFT of the jerk due to the body in the Z direction for a given subject and activity
- mean.fBodyGyro.std.X: Mean of the standard deviation of the frequency determined from a FFT of the angular acceleration due to the body in the X direction for a given subject and activity
- mean.fBodyGyro.std.Y: Mean of the standard deviation of the frequency determined from a FFT of the angular acceleration due to the body in the Y direction for a given subject and activity
- mean.fBodyGyro.std.Z: Mean of the standard deviation of the frequency determined from a FFT of the angular acceleration due to the body in the Z direction for a given subject and activity
- mean.fBodyAccMag.std: Mean of the standard deviation of the frequency determined from a FFT of the magnitude of the acceleration vector due to the body for a given subject and activity
- mean.fBodyBodyAccJerkMag.std: Mean of the standard deviation of the frequency determined from a FFT of the magnitude of the jerk vector due to the body for a given subject and activity
- mean.fBodyBodyGyroMag.std: Mean of the standard deviation of the frequency determined from a FFT of the magnitude of the angular acceleration vector due to the body for a given subject and activity
- mean.fBodyBodyGyroJerkMag.std: Mean of the standard deviation of the frequency determined from a FFT of the magnitude of the angular jerk due to the body for a given subject and activity
