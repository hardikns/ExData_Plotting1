require(dplyr)
require(lubridate)

# This function fetches the dataset zip file, extracts it in the wd 

download_files <- function() {
    if (!file.exists("./dataset.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      dest="dataset.zip", method="curl")
    }
    unzip("./dataset.zip")   
}

read_data <- function() {
    if (!file.exists("./household_power_consumption.txt")) download_files()
    data <- read.table("./household_power_consumption.txt", stringsAsFactors=FALSE, 
               na.strings = "?", sep = ";", header = TRUE)
    hpc_data <- tbl_df(data) %>% 
        filter(Date == "1/2/2007" | Date == "2/2/2007" ) %>% 
        mutate(Datetime = fast_strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
    rm(data)
    return(hpc_data)
}
    

