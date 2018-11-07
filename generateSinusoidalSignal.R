options(digits.secs=3)
library(dplyr)
library(reshape2)

valueVector = seq(0,10,0.1)


sinY <- sin(valueVector)

acc <- as.data.frame(sinY)

acc$y_acc <- -acc$sinY
acc$z_acc <- 0

#plot(valueVector,sinY,type="l", xlab="time", ylab="Sine wave")

#plot(valueVector,y_acc$sinY,type="l", xlab="time", ylab="Sine wave")

names(acc) <- c("X_ACCELERATION_METERS_PER_SECOND_SQUARED", "Y_ACCELERATION_METERS_PER_SECOND_SQUARED", 
                "Z_ACCELERATION_METERS_PER_SECOND_SQUARED")


sineFile <- acc


for (i in 1:950){
  
  print(paste0("i is ", i))
  
  sineFile <- rbind(sineFile, acc)
  
}

sineFile <- head(sineFile, 96000)


newStartTime <- as.POSIXct("2017-11-10 13:00:00.000")

sineFile$HEADER_TIME_STAMP <- newStartTime

for (index in 1:nrow(sineFile)){
  
  print(paste0("i is: ", index))
  sineFile$HEADER_TIME_STAMP[index] = newStartTime
  newStartTime = newStartTime + 0.0125
  
}

library(reshape2)

sineFile <- sineFile %>% select(HEADER_TIME_STAMP, everything())


library(plotly)

tempPlot <- plot_ly(sineFile, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')



savePath = "C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/ABNORMAL/SINE.csv"

write.csv(sineFile, file = savePath, sep = ",", row.names = FALSE)

