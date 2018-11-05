options(digits.secs=3)
library(dplyr)
library(reshape2)

n = 144000

matrix1 <- as.data.frame(matrix(0, ncol = 3, nrow = n))


names(matrix1) <- c("X_ACCELERATION_METERS_PER_SECOND_SQUARED", "Y_ACCELERATION_METERS_PER_SECOND_SQUARED", "Z_ACCELERATION_METERS_PER_SECOND_SQUARED")

newStartTime <- as.POSIXct("2017-11-10 15:00:00.000")

matrix1$HEADER_TIME_STAMP <- newStartTime

for (index in 1:nrow(matrix1)){
  
  print(paste0("i is: ", index))
  matrix1$HEADER_TIME_STAMP[index] = newStartTime
  newStartTime = newStartTime + 0.0125
  
}


allZeroData <- matrix1 %>% select(HEADER_TIME_STAMP, everything())



savePath = "C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/ABNORMAL/FLAT_SIGNAL.csv"

write.csv(allZeroData, file = savePath, sep = ",", row.names = FALSE)

library(plotly)

tempPlot <- plot_ly(allZeroData, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')
