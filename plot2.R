# Read table
df <- read.table("./data/household_power_consumption.txt",head = TRUE,sep=";",stringsAsFactors=FALSE )
# Change Date column to date, and poubset to dates 2007-02-01 and 2007-02-02
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df2 <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")
# Change Time column to time
df2$Time <- as.POSIXct(format(paste(df2$Date,df2$Time,sep=""), format="%Y-%m-%d %H:%M:%S"))
#
# Plot 2 
#
# Change Global_active_power column to numeric
df2$Global_active_power <- as.numeric(df2$Global_active_power)
# Print to png file
png(filename = "plot2.png", width = 480, height = 480)
with(df2, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
