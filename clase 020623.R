secuencia <-c(20:50)
sum(secuencia)
mean(secuencia)

a<- c(10,20,30)
b<- c(40,50,60)
c<- c(70,80,90)
#combinar vectores a matrices
#rbind y cbind funciones de combinacion
matriz <- rbind(a, b, c)
matrix <- matrix()
matriz2 <- matrix(c(a,b,c),
                  nrow = 3, ncol = 3, 
                  byrow = TRUE, 
                  dimnames = list(c("row1", "row2", "row3"), c("c.1", "c.2", "c.3")))
matriz2

setwd("C:\\Users\\CC7\\Downloads")
pizza <- read.csv("pizzaplace.csv")
pizzas <- read.csv("pizzaplace.csv",
                    header = TRUE,
                    row.names = 1,
                    sep=",",
                    dec = "."
)
View
#sin repetir, distinct
tipos <- factor(pizzas$type)
#contar resultados de factores
nlevels(tipos)
#pizza más cara
pizzas[which.max(pizzas$price),5]
#tamaño de pizza que se vende menos
install.packages("dplyr")
library("dplyr")
#pizzas por tamaño
pizzas %>% count(size)
#arrange ordena por n
#selecciona primer dato de columna size
(pizzas %>% count(size) %>% arrange(n))
#ventas de marzo a abril
View(pizzas %>% filter(size == "L"
                       & as.Date(date) >= '2015-03-01'
                       & as.Date(date) <= '2015-04-30'))
#sin dplyr
pizzas[pizzas$size == "L" & substr(pizzas$date,6,7) == "03" |
       substr(pizzas$date,6,7) == "04",]
#nombre y tamaño de ventas en agosto
resultado <- pizzas %>% filter(as.Date(date) >= '2015-08-01' &
                                 as.Date(date) <= '2015-08-31') %>% select(name, size)
resultado
#sin dplyr
pizzas[pizzas$date >= '2015-08-01' & pizzas$date <= '2015-08-31', c(5,6)]
pizzas[substr(pizzas$date,6,7) == "08"]
#horario de cadena
min(pizzas$time)
max(pizzas$time)
print(paste(min(pizzas$time), " - ", max(pizzas$time)))
