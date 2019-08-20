#read data
a <- read.table("~/Documents/Coursera Data Science/Exploratory Analysis/household_power_consumption.txt", header = TRUE, sep=";")

#combine date and time
a$Date_Time <- paste(a$Date, a$Time)

#convert date and time into POSIXct
a$Date_Time <- as.POSIXct(a$Date_Time, format = "%d/%m/%Y %H:%M:%S")

#convert date into POSIXct
a$Date <- as.POSIXct(a$Date, format = "%d/%m/%Y")

#select values for the needed dates
b <- a[which(a$Date == "2007-02-01" | a$Date == "2007-02-02"),]

#convert variables into numeric because they are factors
b[,3:9] <- sapply(b[,3:9], as.character)
b[,3:9] <- sapply(b[,3:9], as.numeric)

#create plot
png("plot3.png", width = 480, height = 480)
par(mar=c(4,4,4,2), pin = c(3,4), pch= 22)
plot(x= b$Date_Time, y= b$Sub_metering_1 , col = "black", ylab = "Global Active Power (kilowatts)", xlab = "", type= "n")
lines(x= b$Date_Time, y= b$Sub_metering_1 , type = "l")
lines(x= b$Date_Time, y= b$Sub_metering_2 , type = "l", col = "red")
lines(x= b$Date_Time, y= b$Sub_metering_3 , type = "l", col = "blue")
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid")
dev.off()