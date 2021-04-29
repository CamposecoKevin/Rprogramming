library(tidyverse)
#CLASE 24
#combinación de gráficos y añadir dimensiones
#La diferencia del otro gráfico es que utilizamos group

#las gráficos deben darse a enterse por si solos
ggplot(data=mpg,mapping = aes(x=displ, y = hwy, group= drv, color = drv))+
  geom_smooth()+
  geom_count()

#globalizar los datos
ggplot(data=mpg,mapping = aes(x=displ, y = hwy, group= drv, color = drv))+
  geom_smooth()+
  geom_count()


ggplot(data=mpg, mapping = aes(x=displ, y = hwy))+
  geom_point(mapping = aes(color = class))+
  geom_smooth(data = filter(mpg, class=="suv"), se =F)


#CLASE 25

#TRANSFORMACIÓNES ESTADÍSTICAS BÁSICAS

#BAR CHART

#informaicón de diamantes

#dataset de diamosn

view(diamonds)


#Ejemplo de visualización de diagrama de barras
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut))


#CLASE 26
#CAMBIANDO LAS TRANSFORMACIÓNES ESTADISTICAS DE NUESTRAS GRÁFICAS


#USO DE TRIBBLE, para crear una data base
#para sacar las parte de arriba de ñ si usa alt + 126

demo_diamonds<-tribble(
  ~cut,         ~freqs,
  "Fair",        1610,
  "Good",        4906,
  "Very Good",   12082,
  "Premium",     13791,
  "Ideal",       21551,
  
)
view(demo_diamonds)

#colocando las 
ggplot(data = demo_diamonds)+
  geom_bar(mapping = aes(x=cut, y = freqs), stat="identity")


#mostrar las proporción en porcentaje.

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut, y =..prop..,group=1))


#summary
#mostrando en el gráfico de las mediannas y maximosm, minimos dentro un archivo
ggplot(data = diamonds)+
  stat_summary(
    mapping = aes(x=cut, y = depth),
    fun.ymin= min,
    fun.max = max,
    fun.y = median
  )


#Gráfica de barras
ggplot(data= diamonds)+
  geom_bar(mapping = aes(x=cut, fill= color))


view(diamonds)



##positoin "FILL"
ggplot(data= diamonds, mapping = aes(x=cut, fill = clarity))+
  geom_bar(position = "fill")

#positión "DODGE"

ggplot(data= diamonds, mapping = aes(x=cut, fill = clarity))+
  geom_bar(position = "dodge")



#position "JITTER" para ver un ruido, y se pueda ver mejor la composición de los datos

ggplot(data= mpg, mapping = aes(x=displ, y = hwy))+
  geom_point(position = "jitter")


ggplot(data= mpg, mapping = aes(x=displ, y = hwy))+
  geom_jitter(  )




#SISTEMAS DE COORDENADAS

#coord_flip() -> cambia los papales de x e Y

#Asi se vería normalmente
ggplot(data = mpg, mapping = aes(x= class, y = hwy))+
  geom_boxplot()

#Asi se vería con la funcion volter de coord_flip()

ggplot(data = mpg, mapping = aes(x= class, y = hwy))+
  geom_boxplot()+
  coord_flip()


#representaciones en mapa

install.packages("maps")

?map_data

usa<- map_data("usa")

ggplot(usa, aes(long, lat, group=group))+
  geom_polygon(fill= "blue", color="white")+
  coord_quickmap()


view(usa)

#utilizando el coord_polar()

ggplot(data= diamonds)+
  geom_bar(
    mapping = aes(x=cut, fill = cut),
    show.legend = F,
    width = 1
  )+
  theme(aspect.ratio = 1)+
  labs(x=NULL, y = NULL)+
  coord_polar()



































