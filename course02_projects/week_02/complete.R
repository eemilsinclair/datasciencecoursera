library("plyr")
library("dplyr")

complete <- function(directory, id =1:332){
  
  ##Get the data from each file.
  fileNames = paste0(directory,"/",sprintf("%03d",id), ".csv")
  df.data <- ldply(lapply(fileNames, read.csv),data.frame)
  
  df.cc <- df.data[complete.cases(df.data),]
  
  ddply(df.cc, .(ID), summarize, nobs = n())
  
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
