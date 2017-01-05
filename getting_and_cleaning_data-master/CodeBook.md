Variables:
testpath: Get the path of test file
trainpath: Get the path of train file
files_test: Get the list of test files
files_train:Get the list of train files

X_test/ Y_test / subject_test: read the test files and get the data
X_train/ Y_train / subject_train: read the train files and get the data


features : read feature file
mean_std_index :use regular expression to get index of features which contain the word mean or std
var_names : variable name 

test/train : combine all test/train data 
all : combine test and train data together
mean_std:　the measurements　only on the mean and standard deviation

fun : function used to get tidy data
tidy : final tidy data

Transformations:
originally there are three test files and three train files, I used cbind to combine test/train files and rbind to 
combine test and train file.

In order to get colnames, I used regular expression to parse the names from feature file. 

To get tidy data, I applied tapply on subject and activity (which are factors)
