setwd("/Users/tomglaser/Desktop/Coursera/Data Science - Johns Hopkins/Data Exploration")
df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactor=FALSE)
df<-subset(df,subset=(Date=="1/2/2007" | Date=="2/2/2007"))
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
df$WeekDay<-format(df$Date,"%a")
df[,3]<-as.numeric(df[,3])
df[,4]<-as.numeric(df[,4])
df[,5]<-as.numeric(df[,5])
df[,6]<-as.numeric(df[,6])
df[,7]<-as.numeric(df[,7])
df[,8]<-as.numeric(df[,8])
png(filename = "plot1.png",
    width = 480, height = 480)
hist(df$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     breaks=11,
     ylim=c(0,1200))
dev.off()