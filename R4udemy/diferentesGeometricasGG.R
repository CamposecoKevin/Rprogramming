#diferentes geometricas en ggplot2
library(ggplot2)
#puntos
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy)) 
#una linea suave  
ggplot(data=mpg)+
  geom_smooth(mapping = aes(x=displ, y = hwy))

#una linea suave, pero segmentando
ggplot(data=mpg)+
  geom_smooth(mapping = aes(x=displ, y = hwy, linetype= drv, color = drv))


#combinación de gráficos


ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y = hwy, color=drv)) +
  geom_smooth(mapping = aes(x=displ, y = hwy, linetype= drv, color = drv))
