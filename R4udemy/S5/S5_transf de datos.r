
# Package ha utilizar -----------------------------------------------------
library(tidyverse)
library(nycflights13)
view(nycflights13)
View(flights)
library(writexl)
library(readxl)




# Base de datos a analizar y asiganciónd variable--------------------------

eventosR1<-read_xlsx("Listado de Eventos 28-02-2022.xlsx")




# 39 Introducción de la transformación de los datos -----------------------
#Tibble es un data frame mejorado para su facil manipulación en tivyverse

## int = número enteros
## dlb = números reales
## chr = vectores de caracteres
## dttm = data + tiempo
## lgl = logicos, valore booleanos
## fctr = factores, variables categoricas
## date = fecha 

## filter = filtrar observaciones
## arrange =  reordenar las filas
## select = seleccionar variables por su nombres
## mutate = crear nuevas variables con funciones con las que existe
## summarise = copsar varios valores para dar un resumen
## group_by = opera la función  a la que acompaña a grupo.




# 40 Filtrado de filas -------------------------------------------------------

#Filtrar solo eventos creados por el componente R1
EventosR1<-filter(eventos, eventos$Programa=="General")

#Frecuencia de numero de eventos por tecnico del componente R1
EPorTec<-data.frame(table(EventosR1$Tecnico))

# Filtrar por tecnico
tecnico<-filter(eventos,Tecnico=="Antonio Cruz Ramírez")


# 41 Filtrado de filas con FILTER --------------------------------------------

HUE<- filter(ProductoresR1, ProductoresR1$Departamento == "Huehuetenango")
QUI<- filter(ProductoresR1, ProductoresR1$Departamento == "Quiché")

view(HUE)



# 42 Usando Bool en filtrado ----------------------------------------------

  # Utilizando el boleano "O", con una que esta correcta tomara como verdadero.
  HQ<-filter(ProductoresR1, Departamento =="Huehuetenango" | Departamento == "Quiché")
  

  #Utilizando %in%  es más eficiente ya que se puede ingresar un todo.
  filter(ProductoresR1, Departamento %in% c("Huehuetenango","Quiché"))
  
  
  View(HQ)
  

# 43 los NA o NULL --------------------------------------------------------
  #Na es la ausencia de datos.
  #df es la base de datos, en esta función buscamos hacer tambien cuente los NA
  #sin eliminar las filas de data set.
  
  
  filter(df, is.na(x)|x>2)
  eventosR1<-read_xlsx("Listado de Eventos 28-02-2022.xlsx")
  view(eventosR1)  
  
  EVCom<-select(eventosR1,Comunidad)
  
  #Contando todos los valores de NA en una data frame
  
  EvComNA<-sum(is.na(EVCom))
  
  #Cantidad de Na que existena en la base da datos.
  print(EvComNA)
  
  #Porcentaje de incidencia de los NA en la base de datos
  EvComNA<-sum(is.na(EVCom)) /count(EVCom)
  print(EvComNA)  *100
  
  
  
  
  

# 44 ordenando filas con arrage -----------------------------------------

  #ver las priemras 6 filas
  head(eventosR1)
  head(EVCom)

  #ver las 6 ultimas filas
  tail(eventosR1)

  # ordendando descendente, aqui es por la ordenas por la 
  #Ordenando la columan comunidad de forma ascendente
  
  arrange(EVCom, Comunidad)
  
  #Ordenando de forma descendente
  arrange(EVCom, desc(Comunidad))
  
  print(EVCom)
  
  # los NA siempre quedara de último.



# 45 filtrar columans con *SELECT* ------------------------------------------
  eventosR1
  
  
  TecDep<-select(eventosR1, Tecnico, Departamento)
  
  #Para seleccionar un conjunto de columnas se usa :, ejemplo
  
  #Seleccionar columans desde IDtecnico hast comunidad
  idCom<-select(eventosR1, idTecnico:Comunidad)
  
  idCom
  
  #Pero si necesido excluir alguna columan solo debo colocar un -
  IdNo<-select(eventosR1, -(idTecnico))

  #Seleción que contiene, con contains,
  Muni<-select(eventosR1, contains("Muni"))

  Muni
  
  

# 46 Renombrar y ordenar las columnas -------------------------------------

  rename(Muni,  Munis = Municipio)
  
  #Encontrar la frecuencia de la participiación de los municipios
  #Y cambiar el nombre de la columna.
  Munis<-data.frame(table(Muni$Municipio)) 
  Munis<-rename(Munis, Municipio = Var1, Cantidad = Freq)
  Munis<-arrange(Munis, desc(Cantidad))
  
  Munis
  
  #Promedio de actividades
  mean(Munis$Cantidad)
  
  
  #Ordenando columna, identificadon las variables a estudiar.
  
  OrdenColum<-select(eventosR1,Tecnico, Departamento, `Tipo de Evento`, everything() )
  
  eventosR1
  
  view(OrdenColum)


# 47 calcular nuevas variables con MUTATE Y TRANSMUTE ---------------------------------
  
  #Seleccionar variables a estudiar
  NewEventoR1 <- select(eventosR1,
                        Tecnico, 
                        Departamento,
                        `Participantes (Sin Personal Proyecto)`)
  NewEventoR1<-rename(NewEventoR1, participantes =`Participantes (Sin Personal Proyecto)`)
  
  view(NewEventoR1)
  
  #Nueva columna, Por actividad se establecido que
  #el 30% son nuevos productores registrados
  #en agricontrol
  
  EventoNuevo<-mutate(NewEventoR1,
                      NuevoProductor = round(participantes*.20))
  
  view(EventoNuevo)
  
  #Nuevo productores ingresados
  sum(EventoNuevo$NuevoProductor)
  
  #Transmute, solo quedarse con los calculados
  EventoNewTrans<-transmute(NewEventoR1,
                     NuevoProductor30 = round(participantes*.20),
                     NuevoProductor40 = round(participantes*.30),
                     NuevoProductor50 = round(participantes*.40))
  
  
  #Visualización de solo los calculados
  view(EventoNewTrans)
  
  


# 48. Funciones utilies para mutar lps datps ------------------------------
  #operaciones aritmeticas : +,-,*,/,

  #Agragados de funciones
  #                      x/sum(x): proporcion sobre el total
  
  
  #Aritmetica modular
                    #%/% es igual cociente de la división entera
                    #%% el resto de la división

  
  #Logaritmos log() base e, log2(), log10().
  
  
  #Offsets; lead(), mueve hacia la izquierda.
  #lag() = mueve hacia la derecha
  
  
  #Funciones acumulativas:
  #cunsum()
  #cumprod()
  #comnin()
  #commean()
  
  #Comparaciones lógicas
  #>,<, <=, >=, ==, !=.
  
  #Ranking: min_rank() se ordena de mayor a menor
  #min_rank(desc())
  #row_number(), no hay repeticiones
  #dense_rank(), si hay repeticiones
  #percent_rank(), 
  #come_dist(),
  #ntile(), se orden por cuartiles
  
  
  

  
  

# 49 resumen de variables agrupadas ---------------------------------------
  #Summarise
  
  summarise(NewEventoR1, 
            XParticipante = mean(participantes, 
                                 na.rm = T))

  #Agrupando por Munis,
  grup_por_muni<-group_by(NewEventoR1,
                          Departamento)
  
  #agrupando por munis y tecnico
  TecnicoMuniGrupo<-group_by(NewEventoR1,
                          Departamento, Tecnico)
  
  
  
  #promedio por munis
  MuniTec<-summarise(grup_por_muni, 
            PromedioMunis = mean(participantes, 
                                 na.rm = T))
  
  #Promedio por munis, y tecnico
  DepGrup<-summarise(TecnicoMuniGrupo, 
            PromedioMunisTecnico = mean(participantes, 
                                 na.rm = T)) 

  view(munigrupoTec)

  #Encontrando el maximo y minumo
  
  max(DepGrup$PromedioMunisTecnico)
  min(DepGrup$PromedioMunisTecnico)

  select(DepGrup, PromedioMunisTecnico == 31)

  #Con la función mapply podré encontrar quien es fue mayor o menor
  mapply(max,DepGrup)
  mapply(min,DepGrup)

  
  

  
  
















