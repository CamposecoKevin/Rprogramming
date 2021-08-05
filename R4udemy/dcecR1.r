library(tidyverse)
library(readxl)
library(dplyr)

#Establecer el directorio de trabajo
setwd("C:/Users/KEVIN CAMPOSECO/Documents/Kevin_Proyecto/Rprogramming/R4udemy/")


#Cargar Archivo
DCEC<-read_xlsx("C:/Users/KEVIN CAMPOSECO/Downloads/Listado de Eventos 01-10-2020 al 30-07-2021 Kevin .xlsx")
View(DCEC)


#RESUMEN DEL ARCHIVO
summary(DCEC)

#Para ver el tipo de cada columna para poder manejarlo
tibble(DCEC)

#Número de filas y columnas
dim(DCEC)

#Extracción de datos por grupo
dcecgroup<-group_by(DCEC, DCEC$Tecnico)

view(dcecgroup)

#Te muestra el total del agrupado
Grupos <- summarize(dcecgroup,
                      Cantidad =  n())

#Aqui ya tenemos tanto DC como EC
agrupados<-DCEC %>%
  group_by(DCEC$`Tipo de Evento`,DCEC$Tecnico) %>%
  summarise(n = n())

view(agrupados)




