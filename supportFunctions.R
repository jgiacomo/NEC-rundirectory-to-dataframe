# Functions to support creating a data frame from the NEC run data directories.

########################################################################
########## Get Sample Info #############################################
########################################################################

runSampleInfo <- function(directory){
    library(dplyr)
    library(readr)
  
    file <- "setup"
    filepath <- file.path(directory, file)
    
    sample.info <- read_tsv(filepath, col_names=FALSE)
    
    # Arrange the columns
    sample.info <- sample.info %>% select(X3,X1)
    names(sample.info) <- c("attribute","value")
    
    return(sample.info)
}


########################################################################
########## Get Cycle Data ##############################################
########################################################################

cycleData <- function(directory){
    library(dplyr)
    library(readr)
    
    file <- c("le12C","le13C","he12C","he13C")
    filepath <- file.path(directory, file)
    
    cycle.info <- list()
    
    for(i in 1:4){
        colWidths <- fwf_empty(filepath[i])  # not sufficient, misses the
                                             # thousands place in cycle column
        colWidths$begin <- c(1,9,19)  # corrects the problem.
        
        cycle.info[[i]] <- read_fwf(filepath[i],colWidths)
        
        cycle.info[[i]] <- cycle.info[[i]] %>% select(X1,X3)
        names(cycle.info[[i]]) <- c("cycle",file[i])
    }
    
    cycle.data <- cbind(cycle.info[[1]],
                        cycle.info[[2]][,2],
                        cycle.info[[3]][,2],
                        cycle.info[[4]][,2])
    
    return(cycle.data)
    
}