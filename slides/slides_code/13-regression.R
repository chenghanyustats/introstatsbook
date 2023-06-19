
## ---- fig.height=6, fig.width = 10------------------------------------------------------------------------------------------------------------------------------------
load("../../../OTT_Final/R_WORKSPACE/CH11/table11-1.rdata")
data <- `table11-1`
data <- data[order(data$x), ]
par(mar = c(4, 4, 2, 1))
plot(data$x, data$y, xlab = "x", ylab = "y", pch = 19, col = "#003366", las = 1,
     main = "Real data (x, y) do not form a perfect straight line: linear regression function + error", type = "b")
abline(lm(data$y~data$x), col = "red")


## ---- fig.height=6, fig.width = 10------------------------------------------------------------------------------------------------------------------------------------
load("../../../OTT_Final/R_WORKSPACE/CH11/table11-1.rdata")
data <- `table11-1`
data <- data[order(data$x), ]
par(mar = c(4, 4, 2, 1))
plot(data$x, data$y, xlab = "x", ylab = "y", pch = 19, col = "#003366", las = 1, ylim = c(0, 140), 
     main = "Finding the best regression line")
abline(lm(data$y ~ data$x), col = "#003366", lwd = 2, lty = 1)
abline(a = 30-6, b = 1.5, col = 1, lwd = 1.2, lty = 2)
abline(a = 22-6, b = 1.7, col = 2, lwd = 1.2, lty = 2)
abline(a = 15-6, b = 1.9, col = 3, lwd = 1.2, lty = 2)
abline(a = 8-6, b = 2.1, col = 4, lwd = 1.2, lty = 2)
abline(a = 1-6, b = 2.2, col = 5, lwd = 1.2, lty = 2)


## ---- echo=FALSE, fig.height=4, fig.width=5---------------------------------------------------------------------------------------------------------------------------
load("../../../OTT_Final/R_WORKSPACE/CH11/table11-3.rdata")
data_ex11_4 <- `table11-3`; colnames(data_ex11_4) <- c("Stand", "Soil_pH", "Grow_Ret")
data_ex11_4
par(mar = c(4, 4, 1, 1))
plot(data_ex11_4$Soil_pH, data_ex11_4$Grow_Ret, pch = 19, xlim = c(3, 5.5), ylim = c(4, 25),
     xlab = "Soil pH level", ylab = "Index of growth retardation")


## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------------------------
## Fit (simple linear) regression model
reg_fit <- lm(Grow_Ret ~ Soil_pH, data = data_ex11_4)
## Detailed model fitting results
summary(reg_fit)


## ---- echo=-(1:5), eval=7---------------------------------------------------------------------------------------------------------------------------------------------
## All information
names(reg_fit)
## regression coefficients
reg_fit$coefficients
coef(reg_fit)
## Confidence interval of beta_0 and beta_1
confint(reg_fit)


## ---- echo=-1, fig.height=4.8, fig.width=8----------------------------------------------------------------------------------------------------------------------------
par(mar = c(4, 4, 2, 1))
## Data and regression line
plot(data_ex11_4$Soil_pH, data_ex11_4$Grow_Ret, pch = 19, xlim = c(3, 5.5), ylim = c(4, 25),
     las = 1, xlab = "Soil pH level", ylab = "Index of growth retardation")
abline(reg_fit, col = "#003366", lwd = 3) # abline(a = 47.475, b = -7.859, col = "#003366", lwd = 3)


## ---- echo=FALSE, fig.height=3.3, fig.width=5-------------------------------------------------------------------------------------------------------------------------
par(mar = c(4, 4, 2, 1))
## Data and regression line
plot(data_ex11_4$Soil_pH, data_ex11_4$Grow_Ret, pch = 19, xlim = c(3, 5.5), ylim = c(4, 25),
     las = 1, xlab = "Soil pH level", ylab = "Index of growth retardation")
abline(reg_fit, col = "#003366", lwd = 3) # abline(a = 47.475, b = -7.859, col = "#003366", lwd = 3)
abline(v = 4.7, col = "red", lty = 2)
abline(h = 47.48-7.86*4.7, col = "red", lty = 2)


## ----echo=1:2, warning=FALSE, fig.height=4, fig.width=6---------------------------------------------------------------------------------------------------------------
predict(reg_fit, newdata = data.frame(Soil_pH = 4.7), interval = "confidence", level = 0.95)
predict(reg_fit, newdata = data.frame(Soil_pH = 4.7), interval = "prediction", level = 0.95)
par(mar = c(4, 4, 2, 1))
## Data and regression line
plot(data_ex11_4$Soil_pH, data_ex11_4$Grow_Ret, pch = 19, xlim = c(3, 5.5), ylim = c(4, 25),
     las = 1, xlab = "Soil pH level", ylab = "Index of growth retardation")
legend("topright", c("Confidence interval for the mean of y", "Prediction interval for a single y"), 
       col = c("red", "blue"), lwd = c(3, 3), bty = "n")
abline(reg_fit, col = "#003366", lwd = 3) # abline(a = 47.475, b = -7.859, col = "#003366", lwd = 3)
segments(x0 = 4.695, y0 = 8.531292, y1 = 12.54274, col = "red", lwd = 3)
segments(x0 = 4.705, y0 = 4.47753, y1 = 16.5965, col = "blue", lwd = 3)
abline(h = 10.537, lty = 2)



## ---- warning=FALSE, fig.height=6, fig.width=10-----------------------------------------------------------------------------------------------------------------------
par(mar = c(4, 4, 1, 1))
# new_data <- data.frame(Soil_pH = c(seq(1, 3.3, by = 0.2), seq(5.2, 7, by = 0.2)))
# ci_new <- predict(reg_fit, newdata = new_data, interval = "confidence", level = 0.95)
# pi_new <- predict(reg_fit, newdata = new_data, interval = "prediction", level = 0.95)
ci <- predict(reg_fit, interval = "confidence", level = 0.95)
pi <- predict(reg_fit, interval = "prediction", level = 0.95)

plot(data_ex11_4$Soil_pH, data_ex11_4$Grow_Ret, pch = 19, xlim = c(3.3, 5.2), ylim = c(0, 30),
     xlab = "Soil pH level", ylab = "Index of growth retardation")
# abline(reg_fit, col = "#003366", lwd = 3)
lines(data_ex11_4$Soil_pH, ci[, c("fit")], col = "#003366", lwd = 3)
lines(data_ex11_4$Soil_pH, ci[, c("lwr")], lwd = 3, col = "red", lty = 1)
lines(data_ex11_4$Soil_pH, ci[, c("upr")], lwd = 3, col = "red", lty = 1)
lines(data_ex11_4$Soil_pH, pi[, c("lwr")], lwd = 3, col = "blue", lty = 1)
lines(data_ex11_4$Soil_pH, pi[, c("upr")], lwd = 3, col = "blue", lty = 1)
abline(v = mean(data_ex11_4$Soil_pH))
segments(x0 = 4.697, y0 = 8.531292, y1 = 12.54274, col = "red", lwd = 3)
segments(x0 = 4.702, y0 = 4.47753, y1 = 16.5965, col = "blue", lwd = 3)
legend("topright", c("regression line", "confidence interval", "prediction interval"),
       lty = c(1, 1, 1), lwd = c(3, 3, 3), col = c("#003366", "red", "blue"), bty = "n")

# lines(c(data_ex11_4$Soil_pH, new_data$Soil_pH), c(ci[, c("lwr")], ci_new[, c("lwr")]), lwd = 2, col = "red", lty = 2)
# lines(c(data_ex11_4$Soil_pH, new_data$Soil_pH), c(ci[, c("upr")],ci_new[, c("upr")]), lwd = 2, col = "red", lty = 2)
# lines(c(data_ex11_4$Soil_pH, new_data$Soil_pH), c(pi[, c("lwr")],pi_new[, c("lwr")]), lwd = 2, col = "blue", lty = 2)
# lines(c(data_ex11_4$Soil_pH, new_data$Soil_pH), c(pi[, c("upr")],pi_new[, c("upr")]), lwd = 2, col = "blue", lty = 2)


## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------------------------
anova(reg_fit)


## ---- fig.height=4, fig.width=11--------------------------------------------------------------------------------------------------------------------------------------
advertising_data <- read.csv("./Advertising.csv")
advertising_data <- advertising_data[, 2:5]
colnames(advertising_data) <- c("TV", "youtube", "instagram", "sales")
par(mfrow = c(1, 3))
par(mar = c(4, 4, 2, 1))
plot(advertising_data$TV, advertising_data$sales, xlab = "TV ", ylab = "Sales")
abline(lm(advertising_data$sales ~ advertising_data$TV), col = "red", lwd = 2)
plot(advertising_data$youtube, advertising_data$sales, xlab = "Youtube", ylab = "Sales")
abline(lm(advertising_data$sales ~ advertising_data$youtube), col = "red", lwd = 2)
plot(advertising_data$instagram, advertising_data$sales, xlab = "Instagram", ylab = "Sales")
abline(lm(advertising_data$sales ~ advertising_data$instagram), col = "red", lwd = 2)


## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------------------------
round(coef(summary(lm(sales ~ TV, data = advertising_data))), 3) ## Simple Regression on TV
round(coef(summary(lm(sales ~ youtube, data = advertising_data))), 3) ## Simple Regression on Youtube
round(coef(summary(lm(sales ~ instagram, data = advertising_data))), 3) ## Simple Regression on Instagram
round(coef(summary(lm(sales ~ TV + youtube + instagram, data = advertising_data))), 3) ## Multiple Regression


## ---- echo=1, fig.height=5, fig.width=6-------------------------------------------------------------------------------------------------------------------------------
round(cor(advertising_data), 3)
# panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...){
#     usr <- par("usr"); on.exit(par(usr))
#     par(usr = c(0, 1, 0, 1))
#     r <- abs(cor(x, y))
#     txt <- format(c(r, 0.123456789), digits = digits)[1]
#     txt <- paste0(prefix, txt)
#     if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
#     text(0.5, 0.5, txt, cex = cex.cor * sqrt(r) + 0.1)
# }
# pairs(advertising_data, lower.panel = panel.smooth, upper.panel = panel.cor)


## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------------------------
full_model <- lm(sales ~ TV + youtube + instagram, data = advertising_data)
null_model <- lm(sales ~ 1, data = advertising_data)
anova(null_model, full_model)


## ---- echo = TRUE-----------------------------------------------------------------------------------------------------------------------------------------------------
full_model_summary <- summary(full_model)
# Point estimates
round(coef(full_model), 4)
# Point estimates and t-test
round(coef(full_model_summary), 4)
# Confidence interval
round(confint(full_model), 4)



## ---- echo=1----------------------------------------------------------------------------------------------------------------------------------------------------------
full_model_summary$adj.r.squared

