#install.packages("devtools")
require(devtools)
#install_github('slidify','ramnathv')
#install_github('slidifyLibraries','ramnathv')
library(slidify)
#install_github('rCharts', 'ramnathv')
#install_github('shiny', 'rstudio')

getwd()
#setwd("..")

author("assignement2") # published in gh-branch
slidify("index.Rmd")
browseURL("index.html")
publish(username = "coursera-jm", repo = "developing-data-products-assignement")

