# server.R
source("helpers.R") 
counties <- readRDS("data/counties.rds")
library(maps) 
library(mapproj)


shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      
      data = switch(input$var,
                    "Percent White" = counties$white,
                    "Percent Black" = counties$black,
                    "Percent Hispanic" = counties$hispanic,
                    "Percent Asian" = counties$asian
                    )
      
      label = switch(input$var,
                     "Percent White" = "White Percentage",
                     "Percent Black" = "Black Percentage",
                     "Percent Hispanic" = "Hispanic Percentage",
                     "Percent ASian" = "Asian Percentage")
      
      percent_map(data, "blue", label, input$range[1], input$range[2])
    })
      
  }
)
    