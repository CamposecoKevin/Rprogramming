
library(tidyverse)
library(readxl)
library(writexl)



# 89- fichero de datos limpio ---------------------------------------------


View(population)

poblacion <- population %>%
  filter(country %in% c("Guatemala", "Chile", "Honduras"),
         year %in% c(1999,2000))

view(poblacion)  


#Población por año

poblacion %>%
  count(year, wt = population)
  
  
# 90-Spreading y gathering ------------------------------------------------

eventos<- read_csv("C:/Users/KEVIN CAMPOSECO/Downloads/Eventos_20220525_204426/query_1.csv")



view(eventos)

str(eventos)

rogelio <- eventos %>%
  filter(eventos$`Id Técnico` == 137)

view(rogelio)

write_csv(eventos, "eventos.csv")


setwd("C:/Users/KEVIN CAMPOSECO/Mis documentos/Kevin_Proyecto/Rprogramming/R4udemy/S8/")





  
  








  
  
  
  
  




  

