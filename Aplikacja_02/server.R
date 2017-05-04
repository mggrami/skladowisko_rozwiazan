library(DT)
library(plotly)
library(ggplot2)
odczyt<- read.csv("data/1_VS_2_16_USUNIETE_ODCZYTY_R.csv", header= TRUE, sep="\t")
odczyt2<- read.csv("data/1_VS_3_47_USUNIETE_ODCZYTY_R.csv", header = TRUE, sep="\t")
odczyt3<- read.csv("data/1_VS_4_62_USUNIETE_ODCZYTY_R.csv", header = TRUE, sep ="\t")

shinyServer(function(input, output){
  
  dataInput<- reactive({
    switch (input$data,
      "PNP" = odczyt,
      "RNR" = odczyt2,
      "RNB" = odczyt3)
  })
  output$dane2 <- renderDataTable(dataInput(), 
                                  options = list(pageLength= 6), class = "compact",
                                  filter = "top"
                                  )
  
  output$wizual <- renderPlotly({
   wykres<- plot_ly(dataInput(),
            x= ~logNormalized.Counts, y=~Name
            )
   
   wykres2<- subplot(
     wykres %>% add_histogram2d()
   )
  })
output$izolacja <-isolate(odczyt)
})
