##read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

##subset to use only rows from the specified dates
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

##add column to the data frame containing date and time of each observation, as POSIXlt
DTchar <- paste(data2$Date, data2$Time, sep=" ")
Date_and_Time <- strptime(DTchar, format="%d/%m/%Y %T")
data2 <- cbind(data2, Date_and_Time)

##create plot 2 as a png file
png(file = "Plot2.png")
plot(data2$Date_and_Time,data2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()