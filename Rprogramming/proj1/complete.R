complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ## Null vector which will contain the num of complete entries for each id
  nobs <- vector()
  
  ## Loop over each file
  for (i in id){
    ## make the file name
    file <- paste(directory, sprintf("%03i.csv",i), sep = "/")
    ## read the file
    data <- read.csv(file)
    ## cound the number of complete entries
    compl <- sum(!is.na(data[,"nitrate"]) & !is.na(data[,"sulfate"]))
    ## add it to the vector
    nobs <- c(nobs, compl)
  }
  
  data.frame(cbind(id,nobs))
}