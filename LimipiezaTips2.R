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




