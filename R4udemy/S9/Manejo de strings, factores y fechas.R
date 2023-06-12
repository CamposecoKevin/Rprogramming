
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





























