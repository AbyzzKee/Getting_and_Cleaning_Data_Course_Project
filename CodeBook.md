This code book that describes the variables, the data, and transformations   
perform in "run_analysis.R"  
  
  
###################################################  
## Data in this project  
  
Raw data used in this project is "Human Activity Recognition Using Smartphones Data Set"  
it is collected from the accelerometers from the Samsung Galaxy S smartphone.  
The data was obtained on:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
  
Tidy data produce from this project is a independent data set with the   
average of each selected feature variable for each activity and each subject.  
  
Term explanation:  
    Feature variable - Normalized Time and frequency domain measurement from raw data.  
    Selected feature - Mean and standard deviation for each measurement.  
    Activity         - Carried out activity.  
    Subject          - Identifier of who carried out the experiment.  
  
###################################################  
## Variables in this project  
  
activity_labels - Data.Frame with Activity Labels  
features_lables - Data.Frame with Features Labels  
  
y_test        - Data.Frame of Activity in test  data set  
subject_test  - Data.Frame of Subject  in test  data set  
y_train       - Data.Frame of Activity in train data set  
subject_train - Data.Frame of Subject  in train data set  
  
grepMeanStd   - Logical   vector to grep selected feature from features_lables  
colClasses    - Character vector to filter selected feature in reading process  
x_test        - Data.Frame of selected feature from test  data.  
x_train       - Data.Frame of selected feature from train data.  
  
      x_merged - Data.Frame merged x_train and x_test  
      y_merged - Data.Frame merged y_train & y_test  
subject_merged - Data.Frame merged subject_train & subject_test  
   data_merged - Data.Frame merged subject_merged & y_merged & x_merged  
  
mean_std_labels - Character vector containing labels of selected feature  
  
subject_activity - Character vector of identifier combining subject & activity   
melt_merged      - Data.Frame of data_merged after melting process  
splitID          - Data.Frame of separated subject & activity   
result           - Data.Frame with the average of each selected feature variable for each activity and each subject.  
  
###################################################  
## Transformations performed in this project  
  
1. Filter only selected feature from x_train & x_test.  
2. Merge x_train, x_test, y_train, y_test, subject_train, subject_test into data_merged.  
3. Perform melt and cast process on data_merged to get result.