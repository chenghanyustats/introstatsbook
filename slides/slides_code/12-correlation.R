

## ----data_03_17, echo=-c(1:4), tidy=FALSE, out.width="100%"------------------------------------
load("../../../OTT_Final/R_WORKSPACE/CH03/table03-17.rdata")
data_03_17 <- `table03-17`
par(mar=c(4,4,1,1), mfrow = c(1, 1))
par(mgp=c(2, 0.8, 0))
plot(x = data_03_17$`employees(k)`, 
     y = data_03_17$rate_y, 
     pch = 19, col = 4, las = 1,
     main = "Scatter Plot", 
     xlab = "Number of employees (k)", 
     ylab = "Crime rate")


## ---- echo=TRUE--------------------------------------------------------------------------------
cor(x = data_03_17$`employees(k)`, 
    y = data_03_17$rate_y)

