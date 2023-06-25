install.packages("readxl")
install.packages("readr")
install.packages("read_csv")
install.packages("rio")
install.packages("tidyverse")
library(readxl)
library(readr)
library(read_csv)
library(rio)
library(tidyverse)

## intentando abrir un archivo .csv

file.choose() ## para saber la ruta /

Vendedores <- read.csv("C:/Users/santi/Desktop/R_analisis/Vendedores.csv", 
                       header = TRUE, check.names = FALSE)

## check.names en el caso de que tenga tilde y despues cambiarle el nombre

## para archivos separados por punto y coma sirve
read.csv2 ()

## si estuviera sin tilde

Vendedores <- read.csv("C:/Users/Usuario/Desktop/R_datos/Vendedores.csv", 
                       header = TRUE)

##### importando un archivo .xlsx 


Ventas <- read_excel("Ventas.xlsx")
Ventas <- read_excel("C:/Users/santi/Desktop/R_analisis/Ventas.xlsx")

head(Ventas, 5)
tail(Ventas, 5)

resumen_ventas <- summary(Ventas); resumen_ventas

var <- head(Ventas, 3)

mes <- Ventas$Mes

### estructura de las variblaes

str(Ventas)
tibble(Ventas)
str(Vendedores)
tibble(Vendedores)

Ventas$`Sector`= as.factor(Ventas$`Sector`)

levels(Ventas$Sector)

Ventas$Sector <- factor(Ventas$Sector, levels=c("1","2","3"),
                 labels=c("sector1","sector2","sector3"))

table(Ventas$Sector)

#### ejemplo 1 uso de factores

produccion=c(120,100,132,112,95,164,172,183,155,176,110,115,122,108,120)
maquina=c(27,27,27,27,27,32,32,32,32,32,55,55,55,55,55)
dia=c(1,2,3,4,5,1,2,3,4,5,1,2,3,4,5)
cbind(maquina,dia,produccion)

maquina=factor(maquina)
maquina
class(maquina)

as.numeric(maquina)  
as.numeric(as.character(maquina))
as.numeric(levels(maquina))[maquina]

# ejemplo 2 uso de factores: orden de la salida

pct <- c("alto","bajo","bajo","medio","alto","medio","bajo","alto","alto","alto")

fpct=factor(pct)
table(fpct)

as.numeric(fpct) # codificacion numerica

fpct=factor(pct, levels=c("bajo","medio","alto"))
table(fpct)

as.numeric(fpct)

##### IMPORTANTE [fila, columna] INDEXACION Y FILTRADO

mes2 <-  Ventas[, 1] # si esta vacio extrae todas las filas, solo la columna 1

mes2 <-  Ventas[, "Mes"] # es lo mismo que lo anterior

fila <- Ventas[1, ] # primera fila, todas las colummnas

posicion <- Ventas[4,5]

sum(Ventas[,"Edad"]) # suma de todas las edades

unique(Ventas$Género) # valores unicos de la variable

table(Ventas$Género) # cantidad de veces que se repiten los valores

sum(Ventas[,"Género"]=="1") # suma si se cumple la condicion
print(Ventas[,"Género"]=="1") # es un vector logico


#### filtrar filas

print(Ventas["4",]) 

val <- c(TRUE,TRUE,TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE)
Ventas[val, ] ## solo las primeras 4 filas, no me funciona 

atributo <- "Hombre"
target <- "Género"
label <- 1

Ventas[Ventas[, target]==label, atributo] # no me funciona

c <-  Ventas[Ventas[,target]==label,atributo] # no me funciona

#### filtrar por mas de una condicion

h <- Ventas[(Ventas[,"Edad"]>=50) & (Ventas[,"Género"]=="1"),] # hombres mayores de 50
table(h$Producto)
m <- Ventas[(Ventas[,"Edad"]>=50) & (Ventas[,"Género"]=="0"),]
table(m$Producto)

condicion <- (Ventas[,"Edad"]>=50) & (Ventas[,"Género"]=="1") & (Ventas[ ,"Producto"] %in% c("Televisor","Radio"))
Ventas[condicion, ]

nrow(restaurant[(restaurant[,target]==label) & (restaurant[,atributo]=="Algunos"),] )

### CONDICIONALES Y CAMPOS CALCULADOS

Ventas$stand <- Ventas$`Monto venta`-mean(Ventas$`Monto venta`)/sd(Ventas$`Monto venta`)


Ventas$old <- ifelse(Ventas$Edad == "60", "50") # no me funciona

Ventas$Nombre <- ifelse (columna2 == "Alto", "Alto", "Bajo") # si la columna2 es alto imprime alto si no bajo

Tabla3 <- merge(tabla1, tabla2, by.x=tabla1$llave, by.y=llave, all.x=TRUE)

# tabla 1 "manda" se le agrega la tabla 2

#all.x= TRUE. pega por la izquierda left join
#all.y= TRUE. pega por la derecha rigth join
#all= TRUE. corresponde a todo
# no colocar all corresponde a un inter join

