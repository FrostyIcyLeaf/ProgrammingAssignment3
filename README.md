---
title: "README for run_analysis.R"
output: html_document
---

## README for run_analysis.R

The R script run_analysis.R cleans up data downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

### First part
The structure of the script is as follows

* Load dplyr library
* Download data from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> and store it in the working directory as `data.zip`
* unzip the `data.zip` file
* read the table data from the test and train directories into respective variables. The following variables are being prefixed with test or train to indicate test or training data:
    + `X`
    + `Y`
    + `Subject`
    + `BodyAccX`
    + `BodyAccY`
    + `BodyAccZ`
    + `BodyGyroX`
    + `BodyGyroY`
    + `BodyGyroZ`
    + `TotalAccX`
    + `TotalAccY`
    + `TotalAccZ`
* feature and activity labels are read into respective data frames
* After all data is read into data frames, the corresponding test and training data frames are bound together with rbind
* The labels in features.txt are not unique, so the next step will correct that by adding `X`, `Y`, `Z` labels and make the later column names unique
* Next we change the column names to the lables from the `features.txt` and give the Inertial data more meaningful names
* Once all columns are appropriatley labeled the different data frames are merged together using cbind
* The merged data set is joined with the activity lables to get a text label for the Activity type
* Next only Standard Deviation columns and Mean columns are selected. The columns are merged with Subject and Activity information for further p processing.
* The resulting data frame is labeled with more meaningful column names. The details can be found in the `CodeBook.md` file.
* Finally the mergedData is joined with the Subject and Activity information and one of the Activity related column is ommitted to match the d definition of tidy data of the data set.
* The result is writtten to the `tidyData.txt` file in the working directory

### Second part
In a second phase the data from before is processed further as follows

* Group the data by Subject and Activity
* Use the summarise_all function to calculate the mean for all columns under the group_by condition
* Write the resulting data to the file `tidyMeanGroupedData.txt`

