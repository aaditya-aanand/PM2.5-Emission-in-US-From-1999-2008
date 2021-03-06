library(dplyr)
library(tidyr)

#Reading into the Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Getting the source codes of motor vehicle related emission
source <- grep("[Mm]otor|[Vv]ehicle", SCC$Short.Name)
codes <- SCC$SCC[source]

#Subsetting the data for Motor Vehicle related emission in Baltimore
NEI <- subset(NEI, fips == "24510")
NEI <- subset(NEI, SCC %in% codes)

#Changing the class of year to a factor
NEI$year <- as.factor(NEI$year)

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
png(file = "plot5.png", width = 500, height = 500)
par(mar = c(4, 4, 2 ,2))
plot(data.year, data.sum, type = "n", xlab = "Year", 
     ylab = "PM2.5 Emission", main = "Total Emission of PM2.5 in Baltimore by Motor Vehicles")
points(data.year, data.sum, pch = 19)
lines(data.year, data.sum)
dev.off()