library(dplyr)
data_adult

glimpse(data_adult)

continuos = select_if(data_adult,is.numeric)  #konse konse variables continuos hai..we are checking

summary(continuos)


#Histogram with kernel density curve
library(ggplot2)


ggplot(continuos, aes(x = hours.per.week))+ geom_density(alpha = .2, fill = "#FF6666")

top_one_percent = quantile(data_adult$hours.per.week, .99)
top_one_percent

#Use filter from dplyr library
data_adult_drop = data_adult %>%
  filter(hours.per.week<top_one_percent)
dim(data_adult_drop)   #dim>> dimension

#Standardizing the numeric columns

data_adult_rescale = data_adult_drop %>%          #{#%>%}..<<generally used to just pass the data to do following operations
  
  mutate_if(is.numeric, funs(as.numeric(scale(.))))
head(data_adult_rescale)   #head>> top values     
                          #tail..last values
tail(data_adult_rescale)


#Select Categorical column

#first convert your data into factor!!
data_adult$workclass = as.factor(data_adult$workclass)
data_adult$education = as.factor(data_adult$education)
data_adult$marital.status = as.factor(data_adult$marital.status)
data_adult$race = as.factor(data_adult$race)
data_adult$gender = as.factor(data_adult$gender)
data_adult$income = as.factor(data_adult$income)
str



factor = data.frame(select_if(data_adult,is.factor))  #Select Categorcial column
              ncol(factor)
      #now creating graph for each column
  graph = lapply(names(factor),
                 function(x)
                 ggplot(factor, aes(get(x)))+ geom_bar()+ theme(axis.text.x = element_text(angle=90) ))            
              
              graph
str(data_adult)

##########################################
##################################################
################################################


#Recasting data:-actually hame itni saari info nahi chahiye ,like 10 12, etc..
#Like we only want the data inshort

recast_data = data_adult_rescale %>%
  select(-x) %>%
  mutate(education = factor(ifelse(education=="Preschool" | education=="10th" | education=="11th" | 
                                     education=="12th" | education=="1st-4th" | education=="5th-6th"
                                    | education=="7th-8th" |education=="9th", "Dropout",
                                   ifelse(education=="HS-grad","HighGrad", ifelse(education=="Some-college"
                                                                                  | education=="Assoc-acdm" | 
                                                                                    education=="Assoc-voc", "Community",
                                                                                  ifelse(education=="Bachelors","Bachelors",
 
                                              ifelse(education=="Master" | education=="Prof-school","Master" , "PhD")))))))
recast_data
summary(recast_data)



recast_data_maritalstatus = data_adult_rescale %>%
mutate(marital.status = factor(ifelse(marital.status=="Never-married" | marital.status=="Married-spouse-absent", "Not-married", 
                                      ifelse(marital.status=="Married-AF-apouse" | marital.status=="Married-civ-spouse","Married" ,
                                      ifelse(marital.status=="Separated" | marital.status=="Divorced", "Separated","Widow")))))


summary(recast_data_maritalstatus)


table(recast_data$marital.status)
table((recast_data$education))

##Plot gender income##
ggplot(recast_data, aes(x=gender, fill=income))+
  geom_bar(position="fill")+theme_dark()

##Plot origin income##
ggplot(recast_data,aes(x =race, fill = income))+
  geom_bar(position = "fill")+theme_dark()+
  theme(axis.text.x = )#incomplete

##The number of hour work by gender##

#box plot gender working time

ggplot(recast_data, aes(x = gender, y = hours.per.week))+
  geom_boxplot()+
  stat_summary(fun.y = mean,
               geom="point",
               size=3,
               color="steelblue")+
  theme_dark()

#density plot based on education          #Part of datascience
#Plot distribution working time by education##

ggplot(recast_data,aes(x=hours.per.week))+
  geom_density(aes(color = education),alpha=0.5) +
  theme_dark()

##################################################################################
################################################################################
#############################################################################

#TRAINING & TESTING#

set.seed(1234)
create_train_test = function(data, size=0.8, train = TRUE)
{
  n_row=nrow(data)
  total_row = size * n_row
  
  train_sample = 1: total_row
  if(train == TRUE){
    return(data[train_sample, ])
  }else{
    return(data[-train_sample, ])
  }
}

data_train= create_train_test(recast_data,0.8,TRUE)
data_test =create_train_test(recast_data,0.8,FALSE)


formula = income~.
logit = glm(formula, data = data_train, family = 'binomial')
summary(logit)

summary(data_train)
str(data_train)

data_train$workclass = as.factor(data_train$workclass)
data_train$education = as.factor(data_train$education)
data_train$marital.status = as.factor(data_train$marital.status)
data_train$race = as.factor(data_train$race)
data_train$gender = as.factor(data_train$gender)
data_train$income = as.factor(data_train$income)

str(data_train)

##Prediction of a table matrix
predict = predict(logit, data_test,type = 'response')
#confusion matrix
table_mat = table(data_test$income,predict>0.5)
table_mat

##Accuracy Test

accuracy_test = sum(diag(table_mat))/ sum(table_mat)
accuracy_test


