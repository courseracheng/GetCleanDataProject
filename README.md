##GetCleanDataProject
===
## File in this repo
===
* UCIHARDataset: the unzip dataset from the website
* README.md: this file for descript what is in this folder
* run_analysis.R: R code for all this five jobs
* CodeBook.md: code book to describe the code
* tidy.txt: tidy data set
* features.txt: detail of refined features

===
## Five goals of this project
* Merges the training and the test sets to create one data set. 
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set 
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Step in the code (run_analysis.R)
### 1.  Merges the training and test sets to creat on data set
* read in train and test file
* merge them together by rbind()

### 2. Extracts only the measurements on the mean and standard deviation for each measurement
* read in features
* refine features with mean() and std() inside
* remove features with meanFreq() inside
* create refined data set datasel based on the featrues
* add column name to the datasel ( this is for step 4)
* read in subject id
* assign subject id to datasel ( this is for step 5)

### 3. Use descriptive activity names to name the activities in the data set
* read labels for train and test
* assign labels to datasel
* read in activity name for each label
* change label id to be activity name

### 4. labels the data set with descriptive variable names
* this first 66 column have name assigned in step 2
* change 67th column name to be subjectID
* change 68th column name to be activity

### 5. from the data set in step 4, create a second tidy data with average of each variable for each activity and each subject
* get a new dataset datatidy with one extra variabel group which subjectID and activity together
* change group variable to be factor with 180 levels
* create new dataset tidy for tidy.txt
* calculate mean for each subject each activity
* wirte to file tidy.txt
