setwd("C:\\Users\\CC7\\Downloads")
contaminacion <- read.csv("contaminacion.csv")
View(contaminacion)
#limpiar data frame
#celdas vacias 1ER PASO, hay vacíos?
is.na(contaminacion)
#filas lleno = true
complete.cases(contaminacion)
#omita filas con valores vacías// completamente llenos
na.omit(contaminacion)
#con alguna 
contaminacion[!complete.cases(contaminacion), ]
#primer fila ,segunda columna
contaminacion[1,2]


install.packages("mice")
library("mice")
#1ER PASO forma mas rapida
md.pattern(contaminacion)

maraton <- read.csv("maraton_ny.csv")
md.pattern(contaminacion)

#2DO PASO, hay duplicados?
duplicated(contaminacion)
contaminacionSnDuplicados <- contaminacion[!duplicated(contaminacion),]
contaminacionSnDuplicados

#3ER PASO, en caso de necesitar datos vacios imputar
#llenar valor con promedio/mean
#NA SI HAY DATOS VACIOS
sum(contaminacion$CN)
#ejecuta suma sobre valores no vacios
sum(contaminacion$CN, na.rm = TRUE)

#crear una columna cn_p para no modificar valores originales
#si columna tiene vacios llenalas con el promedio
#sino tiene vacios llenalo con su mismo valor
contaminacion$CN_p <- ifelse(is.na(contaminacion$CN),
                             mean(contaminacion$CN, na.rm = TRUE),
                             contaminacion$CN)

#moda cuando no haya valores numéricos
install.packages("modeest")
library("modeest")

#crear dataframe
b <- data.frame(v1=c("a", "b", "c", "d"), v2= c("hola", "hola", NA, "adios"))
b$v2_moda <- ifelse(is.na(b$v2), mfv(b$v2, na_rm = TRUE), b$v2)

#vecinos cercanos








