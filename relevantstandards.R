library(readxl)
library(writexl)
library(stringr)
library(dplyr)

xl <<- read_excel("C:/Users/djiang/relevantstandardscarousel/2019 export parsed values.xlsx") #change to local location
standard_input <- trimws("ANSI B11.19-2010") #input valid product id
customers <- filter(xl, ProductId == standard_input)
total_orders <- data.frame(OrderNumber = character())
other_ordered_standards <- data.frame(Owner_GUID = character(), OrderNumber = character(), ProductId = character())

for(orders in 1:nrow(customers)){
  order_id <- customers[orders,]$OrderNumber
  temp <- filter(xl, OrderNumber == order_id)
  other_ordered_standards <- rbind(other_ordered_standards, temp)
}

other_standards_bought <- filter(other_ordered_standards, ProductId != standard_input)
occurances <- table(unlist(other_standards_bought$ProductId))
occurances_df <- as.data.frame(occurances)
occurances_ordered <- arrange(occurances_df, desc(Freq))
filename_clean <- str_remove_all(standard_input, "[(): /]")
filepath <- paste("C:/Users/djiang/relevantstandardscarousel/", filename_clean, '.xlsx', sep = "") #change to local folder
tmp <- write_xlsx(occurances_ordered, filepath)
