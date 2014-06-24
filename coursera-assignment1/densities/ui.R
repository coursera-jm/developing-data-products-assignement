
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
      p("The plot is updated each time a parameter changes."),
      p(" Please wait until the screen refreshes before changing another parameter.")      
    ))
  ),
  fluidRow(
    column(4,
           helpText("Please select a probability density function. The parameters on the central panel will change according to the function chosen."),
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
                      )
    ),
    column(4, 
  #    helpText(paste("Please select the corresponding parameters:")),
      # This outputs the dynamic UI component
      uiOutput("ui")
    ),
    column(4,
           sliderInput("n", "Number of observations:", 
                       min = 1, 
                       max = 500, 
                       value = 100,
                       step  = 10),
           br(),
           helpText("Selected Parameters:"),
           verbatimTextOutput("params")
           
    )
  ),
  fluidRow(
      column(12,
           plotOutput("plot")
    )
  )
))


