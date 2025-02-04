## ggplot2

#install.packages("ggplot2")
#install.packages("dplyr")

library(ggplot2)
library(dplyr)

# decouverte des données
data("iris")

data("starwars")
dim(starwars)
head(starwars)
names(starwars)


# test
ggplot(data=iris,
       mapping = aes(x=Petal.Length, y=Petal.Width, colour = Species))+
  geom_point()+
  facet_grid(rows=vars(Species))

# graphique
ggplot(data=starwars,
       mapping = aes(x=species, y=height, colour = gender))+
  geom_boxplot()+
  facet_grid(rows=vars(gender))


ggplot(data=starwars,
       mapping = aes(x=gender, y=height, colour = gender))+
  geom_boxplot()+
  geom_point()


ggplot(data=starwars,
       mapping = aes(x=eye_color, y=height, colour = gender))+
  theme_dark()+
  geom_boxplot()+
  geom_point()+
  geom_label(aes(label = name), nudge_x = 0.5, nudge_y = 5, size = 2)+
  labs(x = "couleur yeux", y = "taille",
       title ="Starwaaaaaars")

