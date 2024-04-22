#plotting R script

args = (commandArgs(trailingOnly=TRUE))
dataframe = args[1]

data = read.csv(as.character(dataframe))

plot(data$arr_delay, data$predicted_delay, type = "l", xlab = "X-axis label", ylab = "Y-axis label", main = "predicted vs actual delay")

png("plot.png")

dev.off()
