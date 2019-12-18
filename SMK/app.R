# UI for SMK app

library(shiny)
source("SMK.R")

# Define UI allows you to select a villain and the app returns a list of spells that will act against its weakness

ui <- fluidPage(

    # App title
    titlePanel(h1("Sorcerers of the Magic Kingdom")),

    # Sidebar with the button to select the villain
    sidebarLayout(

        # inputs on sidebar
        sidebarPanel(h4("Select Villain:")),

        # Input: select a villain
        #selectInput()

        mainPanel(h3("Spells to use:"),
                  p(strong("The following spells will work well:"))
                  )
    )
)



# Server for SMK app

library(shiny)

server <- function(input, output){

    # create the dataset
}


shinyApp(ui = ui, server = server)
