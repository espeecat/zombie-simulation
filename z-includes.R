# z-includes.R
# Include file for Main script
#
# jason bailey
# 20200120 first commit


# Create the original test data
# for simulations.
fn_initial_conditions<-function(){
  
  #iterations =15   #rows =10   #cols =10   #cells <- rows*cols
  # numberOFZombies to start with   #zombieStart =1
  # number of Immune  #immuneStart =250
  a1<-c(15,10,10,1,0)
  a2<-c(15,10,10,1,0)
  a3<-c(15,10,10,1,100)
  a4<-c(15,10,10,1,100)
  a5<-c(15,10,10,1,150)
  a6<-c(15,10,10,1,250)
  a7<-c(15,10,10,1,250)
  a8<-c(15,10,10,1,299)
  a9<-c(15,10,10,1,299)
  a10<-c(20,20,20,1,0)
  a12<-c(20,20,20,1,0)
  a11<-c(20,20,20,1,0)
  a13<-c(20,20,20,1,0)
  a14<-c(20,20,20,1,500)
  a15<-c(20,20,20,1,20)
  a16<-c(20,20,20,1,150)
  a17<-c(20,20,20,1,250)
  a18<-c(20,20,20,1,350)
  a19<-c(20,20,20,1,450)
  a20<-c(20,20,10,1,250)
  a21<-c(20,20,20,1,299)
  a22<-c(20,20,20,1,599)
  a23<-c(20,20,20,1,599)
  a24<-c(20,20,20,1,299)
  a25<-c(20,20,20,1,299)
  a26<-c(20,20,20,1,399)
  a27<-c(20,20,20,1,650)
  a28<-c(20,20,20,1,450)
  a29<-c(20,20,20,1,550)
  a30<-c(20,20,20,1,550)
  a31<-c(20,20,20,1,50)
  a32<-c(20,20,20,1,50)
  a33<-c(20,20,20,1,150)
  a34<-c(20,20,20,1,150)
  a35<-c(20,20,20,1,160)
  a36<-c(20,20,20,1,170)
  a37<-c(20,20,20,1,780)
  a38<-c(20,20,20,1,880)
  a39<-c(20,20,20,1,1070)
  a40<-c(20,20,20,1,1160)
  a41<-c(25,100,100,1,0)
  a42<-c(25,100,100,1,0)
  a43<-c(25,100,100,1,0)
  a44<-c(25,100,100,1,0)
  a45<-c(25,100,100,1,0)
  a46<-c(25,100,100,1,15000)
  a47<-c(25,100,100,1,40000)
  a48<-c(25,100,100,1,10000)
  a49<-c(25,100,100,1,20000)
  a50<-c(25,100,100,1,30000)
  a51<-c(25,100,100,1,25000)
  a52<-c(25,100,100,1,35000)
  a53<-c(25,100,100,1,35000)
  a54<-c(25,100,100,1,38000)
  a55<-c(25,100,100,1,45000)
  a56<-c(25,100,100,1,1000)
  a57<-c(25,100,100,1,2000)
  a58<-c(25,100,100,1,4000)
  a59<-c(25,100,100,1,6000)
  a60<-c(25,100,100,1,8000)
  a61<-c(25,100,100,1,500)
  a62<-c(25,100,100,1,300)
  a63<-c(25,100,100,1,600)
  a64<-c(25,100,100,1,2500)
  a65<-c(25,100,100,1,4500)
  a66<-c(25,100,100,1,6500)
  a67<-c(25,100,100,1,100)
  a68<-c(25,100,100,1,8000)
  a69<-c(25,100,100,1,7000)
  a70<-c(25,100,100,1,5000)
  a71<-c(25,100,100,1,12000)
  a72<-c(25,100,100,1,16000)
  a73<-c(25,100,100,1,18800)
  a74<-c(25,100,100,1,2200)
  a75<-c(25,100,100,1,24000)
  a76<-c(25,100,100,1,26000)
  a77<-c(25,100,100,1,28000)
  a78<-c(25,100,100,1,32000)
  a79<-c(25,100,100,1,34000)
  
  d<-as.matrix( rbind(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,a32,a33,a34,a35,a36,a37,a38,a39,a40,a41,a42,a43,a44,a45,a46,a47,a48,a49,a50,a51,a52,a53,a54,a55,a56,a57,a58,a59,a60,a61,a62,a63,a64,a65,a66,a67,a68,a69,a70,a71,a72,a73,a74,a75,a76,a77,a78,a79))
                      
  #d<-as.matrix( rbind(a1,a2,a3))
  return(d)
}

# ******************************
# Functions for z-main
# ******************************
fn_doIterations <-function (testName,popMatrix, numRows,numCols){
  cells = numRows*numCols

  fn_plotZombie(testName,popMatrix,0, numRows,  numCols)
    
  iters = fn_iterationStore(testName,popMatrix, 0, numRows,numCols)
  infectionMatrix<-fn_resetInfections(0, cells, numRows)
  for(step in 1:(iterations+1)){
    # iterate over cells
    for (rw in 1:(rows)){
      for (col in 1:(cols)){
        xy<-fn_checkPopulationCells(popMatrix[rw,col])
        if(xy[1] ==FALSE){
          #infectionMatrix[xy[1],xy[2]]<-1
        } else {
          #print(xy)
          infectionMatrix[xy[1],xy[2]]<-1
        }
      } # end col
    } # end row
    
    #infect humans!
    popMatrix<-fn_infectPopulation(popMatrix, infectionMatrix)
    fn_plotZombie(testName,popMatrix,step, numRows,  numCols)
    iters2 = fn_iterationStore(testName,popMatrix, step, numRows,numCols)
    iters<-rbind(iters,iters2)
    # reset matrix after iteration
    infectionMatrix<-fn_resetInfections(0, cells, rows)
  }
  return(iters)
}

# Plot the population matrix at a step
fn_plotZombie<-function(testName,population,step, numRows,  numCols){
  Is<-table(population)
  numI<-Is[names(Is)=='I']
  perI<-(numI/(numRows*numCols))*100
  if (length(perI)<1){
    perI<-0 # 0% immunity
  }
  
  gs <- lapply(as.vector(population), function(zhi){
      if(zhi=="H"){
        colr ="green"
      } else if(zhi=="Z") {
        colr="red"
      } else{
        colr="blue"
      }
      grobTree(rectGrob(gp=gpar(fill=colr, alpha=0.5)), textGrob(zhi, gp=gpar(fontsize=12,font=8)  ))
    
    }
  )
  title =paste(testName," - ","Immune=",perI,"% - Step=", step,sep="")
  #cwd<-getwd()
  #folder<-paste(cwd,"/media/",sep="")
  folder<-'./media/'
  pad<-sprintf("%02d", step)
  path<-paste(folder,testName,"-",pad,".png", sep="")
  png(filename=path)
  grid.arrange(grobs=gs, ncol=numCols, 
              top=textGrob(title, gp=gpar(fontsize=15,font=8)  ))
  dev.off()
}

# Generate random X and Y for matrix
fn_randomXY<-function(){
  randomRow <- sample(1:rows, 1)
  randomCol <- sample(1:cols, 1)
  xy <- c(randomRow, randomCol)
  return(xy)
}

# If the current cell is a zombie
# then generate a random X Y to attempt
# to infect another cell
fn_checkPopulationCells<-function(x){
  isZombie<-fn_isZombie(x)
  if (isZombie =="Y"){
    randomXY<-fn_randomXY()
  } else{
    randomXY<-c(FALSE, FALSE) # no infection
  }
  return(randomXY)
} 

# is the current Cell a zombie
fn_isZombie<-function(x){
  if(x==zombie){
    return("Y") 
  } else{
    return ("N")
  }
}

# is the current cell human
fn_isHuman<-function(x){
  if(x==human){
    return("Y") 
  } else{
    return ("N")
  }
}

# Function to try and infect humans
# cell by cell
fn_infectPopulation<-function(popM, infM){
  for (rw in 1:(rows)){
    for (col in 1:(cols)){
      isHuman <-fn_isHuman(popM[rw, col])
      infection <-infM[rw, col]
      if(isHuman == "Y" && infection ==1){
        popM[rw, col] <-zombie # turn human into zombie
      }
    } # end col
  } # end row
  return(popM)
}

# Initial conditions based on test params
# Create zombies and immunue
fn_zombies_and_immune<-function(popData, immuneStart, zombieStart ){
  # add some random imumune humans
  cnt<-immuneStart
  iStep<-1
  while (iStep<=cnt) {   
    xy =fn_randomXY()
    popData[xy[1],xy[2]] <-immune
    iStep=iStep+1
  }
  # add some random zombies
  for (zStep in 1:(zombieStart)){
    xy =fn_randomXY()
    popData[xy[1],xy[2]] <-zombie
    
  }
  return(popData)
}


# reset infectionMatrix
fn_resetInfections<-function(resetInfection, numcells, numrows){
  infMatrix<-matrix( rep( resetInfection, len=numcells), nrow = numrows)
  return(infMatrix)
}

# get numbers over 1 iteration
fn_iterationStore<-function(testName,popMatrix, step, numRows,numCols){
  
  popData=table(popMatrix)
  #print(postpopData[names(postpopData)=='H'])
  if (length(popData[names(popData)=='H'])>0){
    numH<-popData[names(popData)=='H']
  } else{
    numH<-0
  }
  
  if (length(popData[names(popData)=='Z'])>0){
    numZ<-popData[names(popData)=='Z']
  } else{
    numZ<-0
  }
  
  if (length(popData[names(popData)=='I'])>0){
    numI<-popData[names(popData)=='I']
  } else{
    numI<-0
  }
  
  dfnamesR<-c( "test","step", "rows","cols","human","zombie","immune")
  rowStep<-data.frame(testName,step, numRows,numCols, numH, numZ, numI)
  names(rowStep)<-dfnamesR
  return(rowStep)
  
}

# Test function -is include OK
fn_test<-function(x){
  return ("hello")
}

# ********************************* 
# End
# ********************************* 
