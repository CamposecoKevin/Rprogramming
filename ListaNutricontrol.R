#Arrancar librerias

library(dplyr)
library(tidyr) 
library(readxl)
library(openxlsx)
library(writexl)

#crear un nuevo archivo de trabajo
dir.create("Espacio Nutricontrol")

#para pasar en el nuevo directorio de trabajo
setwd("Espacio Nutricontrol")

productores<-read.xlsx("Listado de Productores Asignados.xlsx")

#obtener valores unicos de una columna
municipio<-unique(productores$municipio)
unique(productores$departamento)

#Crear una tabla solo para muncipio
muni<-tibble(municipio)
View(muni)

#Ordenar
Orden_Muncipio<-arrange(muni,municipio)

#vista general de datos
View(productores)

#culumans y filas
dim(productores)

#visualización de tipo de variable
str(productores)

#Visutalización de datos
str(portecnicos)

#filtro por técnicos
Informacion<-filter(productores,municipio =="")

#guardar datos
write.xlsx(Informacion,"mun_Nuevo Progreso.xlsx")


