## Download and unzip the data to be ./UCIHARDataset
## The blank space in the data folder name has been remove

# 1 Merges the training and test sets to creat on data set

## load data sets
train = read.table("./UCIHARDataset/train/X_train.txt")
dim(train)

test = read.table("./UCIHARDataset/test/X_test.txt")
dim(test)

## merge train and test by rbind
data = rbind(train, test)
dim(data)

# 2 Extracts only the measurements on the mean and standard deviation for each measurement

## read all features names
features = read.table("./UCIHARDataset/features.txt")
dim(features)

## select features
featsel  = features[(grepl("mean()", features[,2])| grepl("std()", features[,2])),]

## remove meanFreq()
featsel = featsel[!grepl("meanFreq()",featsel[,2]),]
featsel
dim(featsel)

## extract the meansurement above from data
datasel = data[, featsel[,1]]
dim(datasel)
## apply the colnames of the first 66 features and this the job for part 4
colnames(datasel) = featsel[,2]

## add subject id to each row
## This is for the  part 5 of this project
subjecttrain = read.table("./UCIHARDataset/train/subject_train.txt")
subjecttest = read.table("./UCIHARDataset/test/subject_test.txt") 
datasel$subject = rbind(subjecttrain, subjecttest)$V1
head(datasel)


# 3 Use descriptive activity names to name the activities in the data set

## read in the labels from train and test and combine them add to datasel
labeltrain = read.table("./UCIHARDataset/train/y_train.txt")
labeltest = read.table("./UCIHARDataset/test/y_test.txt")
datasel$label = rbind(labeltrain, labeltest)$V1
dim(datasel)

## read in activity labels
activityname = read.table("./UCIHARDataset/activity_labels.txt")
activityname

## apply the label id to be label name for the activity
datasel$label = factor( datasel$label, levels = activityname$V1, labels = activityname$V2)

head(datasel)


# 4 labels the data set with descriptive variable names

## apply the colnames of the first 66 features 
## this have been done in party 2

## change the name of subject to subjectID and label to activity
colnames(datasel)[67] = "subjectID"
colnames(datasel)[68] = "activity"
head(datasel)

# 5 from the data set in step 4, create a second tidy data with average of each 
# variable for each activity and each subject

## assign data in step 4 to a new data datatidy
datatidy = datasel

## create new column group which is put subjectID and activity together
datatidy$group = paste(datatidy$subjectID, datatidy$activity)
head(datatidy)

## change group column to be factor so it will be 30 * 6 = 180 levels
datatidy$group = as.factor(datatidy$group)
head(datatidy)
str(datatidy)

## create new data frame for the means
tidy = data.frame(1:180)

for (i in 1:66){
  tidy[, colnames(datatidy)[i]] = tapply(datatidy[,i], datatidy$group, mean)  
}

head(tidy)
dim(tidy)
tidy[,1] = NULL
write.table(tidy, file = "tidy.txt",row.name=FALSE)
