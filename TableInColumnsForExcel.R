b<-table(file@table_in[[1]])
b


b<- data.frame(b)
b

b <- t.data.frame(b)
b

names(b)
NULL
rownames(b)

rownames(b) <- NULL
b

b[1,1]

b[2,1]

b <- rbind(names(file@table_in[1]), b)

b

data.frame(b)
