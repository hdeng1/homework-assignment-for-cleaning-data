# load dataset
setwd("C:/Users/Sarah/Documents/R/Coursera/gettingandcleaningdata/wk4/getdata_projectfiles_UCI_HAR_Dataset/UCI_HAR_Dataset/test")
test<-read.table("X_test.txt",sep = "", header = FALSE)
test_sub <- read.table("subject_test.txt", sep = "", header = FALSE)
test_act <- read.table("y_test.txt", sep = "", header = FALSE)
setwd("C:/Users/Sarah/Documents/R/Coursera/gettingandcleaningdata/wk4/getdata_projectfiles_UCI_HAR_Dataset/UCI_HAR_Dataset/train")
train<-read.table("X_train.txt",sep = "", header = FALSE)
train_sub <- read.table("subject_train.txt", sep = "", header = FALSE)
train_act <- read.table("y_train.txt", sep = "", header = FALSE)


#Edit feautre names and use the edited feautres names as column names for train/test data.
setwd("C:/Users/Sarah/Documents/R/Coursera/gettingandcleaningdata/wk4/getdata_projectfiles_UCI_HAR_Dataset/UCI_HAR_Dataset")
feature<- read.table("features.txt",sep = "", header = FALSE)
feature_name<-gsub("\\()","",feature[,2])
feature_name<-gsub("-","_",feature_name)
#Asmble the test-dataset/train_dataset by adding two new colomns, "subject" and "activity".
sub_act_train<-cbind(train_sub,train_act,train)
sub_act_test<-cbind(test_sub,test_act,test)
names(sub_act_train)<-c("subject","activity",feature_name)
names(sub_act_test)<-c("subject","activity",feature_name)
#merges the train and test dataset 
dim(sub_act_test)
dim(sub_act_train)
test_train<-rbind(sub_act_test,sub_act_train)
dim(test_train)
#extract mean and standard deviation
mean3<-grep("mean",names(test_train))
std3<-grep("std",names(test_train))
test_train_mean_std3<-test_train[,c(1,2,mean3,std3)]
#use descriptive activity names to name the activities.
setwd("C:/Users/Sarah/Documents/R/Coursera/gettingandcleaningdata/wk4/getdata_projectfiles_UCI_HAR_Dataset/UCI_HAR_Dataset")
activity<- read.table("activity_labels.txt",sep = "", header = FALSE)
train_act_f <- factor(train_act[,1],levels = c(1,2,3,4,5,6),labels = activity[,2])
test_act_f<-factor(test_act[,1],levels = c(1,2,3,4,5,6),labels = activity[,2])
sub_actf_train<-cbind(train_sub,train_act_f,train)
sub_actf_test<-cbind(test_sub,test_act_f,test)

colnames(sub_actf_train)<-c("subject","activity", feature_name)
colnames(sub_actf_test)<-c("subject","activity", feature_name)

test_train_f<-rbind(sub_actf_test,sub_actf_train)
test_train_mean_std3<-test_train_f[,c(1,2,mean3,std3)]

#Get the mean value of each measurment for each subject,each activity. 
#Not sure what exatly teacher want, I assume the clean dataset is the result of step 1-4.
 #First group test_train data by subject and activity. Then summarize the dataset by reporting mean of each feature.
summco3_6<-test_train_mean_std3 %>% group_by(subject,activity) %>% summarise(tBodyAcc_mean_X= mean(tBodyAcc_mean_X),tBodyAcc_mean_Y=mean(tBodyAcc_mean_Y),tBodyAcc_mean_Z= mean(tBodyAcc_mean_Z))
newdata<-test_train_mean_std3 %>% group_by(subject,activity) %>% summarise_at(vars(colnames(test_train_mean_std3)[3:81]),funs(mean))
#make newdata into a table called cleandata
setwd("C:/Users/Sarah/Documents/R/Coursera/gettingandcleaningdata/wk4/getdata_projectfiles_UCI_HAR_Dataset/UCI_HAR_Dataset")
write.table(newdata, file = "cleandata.txt", row.names = FALSE)