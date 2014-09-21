Code book for course project Getting and cleaning data on Coursera.org.
=======================================================================
Andrej Fajfar
=======================================================================

I had got zip file from my class getting and cleaning data on 
Coursera.org. Zip content was .txt files with description and separate
datasets. Data was about project human activity recognition using smartphones
datasets. Our data was into 7 different .txt files which we had to put together
to create data for cleaning. First dataset include variable names('features.txt'),
other six datasets ware organized into two pairs separate 70% in train and 30% in test 
of all data.
They care information about: 
- training and test set('X_train' and 'X_test') with
- apropriate labels, which was actualy activity in numbers ('y_train'and'y_set') and
- humans included in research numbered 1-30('subject_train'and'subject_test')
One file contains coresponding labels for activity they perform in research('activity_labels')

=======================================================================

First part of code include lines for creating file, downloading and unziping 
the datasets and setting the working directory where were all our files for cleaning.
 
When I do this I have to load all packages I need for cleaning data: plyr,dplyr and tidyr.

The datasets were readed into R studio and merged thogether as they go with rbind, 
because they have desame number and names of coloumn. File features.txt was saved 
into object names and was used as variable names (coloumn names). Merged datasets were merged 
again with cbind and tbl_df, because this format of data frame is used in uploaded packages, and
saved in object data. 

First chaing was used to extracts only the measurements on the mean and standard deviation for each measurement. 
In this purpose was functions separate and mutate used. We had apropriate variable selected and 
mutate labels activity to each number through function factor.   

Second function descriptive_names accept no arguments and create more descriptive names of our variables.
In this purpose I used functions sub and gsub. Function return a character vector which was save into 
coloumn names of object data in the next step. 

Second chaining was used to creates a second, independent tidy data set with the average of each variable
for each activity and each subject. Function ddply was used. First it groups by variables Person an Activity then
compute average of every variable except Person and Activity. Result had been a tidy data frame with 180 rows and 
68 coloumn. So each variable except Person and Activity represent average of mean or standard deviation (std) it depend
what data variable care in the first place.

Last command was to export tidy data frame in txt file named TidyDataTable.

For better understanding of decription above see code in run_analysis.R file. 

=======================================================================

VARIABLE DESCRIPTION:

Person:	integer ( 1-30 )
	Individuals participating in research.

Activity: factor ( 6 levels )
	WALKING : 1
	WALKING_UPSTAIRS: 2
	WALKING_DOWNSTAIRS: 3
	SITTING: 4
	STANDING: 5
	LAYING: 6
	Activity in research.

TimeBodyAccelerationMeanX: numeric
	Mean of body acceleration signal in X axis and time domain.

TimeBodyAccelerationMeanY: numeric
	Mean of body acceleration signal in Y axis and time domain.

TimeBodyAccelerationMeanZ: numeric
	Mean of body acceleration signal in Z axis and time domain.

TimeGravityAccelerationMeanX: numeric
	Mean of gravity acceleration signal in X axis and time domain.

TimeGravityAccelerationMeanY: numeric
	Mean of gravity acceleration signal in Y axis and time domain.

TimeGravityAccelerationMeanZ: numeric
	Mean of gravity acceleration signal in Z axis and time domain. 

TimeBodyAccelerationJerkMeanX: numeric
	Mean of body acceleration Jerk signal in X axis and time domain.
	
TimeBodyAccelerationJerkMeanY: numeric
	Mean of body acceleration Jerk signal in Y axis and time domain.

TimeBodyAccelerationJerkMeanZ: numeric
	Mean of body acceleration Jerk signal in Z axis and time domain.

TimeBodyGyroscopeMeanX: numeric
	Mean of angular velocity from gyroscope signal in X axis and time domain.

TimeBodyGyroscopeMeanY: numeric
	Mean of angular velocity from gyroscope signal in Y axis and time domain.

TimeBodyGyroscopeMeanZ: numeric
	Mean of angular velocity from gyroscope signal in Z axis and time domain.

TimeBodyGyroscopeJerkMeanX: numeric
	Mean of angular velocity from gyroscope Jerk signal in X axis and time domain.

TimeBodyGyroscopeJerkMeanY: numeric
	Mean of angular velocity from gyroscope Jerk signal in Y axis and time domain.

TimeBodyGyroscopeJerkMeanZ: numeric
	Mean of angular velocity from gyroscope Jerk signal in Z axis and time domain.

TimeBodyAccelerationMagMean: numeric
	Mean of body acceleration magnitude and time domain.

TimeGravityAccelerationMagMean: numeric
	Mean of gravity acceleration magnitude and time domain.

TimeBodyAccelerationJerkMagMean: numeric
	Mean of body acceleration Jerk signal magnitude and time domain.

TimeBodyGyroscopeMagMean: numeric
	Mean of angular velocity from gyroscope magnitude and time domain.

TimeBodyGyroscopeJerkMagMean: numeric
	Mean of angular velocity from gyroscope Jerk signal magnitude and time domain.

FrequencyBodyAccelerationMeanX: numeric
	Mean of body acceleration signal in X axis and frequency domain.

FrequencyBodyAccelerationMeanY: numeric
	Mean of body acceleration signal in Y axis and frequency domain.

FrequencyBodyAccelerationMeanZ: numeric
	Mean of body acceleration signal in Z axis and frequency domain.

FrequencyBodyAccelerationJerkMeanX: numeric
	Mean of body acceleration Jerk signal in X axis and frequency domain.

FrequencyBodyAccelerationJerkMeanY: numeric
	Mean of body acceleration Jerk signal in Y axis and frequency domain.

FrequencyBodyAccelerationJerkMeanZ: numeric
	Mean of body acceleration Jerk signal in Z axis and frequency domain.

FrequencyBodyGyroscopeMeanX: numeric
	Mean of angular velocity from gyroscope signal in X axis and frequency domain.

FrequencyBodyGyroscopeMeanY: numeric
	Mean of angular velocity from gyroscope signal in Y axis and frequency domain.

FrequencyBodyGyroscopeMeanZ: numeric
	Mean of angular velocity from gyroscope signal in Z axis and frequency domain.

FrequencyBodyAccelerationMagMean: numeric
	Mean of body acceleration magnitude and frequency domain.

FrequencyBodyAccelerationJerkMagMean: numeric
	Mean of body acceleration Jerk signal magnitude and frequency domain.

FrequencyBodyGyroscopeMagMean: numeric
	Mean of angular velocity from gyroscope magnitude and frequency domain.

FrequencyBodyGyroscopeJerkMagMean: numeric
	Mean of angular velocity from gyroscope Jerk signal magnitude and frequency domain.

TimeBodyAccelerationStdX: numeric
	Standard deviation of body acceleration signal in X axis and time domain.

TimeBodyAccelerationStdY: numeric
	Standard deviation of body acceleration signal in Y axis and time domain.

TimeBodyAccelerationStdZ: numeric
	Standard deviation of body acceleration signal in Z axis and time domain.

TimeGravityAccelerationStdX: numeric
	Standard deviation of gravity acceleration signal in X axis and time domain.

TimeGravityAccelerationStdY: numeric
	Standard deviation of gravity acceleration signal in Y axis and time domain.

TimeGravityAccelerationStdZ: numeric
	Standard deviation of gravity acceleration signal in Z axis and time domain.

TimeBodyAccelerationJerkStdX: numeric
	Standard deviation of body acceleration Jerk signal in X axis and time domain.

TimeBodyAccelerationJerkStdY: numeric
	Standard deviation of body acceleration Jerk signal in Y axis and time domain.

TimeBodyAccelerationJerkStdZ: numeric
	Standard deviation of body acceleration Jerk signal in Z axis and time domain.

TimeBodyGyroscopeStdX: numeric
	Standard deviation of angular velocity from gyroscope signal in X axis and time domain.

TimeBodyGyroscopeStdY: numeric
	Standard deviation of angular velocity from gyroscope signal in Y axis and time domain.

TimeBodyGyroscopeStdZ: numeric
	Standard deviation of angular velocity from gyroscope signal in Z axis and time domain.

TimeBodyGyroscopeJerkStdX: numeric
	Standard deviation of angular velocity from gyroscope Jerk signal in X axis and time domain.

TimeBodyGyroscopeJerkStdY: numeric
	Standard deviation of angular velocity from gyroscope Jerk signal in Y axis and time domain.

TimeBodyGyroscopeJerkStdZ: numeric
	Standard deviation of angular velocity from gyroscope Jerk signal in Z axis and time domain.

TimeBodyAccelerationMagStd: numeric
	Standard deviation of body acceleration magnitude and time domain.

TimeGravityAccelerationMagStd: numeric
	Standard deviation of gravity acceleration magnitude and time domain.

TimeBodyAccelerationJerkMagStd: numeric
	Standard deviation of body acceleration Jerk signal magnitude and time domain.

TimeBodyGyroscopeMagStd: numeric
	Standard deviation of angular velocity from gyroscope magnitude and time domain.

TimeBodyGyroscopeJerkMagStd: numeric
	Standard deviation of angular velocity from gyroscope Jerk signal magnitude and time domain.

FrequencyBodyAccelerationStdX: numeric
	Standard deviation of body acceleration signal in X axis and frequency domain.

FrequencyBodyAccelerationStdY: numeric
	Standard deviation of body acceleration signal in Y axis and frequency domain.

FrequencyBodyAccelerationStdZ: numeric
	Standard deviation of body acceleration signal in Z axis and frequency domain.

FrequencyBodyAccelerationJerkStdX: numeric
	Standard deviation of body acceleration Jerk signal in X axis and frequency domain.

FrequencyBodyAccelerationJerkStdY: numeric
	Standard deviation of body acceleration Jerk signal in Y axis and frequency domain.

FrequencyBodyAccelerationJerkStdZ: numeric
	Standard deviation of body acceleration Jerk signal in Z axis and frequency domain.

FrequencyBodyGyroscopeStdX: numeric
	Standard deviation of angular velocity from gyroscope signal in X axis and frequency domain.

FrequencyBodyGyroscopeStdY: numeric
	Standard deviation of angular velocity from gyroscope signal in Y axis and frequency domain.

FrequencyBodyGyroscopeStdZ: numeric
	Standard deviation of angular velocity from gyroscope signal in Z axis and frequency domain.

FrequencyBodyAccelerationMagStd: numeric
	Standard deviation of body acceleration magnitude and frequency domain.

FrequencyBodyAccelerationJerkMagStd: numeric
	Standard deviation of body acceleration Jerk signal magnitude and frequency domain.

FrequencyBodyGyroscopeMagStd: numeric
	Standard deviation of angular velocity from gyroscope magnitude and frequency domain.

FrequencyBodyGyroscopeJerkMagStd: numeric
	Standard deviation of angular velocity from gyroscope Jerk signal magnitude and frequency domain.  