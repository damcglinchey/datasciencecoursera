## Exploratory Data Analysis Project 2
## Plot for Question #2
## - Have total emissions from PM2.5 decreased in the 
## - Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## - Use the base plotting system to make a plot answering this question.

## This script assumes the data files are in the current working directory
NEI <- readRDS("summarySCC_PM25.rds")

## Calculate the total emissions per year for Baltimore, MD
NEI_balt <- NEI[NEI$fips == 24510, ]
NEI_pm25year <- select(NEI_balt, Emissions, year)
NEI_Tpm25year <- ddply(NEI_pm25year, "year", 
                       summarise, 
                       TotalEmissions=sum(Emissions))

# Try a linear regression of the data
fit <- lm(NEI_Tpm25year$TotalEmissions ~ NEI_Tpm25year$year)

# Plot
png("plot2.png")
plot(NEI_Tpm25year$year, NEI_Tpm25year$TotalEmissions,
     main="PM25 Emissions for Baltimore, Maryland",
     xlab="year", ylab="Total PM25 Emissions (tons)", 
     pch=20, col="steelblue")
abline(fit, col="red", lty="dashed")
dev.off()