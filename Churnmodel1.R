#Final model
ct<-read.csv('D:\\BA\\Churn_Train (1).csv');
preproc<-preProcess(ct, method = c("medianImpute"))

ctf_Imp<-predict(preproc,ct)
ctf_Imp$number_vmail_messages<-NULL
ctf_Imp$area_code<-NULL
ctf_Imp$total_eve_minutes<-NULL
ctf_Imp$total_intl_minutes<-NULL
ctf_Imp$total_night_minutes<-NULL
ctf_Imp$total_day_minutes<-NULL
treeee<-rpart(churn~.,data=ctf_Imp, method = "class")
summary(treeee)
plot(treeee)
text(treeee)


testfinal<-read.csv('D:\\BA\\project\\FinalLeague_Test.csv')
testfinal$number_vmail_messages<-NULL
testfinal$total_day_minutes<-NULL
testfinal$total_eve_minutes<-NULL
testfinal$total_night_minutes<-NULL

testfinal$total_intl_minutes<-NULL
testfinal$area_code<-NULL
testtt3<-predict(treeee, newdata = testfinal)
View(testtt3)
