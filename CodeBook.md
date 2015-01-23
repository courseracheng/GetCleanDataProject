# Code book of GetCleanDataProject (run_analysis.R)
## Variables in the code
* train: all train data read from train/X_train.txt
* test: all test data read from test/X_test.txt
* data: merge train and test together 

* features: all the features in the data
* featsel: selected features with mean and std by two steps (1) get features with mean and std (2) remove features with meanFreq
* datasel: refined data set based on the featsel

* subjecttrain: subject id for train set
* subjecttest: subject id for test set

* labeltrain: activity label for train set
* labeltest: activity label for test set

* activityname : label index and correspondeing activity name

* datatidy: data with extra group column for tidy data

* tidy: data with 180 rows (30 subject * 6 activity) and 66 variables

## features in tidy.txt
Based on the rules only keep mean() and std() from original data here is more details decription (this is adapted from features_info.txt in UCIHARDataset)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

mean(): Mean value
std(): Standard deviation


The complete list of variables of each feature vector is available in 'features.txt' with total 66 variables.

