Ventas$`Código vendedor` <-  as.factor(Ventas$`Código vendedor` )
str(Ventas) # confirmo 
Vendedores$Código  <-  as.factor(Vendedores$Código)

names(Vendendores)[1] <- "Código" # para cambiar el nombre de la primer columna

ejercicio <- Ventas[Ventas$Mes > 7 & Ventas$Produucto == "Radio", 1:4] # de la columna 1 a la 4
ejercicio <- Ventas[Ventas$Mes > 7 & Ventas$Produucto == "Radio", c(1,2,3,4)] # otra forma de hacerlo para elegir saletadas


##### EJERCICIOS 

### Mostrar los valores de la columna tienda

Ventas$Tienda    # la del script
print(Ventas$Tienda)
Ventas[, "Tienda"]
Ventas[, 5]

### ahora solo de las filas 1 a la 10

a1 <- head(Ventas[,5], 10)
Ventas$Tienda[1:10]     # la del script

### Crear un nuevo dataset con mes, sector y edad llamado dataprueba

dataprueba <- data.frame(Ventas$Mes, Ventas$Sector, Ventas$Edad)
dataprueba <- Ventas[,c("Mes","Sector","Edad")]     # la del script

### del dataset anterior filtrar para los meses menores a julio y que el sector sea 1

julio_sec1 <- dataprueba[(dataprueba[,"Ventas.Mes"]<7) & (dataprueba[,"Ventas.Sector"]=="1"),]
julio_sec1 <- dataprueba[dataprueba$Mes <7 & dataprueba$Sector == 1,] # la del script

### dataset de ventas, filtrar los productos iguales a "Radio"

Ventas <- as.data.frame(Ventas)
radio <- print(Ventas$Producto=="Radio")
Ventas[radio, ]
Ventas[Ventas$Producto == "Radio",]  # la del script


### a ventas agregarle una columna llamada "Tipo de compra" que sea 1 cuando monto de venta mayor a 1000 y 0 cuando sea menor o igual

Ventas$'Tipo de compra' = ifelse(Ventas$`Monto venta`>1000,1,0)
  
### agregar una columna llamada Utilidad que sea menos el 15% de impuestos

Ventas$Utilidad = Ventas$`Monto venta`*0.85

### agregar mediante un joint una columna correspondiente al nombre del vendedor

Ventas = merge(Ventas,Vendedores,by.x = "Código vendedor",
               by.y = "Código",all.x = TRUE)

names(Ventas)[ncol(Ventas)] = "Vendedor"


# solo las comunas 1 y 2 de vendedores

Ventas_prueba <- merge(Ventas, Vendedores[,1,2], by.x = "Código Vendedor",
                       by.y = "Código", all.x = TRUE)
