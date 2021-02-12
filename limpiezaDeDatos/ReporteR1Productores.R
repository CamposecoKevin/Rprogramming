#Arrancar librerias

library(dplyr)
library(tidyr) 
library(readxl)
library(openxlsx)
library(writexl)


productores<-read.xlsx("Listado Productores de Tecnicos R1.xlsx")

#vista general de datos
View(productores)

#culumans y filas
dim(productores)

#visualización de tipo de variable
str(productores)

#Visutalización de datos
str(portecnicos)

#filtro por técnicos
Ana<-filter(productores,tecnicoCampo =="Ana Isabel Gómez López")

#guardar datos
write.xlsx(Ana,"AnaData.xlsx")

