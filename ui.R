library(shiny)


fluidPage(
  
  # Application title
  titlePanel = 'Cars to select',

  # Simple integer interval
  sidebarPanel(
    helpText("Select filters to find a suitable car"),
    checkboxGroupInput('am', 'Transmission type:', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
    checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
    sliderInput('hp', 'Horsepower', min=50, max=340, value=c(50,340), step=10)
  ),
  
  mainPanel(
  tabsetPanel(
      id = 'dataset',
      tabPanel('Selected cars', DT::dataTableOutput('cars_table'))
     )
    )
)

