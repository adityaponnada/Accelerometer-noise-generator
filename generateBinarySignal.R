options(digits.secs=3)
library(dplyr)
library(reshape2)

n = 96000


matrix1 <- as.data.frame(matrix(0, ncol = 3, nrow = n))

names(matrix1) <- c("X_ACCELERATION_METERS_PER_SECOND_SQUARED", "Y_ACCELERATION_METERS_PER_SECOND_SQUARED", 
                    "Z_ACCELERATION_METERS_PER_SECOND_SQUARED")


#matrix1$Z_ACCELERATION_METERS_PER_SECOND_SQUARED <- 0.5

matrix2 <- as.data.frame(matrix(0.5, ncol = 3, nrow = n))

names(matrix2) <- c("X_ACCELERATION_METERS_PER_SECOND_SQUARED", "Y_ACCELERATION_METERS_PER_SECOND_SQUARED", 
                    "Z_ACCELERATION_METERS_PER_SECOND_SQUARED")

#matrix2$Y_ACCELERATION_METERS_PER_SECOND_SQUARED <- -0.5
#matrix2$Z_ACCELERATION_METERS_PER_SECOND_SQUARED <- 0


threshold0 = 160
threshold1 = 160

zeroCounter = 1
oneCounter = 1

looperZero = 0
looperOne = 1

j = 1
k = 1

# matrix1 <- head(matrix1, 1000)
# matrix2 <- head(matrix2, 1000)

binaryMixed <- data.frame()

for (indexZero in j:nrow(matrix1)){
  
  #threshold0 = sample(20:50, 1, replace = T)
  
  print(paste0("First file at: ", indexZero, " first file counter is: ", zeroCounter))
  
  if (zeroCounter <= threshold0){
    
    
    fileOneRow <- matrix1[indexZero,]
    binaryMixed <- rbind(binaryMixed, fileOneRow)
    zeroCounter = zeroCounter + 1
  } else {
    
    zeroCounter = 1
    
    looperZero = looperZero + 1
    
    j = indexZero
    
    
    for (indexOne in k:nrow(matrix2)){
      #threshold1 = sample(20:50, 1, replace = T)
      print(paste0("Second file at: ", indexOne, " second file counter is: ", oneCounter))
      if (oneCounter <= threshold1){
        fileTwoRow <- matrix2[indexOne,]
        #fileTwoRow$FROM[indexTwo] <- "Two"
        binaryMixed <- rbind(binaryMixed, fileTwoRow)
        oneCounter = oneCounter + 1
        
      } else {
        
        k = indexOne
        oneCounter = 1
        looperOne = looperOne + 1
        ##print("BREAKING AWAY FROM THE SECOND FILE")
        break
      }
    
    
    
  }
  
  
  
  }
}


newStartTime <- as.POSIXct("2017-11-10 14:00:00.000")

binaryMixed$HEADER_TIME_STAMP <- newStartTime

for (index in 1:nrow(binaryMixed)){
  
  print(paste0("i is: ", index))
  binaryMixed$HEADER_TIME_STAMP[index] = newStartTime
  newStartTime = newStartTime + 0.0125
  
}


binaryMixed <- binaryMixed %>% select(HEADER_TIME_STAMP, everything())

library(plotly)

tempPlot <- plot_ly(binaryMixed, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')



savePath = "C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/ABNORMAL/BINARY.csv"

binaryMixed <- head(binaryMixed, 96000)

write.csv(binaryMixed, file = savePath, sep = ",", row.names = FALSE)


