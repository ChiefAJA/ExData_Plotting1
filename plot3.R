png(file = "plot3.png") #open file to write

#load power consumption data  - assumes household_power_consumption.txt is in a folder called Data 
data <- tbl_df(read.table("Data/household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?","")))

#adjust Date and Time variables to date/time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data$timetemp<- paste(data$Date, data$Time)
data$Time<- as.POSIXct(strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S"))

#select data for just 2/1/2007-2/2/2007
plot3data<- filter(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# create plot with axis labels, but no data
with(plot3data, plot(Time, Sub_metering_1, ylab= "Energy sub meeting", xlab = "", type = "n"))
# plot sub-metering1 data in black
with(plot3data, points(Time, Sub_metering_1, type = "s"))
# plot sub-metering data in red
with(plot3data, points(Time, Sub_metering_2, type = "s", col = "red"))
# plot sub-metering data in blue 
with(plot3data, points(Time, Sub_metering_3, type = "s", col = "blue"))

#create legend
legend ("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off() #close file 
