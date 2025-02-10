############################################################################
############################################################################
###################  ANALYSES - INDICATEURS  ###############################
############################################################################
############################################################################

## Date : 15/11/2024 
## Auteur : Marie FAURE

##########################################################################
########################### Fonction utiles ##############################
##########################################################################

#install.packages("readxl")
library("readxl")
library(tidyverse)

#%>% 
#|> 
#read_excel()
#select() avec start_with() par exemple
#filter()
#mutate()
#fct_recode()
#group_by_()
#summarise()
#left_join() right_join() inner_join() full_join()
#pivot_longer() pivot_wider()
# ...


##########################################################################
########################### Import #######################################
##########################################################################

Sites <- read_excel("data/Sites.xlsx")
Microorga <- read_excel("data/Microorganismes.xlsx")
Nematodes <- read_excel("data/Nematodes.xlsx")
Vers <- read_excel("data/Lombrics.xlsx")

##########################################################################
######################### Jointure de tables #############################
##########################################################################
########### CONSIGNE : Choisir deux communauté biologique ###########
# Associer sites et deux communautés
#left_join() garde tout les enregistremen de la première table meme celle sans corespondance du tableau de gauche
#right_join() garde tout les enregistrement du tableau de droite
#inner_join() enlève les inregistrement qui n'on pas de corespondance dans les tableau
#full_join() garde tout de tout les tableaux
Sites %>% 
  inner_join(.,Microorga,join_by(ID)) %>% 
  inner_join(.,Nematodes,join_by(ID)) -> siteMN


##########################################################################
################## Sélection de lignes et colonnes ##################
##########################################################################
########### CONSIGNE : Choisir un site ###########
siteMN %>% 
  filter(SITE == "Feucherolles") %>% 
  select(SITE:REPET_BLOC,ARGILE,ends_with("MIN"),
         PHYTO:CARNI,contains("SABLE"))-> feMN

##########################################################################
####################### Créer des variables ##################
##########################################################################
feMN %>% 
  mutate(Pphyto =(PHYTO/(PHYTO+BACT+FONG+OMNI+CARNI))*100) ->feMN2


##########################################################################
############################## Calculs par groupe ########################
##########################################################################
########### CONSIGNE : calculs sur plusieurs variables en même temps######
feMN2 %>% 
  group_by(MODALITE_DESCR) %>% 
  summarise(mean_pp=mean(Pphyto), sd_pp=sd(Pphyto)) ->feSum

##########################################################################
####################### Graphique ########################
##########################################################################
########### CONSIGNE : un graphique en modifiant l'ordre et en recodant des modalités


##########################################################################
######################## Pivots ##########################################
##########################################################################


##########################################################################
####################### Enchaîner tous les traitements ###################
##########################################################################

