library(shiny)

# Define UI
shinyUI(pageWithSidebar(

  # Application title.
  headerPanel("Simulating Confidence Intervals"),
  sidebarPanel(
    helpText("This app is a demonstration of confidence intervals.",
             "The length of the bars are the size of the intervals.",
             "If the interval does not overlap with the population value",
             "(the black vertical line) then it is colored red to indicate a Type 1 error.",
              "Try increasing the sample size and see what happens"),
    numericInput(inputId = "nsamp", 
                 label=strong("Sample size"), 
                 value=100,
                 min=5, 
                 max=10000),
    numericInput(inputId = "mean",
                 label = strong("Population mean"),
                 value = 0,
                 min=1,
                 max=10000000),
    numericInput(inputId = "variance",
                 label = strong("Population standard deviation"),
                 value = 1,
                 min=.01,
                 max=100),
    numericInput(inputId = "conf.level",
                 label=strong("Confidence level"),
                 value = 0.95,
                 min=0.01,
                 max=0.999999),
    numericInput(inputId = "nintv", 
                 label=strong("How many intervals?"), 
                 value=100,
                 min=50, 
                 max=150)
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations. Note the use of the h4 function to provide
  # an additional header above each output section.
  mainPanel(
    plotOutput("confPlot")
  )
))




