
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
#Beta  beta	
#Lognormal	lnorm
#Binomial	binom	
#Negative Binomial	nbinom
#Cauchy	cauchy	
#Normal	norm
#Chisquare	chisq	
#Poisson	pois
#Exponential	exp	
#Student t	t
#F	f	
#Uniform	unif
#Gamma	gamma	
#Tukey	tukey
#Geometric	geom	
#Weibull	weib
#Hypergeometric	hyper	
#Wilcoxon	wilcox
#Logistic	logis	 
#
# http://www.rstudio.com/shiny/
#

library(shiny)

mean_sd <- function() {
  wellPanel(
    numericInput("mean", "Mean:", 0),
    numericInput("sd", "Standard Deviation:", 1, min=0),
    sliderInput("range", "Range:",
                min = -20, max = 20, value = c(-5,5))
  )
}

lambda <- function() {
  wellPanel(
    numericInput("lambda", "Lambda:", 1),
    sliderInput("range", "Range:",
              min = -20, max = 20, value = c(-5,5))
  )
}

df_ncp <- function() {
  wellPanel(
    numericInput("df", "Degrees of Freedom:", 1, min=0),
    numericInput("ncp", "Non-centrality parameter:", 0, min=0),
    sliderInput("range", "Range:",
                min = -20, max = 20, value = c(-5,5))
  )
}

p_f <- function() {
  wellPanel(
    numericInput("df1", "Degrees of Freedom:", 1, min=0),
    numericInput("df2", "Degrees of Freedom:", 1, min=0),
    numericInput("ncp", "Non-centrality parameter:", 0, min=0),
    sliderInput("range", "Range:",
                min = -20, max = 20, value = c(-5,5))
  )
}

p_hyper <- function() {
  wellPanel(
    numericInput("m", "Number of white balls:", 1, min=0),
    numericInput("n", "Number of black balls:", 1, min=0),
    numericInput("k", "Number of balls drawn:", 10, min=0),
    sliderInput("range", "Range:",
                min = -20, max = 20, value = c(-5,5))
  )
}

p_binom <- function () {
  wellPanel(
    numericInput("size", "Number of trials:", 1000, min=0, step=100),
    numericInput("prob", "probability of success on each trial:", .5, min=0, max=1),
    sliderInput("range", "Range:",
                min = -1000, max = 1000, value = c(400,600))
  )
}

min_max <- function() {
  wellPanel(
    numericInput("mn", "Minimum:", 0),
    numericInput("mx", "Maximum:", 1),
    sliderInput("range", "Range:",
                min = -100, max = 100, value = c(-10,10))
  )
}

getParams <- function(input) {
  switch(input$fun,
         "binom" = return (list(size=input$size,prob=input$prob)),
         "chisq" = return (list(df=input$df,ncp=input$ncp)),
         "f"     = return (list(df1=input$df1,df2=input$df2,ncp=input$ncp)),
         "norm"  = return (list(mean=input$mean,sd=input$sd)),
         "hyper" = return (list(m=input$m,n=input$n,k=input$k)),
         "pois"  = return (list(lambda=input$lambda)),
         "t"     = return (list(df=input$df,ncp=input$ncp)),
         "unif"  = return (list(min=input$mn,mx=input$max)),
         return (list(0,1))
  )
}
  
plotDensity <- function(input) {
  n <- input$n
  range <- input$range
  if (is.null(input$range) || is.null(input$type)) return()
  x <- seq(range[1], range[2], length=n)
  
  if (input$type == "cum") {
    switch(input$fun,
           "binom" = plot(function(x) pbinom(x, size=as.numeric(input$size), prob=as.numeric(input$prob)), range[1], range[2], col="red"),
           "chisq" = plot(function(x) pchisq(x, df=as.numeric(input$df), ncp=as.numeric(input$ncp)), col="red"),
           "f"     = plot(function(x) pf(x, df1=as.numeric(input$df1), df2=as.numeric(input$df2), ncp=as.numeric(input$ncp)), range[1], range[2], col="red"),
           "norm"  = plot(function(x) pnorm(x, mean=as.numeric(input$mean), sd=as.numeric(input$sd)), range[1], range[2], col="red"),
           #"norm"  = y <- pnorm(x, mean=as.numeric(input$mean), sd=as.numeric(input$sd)),
                    # ff <- function(x) pnorm(x, mean=as.numeric(input$mean), sd=as.numeric(input$sd)),
           "hyper" = plot(function(x) phyper(x, m=as.numeric(input$m), n=as.numeric(input$n), k=as.numeric(input$k)), range[1], range[2], col="red"),
           "pois"  = plot(function(x) ppois(x, lambda=as.numeric(input$lambda)), range[1], range[2], col="red"),
           "t"     = plot(function(x) pt(x, df=as.numeric(input$df),ncp=as.numeric(input$ncp)), range[1], range[2], col="red"),
           "unif"  = plot(function(x) punif(x,min=as.numeric(input$mn),max=as.numeric(input$mx)), range[1], range[2], col="red"),
           plot(function(x) pnorm(x), range[1], range[2], col="red")
    )
    #if (length(x) == length(y)) 
    ##  plot(x, y,  lty=2, xlab="x value", xlim=range, col="red", type="l",
    #       ylab="Density", main=paste(input$fun,"Distribution"))
      
    #curve(pnorm(x), add = TRUE, col = "red", lwd = 2)
  } else {
    switch(input$fun,
           "binom" = y <- dbinom(x, size=as.numeric(input$size), prob=as.numeric(input$prob)),
           "chisq" = y <- dchisq(x, df=as.numeric(input$df), ncp=as.numeric(input$ncp)),
           "f"     = y <- df(x, df1=as.numeric(input$df1), df2=as.numeric(input$df2), ncp=as.numeric(input$ncp)),
           "norm"  = y <- dnorm(x, mean=as.numeric(input$mean), sd=as.numeric(input$sd)),
             #ff <- fonction(x) dnorm(x, mean=as.numeric(input$mean), sd=as.numeric(input$sd)),
           "hyper" = y <- dhyper(x, m=as.numeric(input$m), n=as.numeric(input$n), k=as.numeric(input$k)),
           "pois"  = y <- dpois(x, lambda=as.numeric(input$lambda)),
           "t"     = y <- dt(x, df=as.numeric(input$df),ncp=as.numeric(input$ncp)),
           "unif"  = y <- dunif(x,min=as.numeric(input$mn),max=as.numeric(input$mx)),
#           "norm"  = p <- rnorm(100, 0, 1), #input$n, input$mean, input$sd),
             # curve(dnorm(x, mean=input$mean, sd=input$sd), col = "red",range[1], range[2]),
           plot(function(x) dnorm(x), range[1], range[2], col="red")
    )

    if (length(x) == length(y)) {
      plot(x, y,  lty=2, xlab="x value", xlim=range, col="red", type="l",
           ylab="Density", main=paste(input$fun,"Distribution"))
    } else {
      p("The graph cannot be generated with these parameters.")
    }
    #plot(ff, range[1], range[2], col="red")
    
    #legend("topright", inset=.05, title="Distributions",
    #       labels, lwd=2, lty=c(1, 1, 1, 1, 2), col=colors)
  }
}



format_list <- function (l){
  ret <- "Params:"
  for (i in names(l)) {
    ret <- paste(ret,i)
    ret <- paste(ret,l[i],sep="=")
  }
  return (ret)
}
#format_list(list(q=2,b=3)) # ==> "Params: q=2 b=3"


shinyServer(function(input, output) {
   
  output$plot <- renderPlot({
    plotDensity(input)
  })
  
  
  output$fun1 <- renderText({
    input$fun
  })
  
  output$fun2 <- renderPrint({
    str(input$fun)
  })
  
  output$params <- renderText({
    format_list(getParams(input))
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

