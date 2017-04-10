library(shiny)

shinyUI(fluidPage(
  titlePanel("Dane RNAseq"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("data",
                 label = "Wybierz zmutowany szczep E.coli:",
                 choices = c("PNP", "RNR"),
                 selected="PNP"
    )
  ),
  mainPanel(
    h2("Dane"),
    tableOutput("dane")
  )
  )
))