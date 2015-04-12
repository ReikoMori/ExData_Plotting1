# Read table
df <- read.table("./data/household_power_consumption.txt",head = TRUE,sep=";",stringsAsFactors=FALSE )
# Change Date column to date, and poubset to dates 2007-02-01 and 2007-02-02
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df2 <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")
# Change Time column to time
df2$Time <- as.POSIXct(format(paste(df2$Date,df2$Time,sep=""), format="%Y-%m-%d %H:%M:%S"))
#
# Plot 4
#
# Change columns to numeric
df2$Global_active_power <- as.numeric(df2$Global_active_power)
df2$Voltage <- as.numeric(df2$Voltage)
df2$Global_reactive_power <- as.numeric(df2$Global_reactive_power)
df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)
df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)
df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)
# Print to png file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
#
with(df2, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
#
with(df2, plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))
#
with(df2, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(df2, points(Time, Sub_metering_1, type="l"))
with(df2, points(Time, Sub_metering_2, type="l", col="red"))
with(df2, points(Time, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1,col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, bty=n, box.lwd=0)
#
with(df2, plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()

