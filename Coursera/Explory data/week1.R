
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

#
par("lty")


# 04- Base Plotting System (part 2) ---------------------------------------

install.packages("swirl")

mpg

ggplot(data = mpg, aes(x = cty, y = hwy), geom_point())



# 02.4- Base Plotting Demonstration ---------------------------------------

x <- rnorm(100)
hist(x)

y <- rnorm(100)
plot(x = y, y = x, pch = 4)
title("Gráfica de puntos")
legend("topleft", legend = "Data")
legend("topleft", legend = "Data", pch = 4)
fit <- lm(y ~ x)
abline(fit)
abline(fit, lwd=3)
#Nota: para hacer un plot, ambas varialbes deben tener las mismas cantidades

z<-rnorm(100)
# creando gráficas en dos
par(mfrow = c(2,1))
plot(x, y, pch = 20)
plot(x, z, pth = 19)
par("mar")

#2  gráficos en horizontal
par(mar = c(2,2,1,1))
plot(x, y, pch = 20)
plot(x, z, pth = 20)

#2 gráficos en vertical
par(mfrow = c(1,2))
plot(x, y, pch = 20)
plot(x, z, pth = 20)

#2 gráficos con mas espacios en cada lado
par(mar = c(4,4,2,2)) # para ajustar el margen
par(mfrow = c(1,2))
plot(x, y, pch = 20)
plot(x, z, pth = 20)


# graficando por segemendos
g <- gl(2, 50, labels = c("Male", "Female"))


par(mfrow = c(1,1)) #Sirve para devolver el plano a 1 sola gráfica

plot(x,y)
plot(x,y, type = "n", xlab = "Hombres", ylab = "Mujeres")

points(x[g == "Male"], y[g== "Female"], col= "Red")
points(x[g == "Female"], y[g== "Male"], col= "Blue", pch = 19)
title("Relación altura mujeres y hombres")


