##This is part three of the R code for my first programming assignment in the
##Coursera course Exploratory Data Analysis. This code creates Plot 4, which is
##a composite of four different plots displayed in the same image.

#Load the data file into a data frame, selecting only those rows
#corresponding to 2007-02-01 and 2007-02-02
powerData <- read.table("data/household_power_consumption.txt", header = TRUE,
                sep = ";", col.names = c("Date", "Time", "Global_active_power",
                "Global_reactive_power", "Voltage", "Global_intensity", 
                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                na.strings = "?", skip = 66636, nrows = 2880,
                stringsAsFactors = FALSE)

#Launch PNG graphics device
png(file = "plot4.png",  width = 480, height = 480, units = "px")

#Set up plotting workspace parameters
par(mfcol = c(2, 2))

#make upper left plot
with(powerData, plot(Global_active_power, col = "transparent", main = "",
             xlab = "", ylab = "Global Active Power", xaxt = "n"))
lines(powerData$Global_active_power, col = "black")
axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"), tick = TRUE)

#make lower left plot
with(powerData, plot(Sub_metering_1, col = "transparent", main = "",
     xlab = "", ylab = "Energy sub metering", xaxt = "n"))
lines(powerData$Sub_metering_1, col = "black")
points(powerData$Sub_metering_2, col = "transparent")
lines(powerData$Sub_metering_2, col = "red")
points(powerData$Sub_metering_3, col = "transparent")
lines(powerData$Sub_metering_3, col = "blue")
axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"), tick = TRUE)
legend("topright", bty = "n", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#make upper right plot
with(powerData, plot(Voltage, col = "transparent", main = "",
                     xlab = "datetime", ylab = "Voltage", xaxt = "n", yaxt = "n"))
lines(powerData$Voltage, col = "black")
axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"), tick = TRUE)
axis(2, at = c(234, 236, 238, 240, 242, 244, 246), labels = c("234", "", "238", "", "242", "", "246"), tick = TRUE)

#make lower right plot
with(powerData, plot(Global_reactive_power, col = "transparent", main = "",
             xlab = "datetime", xaxt = "n"))
lines(powerData$Global_reactive_power, col = "black")
axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"), tick = TRUE)

#turn off graphics device
dev.off()

#End of file


