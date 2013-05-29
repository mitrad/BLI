## 최종 수정일: 2013/5/29
## 작성자 : 양 우성

## 데이터 불러오기
better <- read.csv("Better Life Index.csv", header=T)
names(better) <- c("Title", "2011", "2012", "2013")

## Barplot의 색상지정 
col <- ifelse(better[,2:4] >= 5, "#42cc0a", "#bb0d4f")

## 4x3의 barplot 작성
par(mfrow=c(4,3))
for (i in 1:11){
  tN <- unlist(better[i,2:4])
  barplot(tN, width=0.5, ylim=c(0,10), col=col[i,], 
          xlab=better[i,1], border=NA)  
}
par(mfrow=c(1,1))



