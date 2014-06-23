
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)


shinyUI(fluidPage(
  
  titlePanel("Quiz"),
  
  fluidRow(
    
    column(2, wellPanel(
      selectInput("input_type", "Input type",
                  c("1", "2", "3", "4"
                  )
      )
    )),
    
    column(2, wellPanel(
      # This outputs the dynamic UI component
      uiOutput("ui")
    ))
    
  )
))
