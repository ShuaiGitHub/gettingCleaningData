#initilizae
mainDir<-"./UCI HAR Dataset/"
testDir<-"./UCI HAR Dataset/test/"
#create names for files
train_name<-paste0(mainDir,"train/","X_train.txt")
feature_name<-paste0(mainDir,"features.txt")
test_name<-gsub("train","test",train_name)
##read original data into files
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
#trainData<-cbind(subjectTrain,trainOutcome,trainData)
#testData<-cbind(subjectTest,testOutcome,testData)
#featureData<-rbind(data.frame(V1=1,V2="subjectID"),data.frame(V1=2,V2="activity"),featureData)
##assign names
fullMeasure<-rbind(trainData,testData)
fullSubject<-rbind(subjectTrain,subjectTest)
fullOutcome<-rbind(trainOutcome,testOutcome)
colnames(fullMeasure)<-featureData$V2
selectedFeature<-grep("-mean()|-std()",featureData$V2,value=T)
selectedFeature<-selectedFeature[-grep("-meanFreq",selectedFeature)]
selectMeasure<-subset(fullMeasure,select=selectedFeature)
selectedFeature<-gsub("-mean[-()]*","Mean",selectedFeature)
selectedFeature<-gsub("-std[-()]*","Std",selectedFeature)
fullFeature<-unlist(c(list("ID","Activity"),selectedFeature))
fullData<-cbind(fullSubject,fullOutcome,selectMeasure)
colnames(fullData)<-fullFeature
mdata<-melt(fullData,id=c("ID","Activity"))
Summary<-dcast(mdata,ID+Activity~variable,mean)