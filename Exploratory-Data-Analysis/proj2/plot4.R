## Exploratory Data Analysis Project 2
## Plot for Question #4
## - Across the United States, how have emissions from 
## - coal combustion-related sources changed from 1999–2008?

## This script assumes the data files are in the current working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Merge the two data sets
## TODO: This could probably be simplified to only pull what we really need
##       since this is pretty intensive
NEI_merge <- merge(NEI, SCC)

## Looking at SCC variables - coal combustion could be:
## grep("Coal", levels(SCC$EI.Sector), value=T)
## - [13] "Fuel Comb - Comm/Institutional - Coal"
## - [18] "Fuel Comb - Electric Generation - Coal"
## - [23] "Fuel Comb - Industrial Boilers, ICEs - Coal"
NEI_coal <- NEI_merge[grepl("Coal", NEI_merge$EI.Sector), ]

## Get the sum of emissions vs year
NEI_pm25year <- select(NEI_coal, Emissions, year)
NEI_Tpm25year <- ddply(NEI_pm25year, "year", 
                       summarise, 
                       TotalEmissions=sum(Emissions))

# Plot
qplot(year, TotalEmissions, 
      data=NEI_Tpm25year, 
      geom=c("point", "smooth"), method="lm", 
      main="PM25 Emissions for Coal-Combustion Sources", 
      ylab="Total PM25 Emissions (tons)")
ggsave(filename="plot4.png")

