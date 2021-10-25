#utiliación de dplyr para transformación de datos.

library(tidyverse)
library(nycflights13)
install.packages("nycflights13")

nycflights13::flights





# 41 Filtrado de filas con FILTER --------------------------------------------

HUE<- filter(ProductoresR1, ProductoresR1$Departamento == "Huehuetenango")
QUI<- filter(ProductoresR1, ProductoresR1$Departamento == "Quiché")

view(HUE)




# 42 Usando Bool en filtrado ----------------------------------------------

# Utilizando el boleano "O"
filter(ProductoresR1, Departamento =="Huehuetenango" | Departamento == "Quiché")


#Utilizando %in% 
filter(ProductoresR1, Departamento %in% c("Huehuetenango","Quiché"))














