png(file = "plot1.png")  #open file to write to 

## grab data from .txt file 
data <- tbl_df(read.table("Data/household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?","")))

#convert date variable 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#select data for dates: 2/1/2007-2/2/2007
plot1data<- filter(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#create histogram with time vs global active power with appropriate axis labels
hist(plot1data$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off() #close file 