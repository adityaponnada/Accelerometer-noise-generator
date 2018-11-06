n = 96000


matrix1 <- as.data.frame(matrix(0, ncol = 3, nrow = n))

names(matrix1) <- c("X_ACCELERATION_METERS_PER_SECOND_SQUARED", "Y_ACCELERATION_METERS_PER_SECOND_SQUARED", 
                    "Z_ACCELERATION_METERS_PER_SECOND_SQUARED")





values <- c(0, 0.5)

val = sample(values, 1)

#gap = sample(160:160, 1, replace = T)

gap = 160

j = 1

matrix1 <- head(matrix1, 1000)

step = 1

for (i in 1:nrow(matrix1)){
  
  print(paste0("at i: ", i))
  
  if (step ==1){
    
    print(paste0("in step: ", step))
    
    matrix1$X_ACCELERATION_METERS_PER_SECOND_SQUARED[i:i+gap] <- 0
    matrix1$Y_ACCELERATION_METERS_PER_SECOND_SQUARED[i:i+gap] <- 0
    matrix1$Z_ACCELERATION_METERS_PER_SECOND_SQUARED[i:i+gap] <- 0
    
    step = 2
    
    
    
  } else if (step == 2){
    
    print(paste0("in step: ", step))
    
    matrix1$X_ACCELERATION_METERS_PER_SECOND_SQUARED[i:i+gap] <- 0.5
    matrix1$Y_ACCELERATION_METERS_PER_SECOND_SQUARED[i:i+gap] <- 0.5
    matrix1$Z_ACCELERATION_METERS_PER_SECOND_SQUARED[i:i+gap] <- 0.5
    
    step = 1
    
    
  }
  
  i = i + gap + 1
  
}


newStartTime <- as.POSIXct("2017-11-10 14:00:00.000")

matrix1$HEADER_TIME_STAMP <- newStartTime

for (index in 1:nrow(matrix1)){
  
  print(paste0("i is: ", index))
  matrix1$HEADER_TIME_STAMP[index] = newStartTime
  newStartTime = newStartTime + 0.0125
  
}

library(reshape2)
matrix1 <- matrix1 %>% select(HEADER_TIME_STAMP, everything())

library(plotly)

tempPlot <- plot_ly(matrix1, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')



savePath = "C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/ABNORMAL/BINARY.csv"

write.csv(matrix1, file = savePath, sep = ",", row.names = FALSE)


