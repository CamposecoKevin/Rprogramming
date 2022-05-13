# Estableciendo lugar de trabajo
setwd("/R/Rprogramming/R4udemy/S6/")

# Package ha utilizar -----------------------------------------------------
library(tidyverse)
library(nycflights13)
view(nycflights13)
View(flights)

library(readxl)

install.packages("writexl")
library(writexl).



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
    geom_bar(mapping = aes(eventosR1$Municipio))
  
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
  
  
  

# 64- Reemplazan errores por NAS ------------------------------------------

  good_diamonds <- diamonds%>%
    mutate( y = ifelse(y < 2 | y>30, NA, y))
  
  view(good_diamonds)  
  
  
  
  

# 65- la covariación a través de las densidades ---------------------------
  
  # categoria vs contínua
  
  
  ggplot(data = diamonds, color = cut)+
    geom_bar(mapping = aes(x = cut))
  
  
  
    
  
  #Creando una tabla
  Muni<-data.frame(table(eventosR1$Municipio))%>%
    rename( Municipios = Var1, Cantidad = Freq)%>%
    arrange(desc(Cantidad))%>%
    filter(Cantidad > 21) 
    
  Muni
  

  #LA DENSIDAD EN LA CURVAS
  
  ggplot(data = diamonds, mapping = aes(x = price, y = ..density.. ))+
    geom_freqpoly(mapping = aes(color = cut), binwidth = 500)
  
 
  

# 66- la covariacina de factores  de boxplot ------------------------------
  # el boxplot
  # Empieza en el quartil 25, y termina en el quartil 75
  # los bigotes,
  
  
  ggplot( data = diamonds, mapping = aes(x = cut, y = price) )+
    geom_boxplot()
  
  # gráfica de los coches, y un orden segun sumedia
  
  ggplot(data = mpg, mapping = aes(x = class, y = hwy))+
    geom_boxplot()
    
  #ordenado
  
  ggplot(data = mpg, mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy))+
    geom_boxplot()
  
    

# 67- la covariancia de factores a través de heatmaps ---------------------

  
  ggplot(data = diamonds)+
    geom_count(mapping = aes(x = cut, y = color) )
  
  
  diamonds%>%
    count(color, cut)

  eventosR1%>%
    count(Departamento,Municipio)%>%
    arrange(desc(n)) -> municipioR1
  
  municipioR1
  
  ggplot(data = municipioR1,mapping =  aes(x= Municipio, y = Departamento))+
    geom_tile(mapping = aes(fill =n))
  
  
  ggplot(data = municipioR1)+
    geom_bar(mapping = aes(municipioR1$n))
  
  
  

# 68- covariancia de variables continuas con scatterplots -----------------
  
  


# 69- visualización de patrones -------------------------------------------
  # * Coincidencias,
  # * Relaciones que implica el patrón?
  # * fuerza de la relación
  # * otras variables afectadas
  # * subgrupos
  
  
  #Erupciones y minutos
  ggplot(data = faithful)+
    geom_point(mapping = aes(x = eruptions, y =waiting))
  
  install.packages("modelR")
  library(modelr)
  
  #Creación de modelos
  
  mod<-lm(log(price) ~(carat), data = diamonds)
  mod  
  
  diamod_pred <- diamonds %>%
    add_residuals(mod)%>%
    mutate(res = exp(resid))
  


# 70- una reflexión sobre la sintaxis de tidiverse ------------------------
  #simplificando la sitaxis de ggplot.
  
  diamonds%>%
    count(cut, clarity)%>%
    ggplot(aes(clarity, cut, fill = n))+
    geom_tile()
  

  
  