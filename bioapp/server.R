library(shiny)
odczyt<- read.csv("data/1_VS_2_16_USUNIETE_ODCZYTY_R.csv", header= TRUE, sep="\t")
odczyt2<- read.csv("data/1_VS_3_47_USUNIETE_ODCZYTY_R.csv", header = TRUE, sep="\t")

shinyServer(function(input, output){
  
  dataInput<- reactive({
    switch (input$data,
      "PNP" = odczyt,
      "RNR" = odczyt2)
  })
  output$dane <-renderTable(
    {head(dataInput(), n=10)})
})
