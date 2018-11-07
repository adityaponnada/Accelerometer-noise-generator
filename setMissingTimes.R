options(digits.secs=3)
library(dplyr)
library(reshape2)

##only for a temporary fix

newStartTime <- as.POSIXct("2017-11-10 11:00:00.000")

f3$HEADER_TIME_STAMP <- newStartTime

for (index in 1:nrow(f3)){
  
  print(paste0("i is: ", index))
  f3$HEADER_TIME_STAMP[index] = newStartTime
  newStartTime = newStartTime + 0.0125
  
}


library(reshape2)

f3 <- f3 %>% select(HEADER_TIME_STAMP, everything())

savePath = "C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/ABNORMAL/BINARY2.csv"

write.csv(f3, file = savePath, sep = ",", row.names = FALSE)
