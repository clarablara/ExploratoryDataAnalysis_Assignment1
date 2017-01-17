## Coursera:    Exploratory Data Analysis (Course 4 - Data Science)
## Assignment:  Course Project 1
## File Name:   plot1.R
## Programmer:  Clara A. ("clarablara" on GitHub)
## Date:        01/16/2017


plot1 <- function() {

    ## Read data for date range 1/2/2007 - 2/2/2007
    data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", nrows = 2880, skip = 66637)

    ## Reset column names
    read_head <- readLines("household_power_consumption.txt", n = 1)
    cnames <- unlist(strsplit(read_head, ";"))
    colnames(data) <- cnames
    
    ## Plot histogram of "Global_active_power" variable
    hist(data$Global_active_power, 
            breaks = 12,
            freq = TRUE,
            col = "Red",
            main = "Global Active Power", 
            xlab = "Global Active Power (kilowatts)"
         )
    
    ## Copy plot to png graphic
    dev.copy(png, file = "plot1.png")
    dev.off()

}

plot1()