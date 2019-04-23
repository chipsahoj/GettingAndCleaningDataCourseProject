# Coursera *Getting and Cleaning Data* Course Project

As described in the instructions for this course project:

"One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users."

In this course project, data collected from the accelerometers from the Samsung Galaxy S smartphone were retrieved, compiled, manipulated, and cleaned to prepare a tidy data set which can be used for future analysis.

This repository contains the following files associated with this course project:

- `README.Rmd` - This R markdown file summarizes the aim of the project, the files found in this repository, and the data manipulation and cleaning that was performed in creating the final tidy data set, `tidydata.txt`.
- `tidydata.txt` - This .txt file contains the final tidy data set, created by the R script, `run_analysis.R`.
- `run_analysis.R` - This R script contains the code used to create the final tidy data set, `tidydata.txt`.
- `Codebook.Rmd` - This file contains a description of the contents of the final tidy data set, including descriptions of the variables.

## Study Description

Data were retrieved from the University of California, Irvine (UCI) Machine Learning Repository at [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Detailed information about the data set can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). A portion of the description found on that webpage is as follows:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Creation of the Final Tidy Data Set, `tidydata.txt`

In order to create the final tidy data set, `tidydata.txt`, the following actions were performed by way of the `run_analysis.R` R script:

- The various source data sets were read into R
- The source data sets were merged into one tidy data set
- The measurements on the mean and standard deviation for each measurement were extracted
- Descriptive names of the variables were applied and the names were cleaned
- The activity variable was made a factor variable and descriptive factor levels were applied
- A final, second tidy data set was created which provides the average of each variable for each activity and each subject
- The final, second tidy data set was written to a .txt file for sharing in the repository

The `tidydata.txt` file in this repository was created running the `run_analysis.R` R script in R version 3.5.3 on Windows 10 64-bit edition. The script also used the `dplyr` package version 0.8.0.1.

## Why is the Final Data Set Tidy?

The final data set is tidy because of the following:

- The variable names are abbreviated, yet descriptive (desribed in detail in the codebook, `Codebook.Rmd`)
- The activity variable has descriptive factor levels
- The data set only contains the mean and standard deviation variables for each of the measurements collected

## Code for Reading the Final Tidy Data Set, `tidydata.txt` into R

To read the final tidy data set, `tidydata.txt` into R, the following code can be copied and pasted into the console, after replacing the `file_path` argument with the appropriate path:

```
data <- read.table(file_path, header = TRUE)
View(data)
```
