if (!exists("do_plot"))
  source ("make_plots.R");

if (!exists("load_data"))
  source ("load_data.R");

# Reset
par (mfrow=rep(1,2),mar=c(5,4,4,2),oma=rep(0,4));

# Load data
data <- load_data();

# Make plot 1 (actual implementation in file make_plots.R)
do_plot(make_plot1, data, filename="plot1.png", to_file=T);

