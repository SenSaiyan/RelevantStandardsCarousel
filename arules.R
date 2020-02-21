library(readxl)
library(writexl)
library(stringr)
library(plyr)
library(dplyr)
library(arules)
library(RColorBrewer)

xl <<- read_excel("C:/Users/djiang/relevantstandardscarousel/2019 export parsed values.xlsx") #change to local location
xl <- xl[order(xl$Owner_GUID),] #order by user making purchases, even across different orders

#add SDO column to dataframe
for(orders in 1:nrow(xl)){
  SDO <- sapply(strsplit(xl$ProductId," "), '[', 1)
  xl$SDO = SDO
}
transData <- ddply(xl,c("Owner_GUID","OrderNumber"),collapse=",")

trans <- as(xl, 'transactions')
inspect(head(trans))
rules <- apriori(xl, parameter = list(support = 0.01, confidence = 0.5))
