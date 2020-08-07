## almacenar codigo de limpieza de datos,


## asignación de datos a un objeto llamado datos

datos <-  read_xlsx("ProductoresDueñosAtendidos R1.xlsx")


## facilitar la lectur de los datos

datos <- as_tibble(datos)

## las dimensiones del documento

dim(datos)


## ver filas de la base de datos
head(datos, n =5)


## para ver la ultima filas

tail(datos, n = 5)

## el tipo de cada variable

glimpse(datos)

## seleccionar columnas, hay que tomar en cuenta 
## MAYUSCULAS y minusculas, ya que imprime error

NuevosDatos <-select(datos, Departamento, Productor, Cultivos)

## función filtrar

## >: mayor que
## <: menor que
## >=: mayor o igual que
## <=: menor o igual que
## ==: igual que (se ponen dos signos de igual)
## !=: diferente
## &: y
## |: o
## is.na(variable): filtra los valores en blanco de la variable seleccionada.
## !is.na(variable): filtra los valores que no están en blanco de la variable.

tecnicos<-select(datos, Usuario_Que_Registro)

filter(datos, Departamento == "Huehuetenango" & Tecnicos_han_atendido == "Moises Solis Santos")



## con la función mutate se puede crear una nueva columna


## ordenar ascendente
tecnicos <- arrange(tecnicos, Usuario_Que_Registro)


## para guardar un archivo en formato separado por comas,
write.csv(tecnicos, "tecnicos.csv")















