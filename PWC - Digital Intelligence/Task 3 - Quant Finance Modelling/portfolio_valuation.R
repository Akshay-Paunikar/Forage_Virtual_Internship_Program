data <- read.csv("data.csv",sep=";") 

n.forecast <- 30 #number of forecast periods
n.vintage <- nrow(data) #number of vintages
discount.rate <- 0.025  #discount rates (annual)


historical.cf <- as.matrix(data[,3:ncol(data)]) #matrix of cash flows that have already been observed
amount.originated <- data[,2] #vector of amounts originated per vintage


periods.remaining <- n.forecast - n.vintage:1 #number of periods to be forecasted per vintage

paid.percentages <- historical.cf/amount.originated #repayment percentage, i.e. historical payments as a percentage of the originated amount per vintage
first.period <- diag(paid.percentages) #repayment percentage in the period that the loans were originated per vintage
second.period <- c(diag(paid.percentages[-nrow(paid.percentages),-1]),as.numeric(paid.percentages[n.vintage,n.vintage]*2)) #cash flow percentage in the period after the loans were originated per vintage
#(assume the second cash flow is twice the first cash flow for the last vintage)


p <- matrix(0,nrow = n.vintage, ncol = n.forecast) #marix of zeros
p[,1] <- first.period #assign repayment percentage of first period
p[,2] <- second.period #assign repayment percentage of second period


for (i in 1:n.vintage){ #calculate the expected repayment percentages according to the formula (columns are to be interpreted as periods since origination and not months)
        for (j in 3:n.forecast) {
                p[i,j] <- max(0, p[i,2] * log( 1 + (1-sum(p[i,1:(j-1)]))) * (1-(j-1)/n.forecast) )
        }
}


p.forecast <- matrix(0,n.vintage,n.forecast-1) #matrix of zeros for the forecasted xpected repayment percentagess (each column corresponds to a period in the future, starting in January 2021)
for (i in 1:n.vintage){ #assign the expected repayment percentages to the correct periods
        for (j in 1:periods.remaining[i]) {
                p.forecast[i,j] <-  p[i,n.forecast-periods.remaining[i]+j]    
        }  
}


discount.factors <- 1/(1+discount.rate)^((1:(n.forecast-1))/12) #series of discount factors 
pv <- t(t(p.forecast)*discount.factors)*amount.originated #present value of forecasted cash flows   
result = sum(pv) #sum of all present values, i.e. the value of the portfolio


paste0("The fair value estimate for the portfolio is ", round(result,2)," Swiss Francs")
