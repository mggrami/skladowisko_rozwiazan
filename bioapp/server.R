library(shiny)
odczyt<- read.csv("data/1_VS_2_16_USUNIETE_ODCZYTY_R.csv", header= TRUE, sep="\t")

shinyServer(function(input, output){
  
  output$dane <- renderTable(odczyt)
  
})
