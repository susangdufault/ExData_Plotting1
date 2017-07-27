##This is part one of the R code for my first programming assignment in the
##Coursera course Exploratory Data Analysis. This code creates Plot 1, which is
##a histogram of Global Active Power for the Feb 1-2, 2007 period.

#Load the data file into a data frame, selecting only those rows
#corresponding to 2007-02-01 and 2007-02-02
powerData <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?", skip = 66636, nrows = 2880, stringsAsFactors = FALSE)

#Launch PNG graphics device, make Plot 1, close device
png(file = "plot1.png",  width = 480, height = 480, units = "px")
with(powerData, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()

#End of file


