

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





















  
  








  
  
  
  
  




  

