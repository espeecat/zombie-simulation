# zombie-simulation
Zombie simulation with R

Using R to simulate the spread of a zombie infection with different levels of immunity in the population.   

## Requirements  
This is using R and RStudio to run the code and show images.

"... R is a free software environment for statistical computing and graphics..." (https://www.r-project.org/)

R is avialable from:  
https://www.r-project.org/

RStudio is available from:  
https://rstudio.com/  

The code requires some extra libraries which are called at the beginning of each scrip with the install.packages command. The first time this is run the package will be downloaded and installed. You can use the library command to include the package. 

## Running the code 

There are 3 files  
* z-main.R  -- main file to run
* z-includes.R --includes file
* create-animations.R  -- produce animations

Call z-main to run all the tests and produce images.  z-main uses z-includes and z-includes does not need to be called directly.  

create-animations - this is run to produce the animated gifs based on the images produced by z-main.

### set the directories 

Ensure that you've set the directories in your code to ensure the images are written to a suitable location and the include file can be seen. This is set using the setwd command.

In this code there is a folder containing the R files and a subfolder called media. 

### Run the code  



<code>
</code>
