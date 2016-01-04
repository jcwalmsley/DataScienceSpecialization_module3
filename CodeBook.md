## GETTING AND CLEANING DATA COURSE PROJECT - JHUBPSH dt. 51207

## CONTENTS: 
A) RAW DATA SUMMARY 
B) RAW DATA DETAILS
        1) RAW DATA SET INCLUDES
        1) RAW DATA MEASUREMENTS
        2) RAW DATA NOTES ON THE MEAUSREUMENTS
        3) RAW DATA DIMENSIONS
        4) ADDITIONAL NOTES
C) VARIABLES OVERVIEW OF OBSERVATIONS 
D) PROCESSING / TRANSFORMATIONS OF THE RAW DATA
E) INSTRUCTIONS FOR FINAL PRODUCT
F) SOURCE INFORMATION
G) OTHER RELATED PUBLICATIONS

=======================================
## A) RAW DATA - SUMMARY:
A 561-feature vector with time and frequency domain variables.
Features are normalized and bounded within [-1,1].
Each feature vector is a row on the text file.
'features_info.txt': Shows information about the variables used on the feature vector.
'features.txt': List of all features.

========================================    
## B) RAW DATA - DETAILS:
For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## 1) RAW DATA SET INCLUDES:
I. 'README.txt'
a) 'features_info.txt': Shows information about the variables used on the feature vector.
b) 'features.txt': List of all features.
c) 'activity_labels.txt': Links the class labels with their activity name.
d)’train/X_train.txt': Training set.
e)’train/y_train.txt': Training labels.
f)’test/X_test.txt': Test set.
g)’test/y_test.txt': Test labels.

II. The following files are available for the train and test data. Their descriptions are equivalent. 
a) 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
b) 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signalfrom the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
c) 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
d) 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## 2) RAW DATA MEASUREMENTS: 
a) Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
b) 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
c) 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The  same description applies for the 
d) 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
e) 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
f ) 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the  gyroscope for each window sample. The units are **radians/second** 

## 3) RAW DATA NOTES ON THE MEASUREMENTS:
    
a) The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

b) The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## 4) RAW DATA DIMENSIONS
Description of abbreviations of measurements
1.	leading t or f is based on time or frequency measurements.
2.	Body = related to body movement.
3.	Gravity = acceleration of gravity
4.	Acc = accelerometer measurement
5.	Gyro = gyroscopic measurements
6.	Jerk = sudden movement acceleration
7.	Mag = magnitude of movement
8.	mean and SD are calculated for each subject for each activity for each mean and SD measurements.
The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.
These signals were used to estimate variables of the feature vector for each pattern: ‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions. They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.
•	tBodyAcc-XYZ
•	tGravityAcc-XYZ
•	tBodyAccJerk-XYZ
•	tBodyGyro-XYZ
•	tBodyGyroJerk-XYZ
•	tBodyAccMag
•	tGravityAccMag
•	tBodyAccJerkMag
•	tBodyGyroMag
•	tBodyGyroJerkMag
•	fBodyAcc-XYZ
•	fBodyAccJerk-XYZ
•	fBodyGyro-XYZ
•	fBodyAccMag
•	fBodyAccJerkMag
•	fBodyGyroMag
•	fBodyGyroJerkMag
The set of variables that were estimated from these signals are:
	•	mean(): Mean value
	•	std(): Standard deviation

## 5) ADDITIONAL NOTES: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

=======================================
## C) VARIABLES OVERVIEW OF OBSERVATIONS: Record of 30 individuals performing six activities to collect data on 89 variables
INDIVIDUAL SUBJECTS: 30 volunteers within an age bracket of 19-48 years.
ACTIVITIES: Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  

======================================
## D) PROCESSING / TRANSFORAMTIONS OF THE RAW DATA:
Create one R script called run_analysis.R that:
1) Download and unzip the files for the assignment into the local directory
2) Read the files
3) Merges the training and the test data sets to create one data set adding a header of variables (activity names)
4) Extracts only the measurements on the mean and standard deviation for each measurement.
5) Appropriately labels the data set with renamed descriptive acivity and variable names. 
6) From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each         activity and each subject.
## E) INSTRUCTIONS FOR FINAL PRODUCT:
Create the tidy data set called tidy.txt by;
Upload the tidy data set created in step 6 of the procuessing instructions above as a txt file created with                 write.table() using row.name=FALSE  

====================================
## F) SOURCE INFORMATION:
License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

For more information about this dataset contact: activityrecognition@smartlab.ws

## G) Other Related Publications:
===========================
[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz.  Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care.   Volume 19, Issue 9. May 2013

[3] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223. 

[4] Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Catal�. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.  

==================================================================================================
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita and Xavier Parra. November 2013.

