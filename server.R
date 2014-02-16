library(shiny)

# Define server logic required
shinyServer(function(input, output) {
  output$confPlot <- renderPlot({
    
    pop.mean <- input$mean
    pop.sd <- sqrt(input$variance)
    n <- input$nsamp
    conf.lvl <- input$conf.level
    nintv <- input$nintv
    
    plot(NULL, xlim = c(pop.mean - pop.sd, pop.mean + pop.sd),
         ylim = c(1,nintv), yaxt = 'n', xlab = "", 
         ylab="", main = "")
    abline(v = pop.mean, col = "blue")
    mtext(expression(mu), cex = 2, at = pop.mean, col = "blue")
    
    for (i in 1:nintv){
      x <- rnorm(n, mean = pop.mean, sd = pop.sd)
      interval <- t.test(x, conf.level = conf.lvl)$conf.int
      if(pop.mean > interval[1] & pop.mean < interval[2]){
        lines(c(interval[1], interval[2]), c(i,i), lwd = 2, col = 'black')
      } else {
        lines(c(interval[1],interval[2]), c(i,i), lwd = 3, col = 'red' )
      } 
    }
    
  })
})