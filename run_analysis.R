# Load dplry package
library(dplyr)

# Read in required data
activity_labels <- read.table("activity_labels.txt", quote="\"", comment.char="")
features <- read.table("features.txt", quote="\"", comment.char="")
subject_train <- read.table("./train/subject_train.txt", quote="\"", comment.char="")
X_train <- read.table("./train/X_train.txt", quote="\"", comment.char="")
y_train <- read.table("./train/y_train.txt", quote="\"", comment.char="")
subject_test <- read.table("./test/subject_test.txt", quote="\"", comment.char="")
X_test <- read.table("./test/X_test.txt", quote="\"", comment.char="")
y_test <- read.table("./test/y_test.txt", quote="\"", comment.char="")

# Add variable names to data frame
colnames(X_train) <- features$V2
colnames(X_test) <- features$V2

# Add subject ID coloumn to data frames
X_train <- cbind(X_train, subject_train)
X_test <- cbind(X_test, subject_test)

# Rename new subject column
colnames(X_train)[562]<- "subjectID"
colnames(X_test)[562]<- "subjectID"

# Add activity ID coloumn to data frames
X_test <- cbind(X_test, y_test)
X_train <- cbind(X_train, y_train)

# Rename new activity column
colnames(X_test)[563]<- "activity"
colnames(X_train)[563]<- "activity"

# Combine test & train data
mData <- rbind(X_test, X_train)

# Change class of activity column to factors
mData$activity <- as.factor(mData$activity)

# Change class of subjectID column to factors
mData$subjectID <- as.factor(mData$subjectID)

# Replace activity IDs with decriptive names
levels(mData$activity) <- activity_labels$V2

# Find columns that contain measurements of mean & standard deviation
toMatch <- c("mean","std", "subjectID", "activity")
colsExtract <- unique (grep(paste(toMatch,collapse="|"), names(mData), value=TRUE))

# Extract columns that contain measurements of mean & standard deviation
msData <- mData[colsExtract]

# Group dataset by activity & subjectID
asData <- group_by(msData, activity, subjectID, add = TRUE)

# Calculate mean of each variable for each combination of activity & subjectId
avgsubactData<-summarise_each(asData, funs(mean))

# Output resulting dataset as a text file
write.table(avgsubactData, file = "output.txt", row.names = FALSE)