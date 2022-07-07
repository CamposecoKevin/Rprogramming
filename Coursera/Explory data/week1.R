
# 01-Graphics ----------------------------------------------------------------

#the use of graphs is very important at the time data 
#analyst


# Exploratory Graphs (part 1) ---------------------------------------------
population <- data.frame(population)

#¿Qué paises tiene mayor población que el promedio?

#un resumen de los datos

ResumenPoblacion<- summary(population$population)

#gráfica de bigote

boxplot(population$population, col= "red")


filter(population,population$population >= promedio )

str(population)












