# PM2.5 Emission in US From 1999-2008

### Brief Introduction

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI).

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data used in this project are for 1999, 2002, 2005, and 2008.

### Overall Goal of this Project

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008.

### Link for the Dataset

https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

## The zip file contains two files:

1. *PM2.5 Emissions Data (𝚜𝚞𝚖𝚖𝚊𝚛𝚢𝚂𝙲𝙲_𝙿𝙼𝟸𝟻.𝚛𝚍𝚜): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year.* 

2. *Source Classification Code Table (𝚂𝚘𝚞𝚛𝚌𝚎_𝙲𝚕𝚊𝚜𝚜𝚒𝚏𝚒𝚌𝚊𝚝𝚒𝚘𝚗_𝙲𝚘𝚍𝚎.𝚛𝚍𝚜): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.*

### Column variables for the first file are:

- 𝚏𝚒𝚙𝚜: A five-digit number (represented as a string) indicating the U.S. county
- 𝚂𝙲𝙲: The name of the source as indicated by a digit string (see source code classification table)
- 𝙿𝚘𝚕𝚕𝚞𝚝𝚊𝚗𝚝: A string indicating the pollutant
- 𝙴𝚖𝚒𝚜𝚜𝚒𝚘𝚗𝚜: Amount of PM2.5 emitted, in tons
- 𝚝𝚢𝚙𝚎: The type of source (point, non-point, on-road, or non-road)
- 𝚢𝚎𝚊𝚛: The year of emissions recorded

*All together, this project addresses six points:*

### Questions:

- Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? What is the pattern?

- Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008?

- Of the four types of sources (point, nonpoint, onroad, nonroad), which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?

- Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

- How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

- Comparison of emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California. Which city has seen greater changes over time in motor vehicle emissions?

*The script for all specific points and related plots are in the file as plot1.R/plot1.png*

