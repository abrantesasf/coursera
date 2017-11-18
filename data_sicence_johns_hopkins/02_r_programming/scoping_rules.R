# LEXICAL (static) SCOPING:
#==========================
make.pow <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}

square <- make.pow(2)
cube <- make.pow(3)
square(4)
cube(4)
cube

search()

ls(environment(square))
get("n", environment(square))
get("n", environment(cube))

search()



## DYNAMIC SCOPING
##================
y <- 10

f <- function(x) {
  y <- 2
  y^2 + g(x)
}

g <- function(x) {
  # g foi definida no ambiente global, então o 
  # valor de y será buscado do ambiente global
  x * y
}

f(3)

f2 <- function(x) {
     y <- 2
     g <- function(x) {
          # g foi definida no ambiente de f, então o
          # valor de y será buscado no ambiente de f
          x * y
     }
     y^2 + g(x)
}

f2(3)
