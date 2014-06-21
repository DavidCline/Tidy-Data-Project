CodeBook.md for Course Project in "Getting and Cleaning Data"
=============================================================

Tidy Data (notes on raw data are found below)
---------------------------------------------
The data found in tidyData.txt consist of 180 observations (rows) of 68 variables (columns) summarizing the averages of mean and standard deviation measurements for a range of accelerometer and gyroscope signals generated by Samsung Galaxy S II smartphones worn by 30 different research subjects performing 6 different activities of daily living: walking, walking upstairs, walking downstairs, sitting, standing and laying.  Each row is the record of a unique combination of activity (first column) and subject (second column) and the averaged mean and standard deviation estimations for the accelerometer and gyroscope signals by that particular subject during that particular activity.

Column 1, activityID, is a set of six activity names (walking, walking.upstairs, walking.downstairs, sitting, standing, laying) repeated 30 times each down the length of the column, once for each of the 30 subjects.  I modified these labels slightly from their original appearance in the raw data, converting them from upper to lower case, and replacing underscore separators with dot separators.

Column 2, subjectID, is a set of integers ranging from 1 to 30 to identify research subjects.  Each appears six times down the length of the column, once for each of the six activities they engaged in.

Columns 3 - 68 (66 in all), are averages of mean and standard deviation calculations for 33 accelerometer and gyroscope signal measurments originally recorded (33 x 2 = 66).
Their names are as follows are listed here:

time.BodyAcc.mean.X  
time.BodyAcc.mean.Y  
time.BodyAcc.mean.Z  
time.BodyAcc.std.X  
time.BodyAcc.std.Y  
time.BodyAcc.std.Z  
time.GravityAcc.mean.X  
time.GravityAcc.mean.Y  
time.GravityAcc.mean.Z  
time.GravityAcc.std.X  
time.GravityAcc.std.Y  
time.GravityAcc.std.Z  
time.BodyAccJerk.mean.X  
time.BodyAccJerk.mean.Y  
time.BodyAccJerk.mean.Z  
time.BodyAccJerk.std.X  
time.BodyAccJerk.std.Y  
time.BodyAccJerk.std.Z  
time.BodyGyro.mean.X  
time.BodyGyro.mean.Y  
time.BodyGyro.mean.Z  
time.BodyGyro.std.X  
time.BodyGyro.std.Y  
time.BodyGyro.std.Z  
time.BodyGyroJerk.mean.X  
time.BodyGyroJerk.mean.Y  
time.BodyGyroJerk.mean.Z  
time.BodyGyroJerk.std.X  
time.BodyGyroJerk.std.Y  
time.BodyGyroJerk.std.Z  
time.BodyAccMag.mean  
time.BodyAccMag.std  
time.GravityAccMag.mean  
time.GravityAccMag.std  
time.BodyAccJerkMag.mean  
time.BodyAccJerkMag.std  
time.BodyGyroMag.mean  
time.BodyGyroMag.std  
time.BodyGyroJerkMag.mean  
time.BodyGyroJerkMag.std  
frequency.BodyAcc.mean.X  
frequency.BodyAcc.mean.Y  
frequency.BodyAcc.mean.Z  
frequency.BodyAcc.std.X   
frequency.BodyAcc.std.Y  
frequency.BodyAcc.std.Z  
frequency.BodyAccJerk.mean.X  
frequency.BodyAccJerk.mean.Y  
frequency.BodyAccJerk.mean.Z  
frequency.BodyAccJerk.std.X  
frequency.BodyAccJerk.std.Y  
frequency.BodyAccJerk.std.Z  
frequency.BodyGyro.mean.X  
frequency.BodyGyro.mean.Y  
frequency.BodyGyro.mean.Z  
frequency.BodyGyro.std.X  
frequency.BodyGyro.std.Y  
frequency.BodyGyro.std.Z  
frequency.BodyAccMag.mean  
frequency.BodyAccMag.std  
frequency.BodyBodyAccJerkMag.mean  
frequency.BodyBodyAccJerkMag.std  
frequency.BodyBodyGyroMag.mean  
frequency.BodyBodyGyroMag.std  
frequency.BodyBodyGyroJerkMag.mean  
frequency.BodyBodyGyroJerkMag.std  

All these names were modified from the raw data by removing unwanted characters from a vector of names in features.txt.  These unwanted characters included characters that made the names less readable and were subject to misinterpretation by R.  They included dashes or minus signs and left right parenthesis pairs or functions indicators.

The values in these 66 columns were obtained by reshaping and recasting the data and summarizing with the mean() function using melt and dcast from the reshape 2 package.

These 66 variable are only a small subset of the 561 variables provided in the raw data set, but they are the only one respresenting pairs of mean and standard deviation estimations as requested in the course project instructions. The 33 signal measurements for which these pairs exist are shown below (each XYZ item counting as three tri-axial signals - see Raw Data below for details).

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

Please refer to my README.md file for details of the processing of the raw files to achieve the resulting tidy data set.


Raw Data
--------
Raw Data for this project were accessed via the following link in the course materials and were downloaded on June 14, 2014:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The zipped data files were obtained from the Machine Learning Repository at University of California at Irvine.  Their webpage for this raw data set, which they refer to as the UCI HAR (Human Activity Recognition) data set is:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

On this page UCI notes the original source of the data is Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto at Smartlab - Non Linear Complex Systems Laboratory, one of the Research Laboratories at the DITEN Department of the University of Genova, Italy.  They further note the data providers' citation request as:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

** Detailed descriptions of the zipped files included, and the raw data they contain are available at the websites noted above:

Here are some directly quoted portions of the researchers' README file describing the raw data set and the zipped files included:
---------------------------------------------------------------------------------------------------------------------------------

Human Activity Recognition Using Smartphones Dataset
Version 1.0

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNS                                                                                                                      TAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial                         angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of                         the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

*The researchers note that the feature (signal) measurments are "normalized and bounded within [-1,1]."*


Here are some direct quotes from features_info.txt, the researchers' description of the signals they measured and the values they estimated from them:
------------------------------------------------------------------------------------------------------------------------------------------------------
Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  






