d1 <- as.Date(file@table_out[[24]], format = "%d.%m.%Y")
d2 <- as.Date(file@table_out[[42]], format = "%d.%m.%Y")

#sort(as.Date(file@table_out[[24]], format = "%d.%m.%Y"))
x <- c()
 for (i in 1:nrow(file@table_out))
   {
    x <- append(x, c(d1[i], d2[i]), after = length(x))
   }
print(x)
  x1 <- x
  x <- sort(x)
  for (i in 1:length(x))
  { 
    print(c(x1[i], x[i]))
    if (x1[i] %in% x[i] == FALSE)
      { print(i)}
  }
  ind <- c()
  ind <- append(ind, which(d1 > d2), after = length(x))
  print(ind)