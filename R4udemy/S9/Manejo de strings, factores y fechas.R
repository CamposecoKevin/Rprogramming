
# Manejo de strings, factores y fechas ------------------------------------



# 111-Strings -------------------------------------------------------------

#welcome this class.



# 112 los fundamentos del String -----------------------------------------------------
library(stringr)

s1 <- "estos es un string"

#Para cerrar, se debe agregar otra comilla doble
backslah <- "\""

#En si se usa comillas simples, no es necesario usar otro al final
single_quote <-  ' / '

#para juntarlos
x <- c(s1, backslah, single_quote)
#sirve para encontrar que simbolos contienen
writeLines(x)

#caracteres escapantes

#?'"'
mu<- '\u00b5'

mu

#para ver todos los caracteres,
#de como se usan.
?'"'



# 113 operaciones con string ----------------------------------------------
#muestra el largo de carateres

c("a", "b", "c")
str_length(c("a","Hola soy kevin"))

#conmbinar strings, usando separador

str_c("a", "b", "c" , sep = ", ")

#quitar NA dentro de una combinación

x<- c("abc", NA)

str_c("hola",  str_replace_na(x) , "adios", sep = " ")

#el uso de los string con str_
#str_


# 114 las bases de las expresiones regulares ------------------------------

#str_view()
#str_view_all()


x <- c('manzana', 'banana', 'pera', 'piña')

install.packages("htmlwidgets")

library(htmlwidgets)
library(tidyverse)


str_view(x, '.a.')
str_view(x, 'na')
#localizar un bacslash
backlash <- '\\\\'
writeLines(backlash)
str_view('a\\b', '\\\\')


# 115 anclas y caracteres de clase ----------------------------------------

y <- c('tarta de manzana', 'manzana', 'manzana al horno')

str_view(y, '^manzana$')


# \b  localizar la frontera de una palabra

# \d  localizar cualquier dígito
# \s  cualquier espacio en blanco




# 116 repeticiones de grupos y referencias --------------------------------

#  ? -> 0 o 1
#  + -> 1 o + veces
#  * -> 0 o mas veces

xx <- "El año 188 es l mas largo en  número s romaso: MDCCCLXXXCIII"
str_view(xx, "CC?")
str_view(xx, "CC+")
str_view(xx, "CC*")
str_view(xx, "CC[LX]+")



str_view(fruit, '(..)\\1')


# 117. Encontrar y extraer coincidencias de la expresión regular ----------


#otras herramientas

#Encontrar palabras en el lugar
str_detect(fruit, 'a')
cantidad
sum(str_detect(words, '^j'))
#promedio
mean(str_detect(words, '^j'))


sum(!str_detect(words, '[aeiou]'))




df <- tibble(
  word = words,
  i = seq_along(word)
)

view(df)


df %>% filter(str_detect(words,'x$'))



# 118. Agrupaciones y reemplazos de strings -------------------------------

head(sentences)

colors <- c("red", "orange", "yellow", "green", "blue", "purple")

color_mach <- str_c(colors, collapse = "|")

has_color <- str_subset(sentences, color_mach)

matches <- str_extract(has_color, color_mach)


#extracción exacta

str_extract_all(x, "[a-z]", simplify = TRUE)

noun <- "(a|the) ([^ ]+)"

sentences %>%
  str_subset(noun)%>%
  str_extract(noun)%>%
head(20)



# 119 divisiones y busqueda string ----------------------------------------

#str_replace()
#str_replace_all()

str_replace(fruit, "[aeiou]", "_")


str_replace(c("1" = "un", "2"="dos", "3" ="tres") )


#dividir

sentences %>%
  head(10)%>%
  str_split(" ")




# 120 otras expresiones regulares -----------------------------------------

str_view(fruit, regex("nana"))



x <- "linea 1\nlinea 2\nlinea"


str_extract_all(x, regex("^linea"))[[1]]
str_extract_all(x, regex("^linea", multiline = TRUE))[[1]]





# 121 buscar funciones, variables -----------------------------------------

#buscar funcion
apropos("replace")

#encontrar un archivo que termine en cierto formato
dir(pattern = ".xlsx")




# 122 factores --------------------------------------------------------------

# 123 crear factores ------------------------------------------------------

library(forcats)

x1 <- c("Vie", "Dom","Lun", "Mar")
sort(x1)


day_levels <- c("Lun", "Mar","Mie", "Jue","Vie","Sab","Dom")

y1 <- factor(x1, levels = day_levels)

sort(y1)



# 124 encuesta anual de USA -----------------------------------------------

gss_cat %>% view()

gss_cat %>% count(marital)


gss_cat %>% ggplot(aes(marital))+
  geom_bar()



# 125 cambiar el nivel de un factor ---------------------------------------


relegion_summary <- gss_cat%>%
  group_by(relig)%>%
  summarise(
    age= mean(age,na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )

#visualizar

ggplot(relegion_summary, aes(tvhours, relig))+
  geom_point()

ggplot(relegion_summary, aes(tvhours, fct_reorder(relig, tvhours)))+
  geom_point()


#reordenar

gss_cat%>%
  mutate(marital = marital %>% fct_infreq() %>% fct_rev())%>%
  ggplot(aes(marital))+
  geom_bar()






# 126 mutar los niveles de factores ---------------------------------------

gss_cat %>% count(partyid)


gss_cat %>%
  mutate(partyid = fct_recode(partyid,
    "Republican, strong"     = "Strong republican",
    "Republican, weak"       = "Not str republican",
    "Independent, near rep"  = "Ind,near rep",
    "Independent, near dem"  = "Ind,near dem",
    "Democrat, weak"         = "Not str democrat",
    "Democrat, strong"       = "Strong democrat"
  ))%>% count(partyid)


gss_cat %>% 
  mutate(relig = fct_recode(relig)) %>% count(relig)





# 127 fechas --------------------------------------------------------------
library(tidyverse)
library(lubridate)
library(nycflights13)


#date
#time
#dttm
#library(hms)


today()
now()

ymd("2023-01-13")
mdy("January 30th, 2018")

dmy("08-junio-2023")


#crear una fecha

flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure=make_datetime(year, month, day, hour, minute))



# 129 obtener componentes de fechas ---------------------------------------

nowww<- now()


year(nowww)

month(nowww)

mday(nowww)

wday(nowww)

hour()
minute()
second()



(flights)



# 130 redondeo y modificación de componentes de fechas --------------------

nowww


update(nowww, year= 2030, month = 12, mday =2, hour =3)



# 131 lapsos de tiempo ----------------------------------------------------

#duración <- numero exacto de segudnos
#periodos <- unidades humanas
#intervarlos <-  punto de partidad y de final

#días del incició que nací
yearold<- today() - ymd(19950519)


as.duration(yearold)


# 132 time zones ----------------------------------------------------------

# IANA -> continente/ city
#europe/madrid, europe/paris, America/new your

# name
Sys.timezone()


setwd("D:/R/Rprogramming/R4udemy/S10")

dir.create("S10")










































