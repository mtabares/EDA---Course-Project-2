##Plot1
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the
## total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, 
## and 2008.
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
tot.emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))
colores <- c("red", "green", "blue", "yellow")
x1<-barplot(height=tot.emissions$Emissions/1000, names.arg=tot.emissions$year,
            xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),
            main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),col=colores)
text(x = x1, y = round(tot.emissions$Emissions/1000,2), label = round(tot.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")