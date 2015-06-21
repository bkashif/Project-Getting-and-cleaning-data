====================================
GETTING & CLEANING DATA PROJECT
====================================

DESCRIPTION:
====================
This code book contains additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

DATA SOURCE:
====================
A complete description of data is available at the  UCI Machine Learning Repository 
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
and the source data for the project
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

STEPS FOLLOWED TO CLEAN THE DATA:
====================================
The run_analysis.R script performs the following steps to clean the data:

1. Merge the training and the test sets to create one data set:
After setting the source directory for the files, read into tables the data located in
	Read in the data from files
	features.txt		#561*2
	activity_labels.txt	#6*2
	subject_train.txt	#7352*1
	x_train.txt		#7352*561
	y_train.txt		#7352*1
	Create the final training set by merging yTrain, subjectTrain, and xTrain
	Assign column names to the data imported above
	Read in the test data
	subject_test.txt	#2947*1
	x_test.txt		#2947*561
	y_test.txt		#2947*1
Combine training and test data to generate a 10299x563 data frame.

2. To extract only the mean and standard deviation for each measurement created a logical vector (length=563 and sum=20) containing TRUE values for the ID, mean and stdev columns and FALSE values for the others. The subset of this data hence keeps only the necessary columns.

3. Inorder to use descriptive activity names to name the activities in the data set the data subset is merged with the activityType table resulting in 10299*21 data frame.

4. In order to appropriately label the data set with descriptive activity names function gsub is used for pattern replacement to clean up the data labels resulting in 10299*21 data frame.

5.Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.

5. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. 

6. The resullts are written to tidyData.txt created in the working directory.