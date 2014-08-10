#data <- read.table("householddata.txt", sep=";", header=TRUE)
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data<-subset(data, Date==as.Date("01/02/2007", format="%d/%m/%Y")| Date==as.Date("02/02/2007", format="%d/%m/%Y"))

#replacing missing variables with NA
data$Global_active_power<-as.numeric(gsub("\\?",NA, data$Global_active_power))
data$Global_reactive_power<-as.numeric(gsub("\\?",NA, data$Global_reactive_power))
data$Voltage<-as.numeric(gsub("\\?",NA,data$Voltage))

#convert the Date and Time variables to Date/Time classes in R

data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
strptime(data$DateTime, "%d/%m/%y %H:%M:%S")

#override the global parameter to make it 2x2
par(mfcol=c(2,2))

#plots from 2 and 3
plot(data$DateTime, data$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)", type="l", lwd=1)

plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

#new plots
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#build the image
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
