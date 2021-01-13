#instalacción
install.packages("quantmod")
library(quantmod)
library(TTR)
library(zoo)
library(ggplot2)


#descargar datos todos
getSymbols("AAPL")

#descargar cierta fecha
getSymbols("AAPL", from = "2005-01-02", to="2010-12-31")


#Creación de grafica
chartSeries(AAPL, theme = "white")


#para descargar datos desde google.

getSymbols("INTC", src = "google")


