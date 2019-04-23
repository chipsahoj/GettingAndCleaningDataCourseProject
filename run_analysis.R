# STEP 1 - Merge the training and the test sets to create on data set
# Read features labels into R for use in labeling the variables in the merged
# data set
setwd(
        "~/GitLab/coursera-data-science-specialization/03 - Getting and Cleaning Data/Week 4/UCI HAR Dataset"
)
features <- read.table("features.txt")

# Read the train data sets into R so they can then be merged / names columns
# using the features data set
setwd(
        "~/GitLab/coursera-data-science-specialization/03 - Getting and Cleaning Data/Week 4/UCI HAR Dataset/train"
)
X_train <- read.table("X_train.txt", col.names = features$V2)
y_train <- read.table("y_train.txt", col.names = "activity")
subject_train <-
        read.table("subject_train.txt", col.names = "subject number")

# Merges train data sets together
merged_train <- cbind(subject_train, y_train, X_train)

# Read the test data sets into R so they can then be merged / names columns
# using the features data set
setwd(
        "~/GitLab/coursera-data-science-specialization/03 - Getting and Cleaning Data/Week 4/UCI HAR Dataset/test"
)
X_test <- read.table("X_test.txt", col.names = features$V2)
y_test <- read.table("y_test.txt", col.names = "activity")
subject_test <-
        read.table("subject_test.txt", col.names = "subject number")

# Merges test data sets together
merged_test <- cbind(subject_test, y_test, X_test)

# Merges train and test data sets together
merged_all <- rbind(merged_test, merged_train)

# Converts the activity variable to a factor and assigns descriptive names to
# the factor levels
merged_all$activity <- as.factor(merged_all$activity)
levels(merged_all$activity) <-
        c(
                "walking",
                "walking.up.stairs",
                "walking.down.stairs",
                "sitting",
                "standing",
                "laying"
        )

# Removes source data sets
rm(
        features,
        merged_test,
        merged_train,
        subject_test,
        subject_train,
        X_test,
        X_train,
        y_test,
        y_train
)

# STEP 2 - Extract only the measurements on the mean and standard deviation for
# each measurement.
# Loads dplyr package and makes data set tbl_df
library(dplyr)
merged_all <- tbl_df(merged_all)

# Selects only the subject number, activity, and mean/std measurements
merged_all <-
        select(merged_all,
               subject.number,
               activity,
               contains("mean"),
               contains("std"))
merged_all <- select(merged_all,-contains("angle"))

# STEP 3 - Use descriptive activity names to name the activities in the data set.
# This was previously performed above as part of the merge process.
# STEP 4 - Appropriately label the data set with descriptive variable names.
# This was previously performed above as part of the merge process.
# Cleans up the variable names by removing the multiple periods
names(merged_all) <- gsub("\\.\\.\\.", ".", names(merged_all))

# STEP 5 - From the data set in step 4, create a second, independent tidy data
# set with the average of each variable for each activity and each subject.
tidy.df <- group_by(merged_all, activity, subject.number)
tidy.df <-
        summarize_at(tidy.df, vars(tBodyAcc.mean.X:fBodyBodyGyroJerkMag.std..), mean)

# Writes created data set to .txt file
setwd(
        "~/GitLab/coursera-data-science-specialization/03 - Getting and Cleaning Data/Week 4/Course Project"
)
write.table(tidy.df, "tidydata.txt")

# Reads in the created file to check it
data <-
        read.table(
                "~/GitLab/coursera-data-science-specialization/03 - Getting and Cleaning Data/Week 4/Course Project/tidydata.txt",
                header = TRUE
        )
View(data)