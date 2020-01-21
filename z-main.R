# z-main.R
# Main file to run tests and create images
# Run this file to generate PNG files and data
#
# jason bailey
# 20200120 first commit

install.packages("gridExtra")
library(gridExtra)
library(grid)

# Bad to use paths. Should use rproject
# Set this to where R files are located
setwd("/Users/jason/Source/RCode/zombie-simulation/")
source("z-includes.R")

# Symbols for plots
zombie ="Z"
human="H"
immune="I"
#dev.off()

# dataframe for data output of results
dfnames<-c( "iterations", "rows", "columns","startzombies", "starthumans","startimmune", "endzombies", "endhumans","endimmune")
row0<-data.frame(0,0,0,0,0,0,0,0,0)
names(row0)<-dfnames
# Test Data initial conditions
testParams <-fn_initial_conditions()
# dataframe to store all iteration results
# for plots 
iterAll<-data.frame("test0",0,0,0,0,0,0)
dfnamesR<-c( "test","step", "rows","cols","human","zombie","immune")
names(iterAll)<-dfnamesR

# Loops for all tests
for (rowNum in 1:nrow(testParams)){
  iterations <-testParams[rowNum,1]
  rows<-testParams[rowNum,2]
  cols<-testParams[rowNum,3]
  cells<-rows*cols
  numzombies<-testParams[rowNum,4]
  numimmune<-testParams[rowNum,5]
  testName = paste("Test",rowNum)
  # create initial matrix of population Start wih all humans
  population<-matrix( rep( human, len=cells), nrow = rows)
  population<-fn_zombies_and_immune(population, numimmune, numzombies )
  prepopData=table(population)

  # Do iterartions for each test
  iters<-fn_doIterations(testName,population, rows,cols)
  # Store all iteration results
  iterAll<-rbind(iterAll,iters)
  
  # Get last result of each test for summary/final
  last<-tail(iters, n=1)
  #print(last)
  row1<-data.frame(iterations,rows,cols,prepopData[names(prepopData)=='Z'],prepopData[names(prepopData)=='H'],prepopData[names(prepopData)=='I'],last[1,'zombie'],last[1,'human'],last[1,'immune'])
  names(row1)<-dfnames
  row0<-rbind(row0,row1)
  
}
# remove dummy row
# row0 is the final summary for each test
# after all steps
row0 = row0[-1,]

# ********************************* 
# End
# *********************************  