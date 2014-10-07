
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
png(filename = "plot2.png", width = 480, height = 480)
with( hpc2, plot(DateAndTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
