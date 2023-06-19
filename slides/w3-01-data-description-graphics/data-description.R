## ----loan50, highlight.output = c(1, 5)-----------------------------------------------------------------------------------------------
# install.packages("openintro")
library(openintro)
str(loan50)


## -------------------------------------------------------------------------------------------------------------------------------------
# 50 values (rent, mortgage, own) of categorical homeownership in loan50 data
(x <- loan50$homeownership)
## frequency table
table(x)


## -------------------------------------------------------------------------------------------------------------------------------------
freq <- table(x)
rel_freq <- freq / sum(freq)
cbind(freq, rel_freq)


## -------------------------------------------------------------------------------------------------------------------------------------
## convert a vector to a matrix
(freq_table <- as.matrix(table(x)))
colnames(freq_table) <- "freq"
freq_table


## -------------------------------------------------------------------------------------------------------------------------------------
## create relative frequency vector
(rel_freq <- freq_table[, 1] / 50)


## -------------------------------------------------------------------------------------------------------------------------------------
## combine freq_table with rel_freq
(rel_freq_tbl <- cbind(freq_table, 
                       rel_freq))


## -------------------------------------------------------------------------------------------------------------------------------------
# Add total information at the bottom
rbind(rel_freq_tbl, total = c(50, 1))




## ---- echo=-1-------------------------------------------------------------------------------------------------------------------------
par(mar = c(4, 4, 2, 1))
barplot(height = table(x), main = "Bar Chart", xlab = "Homeownership")










## ---- echo=2--------------------------------------------------------------------------------------------------------------------------
par(mar = c(0, 0, 1, 0))
pie(x = table(x), main = "Pie Chart")





## -------------------------------------------------------------------------------------------------------------------------------------
range(iq)




## -------------------------------------------------------------------------------------------------------------------------------------
(int_rate <- round(loan50$interest_rate, 1))





## -------------------------------------------------------------------------------------------------------------------------------------
range(int_rate)


## ----freq_hist, tidy=FALSE, echo=-1, out.width="90%"----------------------------------------------------------------------------------
par(mar = c(4, 4, 2, 1))
hist(x = int_rate, 
     xlab = "Interest Rate (%)",
     main = "Hist. of Int. Rate (Defualt)")


## ----out.width="90%"------------------------------------------------------------------------------------------------------------------
k <- 9
class_width <- 2.5
lower_limit <- 5

class_boundary <- lower_limit + 0:k * class_width

hist(x = int_rate, 
     breaks = class_boundary, #<<
     xlab = "Interest Rate (%)",
     main = "Hist. of Int. Rate (Ours)")


## ---- tidy=FALSE, out.width="100%"----------------------------------------------------------------------------------------------------
hist(x = int_rate, 
     breaks = 1,
     xlab = "Interest Rate (%)",
     main = "Hist. of Int. Rate (Too few)")


## ---- tidy=FALSE, out.width="100%"----------------------------------------------------------------------------------------------------
hist(x = int_rate, 
     breaks = 100,
     xlab = "Interest Rate (%)",
     main = "Hist. of Int. Rate (Too many)")


## ---- out.width="55%"-----------------------------------------------------------------------------------------------------------------
plot(x = loan50$total_income, y = loan50$loan_amount,
     xlab = "Total income", ylab = "Loan amount",
     pch = 16, col = 4)




## -------------------------------------------------------------------------------------------------------------------------------------
mean(int_rate)






## ----median, dependson='mean', tiny=FALSE---------------------------------------------------------------------------------------------
median(int_rate)  ## Compute the median using command median()


## -------------------------------------------------------------------------------------------------------------------------------------
## Compute the median using definition
(sort_rate <- sort(int_rate))  ## sort data
length(int_rate)  ## Check sample size is odd or even
(sort_rate[25] + sort_rate[26]) / 2  ## Verify the answer


## -------------------------------------------------------------------------------------------------------------------------------------
(int_rate[25] + int_rate[26]) / 2  ## Using un-sorted data leads to a wrong answer!!


## ----mode, echo = 1:2-----------------------------------------------------------------------------------------------------------------
## Create a frequency table 
(table_data <- table(int_rate))


## -------------------------------------------------------------------------------------------------------------------------------------
## Sort the table to find the mode that occurs most frequently
## the number that happens most frequently will be the first one
sort(table_data, decreasing = TRUE)


## ---- tidy = FALSE, echo = -(1:2), highlight.output=1---------------------------------------------------------------------------------
data_extreme <- int_rate; data_extreme[1] <- 90
data_extreme

## -------------------------------------------------------------------------------------------------------------------------------------
mean(data_extreme)  ## Large mean! Original mean is 11.56
median(data_extreme)  ## Median does not change!
names(sort(table(data_extreme), decreasing = TRUE))[1] ## Mode does not change too!








## ---- iqr-1, tidy=FALSE---------------------------------------------------------------------------------------------------------------
## Use quantile() to find any percentile 
## through specifying the probability
quantile(x = int_rate, 
         probs = c(0.25, 0.5, 0.75))
## IQR by definition
quantile(x = int_rate, probs = 0.75) - 
  quantile(x = int_rate, probs = 0.25) 


## ---- iqr-2, tidy=FALSE---------------------------------------------------------------------------------------------------------------
## IQR()
IQR(int_rate)  
## summary() to get the numeric summary
summary(int_rate)




## -------------------------------------------------------------------------------------------------------------------------------------
var(int_rate)
sqrt(var(int_rate))
sd(int_rate)






## ----boxplot, echo=-c(1, 2), out.width="100%"-----------------------------------------------------------------------------------------
par(mar = c(0,4,0,0))
par(mfrow = c(1, 1))
boxplot(int_rate,ylab ="Interest Rate (%)")


## -------------------------------------------------------------------------------------------------------------------------------------
sort(int_rate, decreasing = TRUE)[1:5]
sort(int_rate)[1:5]
Q3 <- quantile(int_rate, probs = 0.75, 
               names = FALSE)
Q1 <- quantile(int_rate, probs = 0.25, 
               names = FALSE)
IQR <- Q3 - Q1
Q1 - 1.5 * IQR
Q3 + 1.5 * IQR
