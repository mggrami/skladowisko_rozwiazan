##zabawy z danymi
###Proby
library("ggplot2")
wykresy<-ggplot(`AZBIORCZA`, aes(x= log2.fold.change, y= Name, shape=mutant, color= Name))+
  geom_point()
wykresy + scale_shape_discrete(solid=F)

### Heatmap
# Przygotowanie danych

HM<- as.data.frame(AZBIORCZA)
HM<- select(HM, Name, log2.fold.change, mutant)
HM<- as.data.frame(HM)
HM<- HM[!grepl("-", HM$Name),]
HM<- as.matrix(HM)

# Heatmap produkty

ggplot(AZBIORCZA, aes(mutant, Name))+
geom_tile(aes(fill = log2.fold.change))

## Obrobka danych

 library(plyr)
library(dplyr)
library(tidyr)
##Zmiany w danych
###PNP
PNP.WT<- rename(`1_VS_2_16_USUNIETE_ODCZYTY_R`, c("fold_change_PNP.WT"="fold.change","log2_fold_change_PNP.WT"="log2.fold.change"))
PNP<- c(rep("PNP", 16))
PNP.WT$mutant<- PNP

###RNB
RNB.WT<- rename(`1_VS_3_47_USUNIETE_ODCZYTY_R`, c("fold_change_RNB.WT"="fold.change", "log2_fold_change_RNB.WT"="log2.fold.change"))
RNB<-c(rep("RNB", 47))
RNB.WT$mutant<-RNB

###RNR
names(`1_VS_4_62_USUNIETE_ODCZYTY_R`)[names(`1_VS_4_62_USUNIETE_ODCZYTY_R`)=="fold_change_RNR.WT"]<-"fold.change"
names(`1_VS_4_62_USUNIETE_ODCZYTY_R`)[names(`1_VS_4_62_USUNIETE_ODCZYTY_R`)=="log2_fold_change_RNR.WT"]<-"log2.fold.change"
RNR.WT<-`1_VS_4_62_USUNIETE_ODCZYTY_R`
RNR<-c(rep("RNR", 62))
RNR.WT$mutant<-RNR

##merge
MUTACJE<- full_join(PNP.WT,RNB.WT)
AZBIORCZA<- full_join(MUTACJE, RNR.WT)
