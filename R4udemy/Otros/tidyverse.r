#todo lo relacionado a creación del documentos y lugares de trabajo
#https://rpubs.com/daniballari/intro_espaciotrabajo_archivos


#datos cargados en tidyverse

#v ggplot2 3.3.2     v purrr   0.3.4
#v tibble  3.0.3     v dplyr   1.0.2
#v tidyr   1.1.1     v stringr 1.4.0
#v readr   1.3.1     v forcats 0.5.0
#-- Conflicts ------------------------------------------ tidyverse_conflicts() --
#  x dplyr::filter() masks stats::filter()
#  x dplyr::lag()    masks stats::lag()

#datos


library(quantmod)

#Tutorial Como importar datos de Yahoo Finance a RStudio

mdate="2001-01-03"
amazonprices=getSymbols('AMZ', from=mdate, auto.assign = F)

print(amazonprices)

#otro ejercicio
mdate1="2001-01-04"
amazonprices1=getSymbols('AMZ', from=mdate, auto.assign = F)[,4]
print(amazonprices1)

#Tasa de crecimiento
amazonroc=ROC(amazonprices1, type='discret')
print(amazonroc)

#Tasa de Rendimiento

amazonrend = periodReturn(amazonprices, period = 'monthly', type = 'log', subset = '2018')
print(amazonrend)

#Obtener datos de S P 500
getSymbols("^GSPC", src = "yahoo", from = "2010-01-01", to = "2020-05-30", periodicity= "daily")
print(GSPC)
chartSeries(GSPC, TA=NULL)

chartSeries(GSPC, subset ="last 3 months")
