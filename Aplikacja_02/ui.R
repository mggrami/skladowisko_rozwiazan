shinyUI(fluidPage(
  titlePanel("Zaawansowane Shiny"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("data",
                  label = "Wybierz zmutowany szczep E.coli:",
                  choices = c("PNP", "RNR", "RNB"),
                  selected="PNP")
    ),
  mainPanel(
    h2("Dane"),
    
    dataTableOutput("dane2"),
    
    plotlyOutput("wizual")
    
  )
)
))

