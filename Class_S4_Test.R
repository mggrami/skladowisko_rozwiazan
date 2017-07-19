# S4 Class
library(purrr)

##  Dane
odczyt <- read.csv2("NC_000913_transcripts.csv", header = TRUE, sep = "\t", dec = ",")

##  Klasa
setClass("Coli_S4",
         slots = list(genes = "factor",
                      expression_wt = "integer",
                      expression_mu = "integer"))

dane_EC <- new("Coli_S4", genes = odczyt$Name, expression_wt = odczyt$Normalized.Counts.WT,
               expression_mu = odczyt$Normalized.Counts.PNP)

##  Metoda
setGeneric("zmiana_ekspresji", function(x){
  standardGeneric("zmiana_ekspresji")
})

setMethod("zmiana_ekspresji",
          c(x = "Coli_S4"),
          function(x){
          map2_chr(log(x@expression_mu  / x@expression_wt, base = 2), x@genes, paste)
          })

zmiana_ekspresji(dane_EC)
