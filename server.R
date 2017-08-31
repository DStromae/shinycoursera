library(dplyr)


function(input, output) {
  
  cars_sample <- reactive({
    
    d <- mtcars
    d <- d %>% filter(d$hp <= input$hp)
    
    if (input$cyl != 0) { d <- d %>% filter(d$cyl == input$cyl) }
    else { d <- d %>% filter(d$cyl > 0) }
    
    if (input$am != 2) { d <- d %>% filter(d$am == input$am) }
    else { d <- d %>% filter(d$am >= 0) }    
    
    d
  })
  
  
  output$plot <- renderPlot({
    
    if (!is.na(cars_sample())) {
      
      hist(cars_sample()$mpg, 
           main="Frequency distribution of cars by 'mpg'",
           xlab = "Miles/(US) gallon",
           col = "#75AADB", 
           border = "white")
    }
    
  })
  
  # Generate a summary of the data ----
  output$summary <- renderPrint({
    str(mtcars)
  }) 
  
  
  # Generate an HTML table view of the data ----
  output$table <- renderTable({
    mtcars
  })  
  
  output$n_cars <- renderText({ nrow(cars_sample()) })
  
}