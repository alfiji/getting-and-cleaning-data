# 1) Merges the training and the test sets to create one data set. 
#  Read  the data from the  files and making datatables.

datatraining <- read.table("~/Desktop/X_train.txt")
labeltraining <- read.table("~/Desktop/y_train.txt")
subjecttraining <- read.table("~/Desktop/subject_train.txt")
datatest <- read.table("~/Desktop/X_test.txt")
labeltest <- read.table("~/Desktop/y_test.txt")
subjecttest <- read.table("~/Desktop/subject_test.txt")
features <- read.table("~/Desktop/features.txt")
activity <- read.table("~/Desktop/activity_labels.txt")
table(labeltraining)
table(labeltest) 
datajoining <- rbind(datatraining, datatest) 
labeljoining <- rbind(labeltraining, labeltest)
subjectjoin <- rbind(subjecttraining, subjecttest)


# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 

meanStandard <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinData <- datajoining[, meanStandard]
names(joinData) <- gsub("\\(\\)", "", features[meanStandard, 2]) 
names(joinData) <- gsub("mean", "Mean", names(joinData)) 
names(joinData) <- gsub("std", "Std", names(joinData)) 
names(joinData) <- gsub("-", "", names(joinData)) 

# 3) Uses descriptive activity names to name the activities in the data set.

activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
labelactivity <- activity[labeljoining [, 1], 2]
labeljoining[, 1] <- labelactivity
names(labeljoining) <- "activity"



# 4). Appropriately labels the data set with descriptive activity  names. 
names(subjectjoin ) <- "subject"
datacleaned <- cbind(subjectjoin , labeljoining, joinData)
write.table(datacleaned, "merged_data.txt") # write out the 1st dataset

# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable
#for each activity and each subject.

lengthsubject <- length(table(subjectjoin)) 
lengthactivity <- dim(activity)[1] 
columnLen <- dim(datacleaned)[2]
result <- matrix(NA, nrow=lengthsubject*lengthactivity, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(datacleaned)
row <- 1
for(i in 1:lengthsubject) {
  for(j in 1:lengthactivity) {
    result[row, 1] <- sort(unique(subjectjoin)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == datacleaned$subject
    bool2 <- activity[j, 2] == datacleaned$activity
    result[row, 3:columnLen] <- colMeans(datacleaned[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
This is the required file: 
write.table(result, "required-tidy-data.txt",row.name = FALSE) 

 

