household_power_consumption <- read.table("./files/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", quote="\"", na.strings="?", stringsAsFactors=FALSE)
#Assigns column names
colnames(household_power_consumption)<-household_power_consumption[1,]
household_power_consumption<-household_power_consumption[2:nrow(household_power_consumption),]
#Subsets dates
hdata_set<-household_power_consumption[household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007" ,]
png("plot1.png",width=480,height=480)
hist(as.numeric(as.character(hdata_set$Global_active_power)),col="red",xlab="Global active power (kilowatts)",main="Global active power")
dev.off()