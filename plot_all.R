source ("make_plots.R");

# Reset
par (mfrow=rep(1,2),mar=c(5,4,4,2),oma=rep(0,4));

data <- load_data();
message ("Creating plots");
do_plot(make_plot1, data, filename="plot1_.png", to_file=T);
do_plot(make_plot2, data, filename="plot2_.png", to_file=T);
do_plot(make_plot3, data, filename="plot3_.png", to_file=T);


p<-rep();
p$mfrow<-rep(2,2);
do_plot(make_plot4, data, filename="plot4___.png", to_file=T, par=p);


message ("Done.");
