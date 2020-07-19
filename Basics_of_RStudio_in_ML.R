#Data Types

# x =  14 
# y = 12
# z = x + y
# print(z)
# 
# print(class(z))
# 
# 
# msg = "Hello R studio"
# print(msg)
# print(class(msg))

friends <- c('Mustafa' , 'yusuf', 'Shayaan','Arbaaz','Irshaad')
print(friends)
print(class(friends))

age = c(19,20,16,18)
print(age)
print(class(age))

#LIST
list = c(1,2,3,sin,21.3,"guvava")
print(list)


#Create MATRIX

M = matrix(c('a','b','c','a','b','d'),nrow = 2, ncol = 3, byrow = TRUE)
print(M)

M = matrix(32:51,nrow = 5, ncol = 4, byrow = FALSE)
print(M)

#Arrays are the muultiple matrices
  #3-D structure

a = array(c('green','yellow'),dim = c(3,3,2))
print(a)


                           #FACTORS####
#-> True False
#->male female
#etc..

#Create a Vector
apple_clrs = c('green','green','yellow','red','red','red','green')

factor_apple = factor(apple_clrs)  #Create a Factor Object
print(factor_apple)
print(nlevels(factor_apple)) #nlevels== is constant count (unrepeated count)

                            #DATAFRAME###3



#Create DataFrame

emp.data <- data.frame(       #emp.data>>bcz "." creates an object
  emp_id = (1:5),
  emp_name = c('Rick','Dan','Michelle','Ryan','Gary'),
  salary = c(342.6,567.9,223.6,778.0,843.5),
  
  start_date = as.Date (c("2019-01-01","2019-09-23","2015-09-22","2016-09-23","2013-01-25")),
  
  stringsAsFactors = FALSE
)  
  print(emp.data)


#########################################33


  friends.data <- data.frame(
    friends_id = (1:5),
    friends_name = c('Yusuf','Mustafa','Shayaan','Ali','Muskaan'),
    friends_age = c(19,18,17,20,21),
    friends_email = c('yusuf112@gmail.com','Mus34@gmail.com','Shay98@gmail.com','Ali24@gmail.com','Musk09@gmail.com'),
    
    friends_loc =  c("Mumbai","Kurla","Mumbra","Gorakhpur","Dubai"),
    
    stringsAsFactors = FALSE
  )  
  print(friends.data)
  
  str(friends.data)
  print(summary(friends.data))

#Extract Specific Columns
  
  extracted <- data.frame(friends.data$friends_name,friends.data$friends_id)
  v=print(extracted)
  print(v)
  print(friends.data)
  
  
  
  
  #Extract first two rows
  
  extracted <-data.frame(friends.data[1:2,])
  print(extracted)
  


#Extract 3rd & 5th row with 2nd & 4th column
  
extracted  = friends.data[c(3,5),c(2,4)]
print(extracted)          #rows  #columns


#Add the data int h same data set   (ADD COLUMNS)


friends.data$dept = c("IT","HR","EXTC","MECH","FINANCE")
print(friends.data)

#####Add the data int h same data set   (ADD ROWS)

#MAke a new dataFrame

friends.newdata <- data.frame(
  friends_id = c(1:5),
  friends_name = c('yuvi','Dhanera','Rashid','Nafisa','Zubaida'),
  friends_age = c(22,45,12,43,65),
  friends_email = c('yuvi112@gmail.com','Dhan34@gmail.com','Rash98@gmail.com','Nafo24@gmail.com','Zu09@gmail.com'),
  
  friends_loc =  c("Mumbasa","Nairobi","Pakistan","India","Dubai"),
   friends_depts= c("IT","HR","EXTC","MECH","FINANCE")
)  
print(friends.newdata)



#1)Bind two data frames

friends.data <- data.frame(
  friends_id = (1:5),
  friends_name = c('Yusuf','Mustafa','Shayaan','Ali','Muskaan'),
  friends_age = c(19,18,17,20,21),
  friends_email = c('yusuf112@gmail.com','Mus34@gmail.com','Shay98@gmail.com','Ali24@gmail.com','Musk09@gmail.com'),
  
  friends_loc =  c("Mumbai","Kurla","Mumbra","Gorakhpur","Dubai"),
  friends_depts= c("IT","HR","EXTC","MECH","FINANCE"),
  
  stringsAsFactors = FALSE
)  
print(friends.data)


friends.newdata <- data.frame(
  friends_id = c(1:5),
  friends_name = c('yuvi','Dhanera','Rashid','Nafisa','Zubaida'),
  friends_age = c(22,45,12,43,65),
  friends_email = c('yuvi112@gmail.com','Dhan34@gmail.com','Rash98@gmail.com','Nafo24@gmail.com','Zu09@gmail.com'),
  
  friends_loc =  c("Mumbasa","Nairobi","Pakistan","India","Dubai"),
  friends_depts= c("IT","HR","EXTC","MECH","FINANCE")
)  
print(friends.newdata)






friends.finaldata = rbind(friends.data,friends.newdata)
print(friends.finaldata)

################################## library ggplot2#####################################################################

library(ggplot2)
#Most basic bar chart

ggplot(mtcars , aes(x = factor(cyl))) + geom_bar()

#Change color of bars


ggplot(mtcars , aes(x = factor(cyl))) + geom_bar(fill ="blue",alpha = 0.5)+theme_dark()

str(mtcars)



ggplot(mtcars , aes(x = factor(mpg))) + geom_bar(fill ="blue",alpha = 0.5)+theme_dark()


ggplot(mtcars , aes(x = factor(disp))) + geom_bar(fill ="blue",alpha = 0.5)+theme_dark()



ggplot(mtcars , aes(x = factor(hp))) + geom_bar(fill ="blue",alpha = 0.5)+theme_dark()



ggplot(mtcars , aes(x = factor(drat))) + geom_bar(fill ="blue",alpha = 0.5)+theme_dark()



ggplot(mtcars , aes(x = factor(gear))) + geom_bar(fill ="blue",alpha = 0.5)+theme_dark()



ggplot(mtcars , aes(x = factor(carb))) + geom_bar(fill ="blue",alpha = 0.5)+theme_dark()

############################################## Library dplyr############################################################
library(ggplot2)
library(dplyr)#Step 1
data = mtcars %>%         #Syntax    am & cyl
#step 2
mutate(am = factor(am , labels = c("auto","man")),  #Automatic and Manual <- Category
       cyl = factor((cyl)))  
#Plot the Graph                                    

ggplot(data , aes(x= cyl,fill = am)) +
  geom_bar()+theme_dark()




library(ggplot2)
library(dplyr)

#Step 1
data = mtcars %>%         #Syntax    am & cyl
  #step 2
  mutate(am = factor(am , labels = c("auto","man")),  #Automatic and Manual <- Category
         carb= factor(carb))  
#Plot the Graph                                    

ggplot(data , aes(x= carb,fill = carb)) +
  geom_bar()+theme_dark()





library(ggplot2)
library(dplyr)



#you can visualize the bar % instead of raw count

#Bart chart in %

ggplot(data , aes(x = cyl , fill = am))+
  geom_bar(position = "fill")+theme_dark()  ###using position = "fill in geom_bar() argument to create a graphic with % in y-axis

#gear

library(ggplot2)
library(dplyr)



#you can visualize the bar % instead of raw count

#Bart chart in %

ggplot(data , aes(x = gear , fill = am))+
  geom_bar(position = "fill")+theme_dark()

#Bar chart side by side
 ggplot(data , aes(x = cyl , fill = am))+
   geom_bar(position = position_dodge())+
   theme_dark()
 
 
 #Create a HIISTOGRAM
 
 data_histogram = mtcars %>%
   
  mutate(cyl = factor(cyl)) %>%
   group_by(cyl)%>%
   summarize(mean_mpg = round(mean(mpg),2))
 
 ggplot(data_histogram, aes(x = cyl,y = mean_mpg))+
   geom_bar(stat = "identity")+
 
 
 #using coord_flip()
   data_histogram = mtcars %>%
   
   mutate(cyl = factor(cyl)) %>%
   group_by(cyl)%>%
   summarize(mean_mpg = round(mean(mpg),2))
 
 ggplot(data_histogram, aes(x = cyl,y = mean_mpg,fill = cyl))+          #grps with fill=cyl mapping.R takes care automatically of the color based on levels of cyl of colors  
   geom_bar(stat = "identity")+coord_flip()+theme_dark()
 
 
 #####saved in another variable when we use width=0.5 in geom_bar
 
 graph = ggplot(data_histogram, aes(x = cyl , y = mean_mpg,fill = cyl))+
   geom_bar(stat = "identity",width = 0.5)+coord_flip()+theme_dark()
graph

###add labels to the graph . consists to add value of variable mean_mpg in label

graph + geom_text(aes(label = mean_mpg),hjust = 1.5, color ="white",size=3)+theme_dark()


 
 
 
 
 
 
   
 
   
 




