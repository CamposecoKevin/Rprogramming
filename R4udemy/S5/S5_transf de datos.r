
# Package ha utilizar -----------------------------------------------------
library(tidyverse)
library(nycflights13)
view(nycflights13)
View(flights)




# 39 Introducción de la transformación de los datos -----------------------
#Tibble es un data frame mejorado para su facil manipulación en tivyverse

## int = número enteros
## dlb = números reales
## chr = vectores de caracteres
## dttm = data + tiempo
## lgl = logicos, valore booleanos
## fctr = factores, variables categoricas
## date = fecha 

## filter = filtrar observaciones
## arrange =  reordenar las filas
## select = seleccionar variables por su nombres
## mutate = crear nuevas variables con funciones con las que existe
## summarise = copsar varios valores para dar un resumen
## group_by = opera la función  a la que acompaña a grupo.




# 40 Filtrado de filas -------------------------------------------------------

#Filtrar solo eventos creados por el componente R1
EventosR1<-filter(eventos, eventos$Programa=="General")

#Frecuencia de numero de eventos por tecnico del componente R1
EPorTec<-data.frame(table(EventosR1$Tecnico))

# Filtrar por tecnico
tecnico<-filter(eventos,Tecnico=="Antonio Cruz Ramírez")


# 41 Filtrado de filas con FILTER --------------------------------------------

HUE<- filter(ProductoresR1, ProductoresR1$Departamento == "Huehuetenango")
QUI<- filter(ProductoresR1, ProductoresR1$Departamento == "Quiché")

view(HUE)



# 42 Usando Bool en filtrado ----------------------------------------------

  # Utilizando el boleano "O", con una que esta correcta tomara como verdadero.
  HQ<-filter(ProductoresR1, Departamento =="Huehuetenango" | Departamento == "Quiché")
  

  #Utilizando %in%  es más eficiente ya que se puede ingresar un todo.
  filter(ProductoresR1, Departamento %in% c("Huehuetenango","Quiché"))
  
  
  View(HQ)
  

# 43 los NA o NULL --------------------------------------------------------
  #Na es la ausencia de datos.
  #df es la base de datos, en esta función buscamos hacer tambien cuente los NA
  #sin eliminar las filas de data set.
  
  filter(df, is.na(x)|x>2)
  eventosR1<-read_xlsx("S9/Listado de Eventos 28-02-2022.xlsx")
  view(eventosR1)  
  
  EVCom<-select(eventosR1,Comunidad)
  
  #Contando todos los valores de NA en una data frame
  
  EvComNA<-sum(is.na(EVCom)) /count(EVCom)
  
  #Cantidad de Na que existena en la base da datos.
  print(EvComNA)
  
  #Porcentaje de incidencia de los NA en la base de datos
  EvComNA<-sum(is.na(EVCom)) /count(EVCom)
  print(EvComNA)  *100
  
  

# 44 ordenando filas con arrage -----------------------------------------

  #ver las priemras 6 filas
  head(eventosR1)
  head(EVCom)

  #ver las 6 ultimas filas
  tail(eventosR1)

  # ordendando descendente, aqui es por la ordenas por la 
  #Ordenando la columan comunidad de forma ascendente
  
  arrange(EVCom, Comunidad)
  
  #Ordenando de forma descendente
  arrange(EVCom, desc(Comunidad))
  
  print(EVCom)
  
  # los NA siempre quedara de último.






# 45 filtrar columans con select ------------------------------------------


select(flights, dep_time:arr_delay)




# 47 calcular nuevas variables con MUTATE ---------------------------------

flights_new <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time
                      )

#here creat new column call "time_gain" and "flight_speed"

mutate(flights_new,
       time_gain = arr_delay - dep_delay,
       flight_speed = distance/(air_time/60)
       )




# 48. Funciones utilies para mutar lps datps ------------------------------
  #operaciones aritmeticas : +,-,*,/,

  





























