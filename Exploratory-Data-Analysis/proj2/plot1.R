## Exploratory Data Analysis Project 2
## Plot for Question #1
## - Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## - Using the base plotting system, make a plot showing the total PM2.5 emission from 
## - all sources for each of the years 1999, 2002, 2005, and 2008.

## This script assumes the data files are in the current working directory
NEI <- readRDS("summarySCC_PM25.rds")

## Calculate the total emissions per year
NEI_pm25year <- select(NEI, Emissions, year)
NEI_Tpm25year <- ddply(NEI_pm25year, "year", 
                       summarise, 
                       TotalEmissions=sum(Emissions))

# Try a linear regression of the data
fit <- lm(NEI_Tpm25year$TotalEmissions ~ NEI_Tpm25year$year)

# Plot
png("plot1.png")
plot(NEI_Tpm25year$year, NEI_Tpm25year$TotalEmissions, 
     xlab="year", ylab="Total PM25 Emissions (tons)", 
     pch=20, col="steelblue")
abline(fit, col="red", lty="dashed")
dev.off()