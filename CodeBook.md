Below is requirement from the project description:  
a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md



*	###Variables:
	*	_Orginal variables_: There are three types of variables: subject id that ranges 1 to 30. acitivity id that ranges from 1 to 6.
	
	*	_the goal of the work done on variable_: to create variable names follow tidy data set rules. Additionally, the project description only needs mean and std variables for those measures. One thing that current data set is not "tidy" is the variable name is not clear or follows "camelCase" rule. below is the transformation on those variables.
	
	* ####transformation on variables
		
		*	select variables that only have -mean() or -std() abbrevations. This is done by grep function.
		*	based on variable names, select columns that only contain those names in the dataset (see the Description)


*	###Data:
    *	orginal data contains a X_train file and Y_train
	* 	transformation performed
	* ####transformation on data
*	###CleanUp and Combination