#knnImputation
install.packages("DMwR")
library(DMwR2)

setwd("C:\\Users\\CC7\\Downloads")
contaminacion <- read.csv("contaminacion.csv")

kcontaminacion <- knnImputation(contaminacion)
kcontaminacion
#quitar valores atipicos
rivers
plot(rivers)
#valoresa atipicos mediante grafica de caja, valores fuera 
#de la barrera son atipicos
boxplot(rivers)
boxplot(rivers, horizontal = TRUE)

#eliminar valores atipicos
#conocer los  conf(intervalo de confianza) stats(limites de cajita)
boxplot.stats(rivers)
stats <- boxplot.stats(rivers)
stats$stats
inferior <- stats$stats[1]
superior <- stats$stats[5]
#lim <- c(min(stats$stats), max(stats$stats))
#eliminar los outliers
nuevo <- rivers[rivers < superior & rivers > inferior]
plot(nuevo)
#mas poquitos pero aun outliers
boxplot(nuevo)
#repetir procesos
variable <- boxplot.stats(rivers)
nuevo <- rivers
while (length(variable$out)>0) {
  inferior <- variable$stats[1]
  superior <- variable$stats[5]
  nuevo <- nuevo[nuevo <superior & nuevo > inferior]
  variable <- boxplot.stats(nuevo)
}
boxplot(nuevo)




