

# Space to work ------------------------------------------------------

setwd("C:/Users/KEVIN CAMPOSECO/Mis documentos/Kevin_Proyecto/Rprogramming/R4udemy/S8/")

# packages to use ---------------------------------------------------------

library(tidyverse)
library(readxl)
library(writexl)



# 89- fichero de datos limpio ---------------------------------------------

View(population)

poblacion <- population %>%
  filter(country %in% c("Guatemala", "Chile", "Honduras"),
         year %in% c(1999,2000))

view(poblacion)  


#Población por año

poblacion %>%
  count(year, wt = population)
  
  
# 90-Spreading y gathering ------------------------------------------------

#Estrucutra de limpieza de datos
#Que es una variable y observación
#fila y columnas



# 91-técnica de gathering ----------------------------------------------------


new_table4a<-table4a %>%
  gather(`1999`, `2000`, key = "year", value = "cases" )



new_table4b<-table4b %>%
  gather(`1999`, `2000`, key = "year", value = "population" )
new_table4b

# unir distitntos archivos
#Para que esto funcione tienen que tener las mismas filas
Union_table_ab<-left_join(new_table4a,new_table4b)



# 92. La técnica de spresading --------------------------------------------

#convertir filas a columnas, de acuerdo a la variable a utilizar.
new_table2<- table2 %>%
  spread(key = type, value = count)

table2



# 93- Actualización: Pivot longer -----------------------------------------
#nueva forma de realizaro

new_table4a_1<- table4a %>%
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")


# 95- Actualización: pivot wider ------------------------------------------

table2New<- table2 %>%
  pivot_wider(names_from = type, values_from = count)




# 96- la técnica de seperación --------------------------------------------

new_table3<- table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/", convert = T)

new_table3



# 97- la técnica de reunión -----------------------------------------------

table5 %>%
  unite(new_year, century, year, sep = "")
#No esta convert T, ya que primero pasa Unite luego por separte



# 98- los NA en la limpieza de datos --------------------------------------

roi <- tibble(
  year = c(rep(2016,4), rep(2017,4),2018),
  quarters = c(rep(c(1,2,3,4),2),1),
  return= rnorm(9,mean = 0.5, sd = 1)
)

roi

roi$return[7] = NA

# na escondidos, y proceso par elimnarlos y poder usar los datos correctos

roi %>%
  spread(year, return)%>%
  gather(year, return, `2016`:`2018`, na.rm = T )

# completar e identificar los NA que faltan con complete

roi %>%
  complete(year, quarters)
  
  
# rellenar NA con datos especificos, con fill

treatments <- tribble(
  ~name,          ~treatment,     ~response,
  "Kevin Camposeco",  1,           8,
  NA,                 2,           10,
  NA,                 3,           4,
  "Rubeli Camposeco", 1,           7,
  NA,                 2,           8,
)

#Ejemplo
treatments %>%
  fill(name)


# 98- caso real de sanidad ------------------------------------------------
# visitar la págian who.int

# Hacer que los datos sean mas manejables
tidyr::who %>%
  gather(new_sp_m014:newrel_f65, key = "Key", value = "cases", na.rm = T)->who1

#Hacer un conteo de cada uno de las variables de "Key"

who1 %>%
  count(Key)

# reemplazar una palabra con una nueva palabra

who2<- who1 %>%
  mutate(Key = stringr::str_replace(Key, "newrel", "new_rel"))

#Para observar el cambio que se realzó
view(who2%>%
  count(Key))

# creando nuevas variables utlizando separate

who3 <- who2 %>%
  separate(Key, c("new", "type", "sexage"), sep = "_")

who3 %>% view()

#elimanando columnas que no son necesarias para  el análisis

who4 <- who3 %>%
  select(-new, -iso2, -iso3)


who4 %>% view()

#separa la columan sexedad en dos nuevas columnas con separete

who5 <- who4 %>%
  separate(sexage, c("sexo", "edad"), sep = 1)


#reducir el codigo a todo lo que se pueda, esto para tener una base para 
# analisis de datos

tidyr::who %>%
  gather(new_sp_m014:newrel_f65, key = "Key", value = "cases", na.rm = T)%>%
  mutate(Key = stringr::str_replace(Key, "newrel", "new_rel"))%>%
  separate(Key, c("new", "type", "sexage"), sep = "_")%>%
  select(-new, -iso2, -iso3)%>%
  separate(sexage, c("sexo", "edad"), sep = 1)



# 99- ultimo datos sobre datos estructurados ------------------------------



# 100- datos relacionales -------------------------------------------------

install.packages("nycflights13")
library(nycflights13)

nycflights13::airlines
#Tablas
flights # vuelos
airports # aeropuertos
airlines # Nombre de las empresas
planes # aviones
weather # tiempo


# 101- claves primarias y foraneas ----------------------------------------

#Claves
#Primaria


#Foreneas
#Secundaria



# 102- mutating join ------------------------------------------------------
#convinar dos tablas 


flights_new <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)



flights_new %>% 
  left_join(airlines, by = "carrier")




# 103- diagramas para entender los joins ----------------------------------
# Solo las claves primarias que estan del otro lado a parte del principal se
# podrá utilizar el join

x <- tribble(
     ~key,   ~value,
       1,       "x1",
       2,       "x2",
       3,       "x3",
)

y <- tribble(
  ~key,   ~value,
  1,       "y1",
  2,       "y2",
  4,       "y4",
)

# 104- inner join ---------------------------------------------------------
# para permanecer en la nueva tabla debe tener la claves iguales en cada lado.

x %>% inner_join(y, by = "key")

z



# 105- outer join ---------------------------------------------------------

#left join
x %>% left_join(y, by = "key")

#right join
x %>% right_join(y, by = "key")


#full join
x %>% full_join(y, by = "key")




# 106- claves duplicadas --------------------------------------------------
x1 <- tribble(
  ~key,   ~value,
  1,       "x1",
  2,       "x2",
  2,       "x4",
  1,       "x4",
)


y1 <- tribble(
  ~key,   ~value,
  1,       "y1",
  2,       "y2",
)

x1 %>% left_join(y1, by = "key")


#segundo ejemplo
x2 <- tribble(
  ~key,   ~value,
  1,       "x1",
  2,       "x2",
  2,       "x4",
  3,       "x4",
)


y2 <- tribble(
  ~key,   ~value,
  1,       "y1",
  2,       "y2",
  2,       "y3",
  3,       "y4",
)

#conbinacion todos con todos

left_join(x2,y2, by = "key")




# 107- definir las columnas clave de los joins ----------------------------

flights_new %>% left_join(weather)

flights_new %>% left_join(planes, by = "tailnum")


# combinar, siendo las claves diferentes en cada tabla

flights_new %>% left_join(airports, by = c("dest"="faa"))




# 108- nociones de sql y d ela funcon merge -------------------------------

# dply                  <->      base

#inner_ join (x,y)      <->      merge (x, y)
#left_ join (x,y)       <->      merge (x, y, all.x = True)
#right_ join (x,y)      <->      merge (x, y, all.y = True)
#Full_ join (x,y)       <->      merge (x, y, all.x = True, all.y = True )


# dply                             <->                      SQL
#inner_ join (x,y, by = "z")       <->      SELECT * FROM X INNER JOIN y USING (Z)
#left_ join (x,y, by = "z")        <->      SELECT * FROM X LEFT OUTER y USING (Z)
#right_ join (x,y, by = "z")       <->      SELECT * FROM X RINGHT OUTER y USING (Z)
#Full_ join (x,y, by = "z")        <->      SELECT * FROM X FULL OUTER y USING (Z)



# filtering joins ---------------------------------------------------------

# semi_join (x,y) -> se queda ocn las observaciones de x que tienen correspondencia en Y
# anti_join (x,y) -> elimina todas las observacione de x que tienen correspondencia en Y

#Ejemplo

flights %>% 
  count(dest, sort = TRUE) %>% 
  head(10) -> top_dest


flights %>% 
  semi_join(top_dest)


flights %>% 
  anti_join(planes, by = "tailnum") %>% 
  count(tailnum, sort = TRUE)



# 110- Operaciones entre conjuntos -----------------------------------------

# intersect (x,y) : observaciones comunes  a x e y
# union  (x,y)
#setdiff(x,y)


x <- tribble(
  ~a, ~b,
  1, 2,
  2, 1,
)


y <- tribble(
  ~a, ~b,
  1, 2,
  1, 1,
)

intersect(x,y)
union(x,y)
setdiff(x,y)
setdiff(y,x)
















