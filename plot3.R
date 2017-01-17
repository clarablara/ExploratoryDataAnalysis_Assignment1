## Coursera:    Exploratory Data Analysis (Course 4 - Data Science)
## Assignment:  Course Project 1
## File Name:   plot3.R
## Programmer:  Clara A. ("clarablara" on GitHub)
## Date:        01/17/2017


plot3 <- function() {
    
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
    
    ## Create empty plot
    with(data, plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
    
    ## Insert data into plot
    points(data$Time, data$Sub_metering_1, type = "l")
    points(data$Time, data$Sub_metering_2, type = "l", col = "red")
    points(data$Time, data$Sub_metering_3, type = "l", col = "blue")

    ## Create legend
    legend("topright", 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            lty = c(1, 1, 1),
            col = c("black", "red", "blue")
        )
    
    ## Copy plot to png graphic
    dev.copy(png, file = "plot3.png")
    dev.off()
    
}

plot3()