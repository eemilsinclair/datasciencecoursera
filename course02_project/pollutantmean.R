install.packages("plyr")
library("plyr")

pollutantmean <- function(directory, pollutant, id = 1:332){
  
  ##Get the data from each file.
  fileNames = paste0(directory,"/",sprintf("%03d",id), ".csv")
  df.data <- ldply(lapply(fileNames, read.csv),data.frame)
  
  #Subset the data based on range and pollutant.
  df.sub <- subset(df.data, ID = id, select=pollutant)
  
  #Calculate and return the mean.  
  as.numeric(colMeans(x=df.sub, na.rm=TRUE))
  
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

