

# This function fetches the dataset zip file, extracts it in the wd and renames the root folder 
# as data. 
download_files <- function() {
    if (!file.exists("./dataset.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      dest="dataset.zip", method="curl")
    }
    #unzip("./dataset.zip")   
    #file.rename("./UCI\ HAR\ Dataset", "./data")
}

read_data <- function() {
    download_files()
}

read_data()