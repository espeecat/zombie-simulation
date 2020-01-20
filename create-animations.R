  # create-animations.R
  # Script to create animated GIFs of
  # specific tests
  #
  # jason bailey
  # 20200120 first commit

#install.packages("magick")
library(magick)
imagesPath <- ('/Users/jason/Source/RCode/zombie/media/')

testsToAnimate<-c('Test 1', 'Test 21')

for (testName in testsToAnimate){
  
  #print(testName)
  
  fileSearch<-paste("^",testName,'(.*).png$', sep="")
  print(fileSearch)
  # ^Product(.*)xlsx$
  list <- list.files(imagesPath,pattern=fileSearch)
  #print(list)
  
  imagesAll <- paste0(imagesPath, list)
  images <- image_read(imagesAll)
  #images
  animation <- image_animate(images, fps = 0.8, loop = 5)
  #animation
  saveFileName<-paste(testName,".gif", sep="")
  filePath<-paste0(imagesPath, saveFileName)
  #saveFileName<-'gg.gif'
  #print(filePath)
  image_write(animation, filePath,format = "gif")
  #imagesPath
  
  
}