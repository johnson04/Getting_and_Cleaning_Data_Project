## This is the R code for Chuan Zhang's project for JHU3-Getting and Cleaning Data
setwd("C:/Users/Chuan/Documents/GitHub/Getting_and_Cleaning_Data_Project")

## Loading data and incorporating subject and label indices to the data
TrainData    <- read.table("./UCI HAR Dataset/train/X_train.txt",sep="")
TrainLabel   <- read.table("./UCI HAR Dataset/train/y_train.txt",sep="")
TrainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt",sep="")

LabeledTrainData             <- TrainData
LabeledTrainData["Labels"]   <- TrainLabel
LabeledTrainData["Subjects"] <- TrainSubject


TestData    <- read.table("./UCI HAR Dataset/test/X_test.txt",sep="")
TestLabel   <- read.table("./UCI HAR Dataset/test/y_test.txt",sep="")
TestSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt",sep="")

LabeledTestData             <- TestData
LabeledTestData["Labels"]   <- TestLabel
LabeledTestData["Subjects"] <- TestSubject

## Merging the training and test sets to create one data set
LabeledData <- merge(LabeledTrainData,LabeledTestData,all=TRUE)

## Extracting only the measurements on the mean and standard deviation for each measurement.
Features   <- read.table("./UCI HAR Dataset/features.txt",sep="")

ExtractedLabeledData <- LabeledData[,
                        (grepl("mean()",Features$V2,fixed=TRUE) |
                        grepl("std()",Features$V2,fixed=TRUE)) |
                        names(LabeledData) == "Labels" |
                        names(LabeledData) == "Subjects"]

## Uses descriptive activity names to name the activities in the data set
Activities <- read.table("./UCI HAR Dataset/activity_labels.txt",sep="")
for(i in 1:dim(ExtractedLabeledData)[1])
{
    ExtractedLabeledData$Labels[i] <- 
        as.character(Activities[ExtractedLabeledData$Labels[i],2])
}

## Appropriately labels the data set with descriptive variable names
ExtractedFeatures <- subset(Features,(grepl("mean()",Features$V2,fixed=TRUE) |
                                    grepl("std()",Features$V2,fixed=TRUE)))

names(ExtractedLabeledData) <- c(as.character(ExtractedFeatures$V2),
                                 "Labels","Subjects")

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject
ExtractedLabeledData.Average <- aggregate(ExtractedLabeledData[,1:66],
          by=list(ExtractedLabeledData$Labels,
                ExtractedLabeledData$Subjects),
          FUN="mean")

names(ExtractedLabeledData.Average)[1:2] <- c("Activities","Subjects_Id")
dim(ExtractedLabeledData.Average)
head(ExtractedLabeledData.Average,n=12)

## Outputing the tidy data set obtained following the instructions in the project description.
write.table(ExtractedLabeledData.Average,file="TidyData.txt")
## Example for reading my TidyData.txt
## TidyData <- read.table("TidyData.txt",sep="")
