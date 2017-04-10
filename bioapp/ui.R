library(shiny)

shinyUI(fluidPage(
  titlePanel("Dane RNAseq"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("data",
                 label = "Wybierz zmutowany szczep E.coli:",
                 choices = c("PNP", "RNR"),
                 selected="PNP"),
  numericInput("obs", "Ilość istotnie zmienionych genów:", 8)),
  
  mainPanel(
    h2("Dane"),
    tableOutput("dane"),
    h5("Liczba genów"),
    verbatimTextOutput("row")
  )
  )
))