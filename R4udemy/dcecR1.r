library(tidyverse)
library(readxl)

#Establecer el directorio de trabajo
setwd("C:/Users/KEVIN CAMPOSECO/Documents/Kevin_Proyecto/Rprogramming/R4udemy/")


#Cargar Archivo
DCEC<-read_xlsx("C:/Users/KEVIN CAMPOSECO/Downloads/Listado de Eventos 01-10-2020 al 30-07-2021 Kevin .xlsx")
View(DCEC)


#RESUMEN DEL ARCHIVO
summary(DCEC)

#Para ver el tipo de cada columna
tibble(DCEC)

