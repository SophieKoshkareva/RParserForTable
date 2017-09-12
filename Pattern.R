string <- "25.12.1994"
string1 <- "11122"
pattern <- "^((\\d){2}|(\\d){4})$"
grepl(pattern, string1)


string1 <- "12/11/1994"
pattern <- "^((\\d){2})([,.]|[-/])(\\d{2})([,.]|[-/])((\\d){2}|(\\d){4})$"
grepl(pattern, string1)

string1 <- "12- 4"

pattern <- "^((\\d){2})[[:punct:]]|([[:space:]])?(\\d)+)?$"
gsub("[[:punct:]]([[:space:]])?", ",", string1)
grepl(pattern, string1)

string1 <- "12.4"
grepl("^((\\d){2})[,](\\d)+)?$", string1)