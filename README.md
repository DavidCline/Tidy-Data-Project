README.md for Course Project in "Getting and Cleaning Data"
===========================================================

My GitHub repo for this course project includes an R script in a file called "run_analysis.R".
When executed in R, it will produce as required by the instructions a tidy data set called tidyData and also write that data set to the working directory as a text file called "tidyData.txt". This resulting text file is the one I uploaded to Coursera as required by the course project instructions.

The R script, "run_analysis.R", is well commented and hopefully reads well as formatted.  But I will review here the steps I take in the script to get from the UCI HAR files to the final tidy data output.

NOTE: The script assumes that all the required Samsung Galaxy data files from UCI HAR (x_test.txt , y_test.txt, subject_test.txt, x_train.txt, y_train.txt, subject_train.txt, activity_labels.txt, and features.txt ) are present in the working directory.  This is consistent with the instructions for the project.

The script covers six major steps in processing: 1) read in and merge the data sets, 2) clean up and add the activity labels, 3) clean up and add the variable names, 4) subset the columns for only means and standard deviations, 5) summarize the table by mean, and 6) write the result to a text file.

In Step 1 - READ IN AND MERGE DATA SETS, I read in the file of measurement data, the file containing activity ID numbers, and the file containing subject ID numbers and add the ID information to the data file using a column binding operation.  I do this for the test group and then for the train group. Following that I merge the test and train data set as required by course instructions by stacking one set on top of the other with a row binding operation.

In Step 2 - CLEAN UP AND ADD ACTIVITY LABELS, I read in the activity labels and then convert them to lowercase and convert the separator used in two of the labels from underscore to a dot.  This makes these labels more consistent with the other strings in the data set, the variable names.  Then I add the activity labels to the main data file with a merge operation.  Before all of this I added an index sequence to the main data file that I use in a sorting operation (order() function) at the end to ensure that I have maintained the correct sort order through the merge process.  Before moving on, the script removes two extraneous columns in the data file: the index sequence column and the column of activity IDs which are no longer needed as they have been replaced by activity names.  This fulfills the requirement in the instructions to provide descriptive activity names (standing, laying, etc.).

In Step 3 - CLEAN UP AND ADD VARIABLE NAMES, after reading in the features.txt file containing the variable names, I add the names for the first columns, activityID and subjectID, to the vector of variable names (as.character). Now we have a vector of 563 strings, many of which contain odd or reserved (in R) characters.  I use the make.names() function to make them consistent with proper R syntax. This creates some dot sequences (three periods in a row).  I remove all but one period in these cases with a gsub operation.  The final change I make is to spell out the initial characters, "time" for t, and "frequency" for f.  This makes them a little less cryptic and leaves them in a reasonably readable state, appropriate as per course instructions.  I could have expanded them further which might make them more clearly descriptive but they are long already and further changes could lead to impractically long names.  The last operation here is to replace the "V1", "V2", etc. column names in the data file with this improved vector of names.

In Step 4 - SUBSET COLUMNS FOR MEANS AND STANDARD DEVIATIONS, I select and retain only the columns with mean and standard deviation measurements, as required in the instructions for the project.  I interpreted this as requiring the mean and standard deviation pairs for the 33 signal measurements (each XYZ item counting as three signals) listed in UCI HAR's features_info.txt file, reproduced here:

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

I selected mean and standard deviation columns with a grepl() operation using regular expressions, followed by a subset() operation to eliminate columns with "meanFreq" in their names.  At this point I am left with a data frame with 10,299 rows and 68 columns (the 33x2 mean and standard deviation pairs plus ID columns for activities and subjects.)

In Step 5 - SUMMARIZE BY MEAN, I complete the fifth course project instruction by creating the final tidy data set that summarizes the data by averages for all combinations of signal variable, subject and activity.  This tidy data set is a data frame with 180 rows (30 rows each - for the 30 subjects - times 6 activities) and 68 columns (one each for activity and subject plus the 66 mean and standard deviation columns noted in Step 4 above).  This final data frame meets the tidy data criteria of one variable per column, one observation per row, and one "type" of observational unit (in this case, means of signal measurements) per table.

Lastly, Step 6 - WRITE THE RESULT TO A TEXT FILE uses the write.table() function to write the tidy data set to a text file, "tidyData.txt", which I then uploaded to Coursera as required for this project.




