
Original data
The original data, downloaded from “https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip”, contained the following relevant files:

	⁃	subject_test.txt: an identifying number for the participants who contributed to the test data
	⁃	Y_text.txt: an indicator for whether the 2947 test observations were made while the participants was walking, walking upstairs, walking downstairs, sitting, standing, or laying
	⁃	X_test.txt: for the 2947 test observations, the data for the 561 features which were measured
	⁃	subject_train.txt: an identifying number for the participants who contributed to the training data
	⁃	Y_train.txt: an indicator for whether the 7352 training observations were made while the participants was walking, walking upstairs, walking downstairs, sitting, standing, or laying
	⁃	X_train.txt: for the 7352 training observations, the data for the 561 features which were measured
	⁃	features.txt: the names of the 561 features, or measurements that were taken as part of data collection

Creating a data frame for the test data
subject_test.txt, Y_test.txt and X_test.txt were combined into one dataset “testset” using the cbind function

This resulted in a data frame testset with 2947 observations and 563 variables. 
The 563 variables consist of the subject_test.txt identifier; the activity Y_test.txt activity indicator; and the 561 features from X_test.txt

Creating a data frame for the training data
subject_train.txt, Y_train.txt and X_train.txt were combined into one dataset “trainset” using the cbind function

This resulted in a data frame trainset with 7352 observations and 563 variables. 
The 563 variables consist of the subject_train.txt identifier; the activity Y_train.txt activity indicator; and the 561 features from X_train.txt

Merging the test and training data
trainset and test set were merged using the rbind function.
This resulted in a data frame fullset with 10299 observations (the combined 2947 and 7352 from test and training data) and 563 variables, as described above.

Renaming of variables
Variables V1, V2,…V563 were renamed as “subject”, “activity”, and the names of the 561 features included in the features.txt file (e.g. “tBodyAcc-mean()-X”)

A data frame was created containing the names”subject” and “activity”. The features.txt file was read into R as a 561 item data frame. These two data frames were merged together using rbind, and converted into a vector of length 563. Using the names function, the names from this vector were applied to the fullset data frame.

Reducing the full set
Only those features providing measures of mean and standard deviation of the various measurements were of interest, thus the fullset data frame needed to be reduced. Using the grep function, the reducedset data frame was created, consisting of the “subject” and “activity” variables, as well as those feature variables which included “mean” or “std” in the names. Additionally, those including “meanFreq” were excluded, using the grepl function with the ! (excluding) parameter.

This resulted in a data frame analysisset with 10299 observations and 68 variables.

Renaming “activity” levels to be descriptive
The 1-6, which indicated activity, were renamed as “walking”, “walking_upstairs”, “walking_downstairs”, “sitting”, “standing”, and “laying” by first converting the “activity” variable to a factor and using the levels function to rename.

Reducing dataset to include only subset averages
The data frame is reduced to a data frame redset including a variable of the averages of the various features for the different activities and participants
