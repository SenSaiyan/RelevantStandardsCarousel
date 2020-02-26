library(readxl)
library(writexl)
library(stringr)
library(plyr)
library(dplyr)
library(arules)
library(RColorBrewer)
library(splitstackshape)

xl <<- read_excel("C:/Users/djiang/relevantstandardscarousel/2019 export parsed values.xlsx") #change to local location
xl <- xl[order(xl$Owner_GUID),] #order by user making purchases, even across different orders

#add SDO column to dataframe
# for(orders in 1:nrow(xl)){
#   SDO <- sapply(strsplit(xl$ProductId," "), '[', 1)
#   xl$SDO = SDO
# }

#create df with owner and all standards bought
transData <- ddply(xl,c("Owner_GUID"), function(df1)paste(df1$ProductId, collapse=","))
# transData$Owner_GUID <- NULL
# colnames(transData) <- c("items")

#test <- as(split(xl[,"ProductId"], xl[,"Owner_GUID"]), "transactions")
transData <- cSplit(transData, "V1", sep=",")
temp <- write.csv(transData,"C:/Users/djiang/relevantstandardscarousel/basket.csv", row.names = FALSE)

txn = read.transactions(file='C:/Users/djiang/relevantstandardscarousel/basket.csv', rm.duplicates= FALSE, format='basket',sep=',', cols = 2);
trans <- as(transData, 'transactions')
#inspect(head(trans))
rules <- apriori(transData, parameter = list(support = 0.01, confidence = 0.5))
