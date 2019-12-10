# Density Plot
data <- read.table("countfile.txt",sep="\t",header=T)
cnt_tf <- log(data[,2],10)  
d <- density(cnt_tf)  
pdf(file="Countdensity.pdf")  
plot(d,xlab="Count (log10)", ylab="Density")
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
r2 <- read.table("RPKMfile.txt",sep="\t",header=T)
data <- r2[,2:9]
row.names(data) <- r2[,1]
keep <- rowSums(data >= 0) >=3
rpkm  <- data[keep,]
cols<-c("red","red3", "pink","Violet", "yellow","yellow3","blue3","blue3")
sample.def<-c(  "ctrl1","ctrl2","Nt1","Nt2","Ns1","Ns1","S1","S2")
colors <- rep(cols, each=1)


pc <- prcomp(t(log2(rpkm+1)))



pdf('pca_plot2_NT.pdf')

plot(pc$x[,1],pc$x[,2],col=colors,pch=1)
legend("topright",sample.def,pch=1,col=cols)
dev.off()


pdf('pca*plot*5pc_NT.pdf')
tmpPcaData <- as.data.frame(pc$x[,1:5])
plot(tmpPcaData, col=colors,pch=1)
dev.off()
