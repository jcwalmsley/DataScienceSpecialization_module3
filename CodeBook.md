##Getting and Cleaning Data Course Project JHUBPSH dt. 51207

## CONTENTS: 
A) RAW DATA SUMMARY 
B) RAW DATA DETAILS 
C) RAW DATA MEASUREMENTS 
D) RAW DATA NOTES ON THE MEAUSREUMENTS
E) ADDITIONAL NOTES
F) VARIABLES OVERVIEW OF OBSERVATIONS 
G) PROCESSING / TRANSFORMATIONS OF THE RAW DATA
H) INSTRUCTIONS FOR FINAL PRODUCT
I) SOURCE INFORMATION

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

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## C) RAW DATA MEASUREMENTS: 
        Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
        'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
        'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The  same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
        'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
        'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the  gyroscope for each window sample. The units are **radians/second** 

## D) RAW DATA NOTES ON THE MEASUREMENTS:
    
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## E) ADDITIONAL NOTES: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

=======================================
## F) VARIABLES OVERVIEW OF OBSERVATIONS: 
    (Record of 30 individuals performing six activities to collect data on 69 variables):
    INDIVIDUAL SUBJECTS:
        30 volunteers within an age bracket of 19-48 years.
    ACTIVITIES:
        Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  

For more information about this dataset contact: activityrecognition@smartlab.ws

======================================
## G) PROCESSING / TRANSFORAMTIONS OF THE RAW DATA:
    Create one R script called run_analysis.R that:
    1) Download and unzip the files for the assignment into the local directory
    2) Read the files
    3) Merges the training and the test sets to create one data set.
    4) Extracts only the measurements on the mean and standard deviation for each measurement. 
    5) Uses descriptive activity names to name the activities in the data set
    6) Appropriately labels the data set with descriptive variable names. 
    7) From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each         activity and each subject.
## H) INSTRUCTIONS FOR FINAL PRODUCT:
    Create the tidy data set called tidy.txt by;
        Upload the tidy data set created in step 7 of the procuessing instructions above as a txt file created with                 write.table() using row.name=FALSE  


====================================
## I) SOURCE INFORMATION:
License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Other Related Publications:
===========================
[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz.  Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care.   Volume 19, Issue 9. May 2013

[3] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223. 

[4] Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Catal�. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.  

==================================================================================================
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita and Xavier Parra. November 2013.

