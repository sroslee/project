args = commandArgs(trailingOnly=TRUE)
if(length(args) == 4){
dataframe1 = args[1]
dataframe2 = args[2]
dataframe3 = args[3]
dataframe4 = args[4]
} else {
cat('usage: Rscript hw4.R <data frame>\n', file=stderr())
stop()
}

# Read CSV files for each airline
airline1 <- read.csv(as.character(dataframe1))
airline2 <- read.csv(as.character(dataframe2))
airline3 <- read.csv(as.character(dataframe3))
airline4 <- read.csv(as.character(dataframe4))

airline1 <- na.omit(airline1)
airline2 <- na.omit(airline2)
airline3 <- na.omit(airline3)
airline4 <- na.omit(airline4)

# Calculate average delay per airline per month
avg_delay_airline1 <- tapply(airline1$arr_delay, airline1$month, mean)
avg_delay_airline2 <- tapply(airline2$arr_delay, airline2$month, mean)
avg_delay_airline3 <- tapply(airline3$arr_delay, airline3$month, mean)
avg_delay_airline4 <- tapply(airline4$arr_delay, airline4$month, mean)


# Create a data frame with the average delay for each airline and month
avg_delay <- data.frame(Month = 1:12, American_Airlines = avg_delay_airline1, United_Airlines = avg_delay_airline2, Delta_Airlines = avg_delay_airline3, Southwest_Airlines = avg_delay_airline4)

print(avg_delay$Delta_Airlines[12])

pdf("month_bar_plot.pdf", width= 10, height= 10)

# Plot the bar plot
barplot(t(avg_delay[, -1]), beside = TRUE, col = rainbow(ncol(avg_delay) - 1), xlab = "Month", ylab = "Average Delay", main = "Average Delay per Airline per Month", args.legend = list(x = "top", bty = "n", inset = c(0, 0.1)), legend.text = colnames(avg_delay)[-1])

dev.off()