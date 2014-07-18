CodeBook
========================================================
# Tidy Data

## Summary
In summary, the tidy data I submitted is a data frame with 180 observations and 68 variables. The 180 observations are the avarages of each variable for each activity and each subject. As there are 30 subjects and, for each subject, there are 6 activities (see explanation for variables below), the total number of different "observations" is $30\times 6 = 180$ rows. Similarly, as there are 66 variables are measurements on the mean and standard deviation for each measurement, and there are two "extra" variables, the "Activities" and "Subject_Id", in total there are $66 + 2 = 68$ columns.


## Variables
### Activities and Subjects

[1] "Activities"                 --- a factor variable labelling the six activities during which the raw data were collected. The six activities are the values of this variable are listed as its different levels:

```
levels(TidyData$Activities)
```

1 "LAYING"            
2 "SITTING"           
3 "STANDING"          
4 "WALKING"           
5 "WALKING_DOWNSTAIRS"
6 "WALKING_UPSTAIRS"  


[2] "Subjects_Id"                --- An integer vector labelling the 30 subjects on which the measurements were taken


### The 66 variables, of which averages were calculated

```
names(TidyData[,3:68])
```

 [1] "tBodyAcc.mean...X"          
 [2] "tBodyAcc.mean...Y"          
 [3] "tBodyAcc.mean...Z"          
 [4] "tBodyAcc.std...X"           
 [5] "tBodyAcc.std...Y"           
 [6] "tBodyAcc.std...Z"           
 [7] "tGravityAcc.mean...X"       
 [8] "tGravityAcc.mean...Y"       
 [9] "tGravityAcc.mean...Z"       
[10] "tGravityAcc.std...X"        
[11] "tGravityAcc.std...Y"        
[12] "tGravityAcc.std...Z"        
[13] "tBodyAccJerk.mean...X"      
[14] "tBodyAccJerk.mean...Y"      
[15] "tBodyAccJerk.mean...Z"      
[16] "tBodyAccJerk.std...X"       
[17] "tBodyAccJerk.std...Y"       
[18] "tBodyAccJerk.std...Z"       
[19] "tBodyGyro.mean...X"         
[20] "tBodyGyro.mean...Y"         
[21] "tBodyGyro.mean...Z"         
[22] "tBodyGyro.std...X"          
[23] "tBodyGyro.std...Y"          
[24] "tBodyGyro.std...Z"          
[25] "tBodyGyroJerk.mean...X"     
[26] "tBodyGyroJerk.mean...Y"     
[27] "tBodyGyroJerk.mean...Z"     
[28] "tBodyGyroJerk.std...X"      
[29] "tBodyGyroJerk.std...Y"      
[30] "tBodyGyroJerk.std...Z"      
[31] "tBodyAccMag.mean.."         
[32] "tBodyAccMag.std.."          
[33] "tGravityAccMag.mean.."      
[34] "tGravityAccMag.std.."       
[35] "tBodyAccJerkMag.mean.."     
[36] "tBodyAccJerkMag.std.."      
[37] "tBodyGyroMag.mean.."        
[38] "tBodyGyroMag.std.."         
[39] "tBodyGyroJerkMag.mean.."    
[40] "tBodyGyroJerkMag.std.."     
[41] "fBodyAcc.mean...X"          
[42] "fBodyAcc.mean...Y"          
[43] "fBodyAcc.mean...Z"          
[44] "fBodyAcc.std...X"           
[45] "fBodyAcc.std...Y"           
[46] "fBodyAcc.std...Z"           
[47] "fBodyAccJerk.mean...X"      
[48] "fBodyAccJerk.mean...Y"      
[49] "fBodyAccJerk.mean...Z"      
[50] "fBodyAccJerk.std...X"       
[51] "fBodyAccJerk.std...Y"       
[52] "fBodyAccJerk.std...Z"       
[53] "fBodyGyro.mean...X"         
[54] "fBodyGyro.mean...Y"         
[55] "fBodyGyro.mean...Z"         
[56] "fBodyGyro.std...X"          
[57] "fBodyGyro.std...Y"          
[58] "fBodyGyro.std...Z"          
[59] "fBodyAccMag.mean.."         
[60] "fBodyAccMag.std.."          
[61] "fBodyBodyAccJerkMag.mean.." 
[62] "fBodyBodyAccJerkMag.std.."  
[63] "fBodyBodyGyroMag.mean.."    
[64] "fBodyBodyGyroMag.std.."     
[65] "fBodyBodyGyroJerkMag.mean.."
[66] "fBodyBodyGyroJerkMag.std.." 


These 66 variables correspond to the average and standard deviation of the measured signals listed below:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ

tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The signals with '-XYZ' are measured in 3 axial directions (X, Y, and Z). Therefore, the first 8 signals were measured as $8 \times 3 = 24$ variables. The rest 9 signals, each was measured as one single variable. Therefore, in total we have $24 + 9 = 33$ variables. Associated to each variable here, in our tidy data, the average and standard deviation were calculated, therefore in total, we have $33 \times 2 = 66$ variables. These averages and standard deviations were denoted by a postfix ".mean.." and ".std.." respectively.


# R script for obtaining the tidy data
In the submitted R script: run_analysis.R, the following operations/transformations/analysis were performed:

### Step 1: loading "raw" data
The "raw" training data set:
```
./UCI HAR Dataset/train/X_train.txt
```
and its (activity) labels
```
./UCI HAR Dataset/train/y_train.txt
```
and subject id numbers
```
./UCI HAR Datasettrain/subject_train.txt
```

and the "raw" test data set:
```
./UCI HAR Dataset/test/X_test.txt
```
and its (activity) labels
```
./UCI HAR Dataset/test/y_test.txt
```
and subject id numbers
```
./UCI HAR Datasettrain/subject_test.txt
```

were loaded respectively.

### Step 2: preprocessing
Combining the activity labels and subject id numbers to the training and test data sets respectively as new columns.
The two data sets with activity labels and subject id numbers combined are denoted as:
```
LabeledTrainData
```
and
```
LabeledTestData
```
respectively.

### Step 3: Merging the training and the test data sets to create one data set
The merged data set is denoted as: 
```
LabeledData
```

### Step 4: Extracts only the measurements on the mean and standard deviation for each measurement.
Load the associated features corresponding to each variable (column) of the "raw" data:
```
./UCI HAR Dataset/features.txt
```
and assign it to the variable "Features". Using the information provided by the variable Features, extract the measurements on the mean and standard deviation for each measurement, and assign them to the variable
```
ExtractedLabeledData
```

### Step 5: Uses descriptive activity names to name the activities in the data sets
Load activities from
```
./UCI HAR Dataset/activity_labels.txt
```
and assign it to the variable
```
Activities
```
Using the id for each Activities element to replace the ids in the data sets, such that each activity is named by a name instead of a index number.

### Step 6: Appropriately labels the data set with descriptive variable names
Replace the names of the data frame
```
ExtractedLabeledData
```
by their feature names.

### Step 7: Creates a second, independent tidy data set with the average of each variable for each activity and each subject
Calculated the averages and assign the whole data frame to
```
ExtractedLabeledData.Average
```
then output as the data file:
```
TidyData.txt
```
