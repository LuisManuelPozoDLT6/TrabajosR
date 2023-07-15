#Carga los datos del archivo AB_NYC_2019.csv.
setwd("C:\\Users\\CC7\\Downloads")
datos <- read.csv("AB_NYC_2019.csv")
View(datos)

#¿Cuántas observaciones cuentan con valores vacíos(fecha)
observacionesConFaltante <- datos[!complete.cases(datos),]
nrow(observacionesConFaltante)

#Elimina las observaciones que cuenten con valores vacíos.
sinFaltante <- na.omit(datos)
is.na(sinFaltante)
View(sinFaltante)

#Con el data set original, llena los valores vacíos de las columnas last_review con moda y review_per_month con promedio.
library("modeest")
library("mice")

####################################
datos$last_review <- ifelse(is.na(datos$last_review) | datos$last_review == " ", 
                                  mfv(datos$last_review, na_rm = TRUE),
                                  datos$last_review)
complete.cases(datos$last_review)

datos$reviews_per_month <- ifelse(is.na(datos$reviews_per_month), 
                            mean(datos$reviews_per_month, na.rm = TRUE),
                            datos$reviews_per_month)

#¿Cuántos valores atípicos tiene la columna number_of_reviews?
length(boxplot.stats(datos$number_of_reviews)$out)

#¿Cuántas propiedades existen por cada neighbourhood?
x <- datos %>% group_by(neighbourhood)%>% summarize(total_prop = length(id))
x
View(x)
#¿Cuántos y cuáles room_types existen?
room_types <- factor(datos$room_type)
nlevels(room_types)
unique(room_types)

#¿Cuántas propiedades existen con precios de renta entre 5000 y 7500?
View(datos[datos$price >= 5000 & datos$price <= 7500, ])
nrow(datos[datos$price >= 5000 & datos$price <= 7500, ])

# Con base en el precio de renta, crea una columna nueva llamada precio que asigne una categoria
# (caro, medio, económico) a cada propiedad
length(datos$price)
datos$precios <- 






