## To check the number of lines to be skipped, I opened the data in text document
## I found that data has been recorded from 16/12/2006;17:24:00 
## Data for each minute has been recorded in each line hence I calculated number of minutes between 16/12/2006;17:24:00 and 01/02/2007; 00:00:00
## This is how I got to know that I need to skp 66637 lines. And I read 2880 lines, that's because there are 2880 minutes in 2 days



## Saving file URL in fileURL to be used further for downloading the data

fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"


## Downloading the file in the active directory & unzipping it


download.file(fileURL,destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")

##reading specific lines for 01/02/2007 to 02/02/2007 data

data<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,head=FALSE)

##used this very small dataset to get column headers for the main dataset

data_label<-read.table("household_power_consumption.txt",sep=";",nrows=2,header=TRUE)

## applying column headers to the main dataset

names(data)<-names(data_label)

## plotting histogram
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="Red")

##copying the histogram to png file, file will be saved in the active directory

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()