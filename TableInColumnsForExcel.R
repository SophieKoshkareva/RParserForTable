a<-table(file@table_in[[3]])
aa<- data.frame(a, stringsAsFactors = FALSE)
aa <- t.data.frame(aa)
if (length(a) > 15) 
  aa<- data.frame(aa[,1:15], stringsAsFactors = FALSE)
aa[nrow(aa)+1,]<-aa[nrow(aa),]
aa[nrow(aa)-1,]<-c("Only first 15th values", rep(NA, ncol(aa)-1))
#colnames(a) <- NULL
#rownames(a)<-NULL

b<-table(file@table_in[[4]])
b<- data.frame(b, stringsAsFactors = FALSE)
b<- t.data.frame(b)
b<- data.frame(b, stringsAsFactors = FALSE)
#colnames(b) <- NULL
#rownames(b)<-NULL
c <- rbind.fill(c,a,b)
# c[seq(3+1,nrow(c)+1),] <- c[seq(3,nrow(c)),]
# c[3,]<-c(newrow, rep(NA,ncol(c)-1))
# c


