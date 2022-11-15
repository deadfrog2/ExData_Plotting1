url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
household_zip <- "household.zip"
download.file(url, destfile = household_zip,method = "curl", mode="wb")
unzip("household.zip",exdir = getwd())
list.files()
full_data <- read.table("household_power_consumption.txt",header = TRUE,
                        sep = ";")
head(full_data)
dim(full_data)
sub_data <- subset(full_data,Date %in% c("1/2/2007","2/2/2007"))
head(sub_data)
sub_data$Date <- as.Date(x=sub_data$Date,format="%d/%m/%Y")
sub_data$Global_active_power <- as.numeric(sub_data$Global_active_power)
hist(sub_data$Global_active_power,main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",ylab="Frequency",col="red")
png("plot1.png",width = 480,height = 480)
dev.off()
