better <- read.csv("Better Life Index.csv", header=T)
names(better) <- c("Title", "2011", "2012", "2013")

col <- ifelse(better[,2:4] >= 5, "#42cc0a", "#bb0d4f")

par(mfrow=c(4,3))
for (i in 1:11){
  tN <- unlist(better[i,2:4])
  barplot(tN, width=0.5, ylim=c(0,10), col=col[i,], 
          xlab=better[i,1], border=NA)  
}
par(mfrow=c(1,1))


BLI <- read.csv("Better Life Index_topic_2013.csv", header=T, stringsAsFactors=F )
rownames(BLI) <- BLI$Country
BLI <- BLI[,-1]
#colnames(BLI) <- paste("X",1:ncol(BLI),sep="")
#scaled.BLI <- apply(BLI[,2:ncol(BLI)],2,scale)
#rownames(scaled.BLI) <- BLI$Country
heatmap(as.matrix(BLI))
head(BLI)
library(maps)

Ineq <- read.csv("Indequlity.csv",header= T)
country.code <- read.csv("country-map.csv",header=T)


Ineq <- merge(country.code,Ineq,by="country")

map("world",col="#cccccc")
symbols(Ineq$longitude, Ineq$latitude, 
        circles=sqrt(Ineq$Earn.Soc.Ineq), add=T, inches=0.15,
        bg="#93ceef",fg="#ffffff")

write.csv(country.code,"country-map.csv",row.names=F,quote=F)

ferility <- read.csv("http://book.flowingdata.com/ch08/points/adol-fertility.csv")
map('world',fill=F,col="#cccccc")
symbols(ferility$longitude, ferility$latitude, 
        circles=sqrt(ferility$ad_fert_rate*100), add=T, inches=0.15,
        bg="#93ceef",fg="#ffffff")
exp(Ineq$Earn.Gen.Ineq * 100)


