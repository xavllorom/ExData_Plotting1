#Read file
household_power_consumption <- read.table("./files/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", quote="\"", na.strings="?", stringsAsFactors=FALSE)
colnames(household_power_consumption)<-household_power_consumption[1,]
household_power_consumption<-household_power_consumption[2:nrow(household_power_consumption),]
#Subsets dates
hdata_set<-household_power_consumption[household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007" ,]
#Transform date format (d/m/yyyy -> yyyy-m-d)
for (i in 1:nrow(hdata_set)) hdata_set$Date[i]<-paste(substr(hdata_set$Date[i],5,9),"-",substr(hdata_set$Date[i],3,3),"-",substr(hdata_set$Date[i],1,1),sep="")
#Construct a columns datetime
completeDate<-strftime(paste(hdata_set$Date,hdata_set$Time),"%y-%m-%d %H:%M:%S")
#Append new column
hdata_set <- cbind(hdata_set,completeDate)
png("plot2.png",width=480,height=480)
plot(hdata_set$completeDate,as.numeric(as.character(hdata_set$Global_active_power)),ylab="Global active power (kilowatts)",xaxt="n",type="l",lty=1,lwd=1)
lines(hdata_set$completeDate,as.numeric(as.character(hdata_set$Global_active_power)),col="black")
axis(1, labels=c('Thu','Fri','Sat'),at=c(1,nrow(hdata_set)/2,nrow(hdata_set)))
dev.off()

