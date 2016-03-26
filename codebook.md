
This codebook describe the general structure of the project.

First of all we obtain data form the following source:


https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset includes the following files:


1.	X_train.txt: training set,
2.	y_train.txt: training labels,
3.	X_test.txt: test set,
4.	y_test.txt: test labels,
5.	features_info.txt: shows information about the variables used on the feature vector.
6.	features.txt: list of all features.
7.	activity_labels.txt links the class labels with their activity name,



There are 5 parts:

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive activity names.
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The run_analysis.R has the following general steps in the corresponding order: 

1.	Load test, train, features and activity labels data
2.	Extract the mean and standard deviation column names and data.
3.	Process the data. There are two parts processing test and train data respectively.
4.	Merge data set.
