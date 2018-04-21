library(shiny)
library(leaflet)

shinyUI(
  navbarPage(
    title="Accidentalidad de transito en la ciudad de Medellín",
    tabPanel(
      "datos",
      titlePanel(
        "Datos"
      ),
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
        "Cargar datos",
        img(src="statistic.jpg",height = 300, width = 600)
      )
    ),
    navbarMenu(
      "Mapas",
      tabPanel(
        "Mapa 2017",
        leafletOutput("mapa2017")
      ),
      tabPanel(
        "Mapa 2016",
        leafletOutput("mapa2016")
      ),
      tabPanel(
        "Mapa 2015",
        leafletOutput("mapa2015")
      ),
      tabPanel(
        "Accidentalidad por Barrio 2017",
        leafletOutput("mapabarrios17")
      )      
    ),
    navbarMenu(
      "Análisis descriptivo",
      tabPanel(
        "análisis 1",
        titlePanel(
          "análisis 1"
        ),
        sidebarLayout(
          
          sidebarPanel(
            HTML("Seleccione la combinacion de su interes"),
            br(),
            br(),
            sliderInput(inputId="zoom",
                        label="Zoom",
                        min = 0,
                        max = 30,
                        value = 0
            ),
            br(),
            selectInput(inputId="comuna",
                        label="Comuna",
                        choices=c("Buenos Aires", "Corregimiento de Altavista",
                                  "Corregimiento de San Cristóbal", "Corregimiento de Santa Elena",
                                  "El Poblado","La Candelaria","Manrique","Robledo","Santa Cruz",
                                  "Aranjuez","Belén","Castilla","Corregimiento de San Antonio de Prado",
                                  "Corregimiento de San Sebastián de Palmitas","Doce de Octubre",
                                  "Guayabal","La América","Laureles Estadio","Popular",
                                  "San Javier","Villa Hermosa"),
                        selected="Manrique"),
            br(),
            selectInput(inputId="gravedad",
                        label="Gravedad",
                        choices=c("MUERTO", "HERIDO", "SOLO.DAÑO"),
                        selected="HERIDO"),
            br(),
            selectInput(inputId="año",
                        label="Año",
                        choices=c("2015", "2016", "2017"),
                        selected="2016")
          ),
          mainPanel(
            
            plotOutput("grafico1")
            
          )
        )        
      ),
      tabPanel(
        "análisis 2",
        titlePanel(
          "Diagramas de barras"
        ),
        sidebarLayout(
          sidebarPanel(
            selectInput(inputId="segmentos",
                        label="Segmentos",
                        choices=c("COMUNA", "BARRIO", "FINDE","QUINCENA",
                                  "JORNADA", "DIA", "DIA.NUM", 
                                  "DISENO", "MES", "CLASE", "HORAS"),
                        selected="HORAS"),
            br(),
            selectInput(inputId="gravedad1",
                        label="Gravedad",
                        choices=c("MUERTO", "HERIDO", "SOLO DAÑOS"),
                        selected="HERIDO"),
            br(),
            selectInput(inputId="año1",
                        label="Año",
                        choices=c("2015", "2016", "2017"),
                        selected="2016")
          ),
          mainPanel(
            plotOutput("grafico2")
          )
        )        
      ),
      tabPanel(
        "conclusiones",
        titlePanel(
          "Conclusiones"
        ),
        sidebarLayout(
          sidebarPanel(
            
          ),
          mainPanel(
            
          )
        )        
      )
    ),
    tabPanel(
      "Trabajo y Vídeo"
    )
  )
)