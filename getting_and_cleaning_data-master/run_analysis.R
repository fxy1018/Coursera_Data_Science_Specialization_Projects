# Project For Getting and Cleaning Data Course
# Purpose Statement:
# This program will:
#   1. Merges the training and the test sets to create one data set.
#   2. Extracts only the measurements on the mean and standard deviation for 
#      each measurement.
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names.
#   5. From the data set in step 4, creates a second, independent tidy data set 
#      with the average of each variable for each activity and each subject.


# read files
testpath <- paste(getwd(),"test",sep="/") 
trainpath <- paste(getwd(),"train",sep="/")

files_test <- list.files(testpath, ".txt")
files_train <- list.files(trainpath, ".txt")
    
X_test <- read.table(paste(testpath, files_test[2],sep = "/"), header =F, sep=)
y_test <- read.table(paste(testpath, files_test[3],sep = "/"), header =F, sep=)
subject_test <- read.table(paste(testpath, files_test[1],sep = "/"), header =F, sep=)

X_train <- read.table(paste(trainpath, files_train[2],sep = "/"), header =F, sep=)
y_train <- read.table(paste(trainpath, files_train[3],sep = "/"), header =F, sep=)
subject_train <- read.table(paste(trainpath, files_train[1],sep = "/"), header =F, sep=)

features <- read.table("features.txt", header = F)
mean_std_index <- grep("mean|std", features[,2])
var_names <- features[,2][mean_std_index]

#add label and subject to test data 
test <- cbind(X_test, y_test, subject_test)
train <- cbind(X_train, y_train, subject_train)

#merge training and testing sets
all <- rbind(test,train)
dim(all)

#Extracts only the measurements on the mean and standard deviation
mean_std <- all[,c(mean_std_index,562,563)]
dim(mean_std)

#Uses descriptive activity names to name the activities in the data set
mean_std$activity_label = factor(mean_std[,80], labels = c("WALKING", "WALKING_UPSTAIRS",
                                                           "WALKING_DOWNSTAIRS",
                                                           "SITTING", "STANDING",
                                                           "LAYING"))
mean_std <- mean_std[,-80]


#labels the data set with descriptive variable names
library(dplyr)
colnames(mean_std)[1:79] <- as.character(var_names)
mean_std <- rename(mean_std, subject = V1.2)

#creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject

fun <- function(x) {tapply(x, list(mean_std$subject, mean_std$activity), mean)}
tidy <- apply(mean_std[,1:79], 2, fun)


#write the output in a seperated file
write.table(tidy, "tidy_data.txt", row.names = F, quote = F)




