setwd("~/repositoriosGit/coursera/data_sicence_johns_hopkins/02_r_programming/programming_assignment")

## PARTE 1:
#==========
pollutantmean <- function(directory, pollutant, id = 1:332) {
     # Cria vetor para armazenar dados de todos os arquivos
     poluente <- double()
     
     # Loop através dos arquivos para ler os dados dos poluentes
     for (i in id) {
          # Nome do arquivo
          numero <- if (i < 10) {
               paste("00", i, sep = "")
          } else if (i < 100) {
               paste("0", i, sep = "")
          } else {
               i
          }
          arquivo = paste(directory, "/", paste(numero, ".csv", sep=""), sep="")
          
          # Lê o arquivo em um dataframe
          df <- read.csv(arquivo)
          
          # Popula o vetor poluente
          if (pollutant == "sulfate") {
               poluente <- c(poluente, df$sulfate)
          } else {
               poluente <- c(poluente, df$nitrate)
          }
     }
     
     # Remove dataframe da memória
     rm(df)
     
     # Calcula a média do poluente, removendo NAs:
     mean(poluente, na.rm = TRUE)
}

pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")




## PARTE 2:
#==========
complete <- function(directory, id = 1:332) {
     # Cria um data frame vazio para armazenar os dados
     df <- data.frame(id = numeric(), nobs = numeric())
     
     # Loop através dos arquivos para ler os dados dos poluentes
     for (i in id) {
          # Nome do arquivo
          numero <- if (i < 10) {
               paste("00", i, sep = "")
          } else if (i < 100) {
               paste("0", i, sep = "")
          } else {
               i
          }
          arquivo = paste(directory, "/", paste(numero, ".csv", sep=""), sep="")
          
          # Lê o arquivo em um dataframe
          df2 <- read.csv(arquivo)
          
          # Arquivo e Número de casos completos
          arq <- i
          numCasos <- sum(complete.cases(df2))
          
          # Data frame temporário para soma ao principal
          df3 <- data.frame(cbind(arq, numCasos))
          
          # Append ao data frame principal
          df <- rbind(df, df3)
     }
     names(df) <- c("id", "nobs")
     df
}

complete("specdata", 3)
complete("specdata", 30:25)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 1)
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
cc <- complete("specdata", 54)
print(cc$nobs)
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])




## PARTE 3:
#==========
corr <- function(directory, threshold = 0) {
     # Cria vetor para armazenar dados das correlações
     correlacoes <- double()
     
     # Lista de arquivos no diretório
     arqs <- list.files("specdata", pattern = "\\.csv")
     
     # Loop através dos arquivos para ler os dados dos poluentes
     for (i in arqs) {
          # Path do arquivo
          arquivo = paste(directory, "/", i, sep="")
          
          # Lê o arquivo em um dataframe
          df <- read.csv(arquivo)
          
          # Número de casos completos
          numCasos <- sum(complete.cases(df))
          
          # Calcula correlação entre poluentes, se numCasos > threshold
          c <- if (numCasos > threshold) {
               # Seleciona casos completos para o cálculo
               dfc <- df[complete.cases(df),]
               
               # Calcula a correlação entre poluentes
               cor(dfc$sulfate, dfc$nitrate)
          }
          
          # Append ao vetor de correlações entre poluentes
          correlacoes <- c(correlacoes, c)
     }
     
     # Retorna as correlações
     correlacoes
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
head(cr)
summary(cr)

cr <- corr("specdata")
summary(cr)

length(cr)

cr <- corr("specdata")
cr <- sort(cr)
set.seed(868)
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)
cr <- sort(cr)
n <- length(cr)
set.seed(197)
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)
n <- length(cr)
cr <- corr("specdata", 1000)
cr <- sort(cr)
print(c(n, round(cr, 4)))
