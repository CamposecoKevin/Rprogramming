
# 01-Graphics ----------------------------------------------------------------

#the use of graphs is very important at the time data 
#analyst



# POBLACION -------------------------------------------------------------------------


#02Exploratory Graphs (part 1) ---------------------------------------------
poblacion <- tibble(population)
poblacion 

summary(poblacion)

filter(poblacion,population == min(poblacion$population))

filter(poblacion,population == max(poblacion$population))

filter(poblacion,population >= mean(poblacion$population))

#¿Qué paises tiene mayor población que el promedio?

#un resumen de los datos de todos los datos

ResumenPoblacion<- summary(poblacion$population)



# PROMEDIO ----------------------------------------------------------------

#promedio de toda la población, incluyendo todos los años
promedio <- mean(poblacion$population)

#Filtrar población encima del promedio
PoblacionX<- filter(poblacion,poblacion$population >= promedio & poblacion$population < 800000000)

#gráfica de bigote de población > que el promedio

boxplot(PoblacionX$population, col= "red", horizontal = T)

#Nuevo resumen de PoblaciónPromedio
summary(PoblacionX)



# Mas de 1000000000-----------------------------------------------------------

#promedio de toda la población, incluyendo todos los años
promedio <- mean(poblacion$population)

#Filtrar población encima del promedio
PoblacionMax<- filter(poblacion,poblacion$population >= 1000000000)

#gráfica de bigote de población > que el promedio

boxplot(PoblacionMax$population, col= "red")

#Nuevo resumen de PoblaciónPromedio
summary(PoblacionX)


pob


Prod <- read_xlsx("C:/Users/KEVIN CAMPOSECO/Downloads/Consolidado productores en seguimiento año fiscal 2022.xlsx")



# 03- The base plotting system --------------------------------------------

with(poblacion, plot(year, population))

#utilizar lattice para usar varia celdas
#Ejemplo
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))











