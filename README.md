# homework-assignment-for-cleaning-data
The summary data contains the average value of mean or standard deviation extracted from the merged train/test dataset, grouped by subject and activity.      
The analysis includes the following steps:
1. Load the data sets.
2. Edit feature names from "features.txt" by removing() and replcing "-" with "_" in column names loaded from features_info.txt. For example, change "tBodyAcc-min()-X" into "tBodyAcc_min_X". 
The feature names are prety long, therefore I am not going to make the feature name more discriptive by replacing the short-cut words with full names.
3.Assemble a complete train data frame 'sub_act_train' by
 A. coloumn_bind the 'subject_train.txt','y_train.txt' and 'X_train.txt' together.
 B. name the columns as subject, activity, followed by the features from step 2.
4. Assemble a complete test data frame 'sub_act_test', in the same way as the train data frame.
5. Merge the train/test data frame from step 3-4 into one data frame,'test_train'.
6. Extract only mean and standard deviation values from the data frame in step 5 by making a new subset 'test_train_mean_std3'. 
7. Use descriptive activity names.  Label activity factors as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. 
8. Get the mean value of each measurment for each subject and each activity. I am not sure what exactly teacher wants here. 
I assume the clean data frame is the culmunation of the previous steps (i.e mearge tain-test, extract mean/ standard deviation, then get the average of mean and standard deviations).
 A. Group data frame 'test_train_mean_std3' by subject and activity.  There are 30 sujects and 6 activities, therefore there are a total of 180 combinations of subject and activity in the final data frame.  
 B. Summarize the data by averaging each mean and std value.

Rstudio version 3.6.3 is used in this project.
