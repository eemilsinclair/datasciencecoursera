corr <- function(directory, threshold = 0){
  
  ##Get the data from each file.
  id <- c(1:332)
  fileNames = paste0(directory,"/",sprintf("%03d",id), ".csv")
  df.data <- ldply(lapply(fileNames, read.csv),data.frame)
  df.cc <- df.data[complete.cases(df.data),]
  
  df.sm <- ddply(df.cc, c("ID"), summarize, nobs = n(), 
                 corr = cor(x=sulfate,y=nitrate))
  df.fc <- filter(df.sm, nobs > threshold)
  
  return(as.vector(df.fc["corr"]))
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
cr <- corr("specdata")
summary(cr)
length(cr)
