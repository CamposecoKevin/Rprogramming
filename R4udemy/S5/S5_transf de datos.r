#utiliación de dplyr para transformación de datos.

library(tidyverse)
library(nycflights13)
install.packages("nycflights13")

nycflights13::flights


View(flights)


# 41 Filtrado de filas con FILTER --------------------------------------------

HUE<- filter(ProductoresR1, ProductoresR1$Departamento == "Huehuetenango")
QUI<- filter(ProductoresR1, ProductoresR1$Departamento == "Quiché")

view(HUE)




# 42 Usando Bool en filtrado ----------------------------------------------

# Utilizando el boleano "O"
filter(ProductoresR1, Departamento =="Huehuetenango" | Departamento == "Quiché")


#Utilizando %in% 
filter(ProductoresR1, Departamento %in% c("Huehuetenango","Quiché"))




# 43 los NA o NULL --------------------------------------------------------
#Na es la ausencia de datos.
#df es la base de datos, en esta función buscamos hacer tambien cuente los NA
#sin eliminar las filas de data set.

filter(df, is.na(x)|x>2)




# 44 ordenando filas con arrage -----------------------------------------

#ver las priemras 6 filas
head(flights)

#ver las 6 ultimas filas
tail(flights)

# ordendando descendente, aqui es por la ordenas por la 
#columan arr_delay

arrange(flights, desc(arr_delay))

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




# 48. Funciones utilies para mutar ñps datps ------------------------------






























