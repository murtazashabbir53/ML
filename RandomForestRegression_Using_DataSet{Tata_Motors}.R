DataSet = tata_motors
DataSet=tata_motors[2:3]
str(DataSet)
DataSet$Open=as.numeric(DataSet$Open)
DataSet$High= as.numeric(DataSet$High)
summary(DataSet)
DataSet=na.omit(DataSet)
library(randomForest)
set.seed(1234)
str(DataSet)
regressor = randomForest(x = DataSet[-2], #ignoring 2nd column
                         y = DataSet$High,
                         ntree = 500)        #no.of decision trees [multiple decision trees]

Predicted_High = predict(regressor , data.frame(Open = 170))
Predicted_High
####Visualising the random forest regression results(High Resolution)####
library(ggplot2)

x_grid = seq(min(DataSet$Open), max(DataSet$Open) ,0.01)
ggplot() + 
  geom_point(aes(x = DataSet$Open , y=DataSet$High),
             colour = 'red') + 
  geom_line(aes(x = x_grid, y = predict(regressor , newdata = data.frame(Open = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (RandomForest Regression)') +
  xlab('Open_Price')
ylab('High_Price')#Labelling on graph
