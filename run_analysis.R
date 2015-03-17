

#Loading tests and train datasets
# Check if the wd is "UCI HAR Dataset" (for *nix only)
vec <- strsplit(getwd(), "/")
wd <- tail(vec[[1]], n=1)
if (wd != "UCI HAR Dataset") {
  print ('please, change wd to UCI HAR Dataset and run script again')
} else {
  #load activity_labels
  act <- read.table("activity_labels.txt")
  #data_train
  data_train_X <- read.table("train/X_train.txt")
  data_train_Y <- read.table("train/y_train.txt")
  data_train_subjects <- read.table("train/subject_train.txt")
  colnames(data_train_Y) <- c("activity")
  colnames(data_train_subjects) <- c("subjects")
  Y_info <- read.table("features.txt")
  colnames(data_train_X) <- Y_info[,2]
  # extracting information on mean and std
  data_train_X <- data_train_X[, which(grepl("(mean|std)", colnames(data_train_X)))]
  #finding and replacing activity labels
  activities <- data.table()
  for (activity in data_train_Y){
    activities <- rbind(activities, list(act[activity,2]), use.names =FALSE)}
  colnames(activities) <- c("activity")
  temp1 <- cbind(data_train_subjects, activities, data_train_X)
  #data test
  data_test_X <- read.table("test/X_test.txt")
  data_test_Y <- read.table("test/y_test.txt")
  data_test_subjects <- read.table("test/subject_test.txt")
  colnames(data_test_subjects) <- c("subjects")
  colnames(data_test_X) <- Y_info[,2]
  # extracting information on mean and std
  data_test_X <- data_test_X[, which(grepl("(mean|std)", colnames(data_test_X)))]
  #finding and replacing activity labels
  activities <- data.table()
  for (activity in data_test_Y){
    activities <- rbind(activities, list(act[activity,2]), use.names =FALSE)}
  colnames(activities) <- c("activity")
  temp2 <- cbind(data_test_subjects, activities, data_test_X)
  # combinning test and training sets
  data <- rbind(temp1, temp2)
  #deleting unncessary data
  remove(data_train_X)
  remove(data_train_Y)
  remove(data_train_subjects)
  remove(Y_info)
  remove(data_test_X)
  remove(data_test_Y)
  remove(data_test_subjects)
  remove(temp1)
  remove(temp2)
  remove(activities)
  remove(act)
  processed_data <- ddply(data, .(subjects, activity), numcolwise(mean))
}