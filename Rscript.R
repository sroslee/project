#R script, read in data	

rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
  dataframe = args[1]
} else {
  cat('usage: Rscript hw4.R <data frame>\n', file=stderr())
  stop()
}


data = read.csv(dataframe)


response = data$arr_delay
predictor1 = data$distance
#predictor2 = data$flights
predictor3 = data$actual_elapsed_time
predictor4 = data$dep_delay
#predictor5 = data$month

model = glm(response ~ predictor1 + predictor3 + predictor4 + predictor1:predictor4)
print(summary(model))

#predictions <- predict(model, newdata = new_data, type = "response")
#write.csv(predictions, file = "predicted.csv")

correlation_matrix <- cor(data[, c("dep_delay", "actual_elapsed_time", "flights", "distance")])
print(correlation_matrix)
