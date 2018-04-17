
library(shiny)

shinyServer(function(input, output) {
  #archivo<-NULL
  #datos<-0
   output$tabla <- renderTable({
      archivo<-input$datos
      if (is.null(archivo))
        return(NULL)
     
      datos<-read.table(archivo$datapath, header = input$nombres, 
                 sep = input$separado,skip = input$omitir)
      archivo=datos
      write.csv(datos, file="datos.csv")
      head(datos,5)
    })
   #datos=read.table("datos.csv")
   #output$g=renderPlot({
  #   plot(archivo)
  # })
   
})
