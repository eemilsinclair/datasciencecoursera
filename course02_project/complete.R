complete <- function(directory, id=1:332){
  fileNames <- paste0(directory, "/", sprintf("%03d",id), ".csv")
  csvData <- lapply(fileNames, read.csv)
  csvData.bind <- do.call(rbind, csvData)
  
  csvData.group <- csvData.bind[complete.cases(csvData.bind), ]
  n <- data.frame(table(csvData.group$ID))
  colnames(n) <- c("id","nobs")
  n
}

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
