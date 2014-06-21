### Step 1 - READ IN AND MERGE DATA SETS:
## read in the "test" data and the associated subject and activity IDs
a <- read.table("x_test.txt")          # measurement data
b <- read.table("y_test.txt")          # activity IDs
c <- read.table("subject_test.txt")    # subject IDs

## add subject IDs and activity IDs to the "test" data
d <- cbind(subjectID=c$V1,activityID=b$V1,a)

## read in the "train" data and the associated subject and activity IDs
e <- read.table("x_train.txt")          # measurement data
f <- read.table("y_train.txt")          # activity IDs
g <- read.table("subject_train.txt")    # subject IDs

## add subject IDs and activity IDs to the "train" data
h <- cbind(subjectID=g$V1,activityID=f$V1,e)

## merge the modified "test" and "train" data frames with rbind
mergedDF <- rbind(d,h)



### Step 2 - CLEAN UP AND ADD ACTIVITY LABELS:
## add sequence to use to restore sort order after merge (below)
seq <- 1:nrow(mergedDF)
mergedDF <- cbind(seq,mergedDF)

## read in activity_labels.txt
activityLabels <- read.table("activity_labels.txt")

## edit font to lower case and separator to dot to be more consistent with variable names
activityLabels$V2 <- as.character(activityLabels$V2)
activityLabels$V2 <- tolower(activityLabels$V2)
activityLabels$V2 <- gsub("_",".",activityLabels$V2)

## replace activityID values in merged data set with the text labels from
        ## activity_labels.txt
mergedDF <- merge(activityLabels,mergedDF,by.x="V1",by.y="activityID",sort=FALSE)
## remove extraneous activityID column
mergedDF <- mergedDF[,-1]

## sort on seq column to restore original sort order
ndx <- order(mergedDF$seq)
mergedDF <- mergedDF[ndx,]
## remove extraneous seq column
mergedDF$seq <- NULL



### Step 3 - CLEAN UP AND ADD VARIABLE NAMES:
## read in features.txt
varNames <- read.table("features.txt")

## add activityID and subjectID to varNames vector
varNames <- c("activityID","subjectID",as.character(varNames$V2))

## clean up variable names and make them more descriptive
varNames <- make.names(varNames,unique=TRUE)  # makes names syntactically valid
varNames <- gsub("..","",varNames,fixed=TRUE)
varNames <- gsub("^t","time.",varNames)       # replaces initial "t" with "time"
varNames <- gsub("^f","frequency.",varNames)  # replaces initial "f" with "frequency

## replace column names in mergedDF with varNames
colnames(mergedDF) <- varNames



### Step 4 - SUBSET COLUMNS FOR MEANS AND STANDARD DEVIATIONS:
## select columns with "mean" or "std" in name
IDs <- mergedDF[,1:2]
mergedDFsubset <- mergedDF[,grepl("\\.mean",names(mergedDF)) | grepl("\\.std",names(mergedDF))]
mergedDFsubset <- cbind(IDs,mergedDFsubset)
## eliminate columns with "meanFreq" in names
mergedDFsubset <- subset(mergedDFsubset,select=!grepl("meanFreq",names(mergedDFsubset)))



### Step 5 - SUMMARIZE BY MEAN:
## call the reshape2 package
library(reshape2)

## summarize by average of each variable for each activity and each subject
tidyData <- melt(mergedDFsubset,id=c("activityID","subjectID"))        #  step 1 - melt the table
tidyData <- dcast(tidyData, activityID + subjectID ~ variable, mean)  #  step 2 - recast the table



### Step 6 - WRITE THE RESULT TO A TEXT FILE:
## write tidyData table to a .txt file
write.table(tidyData,"tidyData.txt")





