library(tidyverse)
library(datos)
#por color, el color
ggplot(data= datos::millas)+
  geom_point(mapping = aes(x = cilindrada, y =autopista, color = clase))

#por alpha, la transparencia
ggplot(data= datos::millas)+
  geom_point(mapping = aes(x = cilindrada, y =autopista, alpha = clase))

#por shape, que controla la forma
ggplot(data= datos::millas)+
  geom_point(mapping = aes(x = cilindrada, y =autopista,stroke = 2))


#que todos los puntos sean del mismo color
ggplot(data= datos::millas)+
  geom_point(mapping = aes(x = cilindrada, y =autopista), color = "red", shape =21,fill = "blue", stroke = 5)

#colorer con un condición, en este caso,
#coloera una parte los <5 un color, y otro de los mayores.
ggplot(data= datos::millas)+
  geom_point(mapping = aes(x = cilindrada, y =autopista, color = cilindrada <5))


ggplot(data = datos::millas)+
  geom_smooth(mapping = aes(cilindrada, autopista))


#usando facet_wrape


ggplot(data = datos::millas)+
  geom_point(mapping = aes(cilindrada, autopista))+
  facet_wrap(~ clase, ncol = 2)

# nrow = 2; son las filas en las que se dividirá.


#usando facet_grid


ggplot(data = datos::millas)+
  geom_point(mapping = aes(cilindrada, autopista))+
  facet_grid(traccion ~ clase)
  
ggplot(data = datos::millas) +
  geom_point(mapping = aes(x = traccion, y = cilindros))

#solo muestra información respecto a tracción,
ggplot(data = datos::millas)+
  geom_point(mapping = aes(x = cilindrada, y = autopista)) +
  facet_grid(. ~ cilindros)




#ingresar varios geoms dentro de la misma grafica
ggplot(data = datos::millas) +
  geom_point(mapping = aes(x = cilindrada, y = autopista)) +
  geom_smooth(mapping = aes(x = cilindrada, y = autopista))


# hacer lo mismo, pero más simple.
ggplot(data = datos::millas, mapping = aes(x = cilindrada, y = autopista)) +
  geom_point(mapping = aes(color = clase)) +
  geom_smooth()



#datos con diamenta
ggplot(data = datos::diamantes)+
  geom_bar(mapping = aes(datos::diamantes$corte, fill = corte))






?geom_point


ggplot(data = <DATOS>) +
  <GEOM_FUNCIÓN>(mapping = aes(<MAPEOS>))


ggplot(data = datos::millas)


?datos::millas


ggplot(data = datos::millas)+
  geom_point(aes(x = autopista, y = cilindros))

ggplot(data = datos::millas)+
  geom_
