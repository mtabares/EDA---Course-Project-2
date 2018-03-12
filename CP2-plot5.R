## Plot5
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
require(dplyr)
require(ggplot2)

## reading data sources 
## setwd("C:/Users/MartaT/Dropbox/EAFIT MS/Curso DATA SCIENCE-Jonhs Hopkins University/Course 4 - Exploratory Data Analysis")
# read national emissions data
NEI <- readRDS("summarySCC_PM25.rds")
#read source code classification data
SCC <- readRDS("Source_Classification_Code.rds")
# visualization preparation
number.add.width<-800     # width length to make the changes faster
number.add.height<-800    # height length to make the changes faster

baltcitymaryland.emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
baltcitymaryland.emissions.byyear <- summarise(group_by(baltcitymaryland.emissions, year), Emissions=sum(Emissions))
ggplot(baltcitymaryland.emissions.byyear, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in tons")) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City")+
  geom_label(aes(fill = year),colour = "white", fontface = "bold")
