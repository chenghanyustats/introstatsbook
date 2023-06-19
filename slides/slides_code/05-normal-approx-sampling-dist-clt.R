
## ----------------------------------------------------------------------------------------------
# Binomial prob: P(X = 3) + P(X = 4) + P(X = 5)
n <- 20; p <- 0.3
(prob_bino <- dbinom(x = 3, size = n, prob = p) + dbinom(x = 4, size = n, prob = p) + 
  dbinom(x = 5, size = n, prob = p))
# Normal prob: P(3 < X < 5)
mu <- n * p
sig <- sqrt(n * p * (1 - p))
pnorm(5, mu, sig) - pnorm(3, mu, sig)


## ----------------------------------------------------------------------------------------------
## bino prob
prob_bino
# Normal prob w/ continuity correction 
## P(2.5 < X < 5.5)
pnorm(5.5, mu, sig) - pnorm(2.5, mu, sig)


## ----------------------------------------------------------------------------------------------
pnorm(1.03) - pnorm(-1.03)
pnorm(960, mean = 930, sd = 130/sqrt(20)) - pnorm(900, mean = 930, sd = 130/sqrt(20))


## ----------------------------------------------------------------------------------------------
pnorm(1.2, lower.tail = FALSE)
pnorm(400000, mean = 382000, sd = 150000/sqrt(100), lower.tail = FALSE)

