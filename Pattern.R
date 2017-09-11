string <- "25.12.1994"
string1 <- "11122"
pattern <- "^((\\d){2}|(\\d){4})$"
grepl(pattern, string1)


string1 <- "12/11/1994"
pattern <- "^((\\d){2})([,.]|[-/])(\\d{2})([,.]|[-/])((\\d){2}|(\\d){4})$"
grepl(pattern, string1)