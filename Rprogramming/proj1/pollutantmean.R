pollutantmean <- function(directory, pollutant, id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## Null vector to hold all data
  alldata <- vector()
  
  ## Loop over all id's and get data within each one
  for (i in id) {
    ## Make file name
    file <- paste(directory, sprintf("%03i.csv",i), sep = "/")
    ## Get Data
    data <- read.csv(file)
    ## strip NA's
    vecdata_all <- data[,pollutant]
    vecdata_na <- is.na(vecdata_all)
    vecdata_good <- vecdata_all[!vecdata_na]
    alldata <- c(alldata, vecdata_good)
  }
  
  ## Get the mean of non-NA entries
  mean(alldata)
}
