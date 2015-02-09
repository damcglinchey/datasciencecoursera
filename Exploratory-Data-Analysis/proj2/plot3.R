## Exploratory Data Analysis Project 2
## Plot for Question #3
## - Of the four types of sources indicated by the type 
## - (point, nonpoint, onroad, nonroad) variable, 
## - which of these four sources have seen decreases in 
## - emissions from 1999–2008 for Baltimore City? 
## - Which have seen increases in emissions from 1999–2008? 
## - Use the ggplot2 plotting system to make a plot answer this question.

## This script assumes the data files are in the current working directory
NEI <- readRDS("summarySCC_PM25.rds")

## Calculate the total emissions per year for Baltimore, MD
NEI_balt <- NEI[NEI$fips == 24510, ]
NEI_q3 <- select(NEI_balt, type, year, Emissions)
NEI_q3sum <- ddply(NEI_q3, .(type, year), summarise, 
                   TotalEmissions=sum(Emissions))

# Plot
qplot(year, TotalEmissions, 
      data=NEI_q3sum, 
      facets=.~type, 
      geom=c("point", "smooth"), method="lm", 
      main="PM25 Emissions for Baltimore, Maryland", 
      ylab="Total PM25 Emissions (tons)")
ggsave(filename="plot3.png")
