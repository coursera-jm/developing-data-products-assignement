
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

mean_sd <- function() {
  wellPanel(
    numericInput("mean", "Mean:", 0),
    numericInput("sd", "Standard Deviation:", 1)
  )
}

lambda <- function() {
  numericInput("lambda", "Lambda:", 1)
}

df_ncp <- function() {
  wellPanel(
    numericInput("df", "Degrees of Freedom:", 1),
    numericInput("ncp", "Non-centrality parameter:", 0)
  )
}

p_f <- function() {
  wellPanel(
    numericInput("df1", "Degrees of Freedom:", 1),
    numericInput("df2", "Degrees of Freedom:", 1),
    numericInput("ncp", "Non-centrality parameter:", 0)
  )
}

p_hyper <- function() {
  wellPanel(
    numericInput("m", "Number of white balls:", 1),
    numericInput("n", "Number of black balls:", 1),
    numericInput("k", "Number of balls drawn:", 10)
    
  )
}

p_binom <- function () {
  wellPanel(
    numericInput("size", "Number of trials:", 10),
    numericInput("prob", "probability of success on each trial:", .5)
  )
}

min_max <- function() {
  wellPanel(
    numericInput("min", "Minimum:", 0),
    numericInput("max", "Maximum:", 1)
  )
}

plotDensity <- function(type, FUN, n=100, range=c(-1,1), params) {
  if (type == "cum") {
      plot(function(x) do.call(paste("p",FUN,sep=""),list(x)), range[1], range[2])
      #plot(function(x) pnorm(x), range[1], range[2], main = " Cumulative")
      curve(pnorm(x), add = TRUE, col = "red", lwd = 2)
      #density(p)
  } else {
      #p <- do.call(paste("r",FUN,sep=""), params) # For duration data I assume Poisson distributed
      #plot(p, range[1], range[2], # function(x) dnorm(x)
      #   main = paste("Density of",FUN))
#      hist(p,
#         probability = TRUE, # In stead of frequency
#         breaks = "FD",      # For more breaks than the default
#         col = "darkslategray4", border = "seashell3")
#      lines(density(p - 0.5),   # Add the kernel density estimate (-.5 fix for the bins)
#          col = "firebrick2", lwd = 3)
      plot(function(x) dnorm(x), range[1], range[2],
           main = paste("Density of",FUN))
      curve(dnorm(x), add = TRUE, col = "red", lwd = 2)
  }
}

getParams <- function(input) {
  switch(input$fun,
         "binom" = return (list("size"=input$size,"prob"=input$prob)),
         "chisq" = return (list("df"=input$df,"ncp"=input$ncp)),
         "f"     = return (list("df1"=input$df1,"df2"=input$df2,"ncp"=input$ncp)),
         "norm"  = return (list(input$mean,input$sd)),
         "hyper" = return (list(input$m,input$n,input$k)),
         "pois"  = return (list(input$lambda)),
         "t"     = return (list("df"=input$df,input$ncp)),
         "unif"  = return (list(input$min,input$max)),
         return (list(0,1))
  )
}

shinyServer(function(input, output) {
   
  output$plot <- renderPlot({
     
    input$goButton

    # generate and plot an rnorm distribution with the requested
    # number of observations
    #  hist(rnorm(input$n))
    plotDensity(input$type, input$fun, input$n, input$range, getParams(input))
  })
  
  
  output$fun1 <- renderText({
    input$fun
  })
  
  output$fun2 <- renderPrint({
    str(input$fun)
  })
  
  output$params <- renderPrint({
    str(getParams(input))
  })
  
  output$ui <- renderUI({
    switch(input$fun,
                "binom" = p_binom(),
                "chisq" = df_ncp(),
                "f" = p_f(),
                "norm" = mean_sd(),
                "hyper" = p_hyper(),
                "pois" = lambda(),
                "t" = df_ncp(),
                "unif" = min_max(),
                helpText("Not supported - please edit ui.R")
         )
  })
})

