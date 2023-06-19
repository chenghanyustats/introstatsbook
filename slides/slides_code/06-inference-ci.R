
## ----------------------------------------------------------------------------------------------
## Generate sample data x1, x2, x3, x4, x5, each from population distribution N(2, 1)
(x_data_1 <- rnorm(n = 5, mean = 2, sd = 1)) 

# 
# ## ---- echo=FALSE-------------------------------------------------------------------------------
# x_vec <- c(x_data_1, mean(x_data_1))
# names(x_vec) <- c("x1", "x2", "x3", "x4", "x5", "sample mean")
# kable(t(x_vec), digits = 3)


## ----------------------------------------------------------------------------------------------
(x_data_2 <- rnorm(5, mean = 2, sd = 1))

# 
# ## ---- echo=FALSE-------------------------------------------------------------------------------
# x_vec <- c(x_data_2, mean(x_data_2))
# names(x_vec) <- c("x1", "x2", "x3", "x4", "x5", "sample mean")
# kable(t(x_vec), digits = 3)


## ----ci_normal, echo=TRUE, tidy=FALSE----------------------------------------------------------
## save all information we have
alpha <- 0.05; n <- 16; x_bar <- 121.5; sig <- 5

## 95% CI
(cri_z <- qnorm(p = alpha / 2, lower.tail = FALSE))  ## z-critical value

(m_z <- cri_z * (sig / sqrt(n)))  ## margin of error
x_bar + c(-1, 1) * m_z  ## 95% CI for mu when sigma is known



## ----ci_t, echo=TRUE, tidy=FALSE---------------------------------------------------------------
alpha <- 0.05; n <- 16; x_bar <- 121.5
## (2) sigma is unknown and s = 5
(cri_t <- qt(p = alpha / 2, df = n - 1, lower.tail = FALSE)) ## t-critical value
s <- 5
(m_t <- cri_t * (s / sqrt(n)))  ## margin of error
x_bar + c(-1, 1) * m_t  ## 95% CI for mu when sigma is unknown

