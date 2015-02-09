## Exploratory Data Analysis Project 2
## Plot for Question #6
## - Compare emissions from motor vehicle sources in 
## - Baltimore City with emissions from motor vehicle 
## - sources in Los Angeles County, California (fips == "06037"). 
## - Which city has seen greater changes over time in motor vehicle emissions?

## This script assumes the data files are in the current working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Merge the two data sets
## TODO: This could probably be simplified to only pull what we really need
##       since this is pretty intensive
NEI_merge <- merge(NEI, SCC)

## Subset for Baltimore and LA
NEI_baltla <- NEI_merge[NEI_merge$fips == "24510" | NEI_merge$fips == "06037", ]

## Looking at the SSC data set motor vehicles =
## SSC$SCC.Level.Three - [115] "Automobiles and Light Trucks"
## - or -
## type="ON-ROAD"
NEI_baltlamot <- NEI_baltla[NEI_baltla$type == "ON-ROAD", ]

## Get the sum of emissions vs year
NEI_pm25year <- select(NEI_baltlamot, fips, year, Emissions)
NEI_Tpm25year <- ddply(NEI_pm25year, .(fips, year), 
                       summarise, 
                       TotalEmissions=sum(Emissions))


# Plot
qplot(year, TotalEmissions, 
      data=NEI_Tpm25year, 
      facets = . ~ fips,
      geom=c("point", "smooth"), method="lm", 
      main="PM25 Emissions from Motor Vehicles in Baltimore and LA", 
      ylab="Total PM25 Emissions (tons)")
ggsave(filename="plot6.png")
