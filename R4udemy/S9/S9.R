
# Manejo de strings, factores y fechas ------------------------------------





# Fechas ------------------------------------------------------------------

eventos<-read_xlsx("Listado de Eventos 28-02-2022.xlsx")

R1<-filter(eventos,eventos$Programa=="General")
str(R1)
view(R1)




