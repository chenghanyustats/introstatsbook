

## ----------------------------------------------------------------------------------------------
library(openintro)
# 50 values (rent, mortgage, own) of categorical variable homeownership 
# in the data loan50
x <- loan50$homeownership
x
## frequency table
table(x)


## ----------------------------------------------------------------------------------------------
freq_table <- as.matrix(table(x))
freq_table
colnames(freq_table) <- "frequency"
freq_table


## ----------------------------------------------------------------------------------------------
## create relative frequency vector
rel_freq <- freq_table[, 1] / 50
rel_freq

## combine freq_table with rel_freq
rel_freq_tbl <- cbind(freq_table, rel_freq)
rel_freq_tbl


## ----------------------------------------------------------------------------------------------
barplot(height = table(x), main = "Bar Chart", xlab = "Homeownership")


## ---- echo=2-----------------------------------------------------------------------------------
par(mar = c(0, 0, 1, 0))
pie(x = table(x), main = "Pie Chart")





## ----------------------------------------------------------------------------------------------
## Interest Rate in percentage %
data <- round(loan50$interest_rate, 1)
data


## ----------------------------------------------------------------------------------------------
k <- 9


## ----------------------------------------------------------------------------------------------
(class_width <- (max(data) - min(data)) / k)  ## max = 26.3 and min = 5.31
class_width <- 2.5 ## We use 2.5 for convenience


## ----------------------------------------------------------------------------------------------
min(data)
lower_limit <- 5  ## We use 5 for convenience


## ----------------------------------------------------------------------------------------------
0:9
0:9 * class_width
class_boundary <- lower_limit + 0:9 * class_width
class_boundary


## ----------------------------------------------------------------------------------------------
freq_info <- hist(data, class_boundary, plot = FALSE)
freq_info$breaks
freq_info$counts


## ----freq_table_quant_2, tidy=FALSE------------------------------------------------------------
## Create class interval column 
class_interval <- paste(class_boundary[1:k], class_boundary[2:(k+1)], sep = "-")
class_interval

## Create frequency table using data frame structure
freq_table_quant <- data.frame("Class" = as.character(1:k), 
                               "Class_Intvl" = class_interval, 
                               "Freq" = freq_info$counts, 
                               "Rel_Freq" = freq_info$counts / length(x))
print(freq_table_quant, row.names = FALSE)


## ----freq_hist, tidy=FALSE, echo=-1------------------------------------------------------------
par(mar = c(4, 4, 2, 1))
hist(x = data, breaks = class_boundary, xlab = "Interest Rate (%)", las = 1,
     main = "Histogram of Interest Rate")


## ----------------------------------------------------------------------------------------------
mean(data)



## ----median, dependson='mean', tiny=FALSE------------------------------------------------------
## Compute the median using command median()
median(data) 
## Compute the median using definition
(sort_data <- sort(data))  ## Order data
length(data)  ## Check sample size is odd or even
(sort_data[25] + sort_data[26]) / 2  ## Verify the answer


## ----mode, echo = 1:2--------------------------------------------------------------------------
## Create a frequency table 
(table_data <- table(data))
# sort_table_data <- sort(table_data, decreasing = TRUE)
# sort_table_data
# print(paste("The mode is",names(sort_table_data)[1]))


## ----------------------------------------------------------------------------------------------
## Sort the table to find the mode that occurs most frequently
## the number that happens most frequently will be the last one
sort(table_data)  
## the number that happens most frequently will be the first one
sort(table_data, decreasing = TRUE)  


## ---- tidy = FALSE, echo = -(1:2), highlight.output=1------------------------------------------
data_extreme <- data; data_extreme[1] <- 90 ## replace the first 3 values with 3 large values 
## In the original data, the maximum value is 42.
data_extreme

## ----------------------------------------------------------------------------------------------
mean(data_extreme)  ## Large mean! Original mean is 11.56
median(data_extreme)  ## Median does not change!
names(sort(table(data_extreme), decreasing = TRUE))[1] ## Mode does not change too!





## ---- iqr-1, tidy=FALSE------------------------------------------------------------------------
## Use quantile() to find any percentile 
## through specifying the probability
quantile(x = data, 
         probs = c(0.25, 0.5, 0.75))
## IQR by definition
quantile(x = data, probs = 0.75) - 
  quantile(x = data, probs = 0.25) 


## ---- iqr-2, tidy=FALSE------------------------------------------------------------------------
## IQR()
IQR(data)  
## summary() to get the numeric summary
summary(data)


## ----------------------------------------------------------------------------------------------
var(data)
sqrt(var(data))
sd(data)



## ----boxplot, echo=-c(1, 2), out.width="100%"--------------------------------------------------
par(mar = c(0,4,0,0))
par(mfrow = c(1, 1))
boxplot(data, las = 1,
        ylab = "Interest Rate (%)")


## ----------------------------------------------------------------------------------------------
Q3 <- quantile(data, probs = 0.75, 
               names = FALSE)
Q1 <- quantile(data, probs = 0.25, 
               names = FALSE)
IQR <- Q3 - Q1
Q1 - 1.5 * IQR
min(data)
Q3 + 1.5 * IQR
max(data)


## ----------------------------------------------------------------------------------------------
summary(data)
fivenum(data) ## Tukey's five number summary (minimum, lower-hinge, median, upper-hinge, maximum)
range(data)  ## min and max

