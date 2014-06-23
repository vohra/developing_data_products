library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Automobile Fuel Efficiency Prediction")
  , sidebarPanel(
    h3('Your Automobile')
    , radioButtons('cyl', 'Number of Cylinders', c('4'=4, '6'=6, '8'=8))
    , numericInput('hp', "Gross Horsepower", 150, min=50, max=500, step=1)
    , numericInput('wt', "Weight (lb)", 3000, min=1000, max=6000, step=1)
    , radioButtons('am', 'Transmission', c('Automatic'=0, 'Manual'=1))
    , submitButton('Predict', icon=icon("refresh"))
  )
  , mainPanel(
    h3('Introduction')
    , p('Using this app one can find the fuel efficency of their automobile. You
      just have give certain details about your automobile and click Predict.
      The data is extracted from 1974 Motor Trend US 
			magzine (available from the mtcars R dataset), We build a linear 
			regression model to predict fule efficiency (miles per gallon, or mpg).')
    , p('Please describe your automobile on the left, CLICK Predict button and find your predicted mpg below.')
    , p('Please ensure that the Gross Horsepower of your Automobile must be between 50 to 500. Also the 
        weight of your Automobile must be between 1000 to 6000 lb')
    , h3 ('Your Prediction Result')
    , verbatimTextOutput('oprediction')
  )
))