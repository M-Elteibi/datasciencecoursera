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

# Create plot 2 in png format ----
png(filename="plot2.png", width = 480 , height = 480)
plot(prt_raw$Global_active_power, 
     ylab = "Global Active Power",
     xlab = "",
     type = "l",
     axes = FALSE,
     frame.plot=T
)
axis(1,at=c(0,nrow(prt_raw)/2 , nrow(prt_raw)), lab=c('Thu', 'Fri','Sat') )
axis(2,at=seq(0,6,2), lab=c(0, 2, 4, 6) )
dev.off()