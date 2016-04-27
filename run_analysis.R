#initilizae please set the working directory to source file to make it work
mainDir<-"./UCI HAR Dataset/"
testDir<-"./UCI HAR Dataset/test/"

#create names for files
train_name<-paste0(mainDir,"train/","X_train.txt")
feature_name<-paste0(mainDir,"features.txt")
test_name<-gsub("train","test",train_name)


#read original data into files
subjectTrain<-read.table(gsub("X","subject",train_name),header=F)
subjectTest<-read.table(paste0(mainDir,"test/","subject_test.txt"),header=F)
trainData <-read.table(train_name,header=F)
require(dplyr)
testData <-read.table(test_name,header=F)
trainActivityName<-sub("X","Y",train_name)
trainOutcome<-read.table(trainActivityName,header=F)
testActivityName<-sub("X","Y",test_name)
testOutcome<-read.table(testActivityName,header=F)
featureData<-read.table(feature_name,stringsAsFactors=F)

#assign names
# first combine traindata and testdata for subject Id and activity
fullMeasure<-rbind(trainData,testData)
fullSubject<-rbind(subjectTrain,subjectTest)
fullOutcome<-rbind(trainOutcome,testOutcome)
#read candidate of names
colnames(fullMeasure)<-featureData$V2
#select only mean and std variables
selectedFeature<-grep("-mean()|-std()",featureData$V2,value=T)
#remove meanFreq() variables
selectedFeature<-selectedFeature[-grep("-meanFreq",selectedFeature)]
#subset measure matrix based variables we are interested in
selectMeasure<-subset(fullMeasure,select=selectedFeature)
selectedFeature<-gsub("-mean[-()]*","Mean",selectedFeature)
selectedFeature<-gsub("-std[-()]*","Std",selectedFeature)
# add ID and activity for the preparetion of dataset
fullFeature<-unlist(c(list("ID","Activity"),selectedFeature))
fullData<-cbind(fullSubject,fullOutcome,selectMeasure)
# assign names for future function
colnames(fullData)<-fullFeature
##finish assigning names
#create tidy data set using melt function
mdata<-melt(fullData,id=c("ID","Activity"))
###generate summary statistics using dcast
Summary<-dcast(mdata,ID+Activity~variable,mean)
write.table(Summary,file="tidy.csv",sep=",")
