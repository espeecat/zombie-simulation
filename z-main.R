  # z-main.R
  # Main file to run tests and create images
  # Run this file to generate PNG files and data
  #
  # jason bailey
  # 20200120 first commit
  
  #install.packages("gridExtra")
  library(gridExtra)
  library(grid)


  setwd("/Users/jason/Source/RCode/zombie/")
  source("z-includes.R")

  # Symbols for plots
  zombie ="Z"
  human="H"
  immune="I"
  
  dev.off()
 
  dfnames<-c( "iterations", "rows", "columns","startzombies", "starthumans","startimmune", "endzombies", "endhumans","endimmune")
  row0<-data.frame(0,0,0,0,0,0,0,0,0)
  names(row0)<-dfnames

  
  testParams <-fn_initial_conditions()
  
  iterAll<-data.frame("test0",0,0,0,0,0,0)
  dfnamesR<-c( "test","step", "rows","cols","human","zombie","immune")
  names(iterAll)<-dfnamesR

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
    
    #a[names(a)==435]
    #prepopData[names(prepopData)=='H']
    #iters = fn_iterationStore(testName,popMatrix, 0, numRows,numCols)
    iters<-fn_doIterations(testName,population, rows,cols)
    iterAll<-rbind(iterAll,iters)
    #postpopData=table(population)
    ##print(postpopData[names(postpopData)=='H'])
    #if (length(postpopData[names(postpopData)=='H'])>0){
    #  finalH<-postpopData[names(postpopData)=='H']
    #} else{
    #  finalH<-0
    #}
    #row1<-data.frame(iterations,rows,cols,prepopData[names(prepopData)=='Z'],prepopData[names(prepopData)=='H'],prepopData[names(prepopData)=='I'],postpopData[names(postpopData)=='Z'],postpopData[names(postpopData)=='H'],postpopData[names(postpopData)=='I'])
    
    
    #row1<-data.frame(iterations,rows,cols,prepopData[names(prepopData)=='Z'],prepopData[names(prepopData)=='H'],prepopData[names(prepopData)=='I'],postpopData[names(postpopData)=='Z'],finalH,postpopData[names(postpopData)=='I'])
    last<-tail(iters, n=1)
    print(last)
    row1<-data.frame(iterations,rows,cols,prepopData[names(prepopData)=='Z'],prepopData[names(prepopData)=='H'],prepopData[names(prepopData)=='I'],last[1,'zombie'],last[1,'human'],last[1,'immune'])
    
    #print(row1)
    #pront(row1)
    names(row1)<-dfnames
    row0<-rbind(row0,row1)
    
  }
  
  # remove dummy row
  row0 = row0[-1,]
  row0
  iterAll
  #df[df$aged <= df$laclen, ] 
  iterAll[44,1]
  tests<-iterAll[iterAll$test=="Test 1", ]
  
  
  
  