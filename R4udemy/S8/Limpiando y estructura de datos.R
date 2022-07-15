

# Space to work ------------------------------------------------------

setwd("C:/Users/KEVIN CAMPOSECO/Mis documentos/Kevin_Proyecto/Rprogramming/R4udemy/S8/")

# packages to use ---------------------------------------------------------

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

#Estrucutra de limpieza de datos
#Que es una variable y observación
#fila y columnas



# 91-técnica de gathering ----------------------------------------------------


new_table4a<-table4a %>%
  gather(`1999`, `2000`, key = "year", value = "cases" )



new_table4b<-table4b %>%
  gather(`1999`, `2000`, key = "year", value = "population" )
new_table4b

# unir distitntos archivos
#Para que esto funcione tienen que tener las mismas filas
Union_table_ab<-left_join(new_table4a,new_table4b)



# 92. La técnica de spresading --------------------------------------------

#convertir filas a columnas, de acuerdo a la variable a utilizar.
new_table2<- table2 %>%
  spread(key = type, value = count)

table2








  
  








  
  
  
  
  




  

