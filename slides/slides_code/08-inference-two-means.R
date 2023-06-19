
## ---- echo=TRUE, eval=TRUE---------------------------------------------------------------------
load("../data/pair_data.RDS")
pair_data
d <- pair_data$before - pair_data$after
(d_bar <- mean(d))
(s_d <- sd(d))


## ---- echo=TRUE, eval=TRUE---------------------------------------------------------------------
## t_test
(t_test <- d_bar / (s_d / sqrt(length(d))))
## t_cv
qt(p = 0.95, df = length(d) - 1)
## p_value
pt(q = t_test, df = length(d) - 1, 
   lower.tail = FALSE)


## ----echo=TRUE---------------------------------------------------------------------------------
## CI
d_bar + c(-1, 1) * qt(p = 0.975, df = length(d) - 1) * (s_d / sqrt(length(d)))
## t.test() function
t.test(x = pair_data$before, y = pair_data$after,
       alternative = "greater", mu = 0, paired = TRUE)



## ---- echo=TRUE, eval=TRUE---------------------------------------------------------------------
n1 = 33; x1_bar = 25.2; s1 = 8.6
n2 = 12; x2_bar = 33.9; s2 = 17.4
c <- s1^2/n1 / (s1^2/n1 + s2^2/n2)
df <- (n1-1)*(n2-1) / ((1-c)^2*(n1-1) + c^2*(n2-1))
(df <- floor(df))
## t_test
(t_test <- (x1_bar - x2_bar) / sqrt(s1^2/n1 + s2^2/n2))
## t_cv
qt(p = 0.05, df = df)
## p_value
pt(q = t_test, df = df)


## ---- echo=TRUE, eval=TRUE---------------------------------------------------------------------
n1 = 10; x1_bar = 2.1; s1 = 0.5
n2 = 10; x2_bar = 4.2; s2 = 0.7
sp <- sqrt(((n1 - 1) * s1 ^ 2 + (n2 - 1) * s2 ^ 2) / (n1 + n2 - 2))
sp
df <- n1 + n2 - 2
## t_test
(t_test <- (x1_bar - x2_bar) / (sp * sqrt(1 / n1 + 1 / n2)))
## t_cv
qt(p = 0.05, df = df)
## p_value
pt(q = t_test, df = df)

