library (data.table)
library(dplyr)
#The Zipped Data File was donwloaded and the directory was changed to be where the Zipped Data File Exists
unzip("UCI HAR Dataset.zip")

##PART 1:
# Read Test Data
X_Test<- read.table("UCI HAR Dataset/test/X_test.txt")
Y_Test<- read.table("UCI HAR Dataset/test/Y_test.txt")
Subject_Test<- read.table("UCI HAR Dataset/test/subject_test.txt")


# Read Train Data
X_Train<- read.table("UCI HAR Dataset/train/X_train.txt")
Y_Train<- read.table("UCI HAR Dataset/train/Y_train.txt")
Subject_Train<- read.table("UCI HAR Dataset/train/subject_train.txt")


#Read Features and Activity
Features<-read.table("UCI HAR Dataset/features.txt")

Activity<-read.table("UCI HAR Dataset/activity_labels.txt")

#Merge Test and Train Data
X <- bind_rows(X_Train,X_Test)
X <- tbl_df(X)
Y <- bind_rows(Y_Train,Y_Test)
Y <- tbl_df(Y)
Subject <- bind_rows(Subject_Train,Subject_Test)
Subject <- tbl_df(Subject)

##PART 2,3 and 4:
#Rename columns of X by feature names
colnames(X) <- Features[,2]


#Extract only the measurements on the mean and standard deviation for each measurement
Mean_SD_Column_Index <- grep( "mean\\(\\)|std\\(\\)",Features[,2])
X <- X[,Mean_SD_Column_Index]

# Uses descriptive activity names to name the activities in the data set
# Y contains the numeric values of the activities
Activity_Name <- data.table(merge(Y, Activity))[,2]
colnames(Activity_Name) <- "Activity"
colnames(Subject) <- "Subject"


#Combine Subject, Activity Names and Measurments (Mean and SD only) into one data set
Final_Data <- data.table(bind_cols(Subject,Activity_Name,X))

##PART 5:
# Create Tidy Data that containes only the fetaures average grouped by subject and activity
Tidy_Data <- Final_Data[, lapply(.SD, mean), by = 'Subject,Activity'] 


                        