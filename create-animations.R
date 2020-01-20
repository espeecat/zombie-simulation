  # create-animations.R
  # Script to create animated GIFs of
  # specific tests
  #
  # jason bailey
  # 20200120 first commit

#install.packages("magick")
library(magick)
imagesPath <- ('/Users/jason/Source/RCode/zombie/media/')

# Select tests for which to generate Gifs
testsToAnimate<-c('Test 1', 'Test 21')

# Loops through PNGs with above prefixes
# to generate animated gifs
for (testName in testsToAnimate){
  fileSearch<-paste("^",testName,'(.*).png$', sep="")
  list <- list.files(imagesPath,pattern=fileSearch)
  imagesAll <- paste0(imagesPath, list)
  images <- image_read(imagesAll)
  animation <- image_animate(images, fps = 0.8, loop = 5)
  saveFileName<-paste(testName,".gif", sep="")
  filePath<-paste0(imagesPath, saveFileName)
  image_write(animation, filePath,format = "gif")
}
# ********************************* 
# End
# ********************************* 