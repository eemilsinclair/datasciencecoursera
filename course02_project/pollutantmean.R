library("data.table")

pollutantmean <- function(directory, pollutant, id = 1:332){
  
  fileNames <- paste0(directory, "/", sprintf("%03d",id), ".csv")
  csvData <- lapply(fileNames, read.csv)
  csvData.bind <- do.call(rbind, csvData)
  
  csvData.sub <- subset(csvData.bind, ID = id, select=pollutant)
  mean(unlist(csvData.sub), na.rm = TRUE)
  
}

pollutantmean("specdata", "nitrate")
