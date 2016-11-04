## README

This repo contains the submitted files for the 'Getting and Cleaning Data' project. In total, 4 files including this
README file are provided. Specifically, the following are provided in this repo: 

i) the source code script 'run_analysis.R', 
ii)the generated independent tidy dataset for task 5 in the assignment called 'independent_tidy_dataset.csv', 
iii) a code book named 'CodeBook.md', which describes the variables, data and work performed to clean the data, as well as, 
iv) this 'README.md' file.

### How to run the source code file 'run_analysis.R'

The following is an example of how to run my code for this project. Please note that you must download the
'UCI HAR Dataset' and place this folder in the same directory as the source code file.

setwd("C:/Users/ravi/Getting_and_Cleaning_Data_course_project")
source("run_analysis.R") #load source code
Path_to_data_folder <- "C:/Users/ravi/Getting_and_Cleaning_Data_course_project"
Do_Tidy_Data(Path_to_data_folder)



