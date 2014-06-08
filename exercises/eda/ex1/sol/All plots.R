# Set the Data directory ----
data_dir <- "~/DS_John_Hopkins/data"

# Read in the data -------
all_raw <- read.table (paste(data_dir,"household_power_consumption.txt", sep="/"), 
                       sep = ";",
                       header  = T, 
                       na.strings="?", 
                       stringsAsFactors = F
                     )
str(all_raw)
all_raw$date <- as.Date(all_raw$Date, "%d/%m/%Y")

prt_raw <- all_raw[all_raw$date == "2007-02-01" | all_raw$date == "2007-02-02"  , -1]
rm(all_raw)

str(prt_raw)

# Create plot 1 ---
png(filename="plot1.png", width = 480 , height = 480)
hist(prt_raw$Global_active_power, 
     col = "red" , 
     xlab = "Global Active Power (kilowatts)" , 
     main="Global Active Power"
     )

dev.off()

# Create plot2 ---
png(filename="plot2.png", width = 480 , height = 480)
plot(prt_raw$Global_active_power, 
     ylab = "Global Active Power",
     xlab = "",
     type = "l",
     axes = FALSE,
     frame.plot=T
     )
axis(1,at=c(0,nrow(prt_raw)/2 , nrow(prt_raw)), lab=c('Thursday', 'Friday','Saturday') )
axis(2,at=seq(0,6,2), lab=c(0, 2, 4, 6) )
dev.off()
names(prt_raw)

# Create plot3 ----
plot(prt_raw$Sub_metering_1,
     ylab='Energy sub metering',
     xlab='',
     type="l",
     axes=F ,
     frame.plot=T)
lines(prt_raw$Sub_metering_2, type="l" , col="red")
lines(prt_raw$Sub_metering_3, type="l" , col="blue")
axis(1,at=c(0,nrow(prt_raw)/2 , nrow(prt_raw)), lab=c('Thursday', 'Friday','Saturday') )
axis(2,at= seq(0,30,10) , lab=c(0,10,20,30) )
legend("topright",lty=1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red","blue"))

names(prt_raw)
# Create plot 4 ----
par(mfrow=c(2,2))

with(prt_raw, {
    plot(Global_active_power, ylab='Global Active Power', xlab='', type="l", axes=F , frame.plot=T)
    axis(1,at=c(0,nrow(prt_raw)/2 , nrow(prt_raw)), lab=c('Thu', 'Fri','Sat') )
    axis(2,at=seq(0,6,2), lab=c(0, 2, 4, 6) )
    
    plot(Voltage, ylab='Voltabe' , xlab="datetime", type="l", axes=F , frame.plot=T)
    axis(1,at=c(0,nrow(prt_raw)/2 , nrow(prt_raw)), lab=c('Thu', 'Fri','Sat') )
    axis(2,at=seq(234,246,2) , lab=c('234', ' ', '238', ' ' ,'242', ' ', '246'))
    
    plot(Sub_metering_1, ylab='Energy sub metering', xlab='', type="l", axes=F , frame.plot=T)
    lines(Sub_metering_2,  col="red")
    lines(Sub_metering_3,  col="blue")
    axis(1,at=c(0,nrow(prt_raw)/2 , nrow(prt_raw)), lab=c('Thu', 'Fri','Sat') )
    axis(2,at= seq(0,30,10) , lab=c(0,10,20,30) )
    legend("topright",lty=1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red","blue"), bty="n")
    
    plot(Global_reactive_power, ylab='Global_reactive_power' , xlab="datetime", type="l", axes=F , frame.plot=T)
    axis(1,at=c(0,nrow(prt_raw)/2 , nrow(prt_raw)), lab=c('Thu', 'Fri','Sat') )
    axis(2,at= seq(0,0.5,0.1) , lab=c(0.0,0.1,0.2,0.3,0.4,0.5) , cex.axis=0.8)
    })

