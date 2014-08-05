if (!exists("do_plot"))
  source ("make_plots.R");

if (!exists("load_data"))
  source ("load_data.R");

# Query and modify graphical parameters which will be passed to do_plot function
p$mfrow<-rep(2,2);
p$mar <- c(5,3.9,4,1);

# Load data
data <- load_data();

# Make plot 4 (actual implementation in file make_plots.R)
do_plot(make_plot4, data, filename="plot4.png", to_file=T, par=p);
