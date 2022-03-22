# Estableciendo lugar de trabajo
setwd("/R/Rprogramming/R4udemy/S6/")

# Package ha utilizar -----------------------------------------------------
library(tidyverse)
library(nycflights13)
view(nycflights13)
View(flights)

library(readxl)

install.packages("writexl")
library(writexl)



# Base de datos a analizar y asiganciónd variable--------------------------

  eventosR1<-read_xlsx("/R/Rprogramming/R4udemy/S9/Listado de Eventos 28-02-2022.xlsx")


#Base de datos de productores

  ProductoresR1 <- read_xlsx("D:/R/Rprogramming/Productores/Listado Productores de Tecnicos R1.xlsx")
  print(ProductoresR1)
  
  #Concatener nombres de data frame
  productores <- paste(ProductoresR1$nombres, ProductoresR1$apellidos)

  productores <- as.tibble(productores)%>%
    rename(Nombre_Productor = value)
  
  View(productores) 
  
  


# 59 - la variación de variables categóricas ------------------------------
  
  # Catégoricas: factor o vector de caracteres.
  
  View(eventosR1)
  
  #visualización con de catégoricas de #tipo de evento#
    ggplot(data = eventosR1)+
    geom_bar(mapping = aes(eventosR1$Departamento))
  
  # conteo de las varia
  eventosR1 %>%
    count(eventosR1$`Tipo de Evento`)
  
  

# 60 variables continuas --------------------------------------------------
  #Conjuto de infinito de valores ordenados (numeros, fechas)
  #histogramas
  
  ggplot(data = diamonds)+
    geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

  diamonds %>%
    count(cut_width(carat, 0.5))
  
  view(diamonds)


  diamonds_filter <- diamonds %>%
    filter(carat <3)
  
  ggplot(data = diamonds_filter, mapping = aes(x = carat, color = cut))+
    geom_freqpoly(binwidth = 0.1)
  
    
  
# 61- las pregutnas que debemos hacernos ----------------------------------

  # cuales son los valroes más comunes, por qué?
  
  # cuales son los valroes más raros, cumple con lo que esperamos.
  
  # se ve algun patrón característico o inusual.
  

  
  
  
# 62 - encontrando subgrupos dentro de los datos --------------------------

  # * Qué determian que los elementos de un cluster sean similares entre ellos.
  # * Qué determianq eu clusters separados sean diferentes entre si
  # * describir y explicar cada uno d elos clusters
  # * por qué alguna observación puede ser clasicada
  
  ggplot(data = faithful, mapping = aes(x= eruptions))+
    geom_histogram(binwidth = 0.2)
  


# 62- outliers en la información ------------------------------------------
  
  #son valores que no son facilis de obseva, pero si que estan pero en 
  #pequeñas proporciones.
  ggplot(data = diamonds)+
    geom_histogram(mapping = aes(x = y), binwidth = 0.5 )
  
  
  ggplot(data = diamonds)+
    geom_histogram(mapping = aes(x = y), binwidth = 0.5 )+
    coord_cartesian(ylim = c(0,100))
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    
  
  
  
  
  
  
  
  
  