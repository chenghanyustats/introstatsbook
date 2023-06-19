

## ----example1_compute, echo=TRUE, tidy=FALSE---------------------------------------------------
## create objects for any information we have
alpha <- 0.05; mu_0 <- 120; x_bar <- 121.5; sigma <- 5; n <- 100
(z_sta <- (x_bar - mu_0) / (sigma / sqrt(n))) ## Test statistic
(z_cri <- qnorm(alpha, lower.tail = FALSE)) ## Critical value
(p_val <- pnorm(z_sta, lower.tail = FALSE)) ## p-value
## Make a decision
ifelse(z_sta > z_cri, "Reject H0 by crit. value", "Do not reject H0 by crit. value")
ifelse(p_val < alpha, "Reject H0 by p-value", "Do not reject H0 by p-value")



## ----example2_compute, echo=TRUE, tidy=FALSE---------------------------------------------------
## create objects for any information we have
alpha <- 0.05; mu_0 <- 150; x_bar <- 147.2; s <- 5.5; n <- 25
(t_sta <- (x_bar - mu_0) / (s / sqrt(n))) ## Test statistic
(t_cri <- qt(alpha, df = n - 1, lower.tail = TRUE)) ## Critical value
(p_val <- pt(t_sta, df = n - 1, lower.tail = TRUE)) ## p-value
## Make a decision
ifelse(t_sta < t_cri, "Reject H0 by crit. value", "Do not reject H0 by crit. value")
ifelse(p_val <= alpha, "Reject H0 by p-value", "Do not reject H0 by p-value")


