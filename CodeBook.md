---
title: "Code book for tidy data produced by run_analysis.R"
output: html_document
---

## Code book for tidy data produced by run_analysis.R

The script run_analysis.R generates two files `tidyData.txt` and `tidyMeanGroupedData.txt`

The following variables are found in the respective files:

### tidyData.txt
* `Subject` - Indictaes the test subject, that performs the activity
* `Activity` - A character string indicating the type of activity performed

Furthermore there are 66 variables grouped into Time Domain variables and Frequency Domain variables. This indicates whether the data is information in the time domain or data transformed using the Fast Fourier Transformation into the frequency domain. In each group there are mean values and standard deviation values. The data is always collected for Body acceleration, Gravity acceleration, Body Acceleration Jerk, Gyro and Gyro Jerk for which we always have three components in X, Y and Z dimension. In addition there are 5 time series Mag value for Body Acceleration, Gravity Acceleration, Body Acceleration Jerk, Gyro and Gyro Jerk as well as 4 frequency domain Mag values for Body Acceleration, Acceleration Jerk and Body Gyro and Gyro Jerk. These variables are labeled by putting the respective group words together to generate unique column names. They are:

* `Time Domain Mean Body Acceleration X`
* `Time Domain Mean Body Acceleration Y`
* `Time Domain Mean Body Acceleration Z`
* `Time Domain Mean Gravity Acceleration X`
* `Time Domain Mean Gravity Acceleration Y`
* `Time Domain Mean Gravity Acceleration Z`
* `Time Domain Mean Body Acceleration Jerk X`
* `Time Domain Mean Body Acceleration Jerk Y`
* `Time Domain Mean Body Acceleration Jerk Z`
* `Time Domain Mean Body Gyro X`
* `Time Domain Mean Body Gyro Y`
* `Time Domain Mean Body Gyro Z`
* `Time Domain Mean Body Gyro Jerk X`
* `Time Domain Mean Body Gyro Jerk Y`
* `Time Domain Mean Body Gyro Jerk Z`
* `Time Domain Mean Body Acceleration Mag`
* `Time Domain Mean Gravity Acceleration Mag`
* `Time Domain Mean Body Acceleration Jerk Mag`
* `Time Domain Mean Body Gyro Mag`
* `Time Domain Mean Body Gyro Jerk Mag`
* `Frequency Domain Mean Body Acceleration X`
* `Frequency Domain Mean Body Acceleration Y`
* `Frequency Domain Mean Body Acceleration Z`
* `Frequency Domain Mean Body Acceleration Jerk X` 
* `Frequency Domain Mean Body Acceleration Jerk Y` 
* `Frequency Domain Mean Body Acceleration Jerk Z`
* `Frequency Domain Mean Body Gyro X` 
* `Frequency Domain Mean Body Gyro Y` 
* `Frequency Domain Mean Body Gyro Z` 
* `Frequency Domain Mean Body Acceleration Mag` 
* `Frequency Domain Mean Body Acceleration Jerk Mag`
* `Frequency Domain Mean Body Gyro Mag`
* `Frequency Domain Mean Body Gyro Jerk Mag`
* `Time Domain Standard Deviation Body Acceleration X`
* `Time Domain Standard Deviation Body Acceleration Y`
* `Time Domain Standard Deviation Body Acceleration Z`
* `Time Domain Standard Deviation Gravity Acceleration X`
* `Time Domain Standard Deviation Gravity Acceleration Y`
* `Time Domain Standard Deviation Gravity Acceleration Z`
* `Time Domain Standard Deviation Body Acceleration Jerk X`
* `Time Domain Standard Deviation Body Acceleration Jerk Y`
* `Time Domain Standard Deviation Body Acceleration Jerk Z`
* `Time Domain Standard Deviation Body Gyro X`
* `Time Domain Standard Deviation Body Gyro Y`
* `Time Domain Standard Deviation Body Gyro Z`
* `Time Domain Standard Deviation Body Gyro Jerk X`
* `Time Domain Standard Deviation Body Gyro Jerk Y`
* `Time Domain Standard Deviation Body Gyro Jerk Z`
* `Time Domain Standard Deviation Body Acceleration Mag`
* `Time Domain Standard Deviation Gravity Acceleration Mag`
* `Time Domain Standard Deviation Body Acceleration Jerk Mag`
* `Time Domain Standard Deviation Body Gyro Mag`
* `Time Domain Standard Deviation Body Gyro Jerk Mag`
* `Frequency Domain Standard Deviation Body Acceleration X`
* `Frequency Domain Standard Deviation Body Acceleration Y` 
* `Frequency Domain Standard Deviation Body Acceleration Z` 
* `Frequency Domain Standard Deviation Body Acceleration Jerk X` 
* `Frequency Domain Standard Deviation Body Acceleration Jerk Y` 
* `Frequency Domain Standard Deviation Body Acceleration Jerk Z`
* `Frequency Domain Standard Deviation Body Gyro X` 
* `Frequency Domain Standard Deviation Body Gyro Y` 
* `Frequency Domain Standard Deviation Body Gyro Z` 
* `Frequency Domain Standard Deviation Body Acceleration Mag` 
* `Frequency Domain Standard Deviation Body Acceleration Jerk Mag`
* `Frequency Domain Standard Deviation Body Gyro Mag`
* `Frequency Domain Standard Deviation Body Gyro Jerk Mag`

### tidyMeanGroupedData.txt
* `Subject` - Indictaes the test subject, that performs the activity
* `Activity` - A character string indicating the type of activity performed

Furthermore there are 66 variables grouped into Time Domain variables and Frequency Domain variables. They are labeled in the same fashion as in the `tidyData.txt` case but refer to the mean of the respective column. The data is thereby grouped by Subject and Activity resulting in 6 x 30 = 180 rows. To avoid lengthy names, the columns are named exactly the same as in the `tidyData.txt` file but the file name indicates that the data are all means.