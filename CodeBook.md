## CodeBook

This codebook summarizes the variables, data and the work performed to clean up and modify the 
Human Activity Recognition dataset from the UCI machine learning repository.

### Original Dataset

This project uses the dataset from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
The dataset comprises of training and test feature vector variables and labels for 30 persons based on activities such as
walking, standing, sitting,etc. The following is a list of the provided data which was utilized in this project:


- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
   Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. 
   Its range is from 1 to 30. 

- 'README.txt'

Please refer to the original 'README' textfile to get further details on each item listed above.


### Project source code
The code for this project can be found in 'run_analysis.R'


### Task 1 - Merge given training and test sets into ONE dataset.
For this task, the X_train.txt, y_train.txt, X_test.txt, y_test.txt, subject_train.txt and subject_test.txt files
were all used. The data inside these text files were combined. The output variable to reflect this merger is the
'combined_training_test' dataframe and can be within the 'run_analysis.R' code.

### Task 2 - Extract mean and standard deviations of the measurements.
In this task, the mean and standard deviation columns of the measurement variables were extracted from the 
'combined_training_test' dataframe. This produced a new dataframe variable: "new_combined_training_test",
and once again can be found in the code.

### Task 3 - Use descriptive activity names to name the acitivites in the dataset.
In this task, the "activity_labels.txt" file is used to assign descriptive labels to the associated numeric
labels in the "new_combined_training_test" dataframe.

### Task 4 - Appropriately label the data set with descriptive variable names.
For this task, the descriptiveness of the measurement variables within the dataframe are tidied up a bit. Specifically, 
to improve the descriptiveness of the variables, I replaced the 't' and 'f' notations for the measurements
with 'time-domain: ' and 'freq-domain: '. Additionally, when looking at the "new_combined_training_test" dataframe,
the last variable "fBodyBodyGyroJerkMag-std()" has a typographical error which should ideally be:
"fBodyGyroJerkMag" as correctly listed in the "features_info.txt" text file. This double repeat of the word "Body" seems
to occur in other variables as well, so I cleaned the dataset by fixing this typo.

### Task 5 - Create a second, independent tidy data set with the average of each variable for each activity and each subject.
Finally, I created a second dataset in the form of a .csv file named "independent_tidy_dataset.csv" which can be found on this 
Github repo. This dataset makes use of the "Activity_label" and "Subject_ID" variables. For these each of these 2 variables, 
I computed the average of their respective measurement variables.








