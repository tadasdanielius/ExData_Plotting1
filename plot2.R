if (!exists("do_plot"))
  source ("make_plots.R");

if (!exists("load_data"))
  source ("load_data.R");

# Reset
par (mfrow=rep(1,2),mar=c(5,4,4,2),oma=rep(0,4));

# Load data
data <- load_data();

# Make plot 2 (actual implementation in file make_plots.R)
do_plot(make_plot2, data, filename="plot2.png", to_file=T);
