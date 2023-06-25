##### Realizamos limpieza de datos 

#1 Validar que cada variable está en su correspondiente formato
#2 Cada campo numérico abarca los dominios lógicos que le corresponden
#3 No hay ceros ni datos faltantes donde no corresponde
#4 Las columnas categóricas no tienen niveles extras
#5 Cuidar los outliers

str() # para conocer la estructura de los tipos de variables que tengo en mi data set
summary() # me da un breve resumen de estadística descriptiva de mis datos
table() # para tener un resumen estilo tabla dinámica de la proporción de los datos
na.omit() # borra todas las filas que contienen NA´s


Ventas <- Ventas[Ventas$Compra != 2,] # no puede ser igual a 2

summary(Ventas$Edad)
Ventas <- Ventas[Ventas$Edad > 0,]

summary(Ventas$Mes)
Ventas <- Ventas[Ventas$Mes > 0,]

Ventas <- na.omit(Ventas) 

Ventas <- Ventas[,-c(1,11)] # borra esas columnas
Ventas$`Código vendedor` = NULL
Ventas$`Punto de red` = NULL
