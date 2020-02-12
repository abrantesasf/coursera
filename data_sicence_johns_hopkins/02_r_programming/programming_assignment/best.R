setwd("~/repositoriosGit/coursera/data_sicence_johns_hopkins/02_r_programming/programming_assignment")
rm(list=ls())

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

best <- function(state, desfecho) {
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
          heart.attack <- as.numeric(outcome$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
          options(warn = oldwarn)
          menor <- min(heart.attack[outcome$State == state], na.rm = TRUE)
          hospitais <- outcome$Hospital.Name[
               ! is.na(heart.attack)
               & heart.attack == menor
               & outcome$State == state]
          n <- length(hospitais)
          if (n == 1) {
               return(hospitais)
          } else {
               return(sort(hospitais)[1])
          }
     } else if (desfecho == "heart failure") {
          oldwarn <- getOption("warn")
          options(warn = -1)
          heart.failure <- as.numeric(outcome$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
          options(warn = oldwarn)
          menor <- min(
               heart.failure[outcome$State == state], na.rm = TRUE)
          hospitais <- outcome$Hospital.Name[
               ! is.na(heart.failure)
               & heart.failure == menor
               & outcome$State == state]
          n <- length(hospitais)
          if (n == 1) {
               return(hospitais)
          } else {
               return(sort(hospitais)[1])
          }
     } else {
          oldwarn <- getOption("warn")
          options(warn = -1)
          pneumonia <- as.numeric(outcome$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
          options(warn = oldwarn)
          menor <- min(
               pneumonia[outcome$State == state], na.rm = TRUE)
          hospitais <- outcome$Hospital.Name[
               ! is.na(pneumonia)
               & pneumonia == menor
               & outcome$State == state]
          n <- length(hospitais)
          if (n == 1) {
               return(hospitais)
          } else {
               return(sort(hospitais)[1])
          }
     }
}

