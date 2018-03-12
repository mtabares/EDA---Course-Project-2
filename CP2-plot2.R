## Plot2
## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.
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

baltcitymaryland.emissions<-summarise(group_by(filter(NEI, fips == "24510"), year), Emissions=sum(Emissions))
colores <- c("red", "green", "blue", "yellow")
x2<-barplot(height=baltcitymaryland.emissions$Emissions/1000, names.arg=baltcitymaryland.emissions$year,
            xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,4),
            main=expression('Total PM'[2.5]*' emissions in Baltimore City-MD in kilotons'),col=colores)
text(x = x2, y = round(baltcitymaryland.emissions$Emissions/1000,2), label = round(baltcitymaryland.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")