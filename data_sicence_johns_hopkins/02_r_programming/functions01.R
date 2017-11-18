# Ajusta diretório de trabalho
setwd("~/repositoriosGit/coursera/data_sicence_johns_hopkins/02_r_programming")

# Função para adicionar 2 números
soma2 <- function(x, y) {
  x + y
}
soma2(4, 6)

# Olá mundo com CAT
ola <- function() {
  cat("Olá Mundo!")
}
ola()

# Olá mundo com PRINT
ola <- function() {
  print("Olá Mundo!")
}
ola()

# Above10
x <- 1:20
above10 <- function(x) {
  use <- x > 10
  x[use]
}
above10(x)

# Above n
x <- 1:20
aboveN <- function(x, n) {
  use <- x > n
  x[use]
}
aboveN(x, 14)

# Vários Olá Mundo
muitosOla <- function(n) {
  for (i in seq_len(n)) {
    cat("Olá Mundo!\n")
  }
}
muitosOla(800)

# Retornando valores
columnMean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}
columnMean(airquality)
columnMean(airquality, TRUE)
columnMean(airquality, FALSE)

