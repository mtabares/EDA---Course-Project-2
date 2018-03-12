## Plot6
## Compare emissions from motor vehicle sources in Baltimore City with emissions 
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?
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

## Part1
baltcitymaryland.emissions<-summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
losangelscal.emissions<-summarise(group_by(filter(NEI, fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))

baltcitymaryland.emissions$County <- "Baltimore City, MD"
losangelscal.emissions$County <- "Los Angeles County, CA"
both.emissions <- rbind(baltcitymaryland.emissions, losangelscal.emissions)

## Part2
ggplot(both.emissions, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,2))) +
  geom_bar(stat="identity") + 
  facet_grid(County~., scales="free") +
  ylab(expression("total PM"[2.5]*" emissions in tons")) + 
  xlab("year") +
  ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))+
  geom_label(aes(fill = County),colour = "white", fontface = "bold")
