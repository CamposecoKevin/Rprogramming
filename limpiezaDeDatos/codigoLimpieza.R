## para comenzar a limpiar datos, primero se debe inicilizar estas librerias 
library(dplyr)
library(tidyr) 
library(readxl)


## almacenar codigo de limpieza de datos,


## asignación de datos a un objeto llamado datos

datos <-  read_xlsx("ProductoresDueñosAtendidos R1.xlsx")
DesEm <-  read_xlsx("desempleo.xlsx")

## facilitar la lectur de los datos

datos <- as_tibble(DesEm)

## las dimensiones del documento

dim(datos)


## ver filas de la base de datos
head(datos, n =5)

## Eliminar una fila o columna


## para ver la ultima filas

tail(datos, n = 5)

## el tipo de cada variable

glimpse(datos)

## seleccionar columnas, hay que tomar en cuenta 
## MAYUSCULAS y minusculas, ya que imprime error

NuevosDatos <-select(datos, Departamento, Productor, Cultivos)

## función filtrar

## >: mayor que
## <: menor que
## >=: mayor o igual que
## <=: menor o igual que
## ==: igual que (se ponen dos signos de igual)
## !=: diferente
## &: y
## |: o
## is.na(variable): filtra los valores en blanco de la variable seleccionada.
## !is.na(variable): filtra los valores que no están en blanco de la variable.

tecnicos<-select(datos, Usuario_Que_Registro)

filter(datos, Departamento == "Huehuetenango" & Tecnicos_han_atendido == "Moises Solis Santos")



## con la función mutate se puede crear una nueva columna


## ordenar ascendente
tecnicos <- arrange(tecnicos, Usuario_Que_Registro)


## para guardar un archivo en formato separado por comas,
write.csv(tecnicos, "tecnicos.csv")



## gather(), permite que las columnas se vuelva en observaciones o filas

## spread(), las devuelve a su estado original,



## funcion srt()
## lo que hace es mostrar lo que dentro de una tabla

str(datos)

##La función split
## lo que hace es hacer un subgrupo con todas las variables con una variable elegida
## sintaxis
dep <- split(datos, datos$Departamento)

hue<-dep$Huehuetenango


## para probabilidades

##dnorm

##pnorm

##qnorm

##rnomr

##ejemplo
set.seed(20)
x<- rnorm(100)
e<-rnorm(100,0,2)
y<- 0.5+2*x+e
summary(y)
 
plot(x,y)

##funcion samploe, te permite extraer algo aleatoriamente 




##Herramienta Profile in R


##system.time(), sirve para saber cuanto tiempo se ejecuta un codigo,

##sumarryRprof()


##WEEK4

set.seed(1)
rpois(5, 2)



set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e





