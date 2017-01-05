#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
c1 <- c("Canada", "USA", "China", "Japan", "Canada","Canada","Canada","USA",   "USA",   "USA",  "China",  "China","China", "Japan","Japan","Japan")
c2 <- c("Canada", "USA", "China", "Japan", "USA",   "China", "Japan", "Canada","China", "Japan","Canada", "USA",  "Japan","Canada", "USA", "China")
rate <- c(1,      1,     1,        1,      0.74,    5.17,     87.70,  1.35,    6.96,    117.97,  0.19,    0.14,   16.96,    0.011,  0.0085, 0.058)
tab <- data.frame(c1 = c1, c2=c2, rate=rate)


exchange_fun <- function(curr, foreign, money, rate = 0){
    if (rate != 0 ){
        return(money*rate)
    }
    else{
        filter <- tab$c1 == curr & tab$c2 == foreign
        rate <- tab[filter,][,3]
        return(money*rate)
    }
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$currentCountry <- renderPrint({input$current})
    output$foreignCountry <- renderPrint({input$foreign})
    output$money_in <- renderPrint({input$money})
    output$money_out <- renderPrint({exchange_fun(input$current, input$foreign,input$money, input$rate)})
    
})

