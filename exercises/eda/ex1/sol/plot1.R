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

# Create plot 1 in png format ----
png(filename="plot1.png", width = 480 , height = 480)
hist(prt_raw$Global_active_power, 
     col = "red" , 
     xlab = "Global Active Power (kilowatts)" , 
     main="Global Active Power"
)

dev.off()