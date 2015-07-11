##read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

##subset to use only rows from the specified dates
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

##add column to the data frame containing date and time of each observation, as POSIXlt
DTchar <- paste(data2$Date, data2$Time, sep=" ")
Date_and_Time <- strptime(DTchar, format="%d/%m/%Y %T")
data2 <- cbind(data2, Date_and_Time)

##create plot 3 as a png file
png(file = "Plot3.png")
  with(data2, plot(Date_and_Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
  with(data2, lines(Date_and_Time, Sub_metering_1))
  with(data2, lines(Date_and_Time, Sub_metering_2, col="red"))
  with(data2, lines(Date_and_Time, Sub_metering_3, col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()