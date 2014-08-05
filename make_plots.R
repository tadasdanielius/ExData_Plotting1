# Arguments
# plot_fun - function which should generate the plot
# to_file  - if set to True then will save to file otherwise will display on screen
# filename - the name of the output file, up to 511 characters. The page number is substituted 
#            if a C integer format is included in the character string, as in the default,
#            and tilde-expansion is performed. (The result must be less than 600 characters long. 
#            See postscript for further details.)
# width	   - the width of the device.
# height   - the height of the device.
# par      - par can be used to set or query graphical parameters. Parameters can be set by 
#            specifying them as arguments to par in tag = value form, or by passing them as a 
#            list of tagged values.
do_plot <- function(plot_fun, data, filename="plot.png", width=480, height=480, to_file=TRUE, par=NULL) {
  if (to_file) {
    png(filename = filename, width = width, height = height, units = "px");
    if (!is.null(par)) { par(par); }
    plot_fun(data);
    dev.off();
  } else {
    if (!is.null(par)) { par(par); }
    plot_fun(data);
  }
}

make_plot1 <- function(data) {
  message(" -> Rendering plot 1");
  hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red");
}

make_plot2 <- function(data, ylab="Global Active Power (kilowatts)") {
  message(" -> Rendering plot 2");
  plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab=ylab);
}

make_plot3 <- function(data, bty="y") {
  message(" -> Rendering plot 3");
  column_names <- names(data);
  plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering");
  legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=column_names[7:9], bty=bty);
  
  lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
  lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
}

make_plot4 <- function(data) {
  # Plot4 must have 4 plots. First plot and third plot already implemented in previuos requirements
  # So to avoid code duplication use already implemented version
  message(" -> Rendering plot 4");


  # Instead mixing everything in one function I decided to split in separate functions 
  # for better readability and reusability if needed
  inner_plot2 <- function(data) {
    message("  -> Rendering inner plot 2");
    plot(data$DateTime, data$Voltage, xlab = "DateTime", ylab = "Voltage", type="l")
  }
  
  inner_plot4 <- function(data) {
    message("  -> Rendering inner plot 1");
    plot(data$DateTime, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
  }
  
  make_plot2(data, ylab="Global Active Power");
  inner_plot2(data);
  
  make_plot3(data,bty="n");
  inner_plot4(data);
}

