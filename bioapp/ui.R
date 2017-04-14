library(shiny)

shinyUI(fluidPage(
  titlePanel("Dane RNAseq"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("data",
                 label = "Wybierz zmutowany szczep E.coli:",
                 choices = c("PNP", "RNR"),
                 selected="PNP"),
  numericInput("obs", "Ilość istotnie zmienionych genów:", 8),
  selectInput("wybory",
              label= "Wybierz wartość X:",
              choices = c("Transcription Start",	"Translation Start",	"Translation Stop",	"Transcription Stop",	"Strand",	"Name",	"Synonym",	"Product",	"Raw Counts 1",	"Normalized Counts 1",	"RPKM 1",	"Expression 1",	"Raw Counts 2",	"Normalized Counts 2",	"RPKM 2",	"Expression 2",	"Raw Counts 3",	"Normalized Counts 3",	"RPKM 3",	"Expression 3",	"Raw Counts 4",	"Normalized Counts 4",	"RPKM 4",	"Expression 4",	"pValue 1 vs 2",	"qValue 1 vs 2",	"pValue 1 vs 3",	"qValue 1 vs 3",	"pValue 1 vs 4",	"qValue 1 vs 4",	"pValue 2 vs 3",	"qValue 2 vs 3",	"pValue 2 vs 4",	"qValue 2 vs 4",	"pValue 3 vs 4",	"qValue 3 vs 4",	"fold.change",	"log2.fold.change"),
              selected = "Transcription Start"),
  selectInput("wybory2",
              label= "Wybierz wartość Y:",
              choices = c("Transcription Start",	"Translation Start",	"Translation Stop",	"Transcription Stop",	"Strand",	"Name",	"Synonym",	"Product",	"Raw Counts 1",	"Normalized Counts 1",	"RPKM 1",	"Expression 1",	"Raw Counts 2",	"Normalized Counts 2",	"RPKM 2",	"Expression 2",	"Raw Counts 3",	"Normalized Counts 3",	"RPKM 3",	"Expression 3",	"Raw Counts 4",	"Normalized Counts 4",	"RPKM 4",	"Expression 4",	"pValue 1 vs 2",	"qValue 1 vs 2",	"pValue 1 vs 3",	"qValue 1 vs 3",	"pValue 1 vs 4",	"qValue 1 vs 4",	"pValue 2 vs 3",	"qValue 2 vs 3",	"pValue 2 vs 4",	"qValue 2 vs 4",	"pValue 3 vs 4",	"qValue 3 vs 4",	"fold.change",	"log2.fold.change"),
              selected = "Transcription Start")
  ),
  
  mainPanel(
    h2("Dane"),
    tableOutput("dane"),
    h5("Liczba genów"),
    verbatimTextOutput("row"),
    plotOutput("plot1")
  )
  )
))