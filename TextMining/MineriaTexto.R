```{r,eval=FALSE}
library(rtweet)
tw<-search_tweets("Guatemala",n=500,include_rts = F)
tw$text
```

```{r,eval=FALSE}
library(tm)
library(dplyr)
setwd("C:\\Users\\ALVARO\\Documents\\GitHub\\EST-384\\data")
fb<-read.csv("bd_sc.csv")
#aqui te permite colocar los simbolos
fb<-read.csv("bd_sc.csv",encoding = "UTF-8")
#fb<-read.csv("bd_sc.csv",encoding = "Latin-1")
fb$post_text[5]
```

### Colección de documentos PDFs

```{r,eval=FALSE}
library(pdftools)
dir<-"C:\\Users\\ALVARO\\Documents\\GitHub\\EST-384\\data\\pdf"
pdfdocs <- VCorpus(DirSource(dir, pattern = ".pdf"), 
                   readerControl = list(reader = readPDF))
```

```{r,eval=FALSE}
library(tm)
#Remover la puntuación
removePunctuation(x)
#quitar espacios si existen varios, a uno solo
stripWhitespace(x)
#quita todo los número que esta
removeNumbers(x)
#remueve palabras en un vector
removeWords(x,c("Hola","hoy"))
x
#stopwods donde los artículos se quitan, que tiene version en español.
removeWords(x,stopwords("es")[-47])


```{r,eval=FALSE}
x<-"Hola a todos, ¿Cómo estan?.    hoy es 30 de Noviembre"
#nchar nos muestra todos los caracteres almacenados incluidos espacios
nchar(x)
#Sirve para concatenar
paste("Pregunta 1:",x,"Fin de la oración")
#
paste0("Pregunta 1:",x,"Fin de la oración")
#Reemplazar elementos en un vector
gsub("Hola","xxx",x)
#Es un buscador, decirme que ya lo ha encontrado en los diferentes espacios de trabajo
grep("Hola",x)

y<-c("Hola a todos","chau","Hola")
grep("Hola",y)
#todo minisculo
tolower(x)
#todo mayuscula
toupper(x)

library(qdap)
fake.text<-'R text mining is good but text mining in python is also'
patterns<-c('good','also','text mining')
replacements<-c('great','just as suitable','tm')
mgsub(patterns,replacements,fake.text)
```



df<-nube(tw$text)
wordcloud2(tw$text,n,size = 500,shape = 'pentagon')

wordcloud2(data = df$tw.text)

wordcloud2(data = docs)


??wordcloud

df<-data.frame(tw$t)

library(wordcloud2)
library(wordcloud)

datos<-demoFreq

library(tm)

#extración de inforamción de tw y luego sacar el Número de frecuencia.

docs<-Corpus(VectorSource(tw$text))
docs 

docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)%>%
  tm_map(removeWords,docs,stopwords("es"))


docs <- tm_map(docs, content_transformer(tolower))

docs <- tm_map(docs, removeWords, c(stopwords("sp"),"ahora") )

dtm <- TermDocumentMatrix(docs) 

matrix <- as.matrix(dtm) 

words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)	
wordcloud2(data = df[df$freq>10,],color = "random-dark",shape = "pentagon")

summary(df)



