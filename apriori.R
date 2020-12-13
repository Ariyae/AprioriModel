install.packages("arules")
library(arules)
groceries <- read.transactions(file.choose(), sep = ",")
summary(groceries)
inspect(groceries[1:5])
itemFrequencyPlot(groceries, support = 0.1)
image(groceries[1:5])
apriori(groceries)#Zero support
groceryrules <- apriori(groceries, parameter = list(support = 0.006, confidence = 0.25, minlen = 2))
summary(groceryrules) 
inspect(groceryrules[1:3])
#Improving model performance
inspect(sort(groceryrules, by = "lift")[1:5])
#Testing
berryrules <- subset(groceryrules, items %in% "berries")
inspect(berryrules)
#write in a file
write(groceryrules, file = "groceryrules.csv",
      sep = ",", quote = TRUE, row.names = FALSE)
