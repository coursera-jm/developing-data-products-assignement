
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Probability density function"),
  
  fluidRow(
    column(12, wellPanel(
      p("The plot is update each time a parameter changes."),
      p(" Please wait until the screen refreshes before changing another parameter.")      
    ))
  ),
  fluidRow(
    column(4,
           helpText("Please select a probability density function:"),
           selectInput("fun", "Function",
                 choices = c("binomial" = "binom",
                             "chi-squared" = "chisq",
                             "F" = "f",
                             "hypergeometric" = "hyper",
                             "normal" = "norm",
                             "Poisson" = "pois",
                             "Student's t" = "t",
                             "uniform" = "unif"),
                 selected = "norm"
          ),
          #              "x2", "x3", "sin"
          selectInput("type", "Type",
                      choices = c("density" = "ncum",
                                  "cumulative" = "cum"
                                  ),
                      selected = "ncum"
                      ),
          verbatimTextOutput("params")
    ),
    column(4, 
      helpText(paste("Please select the corresponding parameters:")),
      # This outputs the dynamic UI component
      uiOutput("ui")
    ),
    column(2,
           sliderInput("n", "Number of observations:", 
                       min = 1, 
                       max = 500, 
                       value = 100,
                       step  = 10)
    ),
    column(2,
           # Specification of range within an interval
            sliderInput("range", "Range:",
                min = -20, 
                max = 20, 
                value = c(-5,5))
    )
  ),
  fluidRow(
      column(12,
           plotOutput("plot")
    )
  )
))


