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
                buttonLabel = "Cargar", placeholder = "No hay base"),
      checkboxInput(inputId="nombres", 
                    label="Nombres", 
                    value=TRUE),
      selectInput(inputId="separado",
                  label="Separado por",
                  choices=c(",", ".", " ", "  "),
                  selected=","),
      numericInput(inputId="omitir",
                   label="Omitir",
                   min=0,
                   step=1,
                   value="0")
    ),
    
    mainPanel(
      tableOutput("tabla")
    )
  )
))
  