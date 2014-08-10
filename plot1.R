##First, we should automatically set the directory.
##Second,we should subset the necessary data from the given one.
data<-read.table("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=";",na.strings="?")
Date<-as.Date(data$Date,"%d/%m/%Y")
Datetime<-paste(Date,data$Time)
Datetime<-as.POSIXct(Datetime)
dataframe<-data.frame("Datetime"=Datetime,data[,3:9],stringsAsFactors=FALSE)
data1<-dataframe[(dataframe$Datetime>=as.POSIXct("2007-02-01"))&(dataframe$Datetime<as.POSIXct("2007-02-03 00:00:00")),]
##Then,we can plot the histogram.
png(file="plot1.png",width=480,height=480)
hist(data1$"Global_active_power",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red")
dev.off()