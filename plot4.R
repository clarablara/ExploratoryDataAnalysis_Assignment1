## Coursera:    Exploratory Data Analysis (Course 4 - Data Science)
## Assignment:  Course Project 1
## File Name:   plot4.R
## Programmer:  Clara A. ("clarablara" on GitHub)
## Date:        01/17/2017


plot4 <- function() {
    
    ## Read data for date range 1/2/2007 - 2/2/2007
    data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", nrows = 2880, skip = 66637)
    
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
    
    ## Create 2 x 2 plot grid
    par(mfrow = c(2, 2))
    
    
    ## CREATE 1ST PLOT (top left)
    ## --------------------------
    
    ## Create plot variables
    x <- data$Time
    y <- data$Global_active_power
    
    ## Create plot
    plot(x, y, 
         type = "l",
         xlab = "",
         ylab = "Global Active Power"
    )
    
    
    ## CREATE 2ND PLOT (top right)
    ## ---------------------------
    
    ## Create plot variables
    x <- data$Time
    y <- data$Voltage
    
    ## Create plot
    plot(x, y, 
         type = "l",
         xlab = "datetime",
         ylab = "Voltage"
    )
    
    
    ## CREATE 3RD PLOT (bottom left)
    ## -----------------------------
    
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
           col = c("black", "red", "blue"),
           bty = "n",
           cex = .9
    )
    
    
    ## CREATE 4TH PLOT (bottom right)
    ## ------------------------------
    
    ## Create plot variables
    x <- data$Time
    y <- data$Global_reactive_power
    
    ## Create plot
    plot(data$Time, data$Global_reactive_power, 
         type = "l",
         xlab = "datetime",
         ylab = "Global_reactive_power"
    )
    
    
    ## Copy plot to png graphic
    dev.copy(png, file = "plot4.png")
    dev.off()
    
}

plot4()