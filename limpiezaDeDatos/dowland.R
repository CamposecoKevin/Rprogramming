# codigo para descargar desde URL


#si funciono hay que revisar el código

if(!file.exists("./data")){dir.create("./data")}

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile = "./data/datos.csv")
poblacion<-read.csv("./data/datos.csv")



