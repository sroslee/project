rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
  dataframe = args[1]
} else {
  cat('usage: Rscript hw4.R <data frame>\n', file=stderr())
  stop()
}


data = read.csv(dataframe)

stepwise_model <- step(lm(arr_delay ~ actual_elapsed_time + as.factor(month) + distance + dep_delay, data = data), direction = "both")
print(summary(stepwise_model))
