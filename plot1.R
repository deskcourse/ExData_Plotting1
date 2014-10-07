
hpc <- read.table("household_power_consumption.txt", header=TRUE, na.strings=c("?"), sep=";", stringsAsFactors=FALSE)

# convert first col to Date type
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# subset the data
lowerDt <- as.Date('01/02/2007',"%d/%m/%Y")
upperDt <- as.Date('03/02/2007',"%d/%m/%Y")
hpc2 <- subset(hpc, Date >= lowerDt & Date < upperDt )
hpc2 <- na.omit(hpc2)

# plot the data to a png file
png(filename = "plot1.png", width = 480, height = 480)
hist(hpc2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()