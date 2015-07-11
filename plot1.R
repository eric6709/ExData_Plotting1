## read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

##subset to use only rows from the specified dates
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

##create plot 1 as a png file
png(file = "Plot1.png")
hist(data2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()