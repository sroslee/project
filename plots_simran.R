#plotting R script

#takes in a single csv file - need to adjust the plots.sub file corespondingly

args = (commandArgs(trailingOnly=TRUE))
dataframe = args[1]

data = read.csv(as.character(dataframe))
data = na.omit(data)



#predicted and actual side by side for each month

avg_arr_delay <- tapply(data$arr_delay, data$month, mean)
avg_predicted_delay <- tapply(data$predicted_delay, data$month, mean)
avg_delay = data.frame(Month = 1:12, Predicted = avg_predicted_delay, Actual = avg_arr_delay)
pdf("UA_comp.pdf", width = 8, height = 6)
barplot(t(avg_delay[, -1]), beside = TRUE, col = c("darkblue", "lightblue"), xlab = "Month", ylab = "Avg Delay (min)", main = "Avg Actual & Predicted Arrival Delay by Month", args.legend = list(x = "top", bty = "n", inset = c(0,0.1)), legend.text = colnames(avg_delay)[-1])


dev.off()




#1-1 plot code

#plot(data$arr_delay, data$predicted_delay,
#     xlab = "actual", ylab = "predicted",
#     main = "actual arrival delay vs predicted arrival delay",
#     pch = 19, col = "blue")
# Add a dashed red 1:1 line
#abline(a = 0, b = 1, col = "red", lty = 2)


