#resolver sistema de ecuaciones
solve()
#19*b0+138*b1+1335*b2 = 649.5
#138*b0+1335*b1+14935.5*b2=5306.6
#1335*b0+14935.5*b1+181427.25*b2=51666.75
#coeficientes a la izquierda del igual
a <- matrix(c(19,138,1335,
            138, 1335, 14935.5,
            1335, 14935.5, 181427), nrow = 3 )
b <- matrix(c(649.5, 5306.6, 51666.75), nrow = 3)
solve(a, b)
#[1,] -6.6755591
#[2,] 11.7644938
#[3,] -0.6345802
# y = -6.6755591 + 11.7644938 - -0.6345802 * x^2

#linear model
#formula (dep izq, ind der), datos
setwd("C:\\Users\\CC7\\Downloads")
datos <- read.csv("resistenciaa.csv")
modelo <- lm(resistencia ~ concentracion, 
            data = datos)
#Call:
#lm(formula = resistencia ~ concentracion, data)

#Coeffcients
#(Intercept b0) concentracion b1
# 21.321           1.71

datosMark <- read.csv("marketingg.csv")
datos2 <- datosMark[1:12, 1:3]
modelo <- lm(Sales ~ Spend, data = datos2)
#lineal multiple
modelo2 <- lm(Sales ~ Spend + Month, data = datos2)

#polinomiales
datos <- read.csv("resistenciaa.csv")
modelo <- lm(resistencia ~ concentracion
              + I(concentracion^2) + I(concentracion^3)
             , data = datos)
#Call:
#lm(formula = resistencia ~ concentracion + I(concentracion^2), 
 #  data = datos)

#Coefficients:
 # (Intercept)       concentracion  I(concentracion^2)  
#-6.6742 

prediccion <- predict(modelo, data.frame(concentracion = c(16,17)))

