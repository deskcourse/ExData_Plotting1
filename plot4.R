
hpc <- read.table("household_power_consumption.txt", header=TRUE, na.strings=c("?"), sep=";", stringsAsFactors=FALSE)

# convert first col to Date type
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# subset the data
lowerDt <- as.Date('01/02/2007',"%d/%m/%Y")
upperDt <- as.Date('03/02/2007',"%d/%m/%Y")
hpc2 <- subset(hpc, Date >= lowerDt & Date < upperDt )
hpc2 <- na.omit(hpc2)

#convert just the subset of times
hpc2$DateAndTime <- with(hpc2, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %T"))

# plot the data to a png file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with( hpc2, {
          plot(DateAndTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
          plot(DateAndTime, Voltage, type="l", xlab="datetime", col="black")
          plot(DateAndTime, Sub_metering_1, type="l", xlab="", col="black", ylab="Energy sub metering") 
           points(DateAndTime, Sub_metering_2, type="l", xlab="", col="red")
           points(DateAndTime, Sub_metering_3, type="l", xlab="", col="blue")
           legend("topright", lty=c(1,1,1), cex=0.8, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
          plot(DateAndTime, Global_reactive_power, type="l", xlab="datetime", col="black")
    })
dev.off()
