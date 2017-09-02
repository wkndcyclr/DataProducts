library(shiny)
shinyUI(fluidPage(
      titlePanel("Fit a Linear Model for a Selected Variable"),
      sidebarLayout(
            sidebarPanel(
                  selectInput("selectx", "Choose a predictor variable", choices = mtnames, selectize = FALSE),
                  checkboxInput("showsummary", "Show Hide Model Summary", value = TRUE)
            ),
            mainPanel(
                  tabsetPanel(type = "tabs",
                  tabPanel("Application Display", br(),
                        plotlyOutput("plot1"),
                        h3("Model Summary"),
                        verbatimTextOutput(outputId = "summ1")),
                  tabPanel("Instructions", br(),
                        tags$ol(
                              tags$li("Select the predictor variable by choosing one from the dropdown in the sidebar"),
                              tags$li("Check or uncheck the box to display/hide the model summary, again in the sidebar"),
                              tags$li("Change the predictor variable or hide/unhide selection"),
                              tags$li("Explore the plot by hovering over it."),
                              tags$ul(
                                    tags$li("  - Examine any of the points or boundaries on the confidence band"),
                                    tags$li("  - Choose any of the functions in the tool bar that appears over the plot")  
                              )     
                        )
                  )
                  
                  )
            )
      )
))

