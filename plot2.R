library(dplyr)
library(tidyr)

#Reading into the Data
NEI <- readRDS("summarySCC_PM25.rds")

#Changing the class of year to a factor
NEI$year <- as.factor(NEI$year)

#Subsetting the data for Baltimore City, Maryland
NEI <- subset(NEI, fips == "24510")

#Grouping the NEI Data year wise
NEI <- group_by(NEI, year)

#Summarizing the data by sum function
data <- summarize(NEI, sum(Emissions, na.rm = TRUE))
names(data) <- c("year", "emissions")

#Separating out the year and total emissions
data.year <- data$year
data.sum <- data$emissions

#Changing into numeric
data.year <- as.numeric(as.character(data.year))
data.sum <- as.numeric(as.character(data.sum))

#Creating a GrDevice
png(file = "plot2.png", width = 500, height = 500)
par(mar = c(4, 4, 2 ,2))
plot(data.year, log10(data.sum), type = "n", xlab = "Year", 
     ylab = "Log [PM2.5]", main = "Total Emission of PM2.5 Year Wise in Baltimore City, Maryland")
points(data.year, log10(data.sum), pch = 19)
lines(data.year, log10(data.sum))
dev.off()