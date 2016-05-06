### gettingCleaningData Final Project
For Coursera project

This projects aims to download and clean the data set provided by accelerometers from the Samsung Galaxy S smartphone. The final goal is to create a tidy dataset with following steps:

1. **Merges the training and the test sets to create one data set**.  
    details about merging data can be found in CodeBook.md _data_ session.

2. **Extracts only the measurements on the mean and standard deviation for each measurement**.  
    This involves transformation on variables. Details can be found in CodeBook.md _variable_ session.

3. **Uses descriptive activity names to name the activities in the data set**.  
    In the instruction, we have activities originally labelled as "1","2"..."6" Use revalue() function to rename those into "WALKING","WALKING_UPSTAIRS"..."LAYING"

4. **Appropriately labels the data set with descriptive variable names**.  
    Original names are composed as Name-function-axis. To fulfill the tidy data definition, these variable names are renamed by camelCase (the first word is small while other names are capital)

5. **From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**.  
    The tidy dataset generation and following calculation as based on melt function and dcast function (very handy!). Use _ID_ and _Activity_ as variables, we can calculate the mean of each combination directly.
