# z-includes.R
# Include file for Main script
#
# jason bailey
# 20200120 first commit


# test data
fn_initial_conditions<-function(){
  
  #iterations =15   #rows =10   #cols =10   #cells <- rows*cols
  # numberOFZombies to start with   #zombieStart =1
  # number of Immune  #immuneStart =250
  a1<-c(15,10,10,1,1)
  a2<-c(15,10,10,1,1)
  a3<-c(15,10,10,1,1)
  a4<-c(15,10,10,1,1)
  a5<-c(15,10,10,1,1)
  a6<-c(15,10,10,1,1)
  a7<-c(15,10,10,1,1)
  a8<-c(15,10,10,1,1)
  a9<-c(15,10,10,1,1)
  a10<-c(15,10,10,1,1)
  a12<-c(15,10,10,1,1)
  a11<-c(15,10,10,1,1)
  a13<-c(15,10,10,1,1)
  a14<-c(15,10,10,1,1)
  a15<-c(15,10,10,1,1)
  a16<-c(15,10,10,1,250)
  a17<-c(15,10,10,1,250)
  a18<-c(15,10,10,1,250)
  a19<-c(15,10,10,1,250)
  a20<-c(15,10,10,1,250)
  a21<-c(15,10,10,1,299)
  a22<-c(15,10,10,1,299)
  a23<-c(15,10,10,1,299)
  a24<-c(15,10,10,1,299)
  a25<-c(15,10,10,1,299)
  a26<-c(15,10,10,1,299)
  a27<-c(15,10,10,1,250)
  a28<-c(15,10,10,1,250)
  a29<-c(15,10,10,1,250)
  a30<-c(15,10,10,1,250)
  a31<-c(15,10,10,1,50)
  a32<-c(15,10,10,1,50)
  a33<-c(15,10,10,1,50)
  a34<-c(15,10,10,1,50)
  a35<-c(15,10,10,1,60)
  a36<-c(15,10,10,1,70)
  a37<-c(15,10,10,1,80)
  a38<-c(15,10,10,1,80)
  a39<-c(15,10,10,1,70)
  a40<-c(15,10,10,1,60)
  a41<-c(25,100,100,1,1)
  a42<-c(25,100,100,1,1)
  a43<-c(25,100,100,1,1)
  a44<-c(25,100,100,1,1)
  a45<-c(25,100,100,1,1)
  a46<-c(25,100,100,1,1000)
  a47<-c(25,100,100,1,2000)
  a48<-c(25,100,100,1,3000)
  a49<-c(25,100,100,1,5000)
  a50<-c(25,100,100,1,6000)
  a51<-c(25,100,100,1,35000)
  a52<-c(25,100,100,1,35000)
  a53<-c(25,100,100,1,35000)
  a54<-c(25,100,100,1,35000)
  a55<-c(25,100,100,1,35000)
  
  d<-as.matrix( rbind(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,a32,a33,a34,a35,a36,a37,a38,a39,a40,a41,a42,a43,a44,a45,a46,a47,a48,a49,a50,a51,a52,a53,a54,a55))
  #d<-as.matrix( rbind(a1))
  #matrix( c(1,2,3,), c(4,5,6), nrow = 2, byrow = TRUE)
  return(d)
}



###########
# Functions
###########
fn_doIterations <-function (testName,popMatrix, numRows,numCols){
  cells = numRows*numCols
  #print(popMatrix)
  fn_plotZombie(testName,popMatrix,0, numRows,  numCols)
  
  #dfnamesR<-c( "test","step", "rows","cols","human","zombie","immune")
  #iters0<-data.frame(testName0,0,0,0,0,0,0)
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
    #print(popMatrix)
    # reset matrix after iteration
    infectionMatrix<-fn_resetInfections(0, cells, rows)
  }
  #print(iters)
  #return(popMatrix)
  return(iters)
}

fn_plotZombie<-function(testName,population,step, numRows,  numCols){
  #dev.off()
  #print(as.vector(population))
  
  Is<-table(population)
  numI<-Is[names(Is)=='I']
  perI<-(numI/(numRows*numCols))*100
  
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
  #grid.arrange(grobs=gs, ncol=numCols, 
  #             top="top label", bottom="bottom\nlabel", 
  #             left="left label", right="right label")
  #top=textGrob("Title", gp=gpar(fontsize=15,font=8)
  title =paste(testName,"- ","Percentage Immune ",perI,"% - Step=", step,sep="")
  
  folder<-"/Users/jason/Source/RCode/zombie/media/"
  pad<-sprintf("%02d", step)
  path<-paste(folder,testName,"-",pad,".png", sep="")
  png(filename=path)
  grid.arrange(grobs=gs, ncol=numCols, 
              top=textGrob(title, gp=gpar(fontsize=15,font=8)  ))
  
  
  
  dev.off()
  
  
}

fn_randomXY<-function(){
  
  randomRow <- sample(1:rows, 1)
  randomCol <- sample(1:cols, 1)
  xy <- c(randomRow, randomCol)
  #xy <- c(1, 2)
  return(xy)
}

fn_checkPopulationCells<-function(x){
  isZombie<-fn_isZombie(x)
  if (isZombie =="Y"){
    randomXY<-fn_randomXY()
  } else{
    randomXY<-c(FALSE, FALSE)
  }
  
  return(randomXY)
} 




fn_isZombie<-function(x){
  if(x==zombie){
    return("Y") 
  } else{
    return ("N")
  }
}

fn_isHuman<-function(x){
  if(x==human){
    return("Y") 
  } else{
    return ("N")
  }
}


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

# Create zombies and immunue
fn_zombies_and_immune<-function(popData, immuneStart, zombieStart ){
  # add some random imumune
  for (iStep in 1:(immuneStart)){
    xy =fn_randomXY()
    popData[xy[1],xy[2]] <-immune
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
  #row1<-data.frame(iterations,rows,cols,prepopData[names(prepopData)=='Z'],prepopData[names(prepopData)=='H'],prepopData[names(prepopData)=='I'],postpopData[names(postpopData)=='Z'],postpopData[names(postpopData)=='H'],postpopData[names(postpopData)=='I'])
  
  dfnamesR<-c( "test","step", "rows","cols","human","zombie","immune")
  rowStep<-data.frame(testName,step, numRows,numCols, numH, numZ, numI)
  names(rowStep)<-dfnamesR
  return(rowStep)
  
}

# Test function -is include OK
fn_test<-function(x){
  return ("hello")
}
