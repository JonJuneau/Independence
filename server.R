# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("Helpers.R")

shinyServer(function(input, output) {
  
  dataMatrix <- reactive({data.frame(col0 = c("A.TRUE","A.FALSE"),
                           'B TRUE' = c(input$id11,input$id21),
                           'B FALSE' = c(input$id12,input$id22),
                           row.names = 'col0')}
                         )
  output$Table1 <- renderTable({dataMatrix()})
  A_given_B <- reactive({P_AgivenB(dataMatrix())})
  output$P_a_B <- renderText({A_given_B()})
  B_given_A <- reactive({P_BgivenA(dataMatrix())})
  output$P_b_A <- renderText({B_given_A()})
  ProbTable <- reactive({P_dF(dataMatrix())})
  output$ProbabilityTable <- renderTable({ProbTable()})
  
  
  CHI_Square_stat <- reactive({
          if (input$OK2Go > 0) {Mychisq(dataMatrix())}
          })
  output$chisqStatistic <- renderText({
          if (input$OK2Go > 0) {CHI_Square_stat()$statistic}
          })
  
  output$chisqP_value <- renderText({
          if (input$OK2Go > 0) {CHI_Square_stat()$p.value}
          })

})
