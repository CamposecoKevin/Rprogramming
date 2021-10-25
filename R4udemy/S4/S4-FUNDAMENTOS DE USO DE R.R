#FUNDAMENTOS DE USO DE R

#Usando R como calculadora

#Aque lo que hacemos es solo introducir los parametros y los signos correspondientes
#ya el motor de R, realiza la operación.
#En este caso hemos realizado una suma. 

#Suma
1+1

#Resta
1-1


#raiz

sqrt(25)

y<-seq(1,12)
y[6]


#Los scripts y modos de trabajo de R
library(tidyverse)

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy)) +
  facet_wrap(~class, nrow = 5)


#rutas y directorios de trabajo en R.

#para moverse en los directorios
setwd("D:/R/Rprogramming/R4udemy")
#para saber en donde directorio estamos
getwd()












