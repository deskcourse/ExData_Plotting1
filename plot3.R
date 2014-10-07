
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
png(filename = "plot3.png", width = 480, height = 480)
with( hpc2, plot(DateAndTime, Sub_metering_1, type="l", xlab="", col="black", ylab="Energy sub metering") )
with( hpc2, points(DateAndTime, Sub_metering_2, type="l", xlab="", col="red") )
with( hpc2, points(DateAndTime, Sub_metering_3, type="l", xlab="", col="blue") )
legend("topright", lty=c(1,1,1), cex=0.8, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
