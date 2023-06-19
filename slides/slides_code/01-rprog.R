

## ---- arithmetic-example-----------------------------------------------------------------------
2 + 3 * 5 / 4
2 + 3 / 5 * 4 
# We have to do the operation in the parenthesis first
2 + 3 / (5 * 4) ^ 2


## ---- logical-example--------------------------------------------------------------------------
5 <= 5
5 <= 4
# 5 and 5.00 and 5.000 are of the same value
5 == 5.00
# 5 and 5L are of the same value too
# 5 is of type double; 5L is of type integer
5 == 5L
# Is 5 is NOT equal to 5? FALSE
5 != 5


## ----------------------------------------------------------------------------------------------
## Is TRUE equal to FALSE?
TRUE == FALSE
## Is TRUE not equal to FALSE?
TRUE != FALSE
## Is not TRUE equal to FALSE?
!TRUE == FALSE
## TRUE if either one is TRUE or both are TRUE
TRUE | FALSE
## TRUE if both are TRUE
TRUE & FALSE


## ----------------------------------------------------------------------------------------------
## When doing AND/OR comparisons, all nonzero values are treated as TRUE and 0 as FALSE.
1 | 0
2 | 0
0 | 0
0 & 0
1 & 0
1 & 1



## ----builtin-fcns------------------------------------------------------------------------------
sqrt(144)
## log base 10
log10(100)
exp(1)  ## Euler's number
sin(pi/2)
abs(-7)


## ----------------------------------------------------------------------------------------------
factorial(5)
exp(2)
## without specifying base value
## it is a natural log with base e
log(100)
## log function and we specify base = 2
log(44, base = 2)


## ----------------------------------------------------------------------------------------------
`+`(x = 2, y = 3)
`&`(TRUE, FALSE)


## ----assignment--------------------------------------------------------------------------------
x <- 5  ## we assign value 5 to a variable named x, which is an object.
x  ## type the variable name to see the value stored in the object x


## ----variable----------------------------------------------------------------------------------
(x <- x + 6)  # We can reassign any value to the variable we created
x == 12  # We can perform any operations on variables
log(x) # Variables can also be used in any built-in functions


## ----bad-naming--------------------------------------------------------------------------------
## THIS IS BAD CODING! DON'T DO THIS.
pi  ## pi is a built-in constant
(pi <- 20)
abs ## abs is a built-in function
(abs <- abs(pi))


## ----simpleview, echo=FALSE, out.width="80%", fig.align='center',fig.cap="https://speakerdeck.com/jennybc/simple-view-of-r-objects?slide=3"----
knitr::include_graphics("./img/simpleview.png")


## ----type--------------------------------------------------------------------------------------
typeof(5)
typeof(5L)
typeof("I_love_Marquette")


## ----------------------------------------------------------------------------------------------
typeof(1 > 3)
is.double(5L)


## ----numeric-----------------------------------------------------------------------------------
mode(5)
mode(5L)


## ----------------------------------------------------------------------------------------------
is.numeric(5)
is.numeric(5L)


## ----vector------------------------------------------------------------------------------------
(dbl_vec <- c(1, 2.5, 4.5)) 
(int_vec <- c(1L, 6L, 10L))
## TRUE and FALSE can be written as T and F
(log_vec <- c(TRUE, FALSE, T, F))  
(chr_vec <- c("these are", "some strings"))


## ----------------------------------------------------------------------------------------------
## check how many elements in a vector
length(dbl_vec) 
## check a compact description of 
## any R data structure
str(dbl_vec) 


## ----seq---------------------------------------------------------------------------------------
## use `:` to create a sequence of integers
(vec <- 1:10) 
typeof(vec)

# a sequence of numbers from 1 to 10 with increment 2
(seq_vec <- seq(from = 1, to = 10, by = 2))
typeof(seq_vec)


## ---- echo=FALSE, eval=FALSE-------------------------------------------------------------------
## # a sequence of numbers from 1 to 10
## # with 12 elements
## seq(from = 1, to = 10, length.out = 12)


## ----vector-arithmetic-------------------------------------------------------------------------
# Create two vectors
v1 <- c(3, 8, 4, 5)
v2 <- c(4, 11, 7, 8) 

## All operations happen element-wisely
# Vector addition
(add_result <- v1 + v2)  
# Vector subtraction
(sub_result <- v1 - v2)  


## ----------------------------------------------------------------------------------------------
# Vector multiplication
(multi_result <- v1 * v2)  
# Vector division
(divi_result <- v1 / v2)  
log(v1)
sqrt(v2)


## ----recycle-----------------------------------------------------------------------------------
v1 <- c(3, 8, 4, 5)
# The following 2 operations are the same
v1 * 2
v1 * c(2, 2, 2, 2)
v3 <- c(4, 11)
v1 + v3  ## v3 becomes c(4, 11, 4, 11) when doing the operation


## ----subsetting--------------------------------------------------------------------------------
v1
## The first element
v1[1] 
## The second to 4th element
v2[2:4]  


## ----------------------------------------------------------------------------------------------
v1[c(1, 3)]
## extract all except a few elements
## put a negative sign before the vector of 
## indices
v1[-c(2, 3)] 


## ---- echo = FALSE, eval=FALSE-----------------------------------------------------------------
## x <- c(1, 5, 2, 6)
## names(x) <- letters[1:4]
## x["c"]


## ----factor------------------------------------------------------------------------------------
## Create a factor from a character vector using function factor()
fac <- factor(c("freshman", "sophomore", "junior", "senior"))
typeof(fac)  ## The type is integer.
levels(fac) ## Each level represents an integer, ordered from the vector alphabetically.
str(fac)  ## The integers show the level each element in vector fac belongs to.
order_fac <- factor(c("freshman", "sophomore", "junior", "senior"),
                    levels = c("freshman", "sophomore", "junior", "senior")) #<<
str(order_fac)


## ----list--------------------------------------------------------------------------------------
## a list of 3 elements of different types
x_lst <- list(idx = 1:3, 
              "a", 
              c(TRUE, FALSE))
x_lst


## ----------------------------------------------------------------------------------------------
str(x_lst)
names(x_lst)
length(x_lst)


## ----------------------------------------------------------------------------------------------
x_lst <- list(idx = 1:3, "a", c(TRUE, FALSE))

# =====================
## Returns an "element"!
# =====================
## subset by name (a vector)
x_lst$idx  
## subset by indexing (a vector)
x_lst[[1]]  
typeof(x_lst$idx)


## ----------------------------------------------------------------------------------------------
# =====================
## Returns a "list"!
# =====================
## subset by name (still a list)
x_lst["idx"]  
## subset by indexing (still a list)
x_lst[1]  
typeof(x_lst["idx"])



## ----matrix, tidy=FALSE------------------------------------------------------------------------
## Create a 3 by 2 matrix called mat
(mat <- matrix(data = 1:6, nrow = 3, 
               ncol = 2)) 
dim(mat); nrow(mat); ncol(mat)


## ---- tidy=FALSE-------------------------------------------------------------------------------
# elements are arranged by row
matrix(data = 1:6, 
       nrow = 3, 
       ncol = 2, 
       byrow = TRUE) #<<


## ----------------------------------------------------------------------------------------------
mat
## assign row names and column names
rownames(mat) <- c("A", "B", "C")
colnames(mat) <- c("a", "b")
mat
rownames(mat)
colnames(mat)


## ----matrix-indexing---------------------------------------------------------------------------
mat
## all rows and 2nd column
## leave row index blank
## specify 2 in coln index
mat[, 2]


## ----------------------------------------------------------------------------------------------
## 2nd row and all columns
mat[2, ] 
## The 1st and 3rd rows and the 1st column
mat[c(1, 3), 1] 


## ----reduce-vector-----------------------------------------------------------------------------
(one_col_vec <- mat[, 2])
class(one_col_vec)


## ----------------------------------------------------------------------------------------------
(one_col_mat <- mat[, 2, 
                    drop = FALSE]) #<<
class(one_col_mat)


## ----matrix-bind-------------------------------------------------------------------------------
mat
mat_cbind <- matrix(data = 1:9, 
                    nrow = 3, 
                    ncol = 3)
## should have the same number of rows
cbind(mat, mat_cbind)  


## ----------------------------------------------------------------------------------------------
mat_rbind <- matrix(data = 1:10, 
                    nrow = 5, 
                    ncol = 2)
## should have the same number of columns
rbind(mat, mat_rbind)  


## ----dataframe---------------------------------------------------------------------------------
## data frame w/ an int column named var1 
## and char column named var2.
(df <- data.frame(var1 = 1:3, 
                  var2 = c("a","b", "c")))

## a data frame has a list structure
str(df)  


## ----------------------------------------------------------------------------------------------
## must set column names
## or they are ugly and non-recognizable
data.frame(1:3, c("a","b", "c")) 


## ----df-fcns, echo=1:5-------------------------------------------------------------------------
names(df)  ## df as a list
colnames(df)  ## df as a matrix
length(df) ## df as a list
ncol(df) ## df as a matrix
dim(df) ## df as a matrix

# typeof(df)
# class(df)


## ----------------------------------------------------------------------------------------------
## rbind() and cbind() can be used on df

df_rbind <- data.frame(var1 = 10, 
                       var2 = "g")
rbind(df, df_rbind)

df_cbind <- 
    data.frame(var3 = c("I", "love", "R"))
cbind(df, df_cbind)


## ----df-subset---------------------------------------------------------------------------------
df
## Subset rows
## select the row where var1 == 2
df[df$var1 == 2, ]
df[c(1, 3), ]


## ---- echo=1:5, eval=1:5-----------------------------------------------------------------------
## Subset columns
## like a list
df[c("var1", "var2")] 
## like a matrix
df[, c("var1", "var2")]
str(df["var1"])  ## a data frame with one column
str(df[, "var1"])  ## becomes a vector by default




