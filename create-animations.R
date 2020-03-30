# create-animations.R
# Script to create animated GIFs of
# specific tests
#
# jason bailey
# 20200120 first commit

#install.packages("magick")
library(magick)
# set this to location of images

imagesPath <- './media/'  # iin the project subfolder
# Select tests for which to generate Gifs
testsToAnimate<-c('Test 1','Test 4','Test 5','Test 9','Test 10', 'Test 14','Test 16','Test 21','Test 22','Test 28','Test 32','Test 41','Test 46','Test 47','Test 48', 'Test 49', 'Test 49', 'Test 50', 'Test 51', 'Test 52', 'Test 54', 'Test 55')
#testsToAnimate<-c('Test 1', 'Test 2','Test 3','Test 21','Test 28','Test 32','Test 41')

for (testName in testsToAnimate){
  fileSearch<-paste("^",testName,'-','(.*).png$', sep="")
  list <- list.files(imagesPath,pattern=fileSearch)
  imagesAll <- paste0(imagesPath, list)
  images <- image_read(imagesAll)
  animation <- image_animate(images, fps = 0.8, loop = 1)
  saveFileName<-paste(testName,".gif", sep="")
  filePath<-paste0(imagesPath, saveFileName)
  image_write(animation, filePath,format = "gif")
}
# ********************************* 
# End
# ********************************* 