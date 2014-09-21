#first check if we have an existing file if does't then we create one and set it as working directory(wd).
#We download files and unzip data in that wd and set new wd with containig data.
if(!file.exists("./Get_Cleaning_Data")){dir.create("./Get_Cleaning_Data")}
setwd(paste(getwd(),'/Get_Cleaning_Data',sep = ''))
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile = 'data.zip')
unzip('data.zip')
setwd(paste(getwd(),'/UCI HAR Dataset',sep = ''))
#loading packages for analisis
library(plyr)
library(dplyr)
library(tidyr)
#reading all filles into R and merging together
names <- read.table('features.txt'); names <- as.vector(names$V2)
x_test <- read.table(file = 'test/X_test.txt', col.names = names) 
x_train <- read.table(file = 'train/X_train.txt', col.names = names)
y_train <- read.table(file = 'train/y_train.txt', col.names='Activity')
y_test <- read.table(file = 'test/y_test.txt', col.names='Activity')
subject_train <-  read.table(file = 'train/subject_train.txt',col.names='Person')
subject_test <-  read.table(file = 'test/subject_test.txt',col.names='Person') 
merged_data <- rbind(x_test,x_train)
merged_activity <- rbind(y_test,y_train)
merged_subject <- rbind(subject_test,subject_train)

#create tbl data frame which is used to analize
data <- tbl_df(cbind(merged_subject,merged_activity,merged_data))

#chaning: creating data frame only with variable Person, Activity and which contain mean and std inside name but variables 
#with meanFreq and angle are excluded.
data <- data%>%
                select(Person,Activity,contains('mean'),contains('std'), -contains('meanFreq'),-contains('angle'))%>%
                mutate(Activity=factor(data$Activity, levels = 1:6, 
                                       labels = c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING')))
#function which create descriptive names for our data variables
descriptive_names <- function(){
        name <-names(data) 
        name <- sub('std','STD',name)
        name <- sub('t','Time',name)
        name <- sub('f','Frequency',name)
        name <- gsub('[.]','',name)
        name <- sub('mean','Mean',name)
        name <- sub('Acc','Acceleration',name)
        name <- sub('Gyro','Gyroscope',name)
        name <- sub('BodyBody','Body',name)
        name <- sub('graviTimey','gravity',name)
        name <- sub('AcTimeivity','Activity',name)
        name <- sub('STD','Std',name)
        name
}
#save descriptive name to our data variables
colnames(data) <- descriptive_names()                 
#create tidy data set with average of each variable for each activity and each subject
tidy_data <- ddply(data, .(Person,Activity), numcolwise(mean))
#saving tidy data as txt file        
write.table(tidy_data,file = 'TidyDataTable.txt',row.names = FALSE)    