# Chapter 19 High performance function with Rcpp
# book chapter from Advanced R, 2015 
# Getting started with C++ ------------------------------------------------

library(Rcpp)
library(microbenchmark)
cppFunction('int add(int x, int y, int z) {
  int sum = x + y + z;
  return sum;
          
            }')
add(1,2,3)


# 19.1.1 no inputs, scalar output -----------------------------------------

code <- 'int one(){
  return 1;
}'
cppFunction(code)
one() 


# 19.1.2 scalar input, scalar ouput ---------------------------------------
# compare R and C++ syntax
signR <- function(x){
  if (x > 0) {
    1
  } else if (x == 0) {
    0
  } else {
    -1
  }
}

code <- '
int signC(int x) {
  if (x > 0) {
    return 1;
  } else if (x==0) {
    return 0;
  } else {
    return -1;
  }
}'

cppFunction(code)
signC(9)
signR(9)


# 19.1.3 Vector input, scalar output --------------------------------------

sumR <- function(x) {
  total <- 0
  for (i in seq_along(x)) {
    total <- total + x[i]
  }
  total
}

cppFunction('double sumC(NumericVector x) {
  int n = x.size(); 
  double total = 0;
  for (int i = 0; i < n; ++i) {
    total += x[i];
  }
  return total;
}     
             
  ')


x <- runif(1e3)
microbenchmark(
  sum(x),
  sumC(x),
  sumR(x)
)


# 19.1.4 Vector input, vector output --------------------------------------
# point and points ?
pdistR <- function(x, ys) {
  sqrt((x - ys)^2)
}

code <- '
NumericVector pdistC(double x, NumericVector ys) {
  int n = ys.size();
  NumericVector out(n);
  for(int i = 0; i < n; ++i) {
    out[i] = sqrt(pow(ys[i]-x, 2.0));
  }
  return out;
}'

cppFunction(code)


# 19.1.5 matrix input , vector output -------------------------------------

sourceCpp("rowSumsC.cpp")

set.seed(1014)
x <- matrix(sample(100), 10)
rowSums(x)

rowSumC(x)


# 19.1.6 Using sourceCpp --------------------------------------------------
sourceCpp("meanC.cpp")
library(microbenchmark)
x <- runif(1e6)
microbenchmark(
  mean(x),
  meanC(x)
)


# 19.2 attributes and other classes ---------------------------------------

# .attr()  in R
# .names() in Rcpp


# 19.2.1 lists and data frames --------------------------------------------

sourceCpp("mpe_lm.cpp")

mod <- lm(mpg ~ wt, data = mtcars)
mpe(mod)


# 19.2.2 Functions --------------------------------------------------------

# sourceCpp("call_with_one.cpp")
# callWithOne(function(x) x + 1)
# callWithOne(paste)
# 
# sourceCpp("lappy_cpp.cpp")
# f("y", 1)
# x <- runif(1000)
# lapply1(mean, x) # not working 
# 
# f(_["x"] = "y", _["value"] = 1);

# the part above is not working #


# 19.2.3 other types ------------------------------------------------------

# Environment, WeakReference, ComplexVector, 
# RawVector, DottedPair, Language, ...



# 19.3 Missing values -----------------------------------------------------
sourceCpp("scalar_missing.cpp")


# 19.3.1.1 integers -------------------------------------------------------
# use IntegerVector 


# 19.3.1.2 doubles --------------------------------------------------------

evalCpp("NAN == 1")
evalCpp("NAN == NAN")
evalCpp("NAN + 1") # spread 


# 19.3.2 strings ----------------------------------------------------------


# Boolean -----------------------------------------------------------------

# in R it has T, F and NA; in C++, T, F


# 19.3.4 vectors ----------------------------------------------------------

sourceCpp("is_na.cpp")


# 19.4 Rcpp sugar ---------------------------------------------------------


# 19.4.1 arithmetic and logical operators ---------------------------------


# 19.4.2 logical summary functions ----------------------------------------


# 19.4.3 vector views -----------------------------------------------------


# 19.4.4 other useful functions -------------------------------------------


# 19.5 the STL ------------------------------------------------------------


# 19.5.1 using iterators --------------------------------------------------

sourceCpp("sum_use_iterator.cpp")


# 19.5.2 Algorithms -------------------------------------------------------


# 19.5.3 data structures --------------------------------------------------


# 19.5.4 vectors ----------------------------------------------------------

sourceCpp("rle.cpp")

# 19.5.5 sets -------------------------------------------------------------

sourceCpp('duplicatedC.cpp')


# 19.5.6 Map --------------------------------------------------------------

sourceCpp('tableC.cpp')


# 19.6 Case studies -------------------------------------------------------


# 19.6.1 Gibbs sampler ----------------------------------------------------

gibbs_R <- function(N, thin) {
  mat <- matrix(nrow = N, ncol = 2)
  x <- y <- 0
  for (i in 1:N) {
    for (j in 1:thin) {
      x <- rgamma(1, 3, y * y + 4)
      y <- rnorm(1, 1 / (x + 1), 1 / sqrt(2*(x+1)))
    }
    mat[i,] <- c(x, y)
  }
  mat
}

sourceCpp('gibbls_cpp.cpp')

# benchmarking
microbenchmark(gibbs_R(100, 10), gibbs_cpp(100, 10))


# 19.6.2 R vectorization vs C++ vectorization -----------------------------
vacc1a <- function(age, female, ily) {
  p <- 0.25 + 0.3 * 1 / (1 - exp(0.04 * age)) + 0.1 * ily
  p <- p * if (female) 1.25 else 0.75
  p <- max(0, p)
  p <- min(1, p)
  p
}


vacc1 <- function(age, female, ily) {
  n <- length(age)
  out <- numeric(n)
  for (i in seq_len(n)) {
    out[i] <- vacc1a(age[i], female[i], ily[i])
  }
  out
}

vacc2 <- function(age, female, ily) {
  p <- 0.25 + 0.3 * 1 / (1 - exp(0.04 * age)) + 0.1 * ily
  p <- p * ifelse(female, 1.25, 0.75)
  p <- pmax(0, p)
  p <- pmin(1, p)
  p
}

sourceCpp('vacc.cpp')

# test or benchmark
n <- 1000
age <- rnorm(n, mean = 50, sd = 10)
female <- sample(c(T, F), n, rep = TRUE)
ily <- sample(c(T, F), n, prob = c(0.8, 0.2), rep = TRUE)
stopifnot(
  all.equal(vacc1(age, female, ily), vacc2(age, female, ily)),
  all.equal(vacc1(age, female, ily), vacc3(age, female, ily))
)

microbenchmark(
  vacc1 = vacc1(age, female, ily),
  vacc2 = vacc2(age, female, ily),
  vacc3 = vacc3(age, female, ily)
)


# 19.7 using Rcpp in a package --------------------------------------------


# 19.8, 19.9 Learning more... ---------------------------------------------

