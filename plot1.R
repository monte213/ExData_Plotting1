#for quicker testing, I pulled out the data for the two dates into a separate file
#which would load much quicker. For peer testing though, I include the longer loading code
#data <- read.table("householddata.txt", sep=";", header=TRUE)
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data<-subset(data, Date==as.Date("01/02/2007", format="%d/%m/%Y")| Date==as.Date("02/02/2007", format="%d/%m/%Y"))

#adding this because testing plot 4 keeps overriding global variable
par(mfcol=c(1,1))

#replacing missing variables with NA
data$Global_active_power<-as.numeric(gsub("\\?",NA, data$Global_active_power))

#build out the plot
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()

