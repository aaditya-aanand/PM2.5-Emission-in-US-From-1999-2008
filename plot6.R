library(dplyr)
library(tidyr)

#Reading into the Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Getting the source codes of motor vehicle related emission
source <- grep("[Mm]otor|[Vv]ehicle", SCC$Short.Name)
codes <- SCC$SCC[source]

#Subsetting the data for Motor Vehicle related emission in Baltimore, Maryland
NEI_B <- subset(NEI, fips == "24510")
NEI_B <- subset(NEI_B, SCC %in% codes)

#Subsetting the data for Motor Vehicle related emission in LA, California
NEI_L <- subset(NEI, fips == "06037")
NEI_L <- subset(NEI_L, SCC %in% codes)

#Changing the class of year to a factor
NEI_B$year <- as.factor(NEI_B$year)
NEI_L$year <- as.factor(NEI_L$year)

#Grouping the NEI Data year wise
NEI_B <- group_by(NEI_B, year)
NEI_L <- group_by(NEI_L, year)

#Summarizing the data by sum function
data_B <- summarize(NEI_B, sum(Emissions, na.rm = TRUE))
names(data_B) <- c("year", "emissions")

data_L <- summarize(NEI_L, sum(Emissions, na.rm = TRUE))
names(data_L) <- c("year", "emissions")

#Separating out the year and total emissions
data_B.year <- data_B$year
data_B.sum <- data_B$emissions

data_L.year <- data_L$year
data_L.sum <- data_L$emissions

#Changing into numeric
data_B.year <- as.numeric(as.character(data_B.year))
data_B.sum <- as.numeric(as.character(data_B.sum))

data_L.year <- as.numeric(as.character(data_L.year))
data_L.sum <- as.numeric(as.character(data_L.sum))

#Creating a GrDevice
png(file = "plot6.png", width = 1000, height = 600)
par(mar = c(4, 4, 2 ,2), mfrow = c(1, 2))

{
        plot(data_B.year, data_B.sum, type = "n", xlab = "Year", 
             ylab = "PM2.5 in Tonnes", main = "Baltimore by Motor Vehicles")
        points(data_B.year, data_B.sum, pch = 19)
        lines(data_B.year, data_B.sum)
}

{
        plot(data_L.year, data_L.sum, type = "n", xlab = "Year", 
             ylab = "PM2.5 in Tonnes", main = "LA by Motor Vehicles")
        points(data_L.year, data_L.sum, pch = 19)
        lines(data_L.year, data_L.sum)
}

dev.off()





