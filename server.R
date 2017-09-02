library(shiny)
library(plotly)
shinyServer(function(input, output) {
      data(mtcars)
      mtnames <- c("wt","hp","qsec","disp","drat")
      fit <- reactive({
            x <- input$selectx
            y <- "mpg"
            lmvars <- paste(y,x, sep = " ~ ")
            lm(as.formula(lmvars),  data = mtcars)
            })


      output$plot1 <- renderPlotly({
            x <- input$selectx
            y <- "mpg"
            g <- ggplot(data =  mtcars, aes_string(x = x, y = y)) +
                 geom_point() +
                 geom_smooth(method = "lm") +
                 labs(title = "Interactive Model")
            ggplotly(g)

      })


      output$summ1 <- renderPrint({
           if(input$showsummary) {summary(fit())} else {cat("Summary Not Selected")}

      })
})
