====================================
Getting and Cleaning Data Project
====================================

INTRODUCTION:
====================
This Repo explains a project taken up for accomplishment of the Johns Hopkins Getting and Cleaning Data course.

OBJECTIVE:
====================
The ultimate objective of this project is to demonstrate the collection and cleaning of a tidy dataset that can be used for subsequent analysis. 

DATA SOURCE:
====================
A full description of data is available at the  UCI Machine Learning Repository 
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
and the source data for the project can be downloaded here. 
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

PROJECT SUMMARY:
====================
The cleanup script (run_analysis.R) does the following:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive activity names. 
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

ACTIVITIES DONE:
====================
1.	Downloaded and unzipped the project data and set working directory:
	"C:/Users/Bushra/Documents/data/UCI"
2.	Analysed the project objectives and defined the data fields and functions required to clean the source Dataset and 		prepare the Tidy data as per the requirement of the project stated above.
3.	Coded run_analysis.R to accomplish the tasks defined in the project.
4.	Creation of the README.md and CodeBook.md to explain the functioning of run_analysis.R

RUNNING INSTRUCTIONS:
=========================
After you have downloaded and unzipped the data file, in order to execute the run_analysis.R,  you need to set the working directory to reflect the location of files in your directory.

ADDITIONAL INFORMATION:
=========================
You can find additional information regarding the variables, data and transformations in the CodeBook.md file.