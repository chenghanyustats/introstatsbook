
## ---- arithmetic-example--------------------------------------------------------------------------------------------------------------
2 + 3 * 5 + 4
2 + 3 * (5 + 4)


## ---- logical-example-----------------------------------------------------------------------------------------------------------------
5 <= 5
5 <= 4
# Is 5 NOT equal to 5? FALSE
5 != 5


## -------------------------------------------------------------------------------------------------------------------------------------
## Is TRUE not equal to FALSE?
TRUE != FALSE
## Is not TRUE equal to FALSE?
!TRUE == FALSE
## TRUE if either one is TRUE or both are TRUE
TRUE | FALSE


## -------------------------------------------------------------------------------------------------------------------------------------
## When doing AND/OR comparisons, all nonzero values are treated as TRUE and 0 as FALSE.
1 | 0
2 | 0
0 | 0
0 & 0
1 & 0
1 & 1



## ----builtin-fcns---------------------------------------------------------------------------------------------------------------------
sqrt(144)
exp(1)  ## Euler's number
sin(pi/2)
abs(-7)


## -------------------------------------------------------------------------------------------------------------------------------------
factorial(5)
## without specifying base value
## it is a natural log with base e
log(100)
## log function and we specify base = 2
log(100, base = 10)


## -------------------------------------------------------------------------------------------------------------------------------------
`+`(x = 2, y = 3)
`&`(TRUE, FALSE)


## ----assignment-----------------------------------------------------------------------------------------------------------------------
x <- 5  ## we create an object, value 5, and call it x, which is a variable.
x  ## type the variable name to see the value stored in the object x


## ----variable-------------------------------------------------------------------------------------------------------------------------
(x <- x + 6)  # We can reassign any value to the variable we created
x == 5  # We can perform any operations on variables
log(x) # Variables can also be used in any built-in functions


## ----bad-naming-----------------------------------------------------------------------------------------------------------------------
## THIS IS BAD CODING! DON'T DO THIS!
pi  ## pi is a built-in constant
(pi <- 20)
abs ## abs is a built-in function
(abs <- abs(pi))


## ----type-----------------------------------------------------------------------------------------------------------------------------
typeof(5)
typeof(5L)
typeof("I_love_stat!")


## -------------------------------------------------------------------------------------------------------------------------------------
typeof(1 > 3)
is.double(5L)


## -------------------------------------------------------------------------------------------------------------------------------------
is.numeric(5)
is.numeric(5L)


## ----vector---------------------------------------------------------------------------------------------------------------------------
(dbl_vec <- c(1, 2.5, 4.5)) 
(int_vec <- c(1L, 6L, 10L))
## TRUE and FALSE can be written as T and F
(log_vec <- c(TRUE, FALSE, F))  
(chr_vec <- c("pretty", "girl"))


## -------------------------------------------------------------------------------------------------------------------------------------
## check how many elements in a vector
length(dbl_vec) 
## check a compact description of 
## any R data structure
str(dbl_vec) 


## ----seq------------------------------------------------------------------------------------------------------------------------------
## use `:` to create a sequence of integers
(vec <- 1:10) 
typeof(vec)

# a sequence of numbers from 1 to 10 with increment 2
(seq_vec <- seq(from = 1, to = 10, by = 2))
typeof(seq_vec)


## ----vector-arithmetic----------------------------------------------------------------------------------------------------------------
# Create two vectors
v1 <- c(3, 8)
v2 <- c(4, 100) 

## All operations happen element-wisely
# Vector addition
v1 + v2
# Vector subtraction
v1 - v2


## -------------------------------------------------------------------------------------------------------------------------------------
# Vector multiplication
v1 * v2
# Vector division
v1 / v2
sqrt(v2)


## ----recycle--------------------------------------------------------------------------------------------------------------------------
v1 <- c(3, 8, 4, 5)
# The following 2 operations are the same
v1 * 2
v1 * c(2, 2, 2, 2)
v3 <- c(4, 11)
v1 + v3  ## v3 becomes c(4, 11, 4, 11) when doing the operation


## ----subsetting-----------------------------------------------------------------------------------------------------------------------
v1
v2
## The first element
v1[1] 
## The second element
v2[2]  


## -------------------------------------------------------------------------------------------------------------------------------------
v1[c(1, 3)]
## extract all except a few elements
## put a negative sign before the vector of 
## indices
v1[-c(2, 3)] 


## ----factor, echo=-1------------------------------------------------------------------------------------------------------------------
## Create a factor from a character vector using function factor()
fac <- factor(c("med", "high", "low"))
typeof(fac)
levels(fac) ## Each level represents an integer, ordered from the vector alphabetically.
str(fac)  ## The integers show the level each element in vector fac belongs to.
order_fac <- factor(c("med", "high", "low"), levels = c("low", "med", "high"))
str(order_fac)


## ----list-----------------------------------------------------------------------------------------------------------------------------
## a list of 3 elements of different types
x_lst <- list(idx = 1:3, 
              "a", 
              c(TRUE, FALSE))
x_lst


## -------------------------------------------------------------------------------------------------------------------------------------
str(x_lst)
names(x_lst)
length(x_lst)


## -------------------------------------------------------------------------------------------------------------------------------------
x_lst <- list(idx = 1:3, 
              "a", 
              c(TRUE, FALSE))


## -------------------------------------------------------------------------------------------------------------------------------------
## subset by name (a vector)
x_lst$idx  
## subset by indexing (a vector)
x_lst[[1]]  
typeof(x_lst$idx)


## -------------------------------------------------------------------------------------------------------------------------------------
## subset by name (still a list)
x_lst["idx"]  
## subset by indexing (still a list)
x_lst[1]  
typeof(x_lst["idx"])


## ----matrix, tidy=FALSE---------------------------------------------------------------------------------------------------------------
## Create a 3 by 2 matrix called mat
(mat <- matrix(data = 1:6, nrow = 3, ncol = 2)) 
dim(mat); nrow(mat); ncol(mat)


## -------------------------------------------------------------------------------------------------------------------------------------
mat
## assign row names and column names
rownames(mat) <- c("A", "B", "C")
colnames(mat) <- c("a", "b")
mat
rownames(mat)
colnames(mat)


## ----matrix-indexing------------------------------------------------------------------------------------------------------------------
mat
## all rows and 2nd column
## leave row index blank
## specify 2 in coln index
mat[, 2]


## -------------------------------------------------------------------------------------------------------------------------------------
## 2nd row and all columns
mat[2, ] 
## The 1st and 3rd rows
mat[c(1, 3), ] 


## ----reduce-vector--------------------------------------------------------------------------------------------------------------------
(one_col_vec <- mat[, 2])
class(one_col_vec)


## -------------------------------------------------------------------------------------------------------------------------------------
(one_col_mat <- mat[, 2, 
                    drop = FALSE]) #<<
class(one_col_mat)


## ----matrix-bind----------------------------------------------------------------------------------------------------------------------
mat
mat_c <- matrix(data = c(7, 0, 0, 8, 2, 6), 
                nrow = 3, ncol = 2)
## should have the same number of rows
cbind(mat, mat_c)  


## -------------------------------------------------------------------------------------------------------------------------------------
mat_r <- matrix(data = 1:4, 
                nrow = 2, 
                ncol = 2)
## should have the same number of columns
rbind(mat, mat_r)  


## ----dataframe------------------------------------------------------------------------------------------------------------------------
## data frame w/ an dbl column named  
## and char column named grade.
(df <- data.frame(age = c(19,21,40), 
                  gender = c("m","f","m")))

## a data frame has a list structure
str(df)  


## -------------------------------------------------------------------------------------------------------------------------------------
## must set column names
## or they are ugly and non-recognizable
data.frame(c(19, 21, 40), c("m","f", "m")) 


## ----df-fcns, echo=1:5----------------------------------------------------------------------------------------------------------------
names(df)  ## df as a list
colnames(df)  ## df as a matrix
length(df) ## df as a list
ncol(df) ## df as a matrix
dim(df) ## df as a matrix

# typeof(df)
# class(df)


## -------------------------------------------------------------------------------------------------------------------------------------
## rbind() and cbind() can be used on df

df_r <- data.frame(age = 10, 
                   gender = "f")
rbind(df, df_r)

df_c <- 
    data.frame(col = c("red","blue","gray"))
(df_new <- cbind(df, df_c))


## ----df-subset------------------------------------------------------------------------------------------------------------------------
df_new
## Subset rows
df_new[c(1, 3), ]
## select the row where age == 21
df_new[df_new$age == 21, ]


## ---- echo=1:6, eval=1:6--------------------------------------------------------------------------------------------------------------
## Subset columns
## like a list
df_new$age
df_new[c("age", "gender")] 
## like a matrix
df_new[, c("age", "gender")]
str(df["age"])  ## a data frame with one column
str(df[, "age"])  ## becomes a vector by default


## -------------------------------------------------------------------------------------------------------------------------------------
str(df["age"])  ## a data frame with one column
str(df[, "age"])  ## becomes a vector by default
