library(shiny)
data(mtcars)
myfit <- lm(mpg ~ cyl+hp+wt+am, mtcars)
shinyServer(
  function(input, output) {
    output$ocyl <- renderText(as.numeric({input$cyl}))
    output$ohp <- renderText({input$hp})
    output$owt <- renderText({input$wt})
    output$oam <- renderText(c('Automatic', 'Manual')[as.numeric({input$am})+1])
    output$oprediction <- renderText({
      newdata <- data.frame(cyl=as.numeric({input$cyl}), hp={input$hp}, wt={input$wt}/1000, am=as.numeric({input$am}))
      mypred <- predict(myfit, newdata, interval='prediction', level=.95)
      paste('Your expected mpg=', round(mypred[1,1]), 
            '. With 95% confidence, your mpg is within [', 
            floor(mypred[1,2]), ', ', ceiling(mypred[1,3]), ']', sep='')
    })
  }
)