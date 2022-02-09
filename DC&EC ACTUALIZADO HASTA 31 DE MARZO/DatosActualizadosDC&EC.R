#Arrancar librerias

library(dplyr)
library(tidyr) 
library(readxl)
library(openxlsx)
library(writexl)

productores<-read.xlsx("Listado de Eventos.xlsx")

#vista general de datos
View(productores)

#culumans y filas
dim(productores)

#visualización de tipo de variable
str(productores)

#Visutalización de datos
str(portecnicos)

#filtro por técnicos
tecnico<-filter(productores,Tecnico =="Issmar Federico Molina Noriega*")

#guardar datos
write.xlsx(tecnico,"Issmar.xlsx")

#Revisión de datos extraidos
View(tecnico)

