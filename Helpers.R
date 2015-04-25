#       Helpers.R
#               Functions that help calculate values for Independence
#                       Data Product

#       Calculate the Conditional Probabilities
P_AgivenB <- function(dF) {
        denom <- sum(dF[,'B.TRUE'])
        if(denom != 0) {dF['A.TRUE','B.TRUE']/denom}
        else 0
}
P_NotAgivenB <- function(dF) {
        1-P_AgivenB(dF)
}
P_BgivenA <- function(dF) {
        denom <- sum(dF['A.TRUE',])
        if(denom != 0) {dF['A.TRUE','B.TRUE']/denom}
        else 0
}
P_NotBgivenA <- function(dF) {
        1-P_BgivenA(dF)
}

#       Calculate Expected Values (from data)
TotalCount <- function(dF) {
        sum(dF['A.TRUE',],dF['A.FALSE',])
}
P_dF <- function(dF) {
        dF/TotalCount(dF)
}

#       Calculate the Chi-Square Results
Mychisq <- function(dF) {
        x = dF[,c('B.TRUE','B.FALSE')]
        if(min(x) <= 5) {Mychisq_simulate(x)}
        else {chisq.test(x)}      
}

SimulationTimes <- 10000
Mychisq_simulate <- function(dF) {
        x = dF[,c('B.TRUE','B.FALSE')]
        chisq.test(x, simulate.p.value = TRUE, B=SimulationTimes)
}