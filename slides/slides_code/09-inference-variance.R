

## ----chisq_test_one_sigma, tidy=FALSE, echo=1:10-----------------------------------------------
s <- 3.433; n <- 30; alpha_ci <- 0.01
## 99% CI for sigma
chi_sq_upper <- qchisq(p = alpha_ci / 2, df = n - 1, lower.tail = FALSE)
chi_sq_lower <- qchisq(p = alpha_ci / 2, df = n - 1, lower.tail = TRUE)
round(sqrt((n - 1) * s ^ 2 / chi_sq_upper), 2)
round(sqrt((n - 1) * s ^ 2 / chi_sq_lower), 2)
## Testing sigma > 4
sigma_0 <- 4; alpha_test <- 0.05
(test_stats <- (n - 1) * s ^ 2 / (sigma_0 ^ 2))
(cri_val <- qchisq(p = alpha_test, df = n - 1, lower.tail = FALSE))
# ifelse(test_stats > cri_val, "Reject H_0", "Fail to reject H_0")

# print(paste("99% CI for sigma is (", round(sqrt((n - 1) * s ^ 2 / chi_sq_upper), 2), ",", 
            # round(sqrt((n - 1) * s ^ 2 / chi_sq_lower), 2), ")"))
## Another way to do the inference for sigma
# library(DescTools)
# VarTest()



## ----f_test_two_sigma_ci, tidy=FALSE, echo=TRUE------------------------------------------------
n1 <- 10; n2 <- 10; 
s1 <- 0.5; s2 <- 0.7; alpha <- 0.05
## 99% CI for sigma_1^2 / sigma_2^2
f_upper <- 1 / qf(p = 1 - alpha / 2, 
                  df1 = n1 - 1, 
                  df2 = n2 - 1, 
                  lower.tail = FALSE)
f_lower <- 1 / qf(p = alpha / 2, 
                  df1 = n1 - 1, 
                  df2 = n2 - 1, 
                  lower.tail = FALSE)
round(s1 ^ 2 / s2 ^ 2 * f_lower, 2)
round(s1 ^ 2 / s2 ^ 2 * f_upper, 2)


## ----f_test_two_sigma_test, tidy=FALSE, echo=TRUE----------------------------------------------
## Testing sigma_1 = sigma_2
(test_stats <- s1 ^ 2 / s2 ^ 2)
(cri_val_1 <- qf(p = alpha/2, 
                 df1 = n1 - 1, 
                 df2 = n2 - 1, 
                 lower.tail = FALSE))
(cri_val_2 <- qf(p = 1 - alpha/2, 
                 df1 = n1 - 1, 
                 df2 = n2 - 1, 
                 lower.tail = FALSE))

