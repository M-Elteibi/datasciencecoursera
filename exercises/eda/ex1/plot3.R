# Read in the data and create a subset of required dates ---

# Please change the data_dir value to point to where you saved the raw data file ---
data_dir <- "~/DS_John_Hopkins/data"

all_raw <- read.table (paste(data_dir,"household_power_consumption.txt", sep="/"), 
                       sep = ";",
                       header  = T, 
                       na.strings="?", 
                       stringsAsFactors = F
)

all_raw$date <- as.Date(all_raw$Date, "%d/%m/%Y")

prt_raw <- all_raw[all_raw$date == "2007-02-01" | all_raw$date == "2007-02-02"  , -1]
rm(all_raw)

# Create plot 3 in png format ----
png(filename="plot3.png", width = 480 , height = 480)
plot(prt_raw$Sub_metering_1,
     ylab='Energy sub metering',
     xlab='',
     type="l",
     axes=F ,
     frame.plot=T)
lines(prt_raw$Sub_metering_2, type="l" , col="red")
lines(prt_raw$Sub_metering_3, type="l" , col="blue")
axis(1,at=c(0,nrow(prt_raw)/2 , nrow(prt_raw)), lab=c('Thu', 'Fri','Sat') )
axis(2,at= seq(0,30,10) , lab=c(0,10,20,30) )
legend("topright",lty=1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red","blue"))
dev.off()