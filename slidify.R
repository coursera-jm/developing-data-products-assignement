require(devtools)
#install_github("slidify", "ramnathv")
#install_github("slidifyLibraries", "ramnathv")
library(slidify)
getwd()
#setwd("..")
author("assignement2") # published in gh-branch
slidify("index.Rmd")
publish(username = "coursera-jm", repo = "developing-data-products-assignement")
