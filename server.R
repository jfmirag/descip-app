
library(shiny)

shinyServer(function(input, output) {
   output$tabla <- renderTable({
     archivo<-input$datos
     if (is.null(archivo))
       return(NULL)
     
     read.table(archivo$datapath, header = input$nombres, 
                sep = input$separado,skip = input$omitir)
   })
  
})
