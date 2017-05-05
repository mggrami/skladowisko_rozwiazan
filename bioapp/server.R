library(shiny)
library(ggplot2)
odczyt<- read.csv("data/1_VS_2_16_USUNIETE_ODCZYTY_R.csv", header= TRUE, sep="\t")
odczyt2<- read.csv("data/1_VS_3_47_USUNIETE_ODCZYTY_R.csv", header = TRUE, sep="\t")

shinyServer(function(input, output){
  
  dataInput<- reactive({
    switch (input$data,
      "PNP" = odczyt,
      "RNR" = odczyt2)
  })
  output$row<- renderPrint({
    liczba<- dataInput()
    nrow(liczba)
  })
  output$dane <-renderTable(
    {head(dataInput(), n=input$obs)})
  
  wyboryInput<- reactive({
    switch(input$wybory,
           "Transcription Start"= dataInput()$Transcription.Start,	"Translation Start"= dataInput()$Translation.Start,	"Translation Stop"= dataInput()$Translation.Stop,	"Transcription Stop"= dataInput()$Transcription.Stop,	"Strand"= dataInput()$Strand,	"Name"= dataInput()$Name,	"Synonym"= dataInput()$Synonym,	"Product"= dataInput()$Product,	"Raw Counts 1"= dataInput()$Raw.Counts.1,	"Normalized Counts 1"= dataInput()$Normalized.Counts.1,	"RPKM 1"= dataInput()$RPKM.1,	"Expression 1"= dataInput()$Expression.1,	"Raw Counts 2"= dataInput()$Raw.Counts.2,	"Normalized Counts 2"= dataInput()$Normalized.Counts.2,	"RPKM 2"= dataInput()$RPKM.2,	"Expression 2"= dataInput()$Expression.2,	"Raw Counts 3"= dataInput()$Raw.Counts.3,	"Normalized Counts 3"= dataInput()$Normalized.Counts.3,	"RPKM 3"= dataInput()$RPKM.3,	"Expression 3"= dataInput()$Expression.3,	"Raw Counts 4"= dataInput()$Raw.Counts.4,	"Normalized Counts 4"= dataInput()$Normalized.Counts.4,	"RPKM 4"= dataInput()$RPKM.4,	"Expression 4"= dataInput()$Expression.4,	"pValue 1 vs 2"= dataInput()$pValue.1.vs.2,	"qValue 1 vs 2"= dataInput()$qValue.1.vs.2,	"pValue 1 vs 3"= dataInput()$pValue.1.vs.3,	"qValue 1 vs 3"= dataInput()$qValue.1.vs.3,	"pValue 1 vs 4"= dataInput()$pValue.1.vs.4,	"qValue 1 vs 4"= dataInput()$qValue.1.vs.4,	"pValue 2 vs 3"= dataInput()$pValue.2.vs.3,	"qValue 2 vs 3"= dataInput()$qValue.2.vs.3,	"pValue 2 vs 4"= dataInput()$pValue.2.vs.4,	"qValue 2 vs 4"= dataInput()$qValue.2.vs.4,	"pValue 3 vs 4"= dataInput()$pValue.3.vs.4,	"qValue 3 vs 4"= dataInput()$qValue.3.vs.4,	"fold.change"= dataInput()$fold.change,	"log2.fold.change"= dataInput()$log2.fold.change)
  })
  
  wybory2Input<- reactive({
    switch(input$wybory2,
           "Transcription Start"= dataInput()$Transcription.Start,	"Translation Start"= dataInput()$Translation.Start,	"Translation Stop"= dataInput()$Translation.Stop,	"Transcription Stop"= dataInput()$Transcription.Stop,	"Strand"= dataInput()$Strand,	"Name"= dataInput()$Name,	"Synonym"= dataInput()$Synonym,	"Product"= dataInput()$Product,	"Raw Counts 1"= dataInput()$Raw.Counts.1,	"Normalized Counts 1"= dataInput()$Normalized.Counts.1,	"RPKM 1"= dataInput()$RPKM.1,	"Expression 1"= dataInput()$Expression.1,	"Raw Counts 2"= dataInput()$Raw.Counts.2,	"Normalized Counts 2"= dataInput()$Normalized.Counts.2,	"RPKM 2"= dataInput()$RPKM.2,	"Expression 2"= dataInput()$Expression.2,	"Raw Counts 3"= dataInput()$Raw.Counts.3,	"Normalized Counts 3"= dataInput()$Normalized.Counts.3,	"RPKM 3"= dataInput()$RPKM.3,	"Expression 3"= dataInput()$Expression.3,	"Raw Counts 4"= dataInput()$Raw.Counts.4,	"Normalized Counts 4"= dataInput()$Normalized.Counts.4,	"RPKM 4"= dataInput()$RPKM.4,	"Expression 4"= dataInput()$Expression.4,	"pValue 1 vs 2"= dataInput()$pValue.1.vs.2,	"qValue 1 vs 2"= dataInput()$qValue.1.vs.2,	"pValue 1 vs 3"= dataInput()$pValue.1.vs.3,	"qValue 1 vs 3"= dataInput()$qValue.1.vs.3,	"pValue 1 vs 4"= dataInput()$pValue.1.vs.4,	"qValue 1 vs 4"= dataInput()$qValue.1.vs.4,	"pValue 2 vs 3"= dataInput()$pValue.2.vs.3,	"qValue 2 vs 3"= dataInput()$qValue.2.vs.3,	"pValue 2 vs 4"= dataInput()$pValue.2.vs.4,	"qValue 2 vs 4"= dataInput()$qValue.2.vs.4,	"pValue 3 vs 4"= dataInput()$pValue.3.vs.4,	"qValue 3 vs 4"= dataInput()$qValue.3.vs.4,	"fold.change"= dataInput()$fold.change,	"log2.fold.change"= dataInput()$log2.fold.change)
  })
  
  output$plot1 <- renderPlot({
    ggplot(dataInput(), aes(x=wyboryInput(), y=wybory2Input()))+ geom_point()+
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
  })
})
