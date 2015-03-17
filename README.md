Cleaning Data
----------------------------------------------------
This is a decription of Getting and Cleaning Data project.
After sourcing this script you will get a data.table named
"processed_data" in your global environment

**How does the script work?**
- checks if the current wd is "UCI HAR Dataset"
- puts data together from the training set
- adds proper colomn names
- transforms digital activity descriptions into meaningful format
- does the same things with the testing set
- puts these two sets together yelding cleaned dataset
- removes unnecessary variables
- calculates mean values of digital variables

**Description of variables in output**
1. subject - a volunteer number
2. activity - type of activity in text format
3. all other digital variables descriptions can be found in the feature-info.txt file 