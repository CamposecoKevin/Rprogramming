
## iniciamos en la librería
library(data.table)


## crear matrix con data frame

df= data.frame (x=rnorm(9), y =rep(c("a", "b", "c"), each = 3), z =rnorm(9))
head(df,3)

##crear matrix con data.table

DT= data.table (x=rnorm(9), y =rep(c("a", "b", "c"), each = 3), z =rnorm(9))
head(DT,3)



