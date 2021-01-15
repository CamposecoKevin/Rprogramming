#para instalar el paquete
install.packages("tidyverse")

#para poder ejecutar el paquete
library(tidyverse)

#datos cargados en tidyverse

#v ggplot2 3.3.2     v purrr   0.3.4
#v tibble  3.0.3     v dplyr   1.0.2
#v tidyr   1.1.1     v stringr 1.4.0
#v readr   1.3.1     v forcats 0.5.0
#-- Conflicts ------------------------------------------ tidyverse_conflicts() --
#  x dplyr::filter() masks stats::filter()
#  x dplyr::lag()    masks stats::lag()

#datos de ggplot2, data set.
mpg

#visualzación de datos, con la fucnión view()
view(mpg)
#variables que tiene mpg
    #displ: tamaño del motor del coche en litros.
    #hwy: medida en millas con un galón de gasolina (un galos es igual a 3.785411784 litros).

#Qué fabricante de coche es más optimiza el uso de la gasolina.


#cargando datos y crear una gráfica de mapeo.

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy))

#respuesta a la pregunta: entre mayor es el motor, menos millas hace, de acuerdo al gráfico.
#tendencia negativa.


ggplot(data=mpg)+
  geom_density(mapping = aes(x= manufacturer, y = hwy))

#con esto te muestra que contiene cada columna de la data y te muestra el tipo de datos.
str(mpg)


