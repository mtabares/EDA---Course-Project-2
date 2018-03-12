## Plot3
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999-2008 
## for Baltimore City? Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question.
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

# Group total NEI emissions per year:
baltcitymaryland.emissions.byyear<-summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions=sum(Emissions))
# colores <- c("red", "green", "blue", "yellow")
ggplot(baltcitymaryland.emissions.byyear, aes(x=factor(year), y=Emissions, fill=type,label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  #geom_bar(position = 'dodge')+
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission in tons")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                     "City by various source types", sep="")))+
  geom_label(aes(fill = type), colour = "white", fontface = "bold")

