# Density Plot
data <- read.table("countfile.txt",sep="\t",header=T)
pdf(file="Countdensity.pdf")  

for (cnt in 2:length(data))  #count columns
{  

cnt_tf <- log(data[,cnt],10)  
d <- density(cnt_tf)  
lines(d)  

}  

dev.off() 


#Boxplot
data <- read.table("countfile.txt",sep="\t",header=T)
pdf(file="Countbox.pdf")  
cnt_tf <- log(data[,cnt],10)  
boxplot(cnt_tf)  
dev.off() 

#PCA
