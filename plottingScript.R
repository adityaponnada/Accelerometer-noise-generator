library(plotly)

f1 <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/ABNORMAL/FLAT_SIGNAL.csv", header = TRUE, sep = ",")

f2 <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/ABNORMAL/BINARY.csv", header = TRUE, sep = ",")

f3 <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/ABNORMAL/BINARY2.csv", header = TRUE, sep = ",")

f4 <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/ABNORMAL/SINE.csv", header = TRUE, sep = ",")


tempPlot1 <- plot_ly(f1, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')


tempPlot2 <- plot_ly(f2, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')


tempPlot3 <- plot_ly(f3, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')


tempPlot4 <- plot_ly(f4, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')