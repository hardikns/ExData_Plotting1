source("./read_data.R")
plot1 <- function (data) {

    hist(data$Global_active_power, 
         col = "RED" , 
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", 
         ylab="Frequency")
}
if (!"hpc_data" %in% ls())
    hpc_data <- read_data()

png("plot1.png", width=480, height=480, units="px")
plot1(hpc_data)
dev.off()