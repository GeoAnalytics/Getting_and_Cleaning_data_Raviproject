# Ravi Ancil Persad
# Assignment-Week4: Getting and Cleaning Data



#----- this block of code clears/resets console ----#
rm(list=ls())
cls <- function() cat(rep("\n",100))
cls()
graphics.off()
#--------------------------------------------------#


# -----Example to run this code -----------#:
# setwd("C:/Users/ravi/Getting_and_Cleaning_data_Raviproject")
# source("run_analysis.R") #load source code
# Path_to_data_folder <- "C:/Users/ravi/Getting_and_Cleaning_data_Raviproject"
# Do_Tidy_Data(Path_to_data_folder)
#------------------------------------------#



Do_Tidy_Data <- function(Path_to_data_folder) {
        
        
        # ============  Stage 1: Merge the training and the test sets to create one data set ===============#
        
        X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        y_train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt")
        subjtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        
        
        X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        y_test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt")
        subjtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        
        # rename the columns of 'subjtrain' and 'subjtest'
        colnames(subjtrain)[1] <- "subject_ID"
        colnames(subjtest)[1] <- "subject_ID"
        
        # let's read the 'features.txt' file
        features <- read.table("./UCI HAR Dataset/features.txt")
        
        # this 'features' txt file will now be used to assign column names to the test and train columns.
        colnames(X_train) <- features$V2
        colnames(X_test) <- features$V2
        
        
        # rename the columns of 'y_train_labels' and 'y_test_labels'
        colnames(y_train_labels)[1] <- "Activity_label"
        colnames(y_test_labels)[1] <- "Activity_label"
        
        
        # Now let us combine the 'subjtrain', 'y_train_labels' and 'X_train' dataframes
        combined_training <- cbind(subjtrain,y_train_labels,X_train)
        
        # Similarly, we will also combine the 'subjtest', 'y_test_labels' and 'X_test' dataframes
        combined_test <- cbind(subjtest,y_test_labels,X_test)
        
        # Finally, we combine the training and test datasets into one, single dataset.
        combined_training_test <- rbind(combined_training,combined_test)
        
        
        # ============  Stage 2: Extract only the measurements on the mean and standard deviation for each measurement ===============#
        
        
        # get the mean and standard deviation columns of each measurement
        mean_std_cols_logical <- grepl("mean()", colnames(combined_training_test), fixed=T) | grepl("std()", colnames(combined_training_test), fixed=T)
        mean_std_cols <- combined_training_test[,mean_std_cols_logical]
        
        # Combine the "mean_std_cols" with the "subject_ID" and "Activity_label" columns to form a new dataframe 'new_combined_training_test'
        SubjID_ActivLab_df <- combined_training_test[,1:2]
        new_combined_training_test <- cbind(SubjID_ActivLab_df,mean_std_cols)
        
        
        
        # ============  Stage 3: Use descriptive activity names to name the activities in the data set ===============#
        
        #let's now read in the 6 descriptive activity labels
        descrip_activ_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
        
        
        # we will now assign the descriptive activity labels to their associated numbers in the
        # 'Activity_label' column within the 'new_combined_training_test' dataframe.
        new_combined_training_test$Activity_label <- descrip_activ_labels[new_combined_training_test$Activity_label, 2]
        
        
        # ============  Stage 4: Appropriately label the data set with descriptive variable names ===============#
        
        # To improve the descriptiveness of the variables, let's replace the 't' and 'f' notations for the measurements
        # with 'time-domain: ' and 'freq-domain: '. Additionally, when looking at the "new_combined_training_test" dataframe,
        # we see that for the last variable "fBodyBodyGyroJerkMag-std()" there is a typographical error which should ideally be :
        # "fBodyGyroJerkMag" as correctly listed in the "features_info.txt" text file. This double repeat of the word "Body" seems
        # to occur in other variables as well, so I will also tidy the dataset by fixing this typo.
        
        
        colnames(new_combined_training_test) <- gsub('^t','time-domain: ',colnames(new_combined_training_test))  
        colnames(new_combined_training_test) <- gsub('^f','freq-domain: ',colnames(new_combined_training_test))  
        colnames(new_combined_training_test) <- gsub('BodyBody','Body',colnames(new_combined_training_test))  
        
        
        # ============= Stage 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject =============#
        
        compute_av_each_activ_subj <- aggregate(. ~ Activity_label + subject_ID, data = new_combined_training_test , FUN="mean")
        
        
        switch_first_2_cols <- compute_av_each_activ_subj[,c("subject_ID","Activity_label")]
        
        
        independent_tidy_dataset <- cbind(switch_first_2_cols,compute_av_each_activ_subj[,-(1:2)])
        
        # write to txt file to create a second, independent tidy dataset.
        write.table( independent_tidy_dataset, file="independent_tidy_dataset.txt", row.name=FALSE)
        
        
}






