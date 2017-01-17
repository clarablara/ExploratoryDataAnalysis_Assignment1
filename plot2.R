## Coursera:    Exploratory Data Analysis (Course 4 - Data Science)
## Assignment:  Course Project 1
## File Name:   plot2.R
## Programmer:  Clara A. ("clarablara" on GitHub)
## Date:        01/17/2017


plot2 <- function() {
    
    ## Read data for date range 1/2/2007 - 2/2/2007
    data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", nrows = 2880, skip = 66637)
    
    ## Reset column names
    read_head <- readLines("household_power_consumption.txt", n = 1)
    cnames <- unlist(strsplit(read_head, ";"))
    colnames(data) <- cnames
    
    ## Convert Times variable to times
    dates <- data$Date
    times <- data$Time
    x <- paste(dates, times)
    data$Time <- strptime(x, format = "%d/%m/%Y %H:%M:%S")
    
    ## Convert Dates variable to dates
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    
    ## Create plot variables
    x <- data$Time
    y <- data$Global_active_power
    
    ## Create plot
    plot(x, y, 
         type = "l",
         xlab = "",
         ylab = "Global Active Power (kilowatts)"
    )
    
    ## Copy plot to png graphic
    dev.copy(png, file = "plot2.png")
    dev.off()
    
}

plot2()