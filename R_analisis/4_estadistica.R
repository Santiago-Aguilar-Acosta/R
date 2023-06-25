# Crear un data frame
tabla = data.frame("Monto total" = sum(`Monto venta`),
                   "Ticket prom" = mean(`Monto venta`),
                   "Edad media" = mean(Edad),
                   "Proporción compra" = mean(Compra))


##### Ejercicios de EDA

boxplot() # brinda un gráfico de cajas y bigotes de una variable de los datos
hist() # brinda un histograma de una variable de los datos
cor() # brinda el coeficiente de correlación de dos variables de un data set
nrow() # y ncol() para conocer el número de filas y columnas en mi data set, en ese orden
ncol()
## importante en la creacion de bucles para crear una variable de ese largo

mean() # para conocer el promedio de una variable del set de datos
median() # para conocer la mediana de una variable del set de datos
pairs(Ventas[,c(8,9)]) 
Prop.table() # para conocer la proporción de los niveles en una variable de datos


### Se desea hacer un boxplot de los montos comprados y de las edades

attach(Ventas) # me evita el poner el dataset antes de la variable
               # si modificas los datos despues hay que volver a correrlo

boxplot(`Monto venta`,outline = FALSE,col = "blue",main = "Montos",horizontal = TRUE)
# outline = FALSE saca los outliers (casos puntuales que se desvian mucho)

boxplot(Edad,col = "red",main = "Edades") # por defecto sale vertical

### Se desea realizar un histograma de la variable Utilidad

hist(Utilidad,xlim = c(0,4000),col = "grey",ylab = "Frecuencia")

### Se desea conocer si existe alguna correlación entre la edad y los montos de las ventas 
# correlacion de Pearson 

cor(Utilidad, `Monto venta`) # da 1 porque una esta en funcion de la otra
cor(Edad,`Monto venta`)
cor(Ventas$Género, `Monto venta`)
plot(Edad,`Monto venta`,col = "red", ylim = c(0,4000))

### Se desea conocer la media, mediana y desviación estándar de las variables de Utilidad, edad y frecuencia.


Ventas <- Ventas[`Monto venta` < 6000,] # limpiando outliers

mean(`Monto venta`)
median(`Monto venta`)
sd(`Monto venta`)

round(mean(`Monto venta`), digits =2)

mean(Edad)
median(Edad)
sd(Edad)

mean(Frecuencia)
median(Frecuencia)
sd(Frecuencia)

round(mean(`Monto venta`), digits =2)

### Se desea conocer las proporciones de las variables de compra y género

round(prop.table(table(Género)),2)*100
round(prop.table(table(Compra)),2)*100


