# Loading the data
data <- read.csv("./household_power_consumption.txt", sep=";")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
data$Date <-paste(data$Date, data$Time)
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")
data <- subset (data, 
                     data$Date <strptime("2007/02/03","%Y/%m/%d") &
                     data$Date >=strptime("2007/02/01","%Y/%m/%d"))

# Plot 1
png("plot1.png",width=480,height=480,units="px")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()