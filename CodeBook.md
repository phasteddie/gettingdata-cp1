## Data
The raw datasets were obtained from the UCI Human Activity Recognition project site, at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data comes from an experiment carried out on 30 subjects, who performed six
activities while having their measurements taken with a smartphone. The raw measurements 
come from the accelerometer (used to measure acceleration), and the gyroscope (used to
measure angular velocity). The original units are gravity units for the accelerometer
measurements, and radians/second for those from the gyroscope.

The UCI team filtered the measurements to reduce noise and performed a number of calculations
to produce 561 features for each subject-activity-measurement event. Additionally, all the
features were centered and scaled to lie in the interval [-1, 1]. Subjects are divided
into a training set and test set, representing 70% and 30% of the original data, respectively.

The documentation for the original dataset lists the following calculations made:

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

where t represents the time domain, and f the frequency domain. I used all of these categories
in the final dataset. For each of the variables, 
the following estimates were produced: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

For each type of measurement (i.e. those starting with t or f) I extracted the mean, standard
deviation and, when applicable, mean frequency. I then took the mean of each of these variables
by subject-activity to produce the final dataset.