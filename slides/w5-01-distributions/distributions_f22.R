## ----echo=FALSE, out.width="50%", fig.cap="https://github.com/rasmusab/distribution_diagrams"------------------------------------------------
include_graphics("img/common_dist.png")


## ----discrete_prob_dist_table, echo=FALSE----------------------------------------------------------------------------------------------------
prob_function <- cbind("x" = c(0, 1, 2), "P(X = x)" = c(0.25, 0.5, 0.25))
# kable(prob_function, format = "pipe")
# kable(print(as.data.frame(prob_function), row.names = FALSE))
prob_function_horizontal <- rbind("x" = c("0", "1", "2"), "P(X = x)" = c(0.25, 0.5, 0.25))
# print(as.data.frame(t(prob_function)), row.names = FALSE)
# print(unname(as.data.frame(prob_function_horizontal)))
kable(prob_function_horizontal)


## ----discrete_prob_dist_graph, echo=FALSE, out.width="40%", fig.asp=0.5----------------------------------------------------------------------
par(mar = c(4, 4, 0, 0))
plot(c("0", "1", "2"), c(0.25, 0.5, 0.25), type = "h", ylim = c(0, 0.75),
     lwd = 5, col = "#003366", ylab = "P(X = x)", xlab = "x", las = 1, axes = F)
points(c("0", "1", "2"), c(0.25, 0.5, 0.25), pch = 16, cex = 2, col = "#FFCC00")
axis(1, 0:2, c("0", "1", "2"), col.axis = "black")
axis(2, seq(0, 0.75, by = 0.25), col.axis = "black", las = 2)


## ---- echo=FALSE, out.width="60%"------------------------------------------------------------------------------------------------------------
knitr::include_graphics("./img/alcohol.jpeg")


## ----binomial_plot_noshow, echo = FALSE, out.width="80%", purl=TRUE--------------------------------------------------------------------------
par(mar = c(4, 4, 2, 0), mgp = c(2.7, 1, 0), las = 1)
plot(x = 0:15, y = dbinom(0:15, size = 15, prob = 0.2), type = 'h', xlab = "x", 
     ylab = "P(X = x)", lwd = 5, main = "Binomial(15, 0.2)")


## ---- echo=FALSE, out.width="60%"------------------------------------------------------------------------------------------------------------
knitr::include_graphics("./img/alcohol.jpeg")


## ----binomial_r_1, purl=TRUE-----------------------------------------------------------------------------------------------------------------
## 1. P(X = 6)
dbinom(x = 6, size = 15, prob = 0.2) 
## 2. P(X >= 6) = 1 - P(X <= 5)
1 - pbinom(q = 5, size = 15, prob = 0.2) 


## ----binomial_r_2, purl=TRUE-----------------------------------------------------------------------------------------------------------------
## 2. P(X >= 6) = P(X > 5)
pbinom(q = 5, size = 15, prob = 0.2, 
       lower.tail = FALSE)  


## ----binomial_plot, echo = -1, out.width="67%"-----------------------------------------------------------------------------------------------
par(mar = c(4, 4, 2, 0), mgp = c(2.7, 1, 0), las = 1)
plot(x = 0:15, y = dbinom(0:15, size = 15, prob = 0.2), 
     type = 'h', xlab = "x", ylab = "P(X = x)", 
     lwd = 5, main = "Binomial(15, 0.2)")


## ---- echo=FALSE, out.width="100%"-----------------------------------------------------------------------------------------------------------
knitr::include_graphics("./img/baby.jpeg")


## ----poisson_r_1, purl=TRUE------------------------------------------------------------------------------------------------------------------
(lam <- 4200 / 365)
## P(X = 10)
dpois(x = 10, lambda = lam)  


## ----poisson_r_2, purl=TRUE------------------------------------------------------------------------------------------------------------------
## P(X > 10) = 1 - P(X <= 10)
1 - ppois(q = 10, lambda = lam)  
## P(X > 10)
ppois(q = 10, lambda = lam, 
      lower.tail = FALSE) 


## ----poisson_plot, out.width="60%"-----------------------------------------------------------------------------------------------------------
plot(0:24, dpois(0:24, lambda = lam), type = 'h', lwd = 5, 
     ylab = "P(X = x)", xlab = "x", main = "Poisson(11.5)")


## ----poisson_approx, echo=FALSE, fig.asp=0.5, out.width='95%'--------------------------------------------------------------------------------
par(mfcol = c(2, 2))
n <- 10
p <- 0.5
par(mar = c(2, 2, 1, 0), mgp = c(1, 0.1, 0), las = 1)
plot(0:n, dbinom(0:n, size = n, prob = p), type = 'h', ylim = c(0, 0.25),
      ylab = "P(X = x)", xlab = "x", las = 1, axes = F, lwd = 3, main = "binomial(10, 0.5)")
points(0:n, dbinom(0:n, size = n, prob = p), pch = 16, cex = 0.8, col = "#FFCC00")
axis(1, 0:n, col.axis = "black", cex.axis = 0.6, tck = 0.01)
axis(2, seq(0, 0.2, by = 0.05), col.axis = "black", las = 2, tck = 0.01,
     cex.axis = 0.6)

plot(0:n, dpois(0:n, lambda = n * p), type = 'h', ylim = c(0, 0.25),
      ylab = "P(X = x)", xlab = "x", las = 1, axes = F, lwd = 3, main = "Poisson(10*0.5)")
points(0:n, dpois(0:n, lambda = n * p), pch = 16, cex = 0.8, col = "#FFCC00")
axis(1, 0:n, col.axis = "black", cex.axis = 0.6, tck = 0.01)
axis(2, seq(0, 0.2, by = 0.05), col.axis = "black", las = 2, tck = 0.01, 
     cex.axis = 0.6)

n <- 100
plot(0:15, dbinom(0:15, size = n, prob = 0.01), type = 'h', ylim = c(0, 0.4),
      ylab = "P(X = x)", xlab = "x", las = 1, axes = F, lwd = 3, main = "binomial(100, 0.01)")
points(0:15, dbinom(0:15, size = n, prob = 0.01), pch = 16, cex = 0.8, col = "#FFCC00")
axis(1, 0:15, col.axis = "black", cex.axis = 0.6, tck = 0.01)
axis(2, seq(0, 0.4, by = 0.1), col.axis = "black", las = 2, tck = 0.01,
     cex.axis = 0.6)

plot(0:15, dpois(0:15, lambda = n * 0.01), type = 'h', ylim = c(0, 0.4),
      ylab = "P(X = x)", xlab = "x", las = 1, axes = F, lwd = 3, main = "Poisson(100*0.01)")
points(0:15, dpois(0:15, lambda = n * 0.01), pch = 16, cex = 0.8, col = "#FFCC00")
axis(1, 0:n, col.axis = "black", cex.axis = 0.6, tck = 0.01)
axis(2, seq(0, 0.4, by = 0.1), col.axis = "black", las = 2, tck = 0.01,
     cex.axis = 0.6)



## ---- echo=FALSE, out.width="50%"------------------------------------------------------------------------------------------------------------
# knitr::include_graphics("./img/density.png")
par(mar = c(2, 2, 0, 0), mgp = c(0.5, 0.2, 0), mfrow = c(1, 1))
x = seq(0,10,length=1000)
y = dgamma(x, 2, 1/2)
plot(x, y, type = "l", lwd = 3, col = "blue", axes = FALSE, 
     ylab = "f(x)", las = 1, cex.lab = 1.4)
axis(1, at = c(2, 4), labels = c("a", "b"), tick = TRUE)
axis(2, tick = FALSE, labels = FALSE)
abline(h = 0)
abline(v = 0)
x = seq(2, 4, length = 100)
y = dgamma(x, 2, 1/2)
polygon(c(2, x, 4), c(0, y, 0), col = "lightblue")
text(3, dgamma(2, 2, 1/2)/2, "P(a < X < b)", cex = 1.4)
text(6, dgamma(6, 2, 1/2)/3, "Total Area = 1", cex = 1.8)
text(7.5, dgamma(5.6, 2, 1/2), "density curve", cex = 1.8)


## ----normal_density, echo=FALSE, out.width='35%'---------------------------------------------------------------------------------------------

par(mfrow = c(1, 1))
par(mar = c(1.8, 0, 1.2, 0), mgp = c(0.5, 0.2, 0), las = 1)
mean=100; sd=15
# lb=80; ub=120
x <- seq(-4,4,length=100)*sd + mean
hx <- dnorm(x,mean,sd)
plot(x, hx, type="n", xlab="x", ylab="",
  main=expression(N(100, 15^2)), axes=FALSE)
# i <- x >= lb & x <= ub
lines(x, hx, col = "#003366", lwd = 3)
# polygon(c(lb,x[i],ub), c(0,hx[i],0), col="red")
# area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
# result <- paste("P(",lb,"< IQ <",ub,") =",
#    signif(area, digits=3))
# mtext(result,3)
axis(1, at=seq(40, 160, 20), pos=0, tick = -0.005)


## ----normal_densities, echo=FALSE, out.width='75%'-------------------------------------------------------------------------------------------
mean=100; sd=10
x <- seq(-4,4,length=100)*sd + mean
hx <- dnorm(x,mean,sd)
plot(x, hx, type="n", xlab="x", ylab="", xlim = c(-30, 160), bty = "n",
     main="normal densities", yaxt = "n", xaxt = "n")
axis(1, at=seq(-30, 160, 20), pos=0, tick = -0.005)
lines(x, hx, col = "#003366", lwd = 3)
mean=100; sd=15
x <- seq(-4,4,length=100)*sd + mean
hx <- dnorm(x,mean,sd)
lines(x, hx, col = "#FFCC00", lwd = 3)
mean=20; sd=10
x <- seq(-4,4,length=100)*sd + mean
hx <- dnorm(x,mean,sd)
lines(x, hx, col = 2, lwd = 3)
legend("topright", c(expression(N(100, 10^2)), 
                     expression(N(100, 15^2)), 
                     expression(N(20, 10^2))), 
       col = c("#003366", "#FFCC00", 2), lwd = 3, bty = "n")


## ----689599, echo=FALSE, out.width='60%'-----------------------------------------------------------------------------------------------------
data(COL)
X <- seq(-4, 4, 0.01)
Y <- dnorm(X)
par(mar = c(2, 0, 0, 0), mgp = c(1, 0.2, 0), las = 1)
plot(X, Y, ylab = "",
     type = 'n', 
     axes = FALSE,
     xlim = c(-3.2, 3.2),
     ylim = c(0, 0.4))
abline(h = 0, col = COL[6])
at <- -3:3
labels <- expression(mu - 3 * sigma,
                     mu - 2 * sigma,
                     mu - sigma,
                     mu,
                     mu + sigma,
                     mu + 2 * sigma,
                     mu + 3 * sigma)
axis(1, at, labels, tick = 0.01)
for (i in 3:1) {
  these <- (i - 1 <= X & X <= i)
  polygon(c(i - 1, X[these], i),
          c(0, Y[these], 0),
          col = COL[i],
          border = COL[i])
  these <- (-i <= X & X <= -i + 1)
  polygon(c(-i, X[these], -i + 1),
          c(0, Y[these], 0),
          col = COL[i],
          border = COL[i])
}

# _____ Label 99.7 _____ #
arrows(-3, 0.03,
       3, 0.03,
       code = 3,
       col = '#444444',
       length = 0.15)
text(0, 0.02, '99.7%', pos = 3)

# _____ Label 95 _____ #
arrows(-2, 0.13,
       2, 0.13,
       code = 3,
       col = '#444444',
       length = 0.15)
text(0, 0.12, '95%', pos = 3)

# _____ Label 68 _____ #
arrows(-1, 0.23,
       1, 0.23,
       code = 3,
       col = '#444444',
       length = 0.15)
text(0, 0.22, '68%', pos = 3)

lines(X, Y, col = '#888888')
abline(h = 0, col = '#AAAAAA')


## ---- echo=FALSE, out.width="50%"------------------------------------------------------------------------------------------------------------
knitr::include_graphics("./img/sat_act.jpeg")


## ----standardization_shift, echo=FALSE, out.width='65%', fig.asp=0.3-------------------------------------------------------------------------
mean = 3; sd = 2
par(mar = c(2, 0, 1, 0), mgp = c(1, 0.2, 0), las = 1)
x <- seq(-6, 9, length = 100)
# z <- seq(-3, 13, length = 100)
hx <- dnorm(x, mean, sd)
hz <- dnorm(x, 0, sd)
plot(x, hz, type="n", xlab="x", ylab="", ylim = c(0, dnorm(0, 0, 1)),
  main = "Shift from N(3, 4) to N(0, 4)", axes = FALSE)
lines(x, hz, col = "blue", lwd = 4)
lines(x, hx, col = "#003366", lwd = 4)
axis(1, at = seq(-3, 9, 1), pos=0)
# abline(v = c(0, 3))
segments(x0 = 0, y0 = 0, y1 = dnorm(0, 0, sd), col = "blue", lwd = 2)
segments(x0 = mean, y0 = 0, y1 = dnorm(mean, mean, sd), col = "#003366", lwd = 2)
arrows(x0 = 3, y0 = 0.1, x1 = 0, col = "darkgray", lwd = 2)


## ----standardization_scale, echo=FALSE, out.width='65%', fig.asp=0.3-------------------------------------------------------------------------
par(mar = c(2, 0, 1, 0), mgp = c(1, 0.2, 0), las = 1)
x <- seq(-6, 9, length = 100)
# z <- seq(-3, 13, length = 100)
hx <- dnorm(x, 0, sd)
hz <- dnorm(x, 0, 1)
plot(x, hz, type="n", xlab="x", ylab="", ylim = c(0, dnorm(0, 0, 1)),
  main = "Scale from N(0, 4) to N(0, 1)", axes = FALSE)
lines(x, hz, col = "red", lwd = 4)
lines(x, hx, col = "blue", lwd = 4)
axis(1, at = seq(-3, 9, 1), pos=0)
segments(x0 = 0, y0 = 0, y1 = dnorm(0, 0, 1), col = "red", lwd = 2)
arrows(x0 = 3, y0 = 0.05, x1 = 2, col = "darkgray", lwd = 2)
arrows(x0 = 0.5, y0 = dnorm(0, 0, 2), x1 = 0.5, y1 = dnorm(0, 0, 1), col = "darkgray", lwd = 2)


## ----z_score, echo=FALSE, out.width='70%'----------------------------------------------------------------------------------------------------
par(mar = c(4, 0, 0, 0), mgp = c(0, 0.5, 0), las = 1)
z <- seq(-3, 3, length = 100)
hz <- dnorm(z)
plot(z, hz, type="n", xlab="", ylab="", ylim = c(0, dnorm(0, 0, 1)),
  main = "", axes = FALSE)
lines(z, hz, col = 4, lwd = 4)
segments(x0 = 0, y0 = 0, y1 = dnorm(0, 0, 1), col = 4, lwd = 1, lty = 2)
segments(x0 = 1, y0 = 0, y1 = dnorm(1, 0, 1), col = 4, lwd = 1, lty = 2)
segments(x0 = 2, y0 = 0, y1 = dnorm(2, 0, 1), col = 4, lwd = 1, lty = 2)
segments(x0 = 3, y0 = 0, y1 = 5*dnorm(3, 0, 1), col = 4, lwd = 1, lty = 2)
segments(x0 = -1, y0 = 0, y1 = dnorm(-1, 0, 1), col = 4, lwd = 1, lty = 2)
segments(x0 = -2, y0 = 0, y1 = dnorm(-2, 0, 1), col = 4, lwd = 1, lty = 2)
segments(x0 = -3, y0 = 0, y1 = 5*dnorm(-3, 0, 1), col = 4, lwd = 1, lty = 2)
axis(1, at = seq(-3, 3, 1), pos=0, line = 1)
axis(1, at = seq(-3, 3, 1), labels, tick = 0.01, line = 2)


## ----sat, echo=FALSE, out.width='70%'--------------------------------------------------------------------------------------------------------
par(mfrow = c(2, 1),
    las = 1,
    mar = c(2.5, 0, 0.5, 0))
# _____ Curve 1 _____ #
m <- 1100
s <- 200
X <- m + s * seq(-6, 6, 0.01)
Y <- dnorm(X, m, s)
plot(X, Y,
     type = 'l',
     axes = FALSE, xlab = "",
     xlim = m + s * 2.7 * c(-1, 1))
axis(1, at = m + s * (-3:3))
abline(h = 0)
lines(c(m, m),
      dnorm(m, m, s) * c(0.01, 0.99),
      lty = 2,
      col = '#EEEEEE')
lines(c(m, m) + s,
      dnorm(m + s, m, s) * c(0.01, 1.25),
      lty = 2, col = COL[1])
text(m + s,
     dnorm(m + s, m, s) * 1.25,
     'Anna',
     pos = 3,
     col = COL[1])


# _____ Curve 2 _____ #
par(mar = c(2, 0, 1, 0))
m <- 21
s <- 6
X <- m + s * seq(-6, 6, 0.01)
Y <- dnorm(X, m, s)
plot(X, Y, xlab = "",
     type = 'l',
     axes = FALSE,
     xlim = m + s * 2.7 * c(-1, 1))
axis(1, at = m + s * (-3:3))
abline(h = 0)
lines(c(m, m),
      dnorm(m, m, s) * c(0.01, 0.99),
      lty = 2,
      col = '#EEEEEE')
lines(c(m, m) + 3,
      dnorm(m + 3, m, s) * c(0.01, 1.2),
      lty = 2,
      col = COL[1])
text(m + 3,
     dnorm(m + 3, m, s) * 1.05,
     'Tommy',
     pos = 4,
     col = COL[1])


## ----tail, echo=FALSE, out.width='50%'-------------------------------------------------------------------------------------------------------
par(mfrow = c(1, 1), las = 1, mar = c(2.5, 0, 0, 0), mgp = c(0, 1, 0))
normTail(m = 1100, s = 200, L = 1300, col = 4, cex.axis = 1.3)


## ---- echo=FALSE, out.width="50%"------------------------------------------------------------------------------------------------------------
knitr::include_graphics("./img/normal_table.png")


## ---- ref.label="tail", echo=FALSE, out.width='100%'-----------------------------------------------------------------------------------------


## ---- purl=TRUE------------------------------------------------------------------------------------------------------------------------------
pnorm(1, mean = 0, sd = 1)
pnorm(1300, mean = 1100, sd = 200)


## ---- ref.label="tail", echo=FALSE, out.width='100%'-----------------------------------------------------------------------------------------


## --------------------------------------------------------------------------------------------------------------------------------------------
pnorm(1, mean = 0, sd = 1)
pnorm(1300, mean = 1100, sd = 200)


## ---- echo=FALSE, out.width='50%'------------------------------------------------------------------------------------------------------------
par(mfrow = c(1, 1), las = 1, mar = c(4, 0, 0, 0), mgp = c(1, 1, 0))
normTail(m = 1100, s = 200, U = 1190, col = 4, cex.axis = 1.3)


## ----echo=FALSE, out.width='100%', fig.asp=0.2-----------------------------------------------------------------------------------------------
AddShadedPlot <- function(x, y, offset,
                          shade.start = -8,
                          shade.until = 8, col = 4) {
  lines(x + offset, y)
  lines(x + offset, rep(0, length(x)))
  these <- which(shade.start <= x & x <= shade.until)
  polygon(c(x[these[1]], x[these], x[rev(these)[1]]) + offset,
          c(0, y[these], 0),
          col = 4)
  lines(x + offset, y)
}
# AddText <- function(x, text) {
#   text(x, 0.549283, text, cex = 2)
# }

X <- seq(-3.2, 3.2, 0.01)
Y <- dnorm(X)
par(mfrow = c(1, 1), las = 1, mar = c(0, 0, 0, 0), mgp = c(0, 0, 0))
plot(X, Y, type = 'l', axes = FALSE, xlim = c(-3.4, 16 + 3.4), xlab = "", ylab = "")
AddShadedPlot(X, Y, 0, 0.45, 8)
AddShadedPlot(X, Y, 8)
AddShadedPlot(X, Y, 16, -8, 0.45)
segments(c(3.5, 3.5), c(0.19, 0.23), c(4.5, 4.5), lwd = 3)
# lines(c(3.72, 4.28), rep(0.549283, 2), lwd = 2)
lines(c(11.5, 12.5), c(0.21, 0.21), lwd = 3)
# text(12, 0.549283,' = ', cex = 2)



## ---- purl=TRUE------------------------------------------------------------------------------------------------------------------------------
1 - pnorm(0.45)


## ---- echo=FALSE, out.width='40%'------------------------------------------------------------------------------------------------------------
par(mfrow = c(1, 1), las = 1, mar = c(2, 0, 0, 0), mgp = c(1, 1, 0))
normTail(m = 1100, s = 200, L = qnorm(0.95, 1100, 200), col = 4, cex.axis = 1.3)


## ---- purl=TRUE------------------------------------------------------------------------------------------------------------------------------
(z_95 <- qnorm(0.95))


## ---- purl=TRUE------------------------------------------------------------------------------------------------------------------------------
(x_95 <- 1100 + z_95 * 200)


## ---- purl=TRUE------------------------------------------------------------------------------------------------------------------------------
qnorm(p = 0.95, mean = 1100, sd = 200)


## ----qqplot, fig.height=4.5, out.width='60%', echo = -c(1,2,3, 4, 7),, purl=TRUE-------------------------------------------------------------
par(mfcol = c(2, 2), las = 1, mar = c(3.5, 3.5, 2, 1), mgp = c(2, 0.5, 0))
normal_sample <- rnorm(1000)
right_skewed_sample <- rgamma(1000, 2, 1 / 2)
hist(normal_sample, col = 4, main = "Normal data", breaks = 20, border = "white")
qqnorm(normal_sample, main = "Normal data", col = 4)
qqline(normal_sample)
hist(right_skewed_sample, col = 6, main = "Right-skewed data", breaks = 20, border = "white")
qqnorm(right_skewed_sample, main = "Right-skewed data", col = 6)
qqline(right_skewed_sample)

