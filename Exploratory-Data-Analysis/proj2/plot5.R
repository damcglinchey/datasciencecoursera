## Exploratory Data Analysis Project 2
## Plot for Question #5
## - How have emissions from motor vehicle sources 
## - changed from 1999–2008 in Baltimore City?

## This script assumes the data files are in the current working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Merge the two data sets
## TODO: This could probably be simplified to only pull what we really need
##       since this is pretty intensive
NEI_merge <- merge(NEI, SCC)

## Calculate the total emissions per year for Baltimore, MD
NEI_balt <- NEI_merge[NEI_merge$fips == 24510, ]

## Looking at the SSC data set motor vehicles =
## SSC$SCC.Level.Three - [115] "Automobiles and Light Trucks"
## - or -
## type="ON-ROAD"
NEI_baltmot <- NEI_balt[NEI_balt$type == "ON-ROAD", ]

## Get the sum of emissions vs year
NEI_pm25year <- select(NEI_baltmot, Emissions, year)
NEI_Tpm25year <- ddply(NEI_pm25year, "year", 
                       summarise, 
                       TotalEmissions=sum(Emissions))


# Plot
qplot(year, TotalEmissions, 
      data=NEI_Tpm25year, 
      geom=c("point", "smooth"), method="lm", 
      main="PM25 Emissions from Motor Vehicles in Baltimore, Maryland", 
      ylab="Total PM25 Emissions (tons)")
ggsave(filename="plot5.png")
