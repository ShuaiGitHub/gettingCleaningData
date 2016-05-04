# gettingCleaningData
For Coursera project

This projects aims to download and clean the data set provided by accelerometers from the Samsung Galaxy S smartphone. The final goal is to create a tidy dataset with following steps:

1. Merges the training and the test sets to create one data set.
    Steps incl
2. Extracts only the measurements on the mean and standard deviation for each measurement.
    Most steps were done in several grep function.

3. Uses descriptive activity names to name the activities in the data set
    In the instruction, we have activities originally labelled as "1","2"..."6" Use factor() function to relable those into "WALKING","WALKING_UPSTAIRS"..."LAYING"

4. Appropriately labels the data set with descriptive variable names.
    Orginal name often contain connecting lines

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
