## QUIZ

# PERGUNTA 1:
# Dada a seguinte função,
cube <- function(x, n) {
     x^3
}

# qual o resultado de executar:
cube(3)


# PERGUNTA 2:
# O seguinte código produz um aviso no R. Por quê?
x <- 1:10
if (x > 5) {
     x <- 0
}


# PERGUNTA 3:
# Dada a seguinte função,
f <- function(x) {
     g <- function(y) {
          y + z
     }
     z <- 4
     x + g(x)
}

# qual o resultado de:
z <- 10
f(3)


# PERGUNTA 4:
# Considere o seguinte código:
x <- 5
y <- if(x < 3) {
     NA
} else {
     10
}
# Qual é o valor de y?


# PERGUNTA 5:
# Considere a seguinte função:
h <- function(x, y = NULL, d = 3L) {
     z <- cbind(x, d)
     if(!is.null(y))
          z <- z + y
     else
          z <- z + f
     g <- x + y / z
     if(d == 3L)
          return(g)
     g <- g + 10
     g
}

# Qual variável é uma FREE VARIABLE?


# PERGUNTA 6:
# O que é um environment no R?


# PERGUNTA 7:
# A linguagem R usa que tipo de scoping para resolver free variables?


# PEGUNTA 8:
# Como as free variables são resolvidas no R?


# PERGUNTA 9:
# Qual é uma das principais conseqüências das regras de scoping do R?


# PERGUNTA 10:
# No R, o que é o parent frame?