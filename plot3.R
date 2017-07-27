##This is part three of the R code for my first programming assignment in the
##Coursera course Exploratory Data Analysis. This code creates Plot 3, which is
##a line graph of Global Active Power over time for the Feb 1-2, 2007 period.

#Load the data file into a data frame, selecting only those rows
#corresponding to 2007-02-01 and 2007-02-02
powerData <- read.table("data/household_power_consumption.txt", header = TRUE,
                sep = ";", col.names = c("Date", "Time", "Global_active_power",
                "Global_reactive_power", "Voltage", "Global_intensity", 
                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                na.strings = "?", skip = 66636, nrows = 2880,
                stringsAsFactors = FALSE)

#Launch PNG graphics device, make Plot 2, close device
png(file = "plot3.png",  width = 480, height = 480, units = "px")
with(powerData, plot(Sub_metering_1, col = "transparent", main = "",
     xlab = "", ylab = "Energy sub metering", xaxt = "n"))
lines(powerData$Sub_metering_1, col = "black")
points(powerData$Sub_metering_2, col = "transparent")
lines(powerData$Sub_metering_2, col = "red")
points(powerData$Sub_metering_3, col = "transparent")
lines(powerData$Sub_metering_3, col = "blue")
axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"), tick = TRUE)
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

#End of file


