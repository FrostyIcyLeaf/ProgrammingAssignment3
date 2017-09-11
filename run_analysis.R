#load dplyr library for data handling
library(dplyr)
#Download the data file and unzip the data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","data.zip")
unzip("data.zip")

#Step 1 in getting to clean data: "Merges the training and the test sets to create one data set."
#Read test data
testX <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
testY <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
testSubject <-
    read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

testBodyAccX <-
    read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_x_test.txt")
testBodyAccY <-
    read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_y_test.txt")
testBodyAccZ <-
    read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_z_test.txt")

testBodyGyroX <-
    read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_x_test.txt")
testBodyGyroY <-
    read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_y_test.txt")
testBodyGyroZ <-
    read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_z_test.txt")

testTotalAccX <-
    read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_x_test.txt")
testTotalAccY <-
    read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_y_test.txt")
testTotalAccZ <-
    read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_z_test.txt")

#read training data
trainX <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
trainY <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
trainSubject <-
    read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

trainBodyAccX <-
    read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_x_train.txt")
trainBodyAccY <-
    read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_y_train.txt")
trainBodyAccZ <-
    read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_z_train.txt")

trainBodyGyroX <-
    read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_x_train.txt")
trainBodyGyroY <-
    read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_y_train.txt")
trainBodyGyroZ <-
    read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_z_train.txt")

trainTotalAccX <-
    read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_x_train.txt")
trainTotalAccY <-
    read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_y_train.txt")
trainTotalAccZ <-
    read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_z_train.txt")

#read feature and activity labels
featureLabels <-
    read.table(".\\UCI HAR Dataset\\features.txt")
activityLabels <-
    read.table(".\\UCI HAR Dataset\\activity_labels.txt")

#merge test and training data
X <- rbind(testX, trainX)
Y <- rbind(testY, trainY)
Subject <- rbind(testSubject, trainSubject)
BodyAccX <- rbind(testBodyAccX, trainBodyAccX)
BodyAccY <- rbind(testBodyAccY, trainBodyAccY)
BodyAccZ <- rbind(testBodyAccZ, trainBodyAccZ)

BodyGyroX <- rbind(testBodyGyroX, trainBodyGyroX)
BodyGyroY <- rbind(testBodyGyroY, trainBodyGyroY)
BodyGyroZ <- rbind(testBodyGyroZ, trainBodyGyroZ)

TotalAccX <- rbind(testTotalAccX, trainTotalAccX)
TotalAccY <- rbind(testTotalAccY, trainTotalAccY)
TotalAccZ <- rbind(testTotalAccZ, trainTotalAccZ)

#Ensure that column names of features.txt are unique for bandsEnergy labels
#transform factors to characters
featureLabelsCharacters<-as.character(featureLabels[,2])
for (i in 303:316){featureLabelsCharacters[i]<-paste(featureLabelsCharacters[i],"X")}
for (i in 317:330){featureLabelsCharacters[i]<-paste(featureLabelsCharacters[i],"Y")}
for (i in 331:344){featureLabelsCharacters[i]<-paste(featureLabelsCharacters[i],"Z")}

for (i in 382:395){featureLabelsCharacters[i]<-paste(featureLabelsCharacters[i],"X")}
for (i in 396:409){featureLabelsCharacters[i]<-paste(featureLabelsCharacters[i],"Y")}
for (i in 410:423){featureLabelsCharacters[i]<-paste(featureLabelsCharacters[i],"Z")}

for (i in 461:474){featureLabelsCharacters[i]<-paste(featureLabelsCharacters[i],"X")}
for (i in 475:488){featureLabelsCharacters[i]<-paste(featureLabelsCharacters[i],"Y")}
for (i in 489:502){featureLabelsCharacters[i]<-paste(featureLabelsCharacters[i],"Z")}

#Label columns
colnames(X) <- featureLabelsCharacters #Assigns the technical names from the features.txt file to the respective columns
colnames(Y) <- c("ActivityType")
colnames(Subject) <- c("Subject")
for (i in 1:128)
{
    colnames(BodyAccX)[i] <- paste("X-directed body acceleration", i)
    colnames(BodyAccY)[i] <- paste("Y-directed body acceleration", i)
    colnames(BodyAccZ)[i] <- paste("Z-directed body acceleration", i)
    colnames(BodyGyroX)[i] <- paste("X angular velocity", i)
    colnames(BodyGyroY)[i] <- paste(
        "Y angular velocity", i)
    colnames(BodyGyroZ)[i] <- paste("Z angular velocity", i)
    colnames(TotalAccX)[i] <-
        paste("X-directed total acceleration", i)
    colnames(TotalAccY)[i] <-
        paste("Y-directed total acceleration", i)
    colnames(TotalAccZ)[i] <-
        paste("Z-directed total acceleration", i)
}
colnames(activityLabels)<-c("ID", "Activity")

#merge data into one set
allData <-
    cbind(
        Subject,
        Y,
        X,
        BodyAccX,
        BodyAccY,
        BodyAccZ,
        BodyGyroX,
        BodyGyroY,
        BodyGyroZ,
        TotalAccX,
        TotalAccY,
        TotalAccZ
    )

#Add a column with a descriptive name for the activity from activity_labels.txt
joinedData <- inner_join(allData,activityLabels,by=c("ActivityType" = "ID"))

#Step 2 in getting to clean data: "Extracts only the measurements on the mean and standard deviation for each measurement."
#collect mean data
meanData <- select(joinedData,contains("mean()"))
#collect standard deviation data
stdData <- select(joinedData,contains("std()"))

#bind data together
mergedData <- cbind(meanData,stdData)

#Step 4 in getting to clean data: "Appropriately labels the data set with descriptive variable names."
#Label columns appropriately
colnames(mergedData) <-
    c(
        "Time Domain Mean Body Acceleration X",
        "Time Domain Mean Body Acceleration Y",
        "Time Domain Mean Body Acceleration Z",
        "Time Domain Mean Gravity Acceleration X",
        "Time Domain Mean Gravity Acceleration Y",
        "Time Domain Mean Gravity Acceleration Z",
        "Time Domain Mean Body Acceleration Jerk X",
        "Time Domain Mean Body Acceleration Jerk Y",
        "Time Domain Mean Body Acceleration Jerk Z",
        "Time Domain Mean Body Gyro X",
        "Time Domain Mean Body Gyro Y",
        "Time Domain Mean Body Gyro Z",
        "Time Domain Mean Body Gyro Jerk X",
        "Time Domain Mean Body Gyro Jerk Y",
        "Time Domain Mean Body Gyro Jerk Z",
        "Time Domain Mean Body Acceleration Mag",
        "Time Domain Mean Gravity Acceleration Mag",
        "Time Domain Mean Body Acceleration Jerk Mag",
        "Time Domain Mean Body Gyro Mag",
        "Time Domain Mean Body Gyro Jerk Mag",
        "Frequency Domain Mean Body Acceleration X",
        "Frequency Domain Mean Body Acceleration Y"          ,
        "Frequency Domain Mean Body Acceleration Z"          ,
        "Frequency Domain Mean Body Acceleration Jerk X"      ,
        "Frequency Domain Mean Body Acceleration Jerk Y"      ,
        "Frequency Domain Mean Body Acceleration Jerk Z"      ,
        "Frequency Domain Mean Body Gyro X"         ,
        "Frequency Domain Mean Body Gyro Y"         ,
        "Frequency Domain Mean Body Gyro Z"         ,
        "Frequency Domain Mean Body Acceleration Mag"       ,
        "Frequency Domain Mean Body Acceleration Jerk Mag" ,
        "Frequency Domain Mean Body Gyro Mag"    ,
        "Frequency Domain Mean Body Gyro Jerk Mag",
        "Time Domain Standard Deviation Body Acceleration X",
        "Time Domain Standard Deviation Body Acceleration Y",
        "Time Domain Standard Deviation Body Acceleration Z",
        "Time Domain Standard Deviation Gravity Acceleration X",
        "Time Domain Standard Deviation Gravity Acceleration Y",
        "Time Domain Standard Deviation Gravity Acceleration Z",
        "Time Domain Standard Deviation Body Acceleration Jerk X",
        "Time Domain Standard Deviation Body Acceleration Jerk Y",
        "Time Domain Standard Deviation Body Acceleration Jerk Z",
        "Time Domain Standard Deviation Body Gyro X",
        "Time Domain Standard Deviation Body Gyro Y",
        "Time Domain Standard Deviation Body Gyro Z",
        "Time Domain Standard Deviation Body Gyro Jerk X",
        "Time Domain Standard Deviation Body Gyro Jerk Y",
        "Time Domain Standard Deviation Body Gyro Jerk Z",
        "Time Domain Standard Deviation Body Acceleration Mag",
        "Time Domain Standard Deviation Gravity Acceleration Mag",
        "Time Domain Standard Deviation Body Acceleration Jerk Mag",
        "Time Domain Standard Deviation Body Gyro Mag",
        "Time Domain Standard Deviation Body Gyro Jerk Mag",
        "Frequency Domain Standard Deviation Body Acceleration X",
        "Frequency Domain Standard Deviation Body Acceleration Y"          ,
        "Frequency Domain Standard Deviation Body Acceleration Z"          ,
        "Frequency Domain Standard Deviation Body Acceleration Jerk X"      ,
        "Frequency Domain Standard Deviation Body Acceleration Jerk Y"      ,
        "Frequency Domain Standard Deviation Body Acceleration Jerk Z"      ,
        "Frequency Domain Standard Deviation Body Gyro X"         ,
        "Frequency Domain Standard Deviation Body Gyro Y"         ,
        "Frequency Domain Standard Deviation Body Gyro Z"         ,
        "Frequency Domain Standard Deviation Body Acceleration Mag"       ,
        "Frequency Domain Standard Deviation Body Acceleration Jerk Mag" ,
        "Frequency Domain Standard Deviation Body Gyro Mag" ,
        "Frequency Domain Standard Deviation Body Gyro Jerk Mag"
    )
#Merge mean or standard deviation data respectively together with Subject and Activity information
mergedDataActivity <- cbind(Subject, Y, mergedData)

#Step 3 in getting to clean data: "Uses descriptive activity names to name the activities in the data set" 
#Add a column with a descriptive name for the activity from activity_labels.txt
joinedMergedData <- inner_join(mergedDataActivity,activityLabels,by=c("ActivityType" = "ID"))

#Remove duplicate Activity column to fulfill tidyness criteria
joinedMergedData<-joinedMergedData[,-2]

#Write tidy data to file
write.table(joinedMergedData,"tidyData.txt", row.names = FALSE)

#Step 5 in getting to clean data: "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."
#Calculate the average for the two data sets of means and standard deviations
averageBySubjectActivity <- group_by(joinedMergedData,Subject,Activity) %>% summarise_all(funs(mean))

#Write tidy grouped data to file
write.table(averageBySubjectActivity,"tidyMeanGroupedData.txt", row.names = FALSE)