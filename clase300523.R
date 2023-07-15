inventario<- c('Manzana' =30, 'Platano' =8, 'Sandia' =6)
#Seleccionar elementoa de un vector
inventario[2]
#rangos del 1 a 2
inventario[1:2]
#para seleccionar posiciones que no están contiguas
inventario[c(1,3)]
inventario[-3]#todos menos 3
inventario[-(2:3)]
inventario['manzana']

#para quitar un elemento especifico
inventario <- inventario[-3]

#selección por filtrado
inventario
inventario[inventario < 10]
inventario[inventario == 6]
inventario[inventario %in% c(2,3,6,30)]
inventario[inventario %in% 2:30]

setwd("C:\\Users\\CC7\\Downloads")
maraton <- read.csv("maraton_ny.csv",
                    header = TRUE,
                    row.names = 1,
                    sep=",",
                    dec = "."
)

View()
#seleccionar columna individual
maraton$age
maraton$gender

#fila 3, columna 4
maraton[3,4]
maraton[1:10, 1:2]
#todas las filas, solo columnas 1 y 5
maraton[, c(1,5)]
#solo fila 1 y 100, todas las columnas
maraton[c(1,100), ]
#filas del 1 al 100, todas las columnas
maraton[1:100, ]
#corredores cuyo genero es femenino
View(maraton[maraton$gender=='Female',])

max(maraton$age)
min(maraton$age)
mean(maraton$age)
min(maraton$time)
View(maraton[,-3])
dimension <- dim(maraton)
typeof(dimension)
str(dimension)
dimension[1]
dimension[2]
dim(maraton)[1]
#obtener el rank de los valores de una coleccion
??rank
rank(inventario)

#obtener key y posicion del elemento max o min
?which.max
which.max(maraton$age)
maraton[106,]
which.min(maraton$age)
maraton[250,]
which.min(maraton$time)
-
maraton[706,]
setwd("C:\\Users\\CC7\\Downloads")
rental <- read.csv("house_rental.csv",
                    header = TRUE,
                    row.names = 1,
                    sep=",",
                    dec = "."
)
View(rental)
sum(rental[rental$Price>60000 & rental$Price<80000, 5])
