library(ggplot2)
library(gganimate)
theme_set(theme_bw())

Data <- read_excel("C:/Users/ars39/Dropbox/Visualization/Data.xlsx")

animation::ani.options(ani.width= 1000, ani.height=1000, ani.res = 1000)

plot<- ggplot(Data, aes(x = Date, y = Count,color=factor(Series))) +
  geom_path(size = 1, lineend = "round", linejoin = "round") +
  scale_y_continuous(limits = c(1000,6000),breaks=c(1000,2000,3000,4000,5000,6000))+ 
  labs(x = "Año", y = "Cantidad por Mes", 
       title = "Nacimientos y Muertes en Puerto Rico 2000-2018",
       subtitle="Producido por Alexis R. Santos-Lozada @Appdemography",
       caption = "Fuente: Registro Demográfico de Puerto Rico 2000-2018")+
       theme(legend.title = element_blank())

plot + transition_reveal(ID) 

anim_save("pr_anim1.gif", animation = last_animation(), path ="C:/Users/ars39/Dropbox/Visualization/")

Data2 <- read_excel("C:/Users/ars39/Dropbox/Visualization/Data2.xlsx")

plot2<- ggplot(Data2, aes(x = Date, y = Balance)) +
    geom_path(size = 1, lineend = "round", linejoin = "round") +
    labs(x = "Year", y = "Total", 
         title = "Balance entre Nacimientos y Muertes en Puerto Rico 2000-2018",
         subtitle="Producido por Alexis R. Santos-Lozada @Appdemography",
         caption = "Fuente: Estimaciones del autor, basado en datos del Registro Demográfico") +
  theme(legend.title = element_blank())+
  geom_hline(yintercept = 0, linetype="dotted", 
             color = "red", size=1)

plot2 + transition_reveal(ID) 

anim_save("pr_anim2.gif", animation = last_animation(), path ="C:/Users/ars39/Dropbox/Visualization/")

plot3<- ggplot(Data2, aes(x = Date, y = Net_Migration)) +
  geom_path(size = 0.5, lineend = "round", linejoin = "round") +
  labs(x = "Year", y = "Total", 
       title = "Balance de Pasajeros para Puerto Rico 2000-2018",
       subtitle="Producido por Alexis R. Santos-Lozada @Appdemography",
       caption = "Fuente: Estimaciones del autor, basado en total de pasajeros") +
  theme(legend.title = element_blank())+
  geom_hline(yintercept = 0, linetype="dotted", 
             color = "red", size=1)

plot3 + transition_reveal(ID) 

anim_save("pr_anim3.gif", animation = last_animation(), path ="C:/Users/ars39/Dropbox/Visualization/")

plot4<- ggplot(Data2, aes(x = Date, y = Pop/1000000)) +
  geom_path(size = 0.75, lineend = "round", linejoin = "round") +
  labs(x = "Year", y = "Total poblacional (en millones)", 
       title = "Total de la población de Puerto Rico 2000-2018 (en millones)",
       subtitle="Censo: 2010 (rojo), 2000 (azul), 1990 (amarillo) and 1980 (verde)",
       caption = "Fuente: Estimaciones del autor") +
  theme(legend.title = element_blank())+
  geom_hline(yintercept = 3808610/1000000, linetype="dotted", color = "red", size=1.25)+
  geom_hline(yintercept = 3725789/1000000, linetype="dotted", color = "blue", size=1.25)+
  geom_hline(yintercept = 3403154/1000000, linetype="dotted", color = "orange", size=1.25)+
  geom_hline(yintercept = 3090691/1000000, linetype="dotted", color = "green", size=1.25)

plot4 + transition_reveal(ID) 

anim_save("pr_anim4.gif", animation = last_animation(), path ="C:/Users/ars39/Dropbox/Visualization/")