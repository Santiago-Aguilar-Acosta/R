### ggplot2

library(ggplot2)

data <- mtcars
?mtcars

ggplot(data = mtcars) + 
  geom_point(aes(mpg, qsec, colour = factor(am))) +
  facet_grid(~vs)

ggplot(data = mtcars) + geom_histogram(aes(x=qsec))

ggplot(data = mtcars) + geom_histogram(aes(x=qsec),bins=10,colour = "red")

ggplot(data = mtcars) + geom_histogram(aes(x=qsec,fill=factor(am)),bins=10,alpha = 0.5)

ggplot(data = mtcars) + geom_density(aes(x=qsec,fill=factor(am)),bins=10, position = "identity",alpha = 0.5)

ggplot(data = mtcars) + geom_boxplot(aes(x=factor(am), y=mpg))

ggplot(mtcars, aes(mpg, qsec)) + geom_point(colour = "red")

ggplot(mtcars, aes(mpg, qsec)) + geom_point(aes(colour = factor(cyl)))

ggplot(mtcars, aes(mpg, qsec)) + geom_point(aes(size = cyl), alpha = 0.3)

ggplot(mtcars, aes(mpg, qsec)) + geom_point(aes(size = hp), alpha = 0.4)+
  facet_wrap(~factor(am))

ggplot(mtcars, aes(mpg, qsec)) + geom_point(aes(size = hp), alpha = 0.4)+
  facet_grid(factor(cyl)~factor(am), scale="free")+
  xlab("Millas por galon")+ # eje x
  ylab("Tiempo")+ # eje y
  ggtitle("Título")+ #título del gráfico
  labs(size = "Caballos de potencia") # título de legenda

#Ggplot con nuestro set de datos
ggplot(data = Ventas,aes(Compra))+geom_bar(aes(fill = factor(Género)))

ggplot(data = Ventas,aes(Producto))+
  geom_bar(aes(fill = factor(Frecuencia)))


