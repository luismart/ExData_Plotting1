# Loading the data
data <- read.csv("./household_power_consumption.txt", sep=";")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
data$Date <-paste(data$Date, data$Time)
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")
data <- subset (data, 
                data$Date <strptime("2007/02/03","%Y/%m/%d") &
                  data$Date >=strptime("2007/02/01","%Y/%m/%d"))

# Plot 3
png("plot3.png",width=480,height=480,units="px")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

with(data,plot(data$Date, 
               data$Sub_metering_1,
               type="l",
               ylab="Energy sub metering",
               xlab="",
               col="black"))
with(data,lines(data$Date, 
                data$Sub_metering_2,
                type="l",                
                col="red"))
with(data,lines(data$Date, 
                data$Sub_metering_3,
                type="l",                
                col="blue"))

legend("topright",
       pch="-",
       lty=1,
       lwd=2.5,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       yjust=1)
dev.off()