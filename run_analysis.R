dir<-"/UCI HAR Dataset"
files<-list.files(path="./UCI HAR Dataset/train/Inertial Signals")
subfolder<-"./UCI HAR Dataset/train/"
full_name<-paste0(subfolder,"X_train.txt")
testData <-read.table(full_name,header=F)