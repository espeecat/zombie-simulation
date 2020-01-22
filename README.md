# zombie-simulation
Zombie simulation with R

Using R to simulate the spread of a zombie infection with different levels of immunity in the population.

![Sample of simulation showing Zombie infection](sample.gif?raw=true "Sample Zombie simulation") 

This simulates a population as a square grid of humans (H), zombies (Z) and humans with immunity (I). The purpose of the simulation is to test the effects of different levels of immunity. Does immunity protect those that are not immune? 


## Requirements  
This is using R and RStudio to run the code and show images.

> "... R is a free software environment for statistical computing and graphics..." (https://www.r-project.org/)

* R is available from: https://www.r-project.org/
* RStudio is available from: https://rstudio.com/  

The code requires some extra libraries which are called at the beginning of each scrip with the install.packages command. The first time this is run the package will be downloaded and installed. You can use the library command to include the package. 

## What code is included   

There are 3 files  
* z-main.R  -- main file to run
* z-includes.R --includes file
* create-animations.R  -- produce animations

Call z-main to run all the tests and produce images.  z-main uses z-includes and z-includes does not need to be called directly.  

create-animations - this is run to produce the animated gifs based on the images produced by z-main.

### Set the directories 

Ensure that you've set the directories in your code to ensure the images are written to a suitable location and the include file can be seen. This is set using the setwd command.

In this code there is a folder containing the R files and a subfolder called media.

Open the Rproj (R project) file in RStudio to set the working directory. The media folder is assumed to be a sub-folder of the main working directory.

### Run the code 

The following URL shows you how to run R code:  
https://www.dummies.com/programming/r/how-to-source-a-script-in-r/

* Select the entire content of z-main.R in the RStudio window
* Select Run from the RStudio menu  

Alternatively, you can call the file in the Rstudio console using:  

```R
source("z-main.R") 
```
