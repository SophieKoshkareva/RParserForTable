a <- c("123", "123,4", "123.4", "123, 5", "123. 5")
grepl("(\\d)+", a)
grepl("(\\d)+[,]", a)
grepl("(\\d)+[,](\\d)+", a)
grepl("(\\d)+([,](\\d)+)?", a)
grepl("^(\\d)+([,](\\d)+)?$", a)
grepl("^(\\d)+([,.](\\d)+)?$", a)