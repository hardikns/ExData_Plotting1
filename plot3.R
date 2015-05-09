source("./read_data.R")
plot3 <- function (data) {
    plot(data$Datetime, data$Sub_metering_1, 
         type="l", 
         xlab="", 
         ylab="Energy sub metering")
    lines(data$Datetime, data$Sub_metering_2, col="RED")
    lines(data$Datetime, data$Sub_metering_3, col="BLUE")
    legend("topright", legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"), col=c("BLACK", "RED", "BLUE"), lty=1, lwd=1)
}
if (!"hpc_data" %in% ls())
    hpc_data <- read_data()

png("plot3.png", width=480, height=480, units="px")
plot3(hpc_data)
dev.off()