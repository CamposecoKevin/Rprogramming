
# 133 técnicas de programdor profesional ----------------------------------



# 134 pipes ---------------------------------------------------------------


#sobre escribir la variable original

#componer funciones

# usar una pipe

#assing, get, load


# 134 pipes alternantivas -------------------------------------------------


rnorm(1000) %>% 
  matrix(ncol = 2) %T>%
  plot() %>% 
  str()


# correlación

mtcars %$%
  cor(disp, mpg)
  

mtcars %<>%
  filter(cyl == 6)


# 136 creación de funciones -----------------------------------------------

# nombre de la funcion


# 137 cuando conviene crear funciones -------------------------------------


# 138 funciones para humanos y ordenadores --------------------------------
# que el nombre de la función se entienda



# 139 condiciones y toma de decisiones ------------------------------------

if (condicion){
  # condigo a ejecutar si es Trues
} else{
  # condigo a ejecutar si es falso
}

y <- 10

if (y<20) {
  x <- "numero grande"
} else{
  x <- "numero pequeño"
}


# 140 argumentos de las funciones -----------------------------------------






















