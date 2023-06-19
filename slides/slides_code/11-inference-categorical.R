
## ----goodness_test, echo=TRUE, tidy=FALSE------------------------------------------------------
obs <- c(205, 26, 25, 19)
n <- sum(obs)
pi_0 <- c(0.72, 0.07, 0.12, 0.09)
df <- length(obs) - 1

## Using formula
(expect_count <- pi_0 * n)
(chi2_test <- sum((obs - expect_count) ^ 2 / expect_count))  ## test statistic
qchisq(0.05, df = df, lower.tail = FALSE)  ## critical value
pchisq(chi2_test, df = df, lower.tail = FALSE)  ## p-value


## ---- echo=TRUE--------------------------------------------------------------------------------
## Using chisq.test() function
goodness_test <- chisq.test(x=obs, p=pi_0)
goodness_test$expected
goodness_test$statistic
goodness_test$p.value


## ----independence_test, tidy=FALSE, echo=2:7---------------------------------------------------
## (4) Test of Independence ## Job Performance Example
(contingency_table <- matrix(c(18, 23, 22, 20, 10, 12), nrow = 2, ncol = 3))

## Using chisq.test() function
(indept_test <- chisq.test(contingency_table))

qchisq(0.05, df = (2 - 1) * (3 - 1), lower.tail = FALSE)  ## critical value

# indept_test$expected; indept_test$statistic; indept_test$p.value

