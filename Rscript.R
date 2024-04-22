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

#do we need to make a column of day of the week (1 through 7) for a predictor?

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






#attempting to split into train and test (lm): -->

train_size = floor(0.8 * nrow(data))  #80/20 split
train_indices = sample(seq_len(nrow(data)), size = train_size, replace = FALSE)

train_data = data[train_indices, ]
test_data = data[-train_indices, ]

print("test_data is")
print(nrow(test_data))

linear_model = lm(arr_delay ~ actual_elapsed_time + as.factor(month) + distance + dep_delay, data = train_data)
print(summary(linear_model))


predictions = predict(linear_model, newdata = test_data)
rounded_predictions = round(predictions, 1)  #round to 1 decimal place

comparison_df = cbind(test_data, predicted_delay = rounded_predictions)
file_name = paste0(dataframe, "_predicted.csv")
write.csv(comparison_df, file = file_name, row.names = FALSE)

print(paste("Predicted results have been written to: ", file_name))

print("top 10 rows of the predicted delays")
print(head(comparison_df, 10))
