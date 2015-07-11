##read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

##subset to use only rows from the specified dates
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

##add column to the data frame containing date and time of each observation, as POSIXlt
DTchar <- paste(data2$Date, data2$Time, sep=" ")
Date_and_Time <- strptime(DTchar, format="%d/%m/%Y %T")
data2 <- cbind(data2, Date_and_Time)

##create plot 4 (containing the four graphs) as a png file
png(file = "Plot4.png")
par(mfrow=c(2,2))
  with(data2,{
    ## make first graph
    plot(Date_and_Time,Global_active_power, type="l", ylab="Global Active Power", xlab="")
    ## make second graph
    plot(Date_and_Time,Voltage, type="l", ylab="Voltage", xlab="datetime")
    ## make third graph
    plot(Date_and_Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
      lines(Date_and_Time, Sub_metering_1)
      lines(Date_and_Time, Sub_metering_2, col="red")
      lines(Date_and_Time, Sub_metering_3, col="blue")
      legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", cex=.75)
    ## make fourth graph
    plot(Date_and_Time,Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")      
})
dev.off()