library(shiny)

# Define server logic required
shinyServer(function(input, output) {
  output$lilPlot <- renderPlot({

    pop.mean <- input$mean
    pop.sd <- sqrt(input$variance)
    n <- input$nsamp
    conf.lvl <- input$conf.level
    
    plot(NULL, xlim = c(pop.mean - pop.sd, pop.mean + pop.sd),
         ylim = c(0,100), yaxt = 'n', xlab = (conf.lvl), 
         ylab=(n), main="100 Replicated Confidence Intervals")
    abline(v = pop.mean, col = 'black')
    
    for (i in 1:100){
      x <- rnorm(n, mean = pop.mean, sd = pop.sd)
      test <- t.test(x, conf.level = conf.lvl)
      interval <- test$conf.int
      if(pop.mean > interval[1] & pop.mean < interval[2])
      {lines(c(interval[1], interval[2]), c(i,i), lwd = 2, col = 'black')}
      else
      {lines(c(interval[1],interval[2]), c(i,i), lwd=2, col = 'red' )} 
    }
    
    
  })
})