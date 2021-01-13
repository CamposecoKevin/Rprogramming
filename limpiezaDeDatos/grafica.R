#Pasos para gráficar en R








ggplot(data = ipc,
       mapping = aes(x = X,
                     y = Transporte))+
  geom_point()+
  labs(title = "IPC Transporte")



#si me descargo la base de datos de covid por municipio de Guatemala

fileUrl<-"https://gtmvigilanciacovid.shinyapps.io/3869aac0fb95d6baf2c80f19f2da5f98/_w_969e6be7/session/b5e81ff3eb49f299bc3c1bb4abe2aff0/download/confirmadosFER?w=969e6be7"
download.file(fileUrl,destfile = "D:/R/Rprogramming/limpiezaDeDatos/covidMunicipio.csv")
covidMunicipio<-read.csv("D:/R/Rprogramming/limpiezaDeDatos/covidMunicipio.csv")




fileUrl<-"http://www.ine.gob.gt/sistema/uploads/2020/08/13/20200813155224hCZYPyzqJKV4LKFknS9ojEZEzo1OR8TM.xlsx"
download.file(fileUrl,destfile = "D:/R/Rprogramming/limpiezaDeDatos/ipcGasto.csv")
ipcGasto<-read.csv("D:/R/Rprogramming/limpiezaDeDatos/ipcGasto.csv")
