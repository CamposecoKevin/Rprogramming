
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
























