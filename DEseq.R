rm(list=ls())

library( "DESeq2" )
setwd("inputdirectory")
counts <- read.delim("input_file.txt")

coldata <- counts[,c(7:10)] #CTL and TMT counts
row.names(coldata) <-   counts[,1] #Genename or ID
keep <- rowSums(coldata >= 1) >=3 #removing low expressed genes
coldata <- coldata[keep,]
head(coldata) #check count matrix
group <- factor(c(rep("C",2),rep("T",2))) #make group for control  and treatment

dds <- newCountDataSet( coldata, group )
dds <- estimateSizeFactors( dds )
dds <- estimateDispersions( dds )
dds <- nbinomTest( dds, "C", "T" )

write.table(dds,"DEseq2_out_deg.txt",quote=F,sep="\t",row.names=F)





