library(ggplot2)
library(lubridate)
patky13 <- read.csv("data/patky13.csv")
patky13 <- as.Date(as.character(patky13$x))