## CodeBook
##### Below is requirement from the project description:  
a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.



### Variables:
*	_Orginal variables_: There are three types of variables: subject id that ranges 1 to 30. acitivity that ranges from 1 to 6. There are total 561 variables. See features_info.txt for the full list. There are 7352 observations for training data. There are 2947 observations for test data.

*	_the goal of the work done on variable_: to create variable names follow tidy data set rules. Additionally, the project description only needs mean and std variables for those measures. For example,tBodyAcc-mean()-X refers to X axis of tbody accelometer's mean on that sample. One thing that current data set is not "tidy" is the variable name is not clear or follows "camelCase" rule. below is the transformation on those variables. The full list can be found in features.txt.

* **_transformation on variables_**:
	*	use read.table function to read original feature names into data frame. There are total 561 variables.
	*	select variables that only have -mean() or -std() abbrevations. This is done by grep function.
	*	based on variable names, select columns that only contain those names in the dataset.
	* rename those variables to make data tidy. For example, the variable tBodyAcc-mean()-X goes back to tBodayAccMeanX. This is done by gsub function.


### Data:
*	_orginal data_: contains a X_train file and Y_train txt in each trian and test folder. Similarly, it also contains a X_test file and Y_test file with same length of rows. Additional subject information is stored in subject_train, subject_test respectively.
* 	**_transformation performed on the data_**:
	*	use read.table function to read both train and test files into data frame.
	*	use rbind() and cbind() function to combine x_train,y_train, x_text,subject_train,subject_test files together.
	*   The whole transformation on the data is performed by use of melt function and dcast function.
	* m

### CleanUp and Combination
*	Using rbind and cbind function to combine train and  test datasets.
*	Descriptions of Tidy Data Variables
