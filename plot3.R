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


## Create Plot 2
with(data_date, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")) ## sets an empty scatter
dev.copy(png, file="plot2.png", width=480, height=480) ## Copy plot1 to png file
dev.off()
