# Getting-and-Cleaning-Data-Course-Project
The code first unzips the data folder and reads the following:
  1. Test and Train Data (X_test and X_train: Measurements, Y_test and Y_train: Activity Numeric Indicators, Subject_test and Subject_train: The ID of the subjects under observation)
  2. Activity: Contains 2 columns - the numeric indicator of activities and the corresponding acitivity name
  3. Features: Name of the measurment and what it represents (mean, std, mad, max, min...) which corresponds to the names of the columns of X data tables
  
The code then merges the test and train measurments into "X" and renames the columns of X with the "Features" records
 then merges subject_test and subject_train into "Subject"
 then merges Y_test and Y_train into "Y"

The code then uses grep to keep only the columns of the mean and Standard deviation measurments in "X" and the result is stored in "X"

The code then matches the Activity numeric representation in "Y" to the activity names in "Activity" data table and stores the result in "Activity_Name"
  then combines Subject, Activity_Name and X into "Final_Data"
  
Finally, "Tidy_Data" is created with only the average of the measurments grouped by subject and Activity and "Tidy_Data" is stored in  text file.
