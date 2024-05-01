#plotting R script

args = (commandArgs(trailingOnly=TRUE))
dataframe = args[1]

data = read.csv(as.character(dataframe))

data = na.omit(data)

breaks <- c(-Inf, -360, -60, -10, -2, 2, 10, 60, 360, Inf)

# Define the labels for each category
labels <- c("<-360", "-360 to -60", "-60 to -10", "-10 to -2", "-2 to 2", "2 to 10", "10 to 60", "60 to 360", ">360")


# Create a new categorical variable based on the criteria
data$predicted_category <- cut(data$predicted_delay, breaks = breaks, labels = labels, include.lowest = TRUE)

category_counts <- table(data$predicted_category)

category_perc <- category_counts / sum(category_counts) * 100

# Create a bar plot
barplot(category_perc,
        main = "American Airlines Predicted Delay",
        xlab = "Delay in Minutes",
        ylab = "Percentage",
        col = "skyblue",
        ylim = c(0,40),
        border = "black"
)

dev.off()
