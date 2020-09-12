## MANIPULACIÓN DE DATOS CON DPLYR con SWIRL(), 

##EL siguiente código te permite conocer cuantas filas y variables hay en tu archivo,
##mydf es la variable donde guardas
## read.csv, una funcion que lee archivos csv,
## path2csv es tu archivo
##stringsAsFactors = FALSE, solo factores,
mydf<-read.csv(path2csv, stringsAsFactors = FALSE)

##El siguietne codigo te permite saber cuantas filas y variables hay en tu archivo
dim(mydf)

##con el siguietne codigo te permite ver el cuerpo del archivo
head(mydf)

##mostrar la información de una manera mas amena y ver que significa cada variable con "tbl_f"
cran <- tbl_df(mydf)


#seleccionar columnas, primero va el archivo, despues los nombres de las columans que se requiere,
# utilizamos el : cuando no queremos mencionar todas, sino que simplemente mencionamos la primera y luego la ultima

select(cran, r_arch:country)

#seleccionar todo menos la que indiquemos y para ellos colocamos el signo -antes del nombre de la columan

select(cran, -time)


#para eleminar varias columnas es necesario colocar dentro de parentesis las columnas que no necesito ejemplo
select(cran,-(X:size))


## para filtrar elementos de una columan se necesita usar filter, ejemplo
## aque le decimos, el archivo, la columan "package" y le decimos que filtre solo "swirl"

filter(cran, package == "swirl")



## filtrar todo el archivo, pero con varias condiciones, pero usando coma por cada condición, ejemplo

filter(cran, r_version =="3.1.1", country == "US")


##condico or para realizar filtros, hay que recodar que se puede utilizar los operadores para realizar filtros,

filter(cran, country == "US" | country == "IN")

## utilizar is.na para realizar filtros ejemplo,
# filtramos todas las filtas que no tiene NA, en la columan r_version
filter(cran,!is.na(r_version))


#para ordenar ascedente se usa arrange() ver ejemplo, lo que hago aqui es tomar ip_id como
#mi variable y esta hago que se orden de forma ascendente de menor a mayor, y asi estara ordenado las demas
##columnas,

arrange(cran2,ip_id)

## y para descendente usar ejemplo,
arrange(cran2,desc(ip_id))


##ordenar varias columans
arrange(cran2,package,ip_id)
#ordenar ascendente y descente,
arrange(cran2,desc(r_version),ip_id)

##crear una nueva columan con mutate, siguiente ejemplo
mutate(cran3, size_mb = size / 2^20)

##crear una nueva columna, con la colmna creada anteriomente,
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)


##conocer la media con sumarry

summarize(cran, avg_bytes = mean(size))


##=======================================

##Grouping and Cahining With dplyr

## utilizando group_by, es muy bueno para hacer filtros con una variable principal,
##Agrupe cran por la variable del paquete y almacene el resultado en un nuevo objeto llamado by_package.

by_package<-group_by(cran, package)



## codigo para saber utilizando datos agrupados para extraer información del dataframe
pack_sum <- summarize(by_package,
                      count =  n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country) ,
                      avg_bytes = mean(size))



cesar<-summarize(DatosTecnicos,
                count = Cantida(),
                 )

##Lo que hizo el codigo es, tomar los datos agrupados de by_package, luego con
## count busco todas la filas, luego extrajo cuantas existen con unique, y luego 
##con countries, establecio donde se han descargado, y el ultimal lina fue para saber la media,


##Necesitamos saber el valor de 'recuento' que divide los datos en el 1% superior y el 99% inferior de los paquetes según
##| Descargas totales. En estadística, esto se denomina cuantil muestral de 0,99 o 99%. Utilice cuantil (pack_sum $ count,
##probs = 0,99) para determinar este número

quantile(pack_sum$count, probs = 0.99)




#Ahora podemos aislar solo aquellos paquetes que tuvieron más de 679 descargas totales. Use filter () para seleccionar todas las filas
# from pack_sum para el cual 'count' es estrictamente mayor (>) que 679

top_counts<-filter(pack_sum, count > 679)


##aqui lo que hice fuer ordenar de mayor a menor

top_counts_sorted <- arrange(top_counts,desc(count))



## sirve para encadenar codigo que sirve sola una vez ejemplo (%>%)
result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)







# Print result to console
print(result3)


## con el encademinto me permite seguir en una segunda linea, en este caso y me permite
## ya no colocar el nombre de la variable dentro de select,

cran %>%
  select(ip_id,country,package,size) %>%
  print

## aqui creo una nueva columan

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size/ 2^20)%>%
  print()

#aqui hago un filtro dentro del mismo
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5)%>%
  print()



##y aqui lo orden de mayor a menor, lo que haciamos y varios codigos, lo podmeos hacer
#con el encadenamiento todo junto ejemplo

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  arrange(desc(size_mb))%>%
  print()

