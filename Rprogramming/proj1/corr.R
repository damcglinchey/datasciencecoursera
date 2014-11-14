corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    ## vector of correlations
    corr <- vector()
    
    ## Loop over files (will read every file in the provided directory)
    ## Remember to prepend the directory to each file name
    files <- list.files(directory, full.names = T)
    for (file in files){
        ## Read in the initial data
        data <- read.csv(file)
        
        ## Check that the number of completed pairs is above the threshold
        compl <- sum(!is.na(data[,"nitrate"]) & !is.na(data[,"sulfate"]))
        if (compl > threshold) {
            ## If above the threshold, get the correlation for complete entries
            tmp <- cor(data[,"sulfate"], data[,"nitrate"], use = "complete.obs")
            corr <- c(corr, tmp)
        }
    }
    ## Return a vector of results
    corr
}