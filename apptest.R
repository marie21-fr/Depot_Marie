

library(shiny)

ui <- fluidPage(

    titlePanel("Test Shiny"),

    sidebarLayout(
        sidebarPanel(
            sliderInput("point_size",
                        "Taille des points:",
                        min = 1,
                        max = 5,
                        value = 2),
            selectInput("couleur",
                        "couleur des point",
                        choices = c("Rouge" = "red", "Bleu" = "blue", "Vert" = "green"))
        ),

        mainPanel(
           plotOutput("monPlot")
        )
    )
)


server <- function(input, output) {

    output$monPlot <- renderPlot({
      plot(faithful$eruptions, faithful$waiting,
           xlab = "Durée d'éruption",
           ylab = "Temps d'attente",
           main = "Nuage de points : érupptions vs Attente",
           pch = 8,
           cex = input$point_size,
           col = input$couleur)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
