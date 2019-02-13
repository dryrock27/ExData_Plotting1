#Set Working Directory
#setwd("Coursera/EDA/Project1")

#Read Data
household_power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Convert date format
household_power$Date <- as.Date(household_power$Date, format="%d/%m/%Y")

#Subset data to 02/01/2007 and 02/02/2007
power <- household_power[(household_power$Date =="2007-02-01") | (household_power$Date == "2007-02-02"), ]

# Convert to Date/Time class
power$dateTime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

#Open Plot file
png("plot4.png", width=480, height=480)

#2x2 plot matrix
par(mfrow=c(2,2))

#Create Plot1
plot(power$dateTime, as.numeric(as.character(power$Global_active_power)), type="l", xlab="", ylab="Global Active Power")

#Create Plot2
plot(power$dateTime, as.numeric(as.character(power$Voltage)), type="l", col="black", xlab="datetime", ylab="Voltage")

#Create Plot3
plot(power$dateTime, as.numeric(as.character(power$Sub_metering_1)), type="l", col="black", xlab="", ylab="Energy sub metering")
lines(power$dateTime, as.numeric(as.character(power$Sub_metering_2)), col="red")
lines(power$dateTime, as.numeric(as.character(power$Sub_metering_3)), col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

#Create Plot4
plot(power$dateTime, as.numeric(as.character(power$Global_reactive_power)), type="l", col="black", xlab="datetime", ylab="Global_reactive_power")


#Close Plot file
dev.off()