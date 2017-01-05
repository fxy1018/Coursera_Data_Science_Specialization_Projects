#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

countries <- list("Canada", "USA", "China", "Japan")

# Define UI for application that draws a histogram
shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Currency Exchange Converter"),
        
        sidebarPanel(
            numericInput('money', 'Amount of Currency', 0) ,
            selectInput("current", "Current Currency", 
                        choices = countries),
            selectInput("foreign", "Foreign Currency",
                        choices = countries),
            sliderInput('rate', 'Other Exchange Rate', min=0, max=100, value=-1, step=0.001)
        ),
        mainPanel(
            h3('Currency Calculation Result'),
            p('Current Currency: '), verbatimTextOutput("currentCountry"),
            p('Foreign Currency: '), verbatimTextOutput("foreignCountry"),
            p('Input Money: '),   verbatimTextOutput("money_in"),
            p('Changed Money: '), verbatimTextOutput("money_out")
        )
        
    )
)
