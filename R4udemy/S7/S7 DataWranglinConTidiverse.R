#Establecer el lugar de trabajo
setwd("/R/Rprogramming/R4udemy/S7/")


#Instalación de paquetes a utilizar
# Package ha utilizar -----------------------------------------------------
  library(tidyverse)
  library(readxl)
  library(writexl)



# 71- Data wrinling -------------------------------------------------------

# cración de tibble
# limpieza de datos
# ingresos de datos
# fechas


  eventosR1
  ProductoresR1


# 72 -del data frame a las tibbles ----------------------------------------

  vignette("tibble")
  
  str(eventosR1)
# Sirve para determinar que tipo de archivo es: usalmente debería ser TIBBLE
  class(eventosR1)
  


# 73- Creando tibbles de tidyverse ----------------------------------------
    #Para convertir en una tibble
    EventosR1<- as_tibble(eventosR1)

    class(EventosR1)  
      
    # Creando una tibble
    
    tibble(
      y = 1:12,
      x = pi,
      z = y*x ^ 2
    )
  # creando una tribble
    tribble(
      ~x, ~y,~z,
      "a", 4, 33.14,
      "b", 8, 6.28,
      "c", 9, 3.14
      
    )
    

# 74- imprimir una tibbler por pantalla -----------------------------------
  
  tibble(
    a = lubridate::now() + runif(1e3)*24*60*60,
    b = 1:1e3,
    c= lubridate::today()+ runif(1e3)*30,
    d= runif(1e3),
    e = sample(letters, 1e3, replace = T)
  )

  eventosR1 %>%
    rename(participantes = `Participantes (Sin Personal Proyecto)`)%>%
    print( n = 10, width = Inf)
  

# 75- sybcibhybtis t accesi a tibbles -------------------------------------
  
  # [["nombre de una variable"]]
  # [[posición de una variable]]
  # $nombre de variable
  
  #Eligiendo la columna
  eventosR1[[2]]

  
  

# 76- el paquete readr para importación de datos  -------------------------

  # * read_log() para administrador de servidores.
  # install.packages("webreadr")
  


# 77- guardar un CSV con el paquete R -------------------------------------

  #para guardar un csv
  write.csv(mtcars, file = "cars.csv")
  
  

# 78 Leer un csv con readr ------------------------------------------------

  cars <- read.csv("cars.csv")

  
  #creación de una base de datos
  # LA \n es un salto de linea
  
  read_csv("1,2,3 \n4,5,6 \n7,8,9", col_names = FALSE)
  
  # los NA, dentro de una data si solo hay un caracter
  read_csv("x,y,z \n 1,2,.\n4,.,5", na = ".")
  
  # los NA, con varios caracteres, usar vector
  read_csv("x,y,z \n 1,2,.\n4,#,5", na = c(".", "#"))

    
  

# 79 paquete base vs reader -----------------------------------------------
  
  

# 80- los parsers de readr -------------------------------------------------
  
  #parse_* sirve para pasar rapidamente a
  # un caracter especifico-
  #parse_character()
  #parse_date()
  #parse_datetime()
  
  parse_logical(c("FALSE", "TRU"))

  

# 81- Procesando los números ----------------------------------------------

  # números ya sean con . o ,
  
  parse_double("2,1415", locale = locale(decimal_mark = ","))
  
  # caraceteres monetarios, Euro, USD, Qtz
  # caracteristicas de %
  
  parse_number("12%")
  
  
  # agrupación de números, 1,000,000
  parse_number("1,000,000")

  parse_number("1.000.000", locale = locale(grouping_mark = "."))  
  
  


# 82- Procesando de strings -----------------------------------------------
  #la base del nombre
  charToRaw("Kevin Camposeco") #ascii
  
  #UTF-8
  
  


# 83- Procesando factores -------------------------------------------------

  #parse_factor()
  months <- c("Jan","Feb","Mar","Apr","May","Jun",
              "Jul","Aug","Sep","Oct","Nov","Dec")
  parse_factor(c("May","Apr","Jul","Aug", "Sec","Nob"), levels = months)
  
  
  

# 84- procesando de fecha y horas -----------------------------------------

  # parse_datetime() ISO-8601
  # parse_date()
  # parse_time()
  # EPOCH -> 1970-01-01 00:00
  parse_datetime("2018-06-05T1845")
  parse_datetime("20180605")
  
  parse_date("2015-12-07")
  parse_date("2017/05/18")
  
  parse_time("03:00 pm")
  parse_time("20:00:34")
  
  # Años
  # %Y -> año con 4 dígitos
  # %y -> año con 2 dígitos (00-69) -> 2000-2069, (70-99) -> 1970-1999
  
  # Meses 
  # %m -> mes en formato de dos dígitos 01-12
  # %b -> abreviación del mes 'Ene', 'Feb',...
  # %B -> nombre completo del mes 'Enero', 'Febrero',...
  
  # Día
  # %d -> número del día con dos dígitos 01-31
  # %e -> de forma opcional, los dígitos 1-9 pueden llevar espacio en blanco
  
  # Horas
  # %H -> hora entre 0-23
  # %I -> hora entre 0-12 siempre va con %p
  # %p -> am/pm
  # %M -> minutos 0-59
  # %s -> segundos enteros 0-59
  # %OS -> segundos reales
  # %Z -> Zona horaria America/Chicago, Canada, France, Spain
  # %z -> Zona horaria con respecto a UTC +0800, +0100
  
  
  # No dígitos
  # %. -> eliminar un carácter no dígito
  # %* -> eliminar cualquier número de caracteres que no sean dígitos
  
  

  parse_date("05/08/15", format = "%d/%m/%y")
  parse_date("08/05/15", format = "%m/%d/%y")
  parse_date("01-05-2018", format = "%d-%m-%Y")
  parse_date("01 Jan 2018", format = "%d %b %Y")
  parse_date("03 March 17", format = "%d %B %y")
  parse_date("5 janvier 2012", format = "%d %B %Y", locale = locale("fr"))
  parse_date("3 Septiembre 2014", format = "%d %B %Y", locale = locale("es"))
  
  
  
  

# 85- La heurística del parse ---------------------------------------------

  #lógico -> integer -> double -> number 
  # -> time -> date -> datetime -> strings
  guess_parser("2018-05-03")
  guess_parser("18:59")
  guess_parser(c("3,6,8,25"))
  guess_parser(c("TRUE", "FALSE","TRUE", "F", "T"))
  guess_parser(c("3", "6", "8", "25"))
  
  
  challenge <- read_csv(readr_example("challenge.csv"))
  problems(challenge)
  
  challenge <- read_csv(
    readr_example("challenge.csv"),
    col_types = cols(
      x = col_double(),#parse_double()
      y = col_date()#parse_date()
    )
  )
  View(challenge)
  tail(challenge)
  
  
  
  
  

# 86- Elegir más muestras y la función type_convert -----------------------

  
  challenge1<- read_csv(readr_example("challenge.csv"),
                        guess_max = 1001)

  #Si toda los datos estan mal de acuerdo los datos de calumna,
  # es busno pasarlos todos a character, 
  # para luego usar type_convert para solucionar y que asigne 
  # a cada columna su valor correspondiente de acuerdo a su dato
  
  challenge3 <- read_csv(readr_example("challenge.csv"),
                         col_types = cols(.default = col_character()))
  
  #conviete cada columan de acuerdo a su datos
  type_convert(challenge3)
  
  
  #Ejemplo
  df <- tribble(
    ~x, ~y,
    "1", "1.2",
    "2", "3.87", 
    "3", "3.1415"
     )
  
  type_convert(df)
  
  
  

# 86- otros tipos de ficheros especiales ----------------------------------
  
  #Escritura de ficheros
  # write_csv(), write_tsv()
  # strings en UTF8
  # date /datetimes ISO8601
  # write_excel_csv()
  
  
 #Guardando archivos dentro, del mismo código
  write_csv(challenge, path = "data/challenge.csv")
  
  
  
  #se guarda con las misma configuración que s trabajo
  write_rds(challenge, path = "data/challenge.rds")
  read_rds("data/challenge.rds")
  
  #es otro forma de guardar archivos y leerlos.
  library(feather)
  write_feather(challenge, path = "data/challenge.feather")
  read_feather("data/challenge.feather")
  
  #para trabajar con base de datos, en date en frame
  # DBI + RMySQL, RSQLite, RPostgreSQL
  
  
  library(DBI)

  
  
  
  
  
  
   
  
  
  
  
  
  
  
    
  
  
  
  
  
    
  