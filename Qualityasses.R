# Density Plot
data <- read.table("countfile.txt",sep="\t",header=T)
cnt_tf <- log(data[,2],10)  
d <- density(cnt_tf)  
plot(d,xlab="Count (log10)", ylab="Density")
pdf(file="Countdensity.pdf")  

for (cnt in 3:length(data))  #count columns
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
