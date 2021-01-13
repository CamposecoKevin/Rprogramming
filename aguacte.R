
#asignacion a un objeto llamado aguacate
aguacate<-read.csv("C:/Users/Kevin Camposeco/Downloads/PrecioAguacate.csv")

aguacate1<-read.csv("C:/Users/Kevin Camposeco/Downloads/DescAguacate.csv")

#datos de 2013 hasta 2020
aguacate2<- read_xlsx("C:/Users/Kevin Camposeco/Downloads/Aguacate2013_2020.xlsx")

#Revisar cuantos filas y columnas tiene el archiv
dim(aguacate)

#Revisamos los nombres de las columnas
names(aguacate)

serie1<- ts(aguacate1$Precio)
serie2<- ts(aguacate2$Precio_Aguacate)

#visualizar la serie de tiempo

plot.ts(serie1, main="Evolución del Precio de Aguacate 2000:2020", xlab="Periodos", ylab= "precio")
plot.ts(serie2, main="Evolución del Precio de Aguacate 2013:2020", xlab="Periodos", ylab= "precio")

