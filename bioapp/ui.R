library(shiny)

shinyUI(fluidPage(
  titlePanel("Dane RNAseq"),
  
   mainPanel(
    tableOutput("dane")
  )
))