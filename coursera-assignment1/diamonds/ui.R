library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
  headerPanel("Example plot"),
  sidebarPanel(
    h1("1"),h2("2"),
    textInput(inputId="text1", label = "Input Text1"),
    numericInput('id1','pds',0,min=0,max=9),
    #checkboxGroupInput
    dateInput('ds',"id2:"),
    sliderInput('mu', 'Guess at the mu',value = 70, min = 60, max = 80, step = 0.05,),
    submitButton('Submit')
  ),
  mainPanel(
    h4('You entered'),
    verbatimTextOutput("oid1"),
    h4('You entered'),
    verbatimTextOutput("oid2"),
    code('some code'),
    p('some ordinary text'),
    plotOutput('myHist')
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
