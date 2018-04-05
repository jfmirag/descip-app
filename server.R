
library(shiny)

shinyServer(function(input, output) {
  #archivo<-0
  #datos<-0
   output$tabla <- renderTable({
      archivo<-input$datos
      if (is.null(archivo))
        return(NULL)
     
      datos<-read.table(archivo$datapath, header = input$nombres, 
                 sep = input$separado,skip = input$omitir)
      head(datos,5)
    })
   output$g=renderPlot({
     plot(datos)
   })
   
})
