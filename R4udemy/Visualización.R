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


#Nivele estetica de acuerdo al tipo utilizando color,
#en este ejmplo, identifica de acuerdo el itpo de auto

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy , color = class))



#Utilizando la transparencia de los puntos

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy , alpha = class))

#Forma de puntos dentro de un gráfico (solo permite 6 figuras)

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy , shape = class))



#elección manual de los colores

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy) , color = "green")


#Figura buscando cambiar la forma, 
#shape es el tipo de forma
#size el tamañao"
#color el color
#fill el relleno si asi está configura la figura que se establecera en shape

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy) , shape = 23, size = 10,color = "green" , fill = "pink")



#tareas ggplot 2

##Preguntas de esta tarea

#Toma el siguiente fragmento de código y di qué está mal. 
#¿Por qué no aparecen pintados los puntos de color verde?
  
  ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = "green"))



#Toma el dataset de mpg anterior y di qué variables son categóricas.
str(mpg)  

#Toma el dataset de mpg anterior y di qué variables son contínuas.

#Dibuja las variables contínuas con color, tamaño y forma respectivamente. 

#¿En qué se diferencian las estéticas para variables contínuas y categóricas?
  
#  ¿Qué ocurre si haces un mapeo de la misma variable a múltiples estéticas?
  
#Vamos a conocer una estética nueva llamada stroke. ¿Qué hace? ¿Con qué formas funciona bien? 
  
#  ¿Qué ocurre si haces un mapeo de una estética a algo que no
#  sea directamente el nombre de una variable 
#(por ejemplo aes(color = displ < 4))?


ggplot(data=mpg)+
  geom_point(mapping = aes(x=year) , shape = 23, size = 10,color = "green" , fill = "pink")

#Los facets

#facet_wrap(<FORMULA_VARIABLE>) DEBE SER DISCRETA
#EJEMPLO ~
#Con este modelo podemos visualizar los gráficos de acuerdo a cada variable
#del fenomeno a estudiar
#PARA REALIZAR SEGMENTACIONES

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy)) +
  facet_wrap(~class, nrow = 5)


#face_grid(<FORMULAR VARIABLE1>~<FORMULAVARIABLE2>)

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy)) +
  facet_grid(drv~cyl)


#tarea no. 3

#Preguntas de esta tarea
#¿Qué ocurre si hacemos un facet de una variable contínua?
  
#  ¿Qué significa si alguna celda queda vacía en el gráfico facet_grid(drv~cyl)?
  
#  ¿Qué relación guardan esos huecos vacíos con el gráfico siguiente?
  
#  ggplot(data = mpg) +
#  geom_point(mapping = aes(x=drv, y = cyl)) 



#¿Qué gráficos generan las siguientes dos instrucciones? ¿Qué hace el punto? ¿Qué diferencias
#hay de escribir la variable antes o después de la virgula?
  
#  ggplot(data = mpg) +
 # geom_point(mapping = aes(x=displ, y = hwy)) +
  #facet_grid(.~cyl)

#ggplot(data = mpg) +
 # geom_point(mapping = aes(x=displ, y = hwy)) +
  #facet_grid(drv~.)

#El primer facet que hemos pintado era el siguiente:
  
 # ggplot(data = mpg) +
  #geom_point(mapping = aes(x = displ, y = hwy)) +
  #facet_wrap(~class, nrow = 3)

#¿Qué ventajas crees que tiene usar facets en lugar de la estética del color? 
#¿Qué desventajas? ¿Qué cambiaría si tu dataset fuera mucho más grande?
  
 # Investiga la documentación de ?facet_wrap y contesta a las siguientes preguntas:
  
  #¿Qué hace el parámetro nrow?
  #¿Y el parámetro ncol?
  #¿Qué otras opciones sirven para controlar el layout de los paneles individuales?
  #¿Por qué facet_grid() no tiene los parámetros de nrow ni de ncol?
  #Razona la siguiente afirmación:
  
  #Cuando representemos un facet con facet_grid() conviene poner la variable con más 
#niveles únicos en las columnas.




