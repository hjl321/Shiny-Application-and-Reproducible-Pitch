library(shiny)
library(dplyr)

function(input, output) {
  
  output$cars_table <- DT::renderDataTable({
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      Cylinders = cyl, Horsepower = hp, 
                      Transmission = am)
    data <- filter(data, Cylinders %in% input$cyl, Horsepower %in% hp_seq, Transmission %in% input$am)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data
  }, options = list(lengthMenu = c(5, 25, 100), pageLength = 25), filter = 'top')

}

