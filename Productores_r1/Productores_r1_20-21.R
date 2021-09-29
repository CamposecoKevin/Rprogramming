library(tidyverse)
library(readxl)
library(dplyr)
library(writexl)


#Establecer el directorio de trabajo
setwd("C:/Users/KEVIN CAMPOSECO/Documents/Kevin_Proyecto/Rprogramming/Productores_r1/FaustoValiente/")


#Cargar Archivo
ProductoresR1<-read_xlsx("C:/Users/KEVIN CAMPOSECO/Downloads/Listado de Productores Dueños con Atencion 2021.xlsx")
View(ProductoresR1)


#filtro por técnicos
tecnico<-filter(ProductoresR1,ProductoresR1$`Usuario que Registro` =="Juan Jonatan Avila Xanté")

#guardar datos
write_xlsx(tecnico,"JonatanAvila_productores.xlsx")


