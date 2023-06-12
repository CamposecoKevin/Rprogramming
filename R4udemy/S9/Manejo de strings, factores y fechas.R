
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












































































