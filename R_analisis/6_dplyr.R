#Dplyr y Power BI
install.packages("dplyr")
library(dplyr)

Ventas <- read_excel("Ventas.xlsx")

Ventas_limpio <- Ventas %>% filter(Edad > 0 & Mes >0 & Compra != 2) %>% 
  select(Mes,Producto,Tienda,`Monto venta`,Edad) %>% na.omit()

Ventas_producto <- Ventas %>% group_by(Producto) %>% 
  summarise(Monto_prom = mean(`Monto venta`),Ventas = n()) %>% na.omit()

#Exportar datos
install.packages("xlsx") # para exportar en excel
library(xlsx)

write.csv(Ventas_limpio,"Ventas limpio.csv")

