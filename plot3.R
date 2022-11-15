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
sub_data$datetime <- as.POSIXct(paste(sub_data$Date,sub_data$Time))

plot(sub_data$Sub_metering_1~sub_data$datetime,type="l",ylab=
         "Global Active Power (Kilowatts)",xlab="")
lines(sub_data$Sub_metering_2~sub_data$datetime,col="red")
lines(sub_data$Sub_metering_3~sub_data$datetime,col="blue")
legend("topright",col=c("black","red","blue"),cex=0.5,lty = 1,lwd = 2,legend = 
           c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png",width = 480,height = 480)
dev.off()
