#tips1
#para extraer datos de una columan basta en coloar
# objeto [fila,columana], con esto obtendras lo que pidas ya sea la fila o columna,



#tips2
#pero igual puede colocar el nombre de la columna, ejemplo
# objeto[,edades]



#tips3

#inclusive filtrar lo que necesites, con operadores logicos,
## objeto[(objeto$nombrecoluman <= 3 & objeto$nombrecoluman >11)]
##con estos, hara que las columans establecidas responderan a las condiciones y devolveran 
##estos datos



#ejemplo
#En este codigo, lo que hice es filtrar, solo el dapartamento de quiche, y tambien que solo sea sacapulas,



quiche<-productores[(productores$Departamento == "Quiché" & productores$Municipio=="Sacapulas"),]

##para añadir una  nueva columan es necesario 

##objeto$nombredelanuevacolumana<-rnom(5) en este ultimo lo que queremos que guarde o haga uan suma o multiplicación




#===============================================================================

#creación de nuevas variables

#creando secuencias con seq

s1<- seq(1,10, by = 2); s1



#trabajando con fechas


date()
[1] "Tue Sep 01 22:39:48 2020"

 
Sys.Date()
[1] "2020-09-01"
 
format(d, "%a %b %d ")
 [1] "mar. sep. 01 "
format(d, "%a %b %d %Y ")
[1] "mar. sep. 01 2020 "




#==================================================
# Eliminar las columnas que no interesan en una hoja, se utiliza Skip = el número de filas que no interesan


ipcRegioGasto<-read_xlsx("datos1.xlsx", skip = 2)
> View(ipcRegioGasto)













