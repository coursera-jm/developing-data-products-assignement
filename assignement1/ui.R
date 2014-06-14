library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
  headerPanel("Example plot"),
  sidebarPanel(
    sliderInput('mu', 'Guess at the mu',value = 70, min = 60, max = 80, step = 0.05,)
  ),
  mainPanel(
    plotOutput('newHist')
  )
))


# diamonds <- diamonds[c('carat','color','price')]
# dataset <- diamonds
# 
# shinyUI(pageWithSidebar(
#   
#   headerPanel("Diamonds Explorer"),
#   
#   sidebarPanel(
#     
#     sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
#                 value=min(1000, nrow(dataset)), step=500, round=0),
#     
#     selectInput('x', 'X', names(dataset), 'carat'),
#     selectInput('y', 'Y', names(dataset), 'price'),
#     selectInput('color', 'Color', c('None', names(dataset)), 'color'),
#     
#     checkboxInput('jitter', 'Jitter'),
#     checkboxInput('smooth', 'Smooth', value=T)
#     
#   ),
#   
#   mainPanel(
#     plotOutput('plot')
#   )
# ))
# 
