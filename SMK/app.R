# UI for SMK app

library(shiny)
library(DT)
source("SMK.R")

# Define UI allows you to select a villain and the app returns a list of spells that will act against its weakness

ui <- fluidPage(

    # App title
    titlePanel(h1("Sorcerers of the Magic Kingdom")),

    # Sidebar with the button to select the villain
    sidebarLayout(

        # inputs on sidebar
        sidebarPanel(h4("Select Villain:"),

        # Input: select a villain
        selectInput("villains",
                    label = NULL,
                    # multiple = TRUE,
                    # selectize = TRUE,
                    choices = list("Jasper",
                                   "Cruella de Vil",
                                   "Iago",
                                   "Jafar's Snake",
                                   "Jafar",
                                   "Banzai",
                                   "Scar",
                                   "Cloud Scar",
                                   "Alpaca Guard",
                                   "Kronk",
                                   "Yzma",
                                   "Flotsam and Jetsam",
                                   "Glut",
                                   "Ursula",
                                   "Goon Guard",
                                   "Maleficent",
                                   "Dragon Maleficent",
                                   "Drum-Playing Soldier",
                                   "Governor Ratcliffe",
                                   "Lawrence",
                                   "Shadow Demons",
                                   "Dr. Facilier",
                                   "Chernabog")),


        # Submit button
        submitButton("Submit")),

        mainPanel(h3("Spells to use:"),

                  p(strong("The following spells will work well:")),
                  dataTableOutput("matched_spells")
                  )
    )
)



# Server for SMK app

library(shiny)

server <- function(input, output){

    # select the matched spells
    output$matched_spells <- renderDataTable({
        datatable(
        MSK %>%
        filter(villain == input$villains) %>%
        select(spell, weakness, attack, boost, shield),
        colnames = c("Spell", "Weakness","Attack",
                     "Boost", "Shield"))
        })
}


shinyApp(ui = ui, server = server)
