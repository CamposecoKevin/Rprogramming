



#Nuevo espacio de trabajo para analizar datos de DC&EC

dir.create("DC&EC ACTUALIZADO HASTA 31 DE MARZO")


#Pasar a nueva ubicación de espacio de trabajo
setwd("DC&EC ACTUALIZADO HASTA 31 DE MARZO")
dir()

productores<-read.xlsx("Listado de EC y DC.xlsx")


View(productores)
