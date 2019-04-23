# Codebook - Coursera *Getting and Cleaning Data* Course Project

This codebook provides detailed descriptions of the `tidydata.txt` file found in this repository. The accompanying `README.Rmd` file---also found in this repository---provides a background of the project and the steps used to create this `tidydata.txt` data set.

This codebook is divided into two sections:

- [Section 1: Data](#data)
- [Section 2: Variables](#variables)

[Section 1: Data](#data) contains a description of the data set as a whole, including its structure.
[Section 2: Variables](#variables) contains a description of each of the variables in the data set.

## Section 1: Data <a name="data"></a>

The `tidydata.txt` file is a text data file which contains space-separated values. The structure of the file is as follows:

- The first row in the file contains the names of the variables. These variables are described later on in the [Section 2: Variables](#variables) section.
- The remaining rows contain the values of these varibles for each observation.

## Section 2: Variables <a name="variables"></a>

Each row (observation) in the data set contains 79 averaged signal measurements for a given subject and activity type.

### Description of Each Variable

* `subject.number`  
  + Subject identifier number, integer, ranges from 1-30

* `activity`  
  + Activity type during measurement, factor with 6 possible values/levels  
    - 1 `walking`: subject was walking  
    - 2 `walking.up.stairs`: subject was walking up stairs  
    - 3 `walking.down.stairs`: subject was walking down stairs  
    - 4 `sitting`: subject was sitting  
    - 5 `standing`: subject was standing  
    - 6 `laying`: subject was laying  
    
#### Average of Measurements

All measurements were measured as described in the `features_info.txt` file found in the original downloaded source data zip folder:  

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
> * tBodyAcc-XYZ
> * tGravityAcc-XYZ
> * tBodyAccJerk-XYZ
> * tBodyGyro-XYZ
> * tBodyGyroJerk-XYZ
> * tBodyAccMag
> * tGravityAccMag
> * tBodyAccJerkMag
> * tBodyGyroMag
> * tBodyGyroJerkMag
> * fBodyAcc-XYZ
> * fBodyAccJerk-XYZ
> * fBodyGyro-XYZ
> * fBodyAccMag
> * fBodyAccJerkMag
> * fBodyGyroMag
> * fBodyGyroJerkMag

For each of these variables (both body and gravity signals, as well as both time-domain and frequency domain signals as described above), the average (mean), standard deviation (std), and the weighted average of the frequency (meanFreq) were created for each subject and each activity type (where applicable).

Using the above information, each variable name has an abbrieviated, yet descriptive title to keep the names as brief as possible while being descriptive.