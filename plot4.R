##memory required = no. of column * no. of rows * 8 bytes/numeric
memory_required = 9 * 2075259 * 8
memory_required
#memory_required = 149418648 Bytes Ok

infile <- "household_power_consumption.txt"
data$Date <- as.Date(data$Date, "%d/%m/%y")
data$Time <- strptime(data$Time, "%H:%M:%S")

data <- read.table(infile, sep=";", header=TRUE, na.strings = "?", colClasses=c("character" ,"character" ,"numeric" ,"numeric" ,"numeric" ,"numeric" ,"numeric" ,"numeric" ,"numeric"))
data$Time<- paste0(data$Date," ",data$Time)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")

data_date <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
##str(data_date)


## Create Plot 4
par(mfrow=c(2,2), mar=c(5,4,4,1))

## plot1
with(data_date, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")) ## sets an empty scatter
## plot 2
with(data_date, plot(Time, Voltage, type="l", xlab="datetime", ylab="Global Active Power (kilowatts)")) ## sets an empty scatter

## plot 3
with(data_date, plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy Sub Metering")) ## sets an empty scatter
points(data_date$Time, data_date$Sub_metering_1, col="black", type="l")
points(data_date$Time, data_date$Sub_metering_2, col="red", type="l")
points(data_date$Time, data_date$Sub_metering_3, col="blue", type="l")
legend("topright",inset=0.02, lty=1, seg.len=0.8,xjust=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.7,bty="n")


## plot4
with(data_date, plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")) ## sets an empty scatter

dev.copy(png, file="plot4.png", width=480, height=480) ## Copy plot4 to png file
dev.off()

