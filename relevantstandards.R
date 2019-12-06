library(readxl)
Xl <- read_excel("C:/Users/djiang/Downloads/2019 export parsed values/2019 export parsed values.xlsx")
# View(Xl)

library(dplyr)
customers <- filter(Xl, ProductId == "AAMI TIR12:2010 (AAMI TIR 12:2010)") #input valid product id
# View(customers)

# standard_count <- data.frame(Standard = character(), Count = integer())

CreateOtherStandards <- function(){
  total_orders <- data.frame(OrderNumber = character())
  other_ordered_standards <- data.frame(Owner_GUID = character(), OrderNumber = character(), ProductId = character())
  for(orders in 1:nrow(customers)){
    order_id <- customers[orders,]$OrderNumber
    temp <- filter(xl, OrderNumber == order_id)
    other_ordered_standards <- rbind(other_ordered_standards, temp)
  }
  # print(other_ordered_standards)
  return(other_ordered_standards)
}

other_standards_bought <- filter(CreateOtherStandards(), ProductId != "AAMI TIR12:2010 (AAMI TIR 12:2010)") #filter out own standard name
# print(other_standards_bought)

occurances <- table(unlist(other_standards_bought$ProductId))
# print(occurances)
occurances_df <- as.data.frame(occurances)
occurances_ordered <- arrange(occurances_df, desc(Freq))
# print(occurances_ordered)
# 
# return_first_10_relevance <- function(df){
#   first_10 <- data.frame(Standard = character)
#   for(i in 1:10){
#     first_10 <- rbind(first_10, df[i,]$Var1)
#   }
#   return(first_10)
# }
# 
# relevant_standards <- return_first_10_relevance(occurances_ordered)