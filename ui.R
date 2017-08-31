library(shiny)
shinyUI(fluidPage(
      titlePanel("Fit a Linear Model for a Selected Variable"),
      sidebarLayout(
            sidebarPanel(
                  selectInput("selectx", "Choose a predictor variable", choices = mtnames, selectize = FALSE),
                  checkboxInput("showsummary", "Show Hide Model Summary", value = TRUE)
            ),
            mainPanel(
                  plotlyOutput("plot1"),
                  h3("Model Summary"),
                  verbatimTextOutput(outputId = "summ1")
            )
      )
))
