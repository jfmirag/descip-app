library(shiny)
shinyUI(fluidPage(

  titlePanel("Analisis descriptivo"),
  h4(p("Con esta aplicacion se puede realizar un analisis descriptivo basico."),
     align="left"),

  sidebarLayout(
    sidebarPanel(
      fileInput(inputId="datos", 
                label="Seleccione los datos ", 
                multiple = FALSE, accept = NULL, width = NULL,
                buttonLabel = "Cargar", placeholder = "No hay base")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       #plotOutput("distPlot")
    )
  )
))
