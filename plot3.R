##Plot 3 code
##set wd
setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis")

#read in file
housePowerData <- read.table("./household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F)

#subset data for required year range
subHousePowerDataDay1 <- subset(housePowerData,housePowerData$Date=="1/2/2007")
subHousePowerDataDay2 <- subset(housePowerData,housePowerData$Date=="2/2/2007")

totalHousePowerData <- rbind(subHousePowerDataDay1,subHousePowerDataDay2)


##Specifics to Plot 3

#need datetimestamp
totalHousePowerData$DateTimeStamp <- strptime(paste(totalHousePowerData$Date, totalHousePowerData$Time),format = "%d/%m/%Y %H:%M:%S")

#build plot
with(totalHousePowerData, plot(DateTimeStamp,Sub_metering_1,type = "l",xlab = NA,ylab = "Energy sub metering"))
with(totalHousePowerData, lines(DateTimeStamp,Sub_metering_2,type = "l",col="red"))
with(totalHousePowerData, lines(DateTimeStamp,Sub_metering_3,type = "l",col="blue"))

legend("topright", lty = c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.75)

#save as png
dev.copy(png,'plot3.png')
dev.off()
