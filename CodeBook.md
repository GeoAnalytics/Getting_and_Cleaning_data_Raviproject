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

Please refer to the original 'README' textfile from the UCI dataset folder to get further details on each item listed above.


### Project source code
The code for this project can be found in 'run_analysis.R'


### Task 1 - Merge given training and test sets into ONE dataset.
For this task, the X_train.txt, y_train.txt, X_test.txt, y_test.txt, subject_train.txt and subject_test.txt files
were all used. The data inside these text files were combined. The output variable to reflect this merger is the
'combined_training_test' dataframe and can be found within the 'run_analysis.R' code.

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
Finally, I created a second dataset in the form of a .txt file named "independent_tidy_dataset.txt" which can be found on this 
Github repo. This dataset makes use of the "Activity_label" and "Subject_ID" variables. For these each of these 2 variables, 
I computed the average of their respective measurement variables.

### The variable measurements which were updated

* "time-domain: BodyAcc-mean()-X"  
* "time-domain: BodyAcc-mean()-Y"      
* "time-domain: BodyAcc-mean()-Z"      
* "time-domain: BodyAcc-std()-X"       
* "time-domain: BodyAcc-std()-Y"        
* "time-domain: BodyAcc-std()-Z"       
* "time-domain: GravityAcc-mean()-X"    
* "time-domain: GravityAcc-mean()-Y"   
* "time-domain: GravityAcc-mean()-Z"    
* "time-domain: GravityAcc-std()-X"    
* "time-domain: GravityAcc-std()-Y"    
* "time-domain: GravityAcc-std()-Z"    
* "time-domain: BodyAccJerk-mean()-X"   
* "time-domain: BodyAccJerk-mean()-Y"  
* "time-domain: BodyAccJerk-mean()-Z"  
* "time-domain: BodyAccJerk-std()-X"   
* "time-domain: BodyAccJerk-std()-Y"   
* "time-domain: BodyAccJerk-std()-Z"   
* "time-domain: BodyGyro-mean()-X"     
* "time-domain: BodyGyro-mean()-Y"     
* "time-domain: BodyGyro-mean()-Z"      
* "time-domain: BodyGyro-std()-X"      
* "time-domain: BodyGyro-std()-Y"       
* "time-domain: BodyGyro-std()-Z"      
* "time-domain: BodyGyroJerk-mean()-X"  
* "time-domain: BodyGyroJerk-mean()-Y" 
* "time-domain: BodyGyroJerk-mean()-Z"  
* "time-domain: BodyGyroJerk-std()-X"  
* "time-domain: BodyGyroJerk-std()-Y"   
* "time-domain: BodyGyroJerk-std()-Z"  
* "time-domain: BodyAccMag-mean()"      
* "time-domain: BodyAccMag-std()"      
* "time-domain: GravityAccMag-mean()"   
* "time-domain: GravityAccMag-std()"   
* "time-domain: BodyAccJerkMag-mean()"  
* "time-domain: BodyAccJerkMag-std()"  
* "time-domain: BodyGyroMag-mean()"     
* "time-domain: BodyGyroMag-std()"     
* "time-domain: BodyGyroJerkMag-mean()" 
* "time-domain: BodyGyroJerkMag-std()" 
* "freq-domain: BodyAcc-mean()-X"       
* "freq-domain: BodyAcc-mean()-Y"      
* "freq-domain: BodyAcc-mean()-Z"       
* "freq-domain: BodyAcc-std()-X"       
* "freq-domain: BodyAcc-std()-Y"        
* "freq-domain: BodyAcc-std()-Z"       
* "freq-domain: BodyAccJerk-mean()-X"   
* "freq-domain: BodyAccJerk-mean()-Y"  
* "freq-domain: BodyAccJerk-mean()-Z"   
* "freq-domain: BodyAccJerk-std()-X"   
* "freq-domain: BodyAccJerk-std()-Y"    
* "freq-domain: BodyAccJerk-std()-Z"   
* "freq-domain: BodyGyro-mean()-X"      
* "freq-domain: BodyGyro-mean()-Y"     
* "freq-domain: BodyGyro-mean()-Z"      
* "freq-domain: BodyGyro-std()-X"      
* "freq-domain: BodyGyro-std()-Y"       
* "freq-domain: BodyGyro-std()-Z"      
* "freq-domain: BodyAccMag-mean()"      
* "freq-domain: BodyAccMag-std()"      
* "freq-domain: BodyAccJerkMag-mean()"  
* "freq-domain: BodyAccJerkMag-std()"  
* "freq-domain: BodyGyroMag-mean()"     
* "freq-domain: BodyGyroMag-std()"     
* "freq-domain: BodyGyroJerkMag-mean()" 
* "freq-domain: BodyGyroJerkMag-std()" 

### The various 6 activities

* WALKING
* SITTING
* STANDING
* LAYING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS