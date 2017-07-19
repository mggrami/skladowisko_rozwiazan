library(dplyr)
odczyt<- read.csv("data/1_VS_2_16_USUNIETE_ODCZYTY_R.csv", header= TRUE, sep="\t")
odczyt1<-data.frame()
odczyt2<- read.csv("data/1_VS_3_47_USUNIETE_ODCZYTY_R.csv", header = TRUE, sep="\t")
odczyt3<- read.csv("data/1_VS_4_62_USUNIETE_ODCZYTY_R.csv", header = TRUE, sep ="\t")

odczyt2%>%
  select(Transcription.Start, Transcription.Stop, Translation.Start, Translation.Stop, 
         Strand, Name, Synonym, Normalized.Counts.1, Normalized.Counts.3, Expression.1, 
         Expression.3, pValue.1.vs.3, qValue.1.vs.3) -> 
  odczyt1

odczyt1%>%
  mutate(logNormalized.Counts = log(Normalized.Counts.3/Normalized.Counts.1, base = 2)) ->
  odczyt1

write.table(odczyt1, "~/Dokumenty/SHINY/Aplikacja_02/data/1_VS_3_47_USUNIETE_ODCZYTY_R.csv", row.names = FALSE, col.names = TRUE, sep = "\t")
