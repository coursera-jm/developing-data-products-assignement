#deploy.R to shinyapps.io
#https://github.com/rstudio/shinyapps/blob/master/guide/guide.md
library(shiny)
library(shinyapps)
devtools::install_github('rstudio/shinyapps')
shinyapps::setAccountInfo(name='coursera', token='EB2D9D6CEAC60722AE42E146D40D1B72', secret='VgCnPlx9z8xwEKuCu7yxdBXKgJgzQafMAQF9VlTl')
#addAuthorizedUser("jean")
#removeAuthorizedUser("andy")
deployApp()