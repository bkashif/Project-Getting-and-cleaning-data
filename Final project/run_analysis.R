# Getting & Cleaning Data Course Project
# This script will perform the following steps on the UCI HAR Dataset downloaded from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##########################################################################################################

# 1. Merge the training and the test sets to create one data set.
#set working directory to the location where the UCI HAR Dataset was unzipped
	"C:/Users/Bushra/Documents/data/UCI"
# Reading data files
	features = read.table('./features.txt',header=FALSE) 
	activityType = read.table('./activity_labels.txt',header=FALSE)
	subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
	xTrain = read.table('./train/x_train.txt',header=FALSE)
	yTrain = read.table('./train/y_train.txt',header=FALSE)
# Assiging column names to the data read above
	colnames(activityType) = c('activityId','activityType')
	colnames(subjectTrain) = "subjectId"
	colnames(xTrain) = features[,2]
	colnames(yTrain) = "activityId"
# Merging yTrain, subjectTrain, and xTrain
	trainingData = cbind(yTrain,subjectTrain,xTrain)
# Reading the test data
	subjectTest = read.table('./test/subject_test.txt',header=FALSE)
	xTest = read.table('./test/x_test.txt',header=FALSE)
	yTest = read.table('./test/y_test.txt',header=FALSE)
# Assigning column names to the test data read 
	colnames(subjectTest) = "subjectId"
	colnames(xTest) = features[,2]
	colnames(yTest) = "activityId"
# Merging the xTest, yTest and subjectTest data
	testData = cbind(yTest,subjectTest,xTest)
# Creating final data set
	finalData = rbind(trainingData,testData)
	colNames = colnames(finalData)
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# Create a logicalVector that contains TRUE values for the ID, mean() & stddev() columns and FALSE for others
	logicalVector = (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames))
	finalData = finalData[logicalVector==TRUE]
# 3. Use descriptive activity names to name the activities in the data set
# Merge the finalData set with the acitivityType table to include descriptive activity names
	finalData = merge(finalData,activityType,by='activityId',all.x=TRUE)
	colNames = colnames(finalData)
# 4. Appropriately label the data set with descriptive activity names.
# Cleaning up the variable names
	for (i in 1:length(colNames))
	{
	colNames[i] = gsub("\\()","",colNames[i])
	colNames[i] = gsub("-std$","StdDev",colNames[i])
	colNames[i] = gsub("-mean","Mean",colNames[i])
	colNames[i] = gsub("^(t)","time",colNames[i])
	colNames[i] = gsub("^(f)","freq",colNames[i])
	colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
	colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
	colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
	colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
	colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
	colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
	colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
}
# Reassigning the new descriptive column names to the finalData set
	colnames(finalData) = colNames
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
# Create finalDataNoActivityType with no activityType
	finalDataNoActivityType = finalData[,names(finalData) != 'activityType']
# Including just the mean of each variable for each activity and each subject
	tidyData = aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean)
# Merging the tidyData with activityType
	tidyData = merge(tidyData,activityType,by='activityId',all.x=TRUE)
# Exporting the tidyData set
	write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t')
