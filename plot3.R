library(dplyr)
library(tidyr)

#Reading into the Data
NEI <- readRDS("summarySCC_PM25.rds")

#Subsetting the data for Baltimore City, Maryland
NEI <- subset(NEI, fips == "24510")

#Changing the class of year and type to a factor
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)

#Grouping the NEI Data year wise
NEI <- group_by(NEI, type, year)

#Summarizing the data by sum function
data <- summarize(NEI, sum(Emissions, na.rm = TRUE))
names(data) <- c("type", "Year", "emissions")

#Creating a GrDevice
png(file = "plot3.png", width = 500, height = 500)
qplot(Year, emissions, data = data, facets = . ~ type) +
        labs(title = "PM2.5 Emission Pattern of Baltimore City, US") +
        labs(y = "Emissions of PM2.5")
dev.off()