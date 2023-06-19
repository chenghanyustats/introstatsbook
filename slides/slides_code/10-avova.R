
## ----ex8-1, echo=-c(4, 5, 6)-------------------------------------------------------------------
load("../../../OTT_Final/R_WORKSPACE/CH08/table08-7.rdata")
data_ex81 <- `table08-7`
df_ex81 <- data.frame("y" = c(data_ex81[, 1], data_ex81[, 2], data_ex81[, 3]),
                      "source" = rep(c("cereals", "energy", "veggie"), each = 5))
df_ex81[1, 1] <- 3
df_ex81




## ----anova-ex81, echo=TRUE---------------------------------------------------------------------
summary(aov(y ~ source, data = df_ex81)) ## method 1
anova(lm(y ~ source, data = df_ex81))  ## method 2


## ----------------------------------------------------------------------------------------------
oneway.test(y ~ source, data = df_ex81, var.equal = TRUE) ## method 3 Test results only



## ---- out.width="80%"--------------------------------------------------------------------------
load("../../../OTT_Final/R_WORKSPACE/CH08/table08-16.rdata")
data_8_16 <- `table08-16`  ## This is a data frame
boxplot(data_8_16[, 2:5], axes = FALSE, ylab = "", xlab = "",
        main = "Boxplot of Oxygen Content", horizontal = FALSE)
axis(2)
axis(1, las = 1, at = 1:4, labels = paste(c(1, 5, 10, 20), "km"))
# original_y <- df_heter_var$y


## ---- echo=-c(1, 2)----------------------------------------------------------------------------
load("../../../OTT_Final/R_WORKSPACE/CH08/table08-16.rdata")
data_8_16 <- `table08-16`  ## This is a data frame
data_8_16
data_8_16_tidy <- data.frame(oxygen = c(data_8_16[, 2], data_8_16[, 3],
                                        data_8_16[, 4], data_8_16[, 5]),
                             km = rep(c("1","5","10", "20"), each = 10))
ex8_4_res <- lm(oxygen ~ km, data = data_8_16_tidy)


## ---- message=FALSE, out.width="85%", echo=-c(1, 2), fig.asp=1---------------------------------
par(mgp = c(2.5, 1, 0))
par(mar = c(4, 4, 2, 1))
library(car)
qqPlot(ex8_4_res$residuals, pch = 19, 
       id = FALSE, ylab = "residuals", 
       main = "Normal Probability Plot for Residuals")


## ---- out.width="100%", fig.asp=1--------------------------------------------------------------
par(mar = c(4, 4, 2, 1))
plot(ex8_4_res$fitted.values, 
     ex8_4_res$residuals, xlab = "Fitted Value",
     ylab = "Residual", main = "Versus Fits", pch = 19, col = "red",
     xlim = c(0, 35))
abline(h = 0)


## ---- echo=TRUE--------------------------------------------------------------------------------
data_8_16_tidy


## ---- echo=TRUE--------------------------------------------------------------------------------
data_8_16_trans <- data_8_16_tidy
data_8_16_trans[, 1] <- sqrt(data_8_16_tidy[, 1] + 0.375)
ex8_4_res_trans <- lm(oxygen ~ km, data = data_8_16_trans)
anova(ex8_4_res_trans)


## ---- out.width="100%", fig.asp=0.5------------------------------------------------------------
library(car)
par(mgp = c(2, 0.5, 0))
par(mar = c(3.2, 3.2, 1.2, 1))
par(mfrow = c(1, 2))
qqPlot(ex8_4_res_trans$residuals, pch = 16, id = FALSE, ylab = "residuals")
title(main = "QQ-Plot for Residuals (transformed y)", cex.main = 0.8)
plot(ex8_4_res_trans$fitted.values, ex8_4_res_trans$residuals, xlab = "Fitted Value",
     ylab = "Residual", main = "Versus Fits (transformed y)", pch = 16, col = "red",
     xlim = c(0, 6), cex.main = 0.8)
abline(h = 0)

