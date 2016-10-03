getResultData <- function(directory){
    # Given a directory, search all subdirectories for the file result.xls
    # This file will contain all the run results for a wheel measurement.
    
    library(readr)
    
    # Find all the subdirectories and then look in them for the file
    dirList <- list.dirs(path=directory,full.names=TRUE,recursive=FALSE)
    
    allDF <- NULL  # initialize a data frame to store results
    
    for(dirs in dirList){
        resultFile <- file.path(dirs, "result.xls")
        
        if(file.exists(resultFile)){
            df <- read_csv(resultFile, skip=4)
            df <- df[-1,]  # remove fixed width column width markers
            names(df) <- make.names(names(df))
            
            # Get the batch number and add to data in data frame
            df$Batch <- gsub('(^.*[Bb]atch)(\\d.*$)', '\\2', dirs)
            
            allDF <- rbind(allDF, df)
        }
    }
    
    return(allDF)
}