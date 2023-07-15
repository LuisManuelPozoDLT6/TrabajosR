#Aprendizaje supervisado /ya estan valores de variable dependiente
#dividido en 2 tareas: predicción (regresión)
#y clasificación (k-Nearest Neighboor)

#Knn
View(iris)
datos <- iris
View(datos)

#Verificar que el data set sea un data frame
class(datos)
# | datos <- as.data.frame(datos)

#Verificar q columna de clasificación sea un factor
class(datos$Species)
#datos$Species <- as.factor(datos$Species)

#Los algoritmos de clasificacion son sensibles a cambios de magnitud de las variabkes
#es necesario escalar
#datos$Sepal.length
#     <- scale(datos$Sepal.Length)
#escalamiento de una sola columna normalización primeras 4 col
datos[, 1:4] <- scale(datos[,1:4])
#a primeras 4 columnas esta rescibiendo sus valores ya reescalados
View(datos)
#reescalamiento ajustar maximo y minimo de columna
# 80/20, 70/30
#Si tienes un data set de 150 observaciones
#120 observaciones de entrenamiento
#30 observaciones de 
#saca el 80 porciento de los datos y usa el floor para redondear
tam_train <- floor(0.8 * nrow(datos)) #120/150
#floor redondea hacia abajo
#Extraer cantidad de elementos calculada (120) del conjunto original de datos
#funcion sample: obtiene muestra (algunos elementos)
#aleatoria de un conjunto de datos 
#funcion seq_len: generar enteros desde 1 hasta indicar
#genera una secuencia de enteros del 1 al 150
secuencia <- seq_len(nrow(datos))
class(secuencia)
#elige 120 números de la secuencia de manera aleatoria
indices_train <- sample(secuencia,
                        size = tam_train)
#el data set de entrenamiento y prueba no deben contener la columna de clasidixacion
datos_train <- datos[indices_train, 1:4] # 80%
# - es la negación para indices
datos_test <- datos[-indices_train, 1:4] # 20%
clase_train <- datos[indices_train, 5]
clase_test <- datos[-indices_train,5]

dim(datos_train)
class(clase_train)

install.packages("class")
library("class")
#conjunto de entrenamiento
#conjunto de prueba
#clasificación conjunto de entrenamiento
#valor de k (cuantos vecinos)
# k = cantidad de observacioes / 2 x
#k = sqrt(canidad de observaciones)
#k se recomienda impar
# el resultado de ejecutar knn es la clasificación de los valores de entrenamiento
clasificacion <- knn(datos_train,
                     datos_test,
                     clase_train,
                     k=sqrt(nrow(datos)))

#almacenar datos ed prueba con la clasificacion del algoritmo
datos_test_clasificacion <- datos_test
datos_test_clasificacion$Clase <- clasificacion
View(datos_test_clasificacion)

install.packages("ggplot2")
library("ggplot2")

ggplot(datos_test_clasificacion,
       aes(x=Sepal.Length, y=Sepal.Width,
           color = Clase, fill = Clase)) +
  geom_point(size = 7) + 
  geom_text(aes(label=Clase)) +
  theme(legend.position = "none")

#Matriz de confusion
#Tabla de todos comtra todos
tab <- table(clasificacion, clase_test)
diag(tab)
rowSums(tab)
#val. clasificacos correctamente / total val.
#accuracy / presición
accuracy <- function(tabla){
  sum(diag(tabla)/sum(rowSums(tabla)))*100
}

accuracy(tab)

