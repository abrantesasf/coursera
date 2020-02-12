setwd("~/repositoriosGit/coursera/data_sicence_johns_hopkins/02_r_programming/programming_assignment")
rm(list=ls())

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

rankhospital <- function(state, desfecho, ranking) {
     # checagens prévias:
     estados <- unique(outcome$State)
     if (!(desfecho %in% c("heart attack", "heart failure", "pneumonia"))) {
          stop('invalid outcome')
     } else if (!(state %in% estados)) {
          stop('invalid state')
     }
     
     if (desfecho == "heart attack") {
          oldwarn <- getOption("warn")
          options(warn = -1)
          df <- outcome
          #df$heart.attack <- as.numeric(df$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
          df$heart.attack <- as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
          options(warn = oldwarn)
          
          df2 <- subset(df, State == state & ! is.na(heart.attack))
          colnames(df2)
          df3 <- df2[with(df2, order(heart.attack, Hospital.Name)), ]
          #return(df3[, c("State", "Hospital.Name", "heart.attack")])
          
          rankingOK <- if (ranking == "best") {
               1
          } else if (ranking == "worst") {
               nrow(df3)
          } else {
               ranking
          }
          
          if (nrow(df3) < rankingOK) {
               return(NA)
          } else {
               hospital <- df3$Hospital.Name[rankingOK]
               return(hospital)
          }
     } else if (desfecho == "heart failure") {
          oldwarn <- getOption("warn")
          options(warn = -1)
          df <- outcome
          #df$heart.attack <- as.numeric(df$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
          df$heart.failure <- as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
          options(warn = oldwarn)
          
          df2 <- subset(df, State == state & ! is.na(heart.failure))
          colnames(df2)
          df3 <- df2[with(df2, order(heart.failure, Hospital.Name)), ]
          #return(df3[, c("State", "Hospital.Name", "heart.attack")])
          
          rankingOK <- if (ranking == "best") {
               1
          } else if (ranking == "worst") {
               nrow(df3)
          } else {
               ranking
          }
          
          if (nrow(df3) < rankingOK) {
               return(NA)
          } else {
               hospital <- df3$Hospital.Name[rankingOK]
               return(hospital)
          }
     } else {
          oldwarn <- getOption("warn")
          options(warn = -1)
          df <- outcome
          #df$heart.attack <- as.numeric(df$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
          df$pneumonia <- as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
          options(warn = oldwarn)
          
          df2 <- subset(df, State == state & ! is.na(pneumonia))
          colnames(df2)
          df3 <- df2[with(df2, order(pneumonia, Hospital.Name)), ]
          #return(df3[, c("State", "Hospital.Name", "heart.attack")])
          
          rankingOK <- if (ranking == "best") {
               1
          } else if (ranking == "worst") {
               nrow(df3)
          } else {
               ranking
          }
          
          if (nrow(df3) < rankingOK) {
               return(NA)
          } else {
               hospital <- df3$Hospital.Name[rankingOK]
               return(hospital)
          }
     }
}

