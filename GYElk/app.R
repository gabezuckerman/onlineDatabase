# define some credentials
credentials <- data.frame(
    user = c("g"), # mandatory
    password = c("test"), # mandatory
    admin = c(TRUE),
    comment = "Simple and secure authentification mechanism 
  for single ‘Shiny’ applications.",
    stringsAsFactors = FALSE
)

library(shiny)
library(shinymanager)
library(data.table)
library(tidyverse)

ui <- fluidPage(
    tags$h2("Middleton lab elk database"),
    
    sidebarPanel(
        helpText("Choose which data you want to download"),
        
        selectInput("herds", 
                    label = "Choose one or more herds",
                    choices = c(unique(fread("animals.csv")$commonHerd), "all"),
                    selected = "Cody",
                    multiple = T),
        
        sliderInput("DatesMerge",
                    "Dates:",
                    min = as.Date("2016-01-01","%Y-%m-%d"),
                    max = as.Date("2016-12-01","%Y-%m-%d"),
                    timeFormat="%Y-%m-%d",
                    value = c(as.Date("2016-01-01","%Y-%m-%d"), as.Date("2016-12-01","%Y-%m-%d")))
    ),
    actionButton("button", "Run!"),
    
    
    mainPanel(dataTableOutput("mytable")),
    downloadButton("down", label = "Download")
    
)

# Wrap your UI with secure_app
ui <- secure_app(ui)


server <- function(input, output, session) {
    
    # call the server part
    # check_credentials returns a function to authenticate users
    res_auth <- secure_server(
        check_credentials = check_credentials(credentials)
    )
    
    output$auth_output <- renderPrint({
        reactiveValuesToList(res_auth)
    })
    
    datasetInput <- reactive({
        iris
    })
    
    observeEvent(input$button,
                 {
                     output$mytable <- renderDataTable(datasetInput(), options = list(pageLength = 5))
                 }
                 )
    
    output$downloadData <- downloadHandler(
        filename = function() {
            paste(paste0(input$herds), ".csv", sep = "")
        },
        content = function(file) {
            fwrite(datasetInput(), datasetInput())
        }
    )
    
}

shinyApp(ui, server)