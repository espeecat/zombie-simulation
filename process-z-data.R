# Process data

library(ggplot2)

#data<-read.csv(file="row.csv", header=TRUE)
data<-big
fn_diffHumans <- function(humanStart, humanEnd, totalCells) {
  d<-((humanStart-humanEnd)/humanStart)*100
  return(d)
}

fn_percentImmune<-function(numImmune, totalCells){
  d<-(numImmune/totalCells)*100
  return(d)
}

fn_add_population_categories<-function(numCells){
  st<-toString(numCells)
  pop<-paste('pop.',st, sep="")
  return(pop)
  
}

data$diffHumans<-mapply(fn_diffHumans, data$starthumans,data$endhumans,(data$rows *data$columns))
data$percentImmune<-fn_percentImmune(data$startimmune,(data$rows *data$columns))
data$pop<-fn_add_population_categories(data$rows *data$columns)
#View(data)
#plot(data$percentImmune,data$diffHumans)

# Basic scatter plot
p1<-ggplot(data, aes(x=percentImmune, y=diffHumans,label = rows)) + geom_point()
#p1+geom_point(aes( colour = rows), show.legend = TRUE)
#p1+labs(title = "New plot title", subtitle = "A subtitle")
#p1+labs(x = "immune percentage")
#p1+labs(y = "%age human change")
#p1+xlim(80,100)
#p1+scale_color_manual(values=c("red", "#E69F00", "#56B4E9"))

p1+xlim(0,100)+scale_shape_manual(values=c(3, 16, 17))+scale_color_manual(values=c("red", "blue", "black"))+geom_point(aes(colour = as.factor( rows*rows),shape = as.factor( rows*rows)), show.legend = TRUE)+ theme(legend.title = element_text(colour="black", size=10))+labs(title = "Change in population versus immunity", x = "Population immunity(%)", y = "Change in human population (%)", color = "Population",shape = "Population") 
folder<-'./media/'

path<-paste(folder,"summary.svg", sep="")
svg(path,width=14,height=7)


p1<-ggplot(data, aes(x=percentImmune, y=diffHumans,label = rows)) 
p1+xlim(0,100)+scale_size_manual(values=c(4, 4, 4))+scale_shape_manual(values=c(15, 19,24))+scale_color_manual(values=c("black", "red", "blue"))+geom_point(aes(size=as.factor( rows*rows),colour = as.factor( rows*rows),shape = as.factor( rows*rows)), show.legend = TRUE)+ theme(legend.title = element_text(colour="black", size=10))+labs(title = "Change in population versus immunity", x = "Population immunity(%)", y = "Change in human population (%)", color = "Population",shape = "Population",size = "Population")+scale_x_continuous( breaks = seq(from = 0, to = 100, by = 10)) 
dev.off()

p1<-ggplot(data, aes(x=percentImmune, y=diffHumans,label = rows)) 
p1+xlim(0,100)+scale_size_manual(values=c(4, 4, 4))+scale_shape_manual(values=c(15, 19,24))+scale_color_manual(values=c("black", "red", "blue"))+geom_point(aes(size=as.factor( rows*rows),colour = as.factor( rows*rows),shape = as.factor( rows*rows)), show.legend = TRUE)+ theme(legend.title = element_text(colour="black", size=10))+labs(title = "Change in population versus immunity", x = "Population immunity(%)", y = "Change in human population (%)", color = "Population",shape = "Population",size = "Population")+scale_x_continuous( breaks = seq(from = 0, to = 100, by = 10)) 



#p1+scale_color_manual(values=c("red", "blue", "black"))+geom_point(aes(colour = as.factor( rows)), show.legend = TRUE)+ theme(legend.title = element_text(colour="blue", size=12, face="bold"))+labs(title = "Temperatures\n", x = "TY [°C]", y = "Txxx", color = "Legend Title\n") 
#p1+labs(title = "Temperatures\n", x = "TY [°C]", y = "Txxx", color = "Legend Title\n") + theme(legend.title = element_text(colour="blue", size=16, face="bold"))
# Change the point size, and shape
#ggplot(mtcars, aes(x=wt, y=mpg)) +
 # geom_point(size=2, shape=23)

#http://www.sthda.com/english/wiki/ggplot2-scatter-plots-quick-start-guide-r-software-and-data-visualization
#ggplot(mtcars, aes(x=wt, y=mpg, shape=cyl, color=cyl, size=cyl)) +
#  geom_point()