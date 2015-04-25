# This is the user-interface definition of a Shiny web application.

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Statistical Independence: TWO Binary Variables"),
  p('A binary variable is a variable that take on only two values.  In this \
    app, the variable\'s value will be called either TRUE or FALSE; however\
    , this could represent 0 or 1, or Yes or No, etc.'),
  p('If the variables are related to each other they are said to not be \
    independent.  This app uses the counts in the four possible categories \
    to comnpute the probability that the variables are not related, or \
    independent.  The method uses a chi-squared test.'),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        p('After collecting the counts for the number in each category, \
          place the appropriate value in the input test box.'),
        numericInput('id11','Count of when both A and B are TRUE:',
                     0,min=0,max=1000,step=1),
        numericInput('id12','Count of when A is TRUE and B is FALSE:',
                     0,min=0,max=1000,step=1),
        numericInput('id21','Count of when A is FALSE and B TRUE:',
                     0,min=0,max=1000,step=1),
        numericInput('id22','Count of when both A and B are FALSE:',
                     0,min=0,max=1000,step=1),
        p('When at least one of the values is greater than zero, the app can \
          compute the probability that the variables are independent.'),
        actionButton("OK2Go",'Submit to Calculate Probability')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      
      h3('The Values that were Input:'),
      tableOutput("Table1"),
      
      h3('The Probabilities:'),
      
      h4('Probabilities for each combined category:'),
      tableOutput("ProbabilityTable"),
      p('This matrix shows the estimated probability for each category.  \
        For example, the probability that both A and B are TRUE is in this \
        table at the row for A.TRUE and the column for B.TRUE.'),
 
      
      h4('Probability that A & B are independent:'),
      verbatimTextOutput("chisqP_value"),
      p('If this probability is less than your critical probability, \
        decide that A and B are NOT independent.  Typical values for the \
        critical probabilites are 5% and 10%.  So, if the probability is \
        less than either of these values, you should decide that the \
        variables are dependent, not independent.'),
      
      h4('Conditional Probabilities:'),
      p('If the variables are not independent, then the conditional \
        probabilities become important.  One conditional probability will be \
        the probability that A will be TRUE if we know that B is TRUE.  This is\
        represented by P(A|B).  This is often called \"the probability of A \
        is TRUE given B\".  If you want to know the probability that A is \
        FALSE given that B is TRUE, just subtract P(A|B) from 1.0.'),
      h5('P(A|B):'),
      verbatimTextOutput("P_a_B"),
      h5('P(B|A):'),
      verbatimTextOutput("P_b_A"),
      p('If the variables are independent, the probability that A is TRUE will \
        be the same whether B is TRUE or B is FALSE.')
      
    )
  )
))
