Full.Normality<-function(X, X.Title="X",Title="", pics.only = F, pics.dir = NA)
{
    #library(car)
    library(sm)
    library(nortest)
    print(sprintf("Исследование на нормальность распределения %s", X.Title))
    print("Графические инструменты")
    ##############
    if(!is.na(pics.dir))
    {
        jpeg(filename = paste0(pics.dir, X.Title,".jpg"))
    }
    
    print(hist(X, col="lightblue",  main = paste("Гистограмма" , Title), xlab=X.Title, ylab="Частота"))
    #print(lines(density(X), lwd=4, col="red"))
    
    #qqPlot(X, dist ="norm",col = palette()[1], pch = 19, 
    #       xlab = "Квантили нормального распределения",
    #       ylab = "Наблюдаемые квантили",
    #       main = "QQ Plot")
    
    sm.density(X, model= "Normal", xlab = X.Title, ylab = "Плотность", lwd=4)
    title(main=paste("Плотность распределения", Title))
    if(!is.na(pics.dir))
    {
        dev.off()
    }
    ###############
    if (pics.only == F){
        print(sprintf("Тесты на нормальность распределения %s", X.Title))
        print(shapiro.test(X),data.name=X.Title)
        print(ad.test(X))
        print(cvm.test(X))
        print(lillie.test(X))
        print(sf.test(X))
        print("Calculate 95% CI")
        wilcox.test(X, conf.int = TRUE, conf.level = 0.95)
    }
    
}

#
is.column.empty <- function(column, show.stats=FALSE)
{
    column.length <- length(column)
    def.NA        <- sapply(column,is.na)
    index         <- 1:column.length
    return (index[def.NA])
}


#Multi normality test
# input:
#         array of numbers
#
# output:
#         TRUE  - numbers are normal distributed
#         FALSE - other cases
#
my.test.norm <- function(X, p.value=0.05)
{
    require(sm)
    require(nortest)
    x <- sort(X[complete.cases(X)])
    n <- length(x)
    if (n < 3L) return(FALSE)
    if (are.equal2(X)) return(FALSE)
    
    res <- shapiro.test(X)
    sum <- TRUE
    sum <- sum&(res$p.value>p.value)
    
    x <- sort(X[complete.cases(X)])
    n <- length(x)
    if(n > 7L){
        res <- ad.test(X)
        sum <- sum&(res$p.value>p.value)
        
        res <- cvm.test(X)
        sum <- sum&(res$p.value>p.value)
    }
    
    if (n > 4L){
        res <- lillie.test(X)
        sum <- sum&(res$p.value>p.value)
    }
    
    if(n > 5L){
        res <- sf.test(X)
        sum <- sum&(res$p.value>p.value)
    }
    
    return(sum)
    
}

# Are all values equal?
are.equal <- function(x) length(unique.default(x)) == 1L

# Are all values equal?    
are.equal2 <-function(x)
{
    x <- sort(x[complete.cases(x)])
    n <- length(x)
    if (is.na(n) || n < 3L || n > 5000L) 
        stop("sample size must be between 3 and 5000")
    rng <- x[n] - x[1L]
    if (rng == 0) 
        return(TRUE)
    return(FALSE)
}

#test of all columns for normality,
#prints normal columns names only
list.normal.columns <- function(df)
{
    #remove all non numeric columns
    list <- sapply(df,is.numeric)
    df.temp <- df[list]
    #remove all columns with equal values
    list<-!apply(df.temp,2,are.equal)
    df.temp <- df.temp[list]
    #normality test
    list <-apply(df.temp,2,my.test.norm)
    names(df.temp)[list]
}

shapiro.test.base <- function(x, na.rm = TRUE)
{
    require(sm)
    require(nortest)
    if (na.rm) x <- na.omit(x)
    x <- sort(x[complete.cases(x)])
    n <- length(x)
    if (n < 3L) return(NA)
    if (are.equal2(x)) return(NA)
    
    return(shapiro.test(x)$p.value)
}

ad.test.base <- function(x, na.rm = TRUE)
{
    require(sm)
    require(nortest)
    if (na.rm) x <- na.omit(x)
    x <- sort(x[complete.cases(x)])
    n <- length(x)
    if (n < 8L) return(NA)
    if (are.equal2(x)) return(NA)
    
    return(ad.test(x)$p.value)
}
cvm.test.base <- function(x, na.rm = TRUE)
{
    require(sm)
    require(nortest)
    if (na.rm) x <- na.omit(x)
    if (na.rm) x <- na.omit(x)
    x <- sort(x[complete.cases(x)])
    n <- length(x)
    if (n < 8L) return(NA)
    if (are.equal2(x)) return(NA)
    
    return(cvm.test(x)$p.value)
}
lillie.test.base <- function(x, na.rm = TRUE)
{
    require(sm)
    require(nortest)
    if (na.rm) x <- na.omit(x)
    x <- sort(x[complete.cases(x)])
    n <- length(x)
    if (n < 5L) return(NA)
    if (are.equal2(x)) return(NA)
    
    return(lillie.test(x)$p.value)
}
sf.test.base <- function(x, na.rm = TRUE)
{
    require(sm)
    require(nortest)
    if (na.rm) x <- na.omit(x)
    x <- sort(x[complete.cases(x)])
    n <- length(x)
    if (n < 6L) return(NA)
    if (are.equal2(x)) return(NA)
    
    return(sf.test(x)$p.value)
}

length.base<- function(x, na.rm = TRUE)
{
    
    if (na.rm) x <- na.omit(x)
    x <- sort(x[complete.cases(x)])
    n <- length(x)
    return(n)
}
# ks.test.base <- function(x, na.rm = TRUE)
# {
#     require(stats)
#     if (na.rm) x <- na.omit(x)
#     x <- sort(x[complete.cases(x)])
#     n <- length(x)
#     if (n < 1L) return(NA)
#     if (are.equal2(x)) return(NA)
#     
#     return(ks.test(x)$p.value)
# }

table.tests.normality.inner <- function(df,
                                        shapiro.show = FALSE,
                                        ad.show      = FALSE,
                                        cvm.show     = FALSE,
                                        lillie.show  = FALSE,
                                        sf.show      = FALSE,
                                        ks.show      = FALSE
)
{
    require(plyr)
    require(magrittr)
    
    if (!is.data.frame(df)) {
        warning("argument 'df' is not a data frame: returning NA")
        return(NA_real_)
    }
    
    #create data frame with 0 columns and needed row length
    length.row <- df %>% sapply (mean, na.rm = TRUE) %>% length
    d <- data.frame(x=1:length.row)
    df.res  <- d[, FALSE]
    
    df.res <- cbind(df.res, 'n'  = df %>% sapply(length.base, na.rm = TRUE) %>% round( digits=3))
    
    if (shapiro.show){
        df.res <- cbind(df.res, 'shapiro, p-level'  = df %>% sapply(shapiro.test.base, na.rm = TRUE) %>% round( digits=3))
    }
    if (ad.show){
        df.res <- cbind(df.res, 'ad, p-level'       = df %>% sapply(ad.test.base,      na.rm = TRUE) %>% round( digits=3))
    }
    if (cvm.show){
        df.res <- cbind(df.res, 'cvm, p-level'      = df %>% sapply(cvm.test.base,     na.rm = TRUE) %>% round( digits=3))
    }
    if (lillie.show){
        df.res <- cbind(df.res, 'lillie, p-level'   = df %>% sapply(cvm.test.base,     na.rm = TRUE) %>% round( digits=3))
    }
    if (sf.show){
        df.res <- cbind(df.res, 'sf, p-level'       = df %>% sapply(sf.test.base,      na.rm = TRUE) %>% round( digits=3))
    }
    # if (ks.show){
    #     df.res <- cbind(df.res, 'kolm-smir, p-level'= df %>% sapply(ks.test.base,      na.rm = TRUE) %>% round( digits=3))
    # }
    return(df.res)
}

#test of all columns for normality,
#prints ful results as data frame
table.tests.normality.full <- function(df)
{
    #remove all non numeric columns
    list <- sapply(df,is.numeric)
    df.temp <- df[list]
    #remove all columns with equal values
    list<-!apply(df.temp,2,are.equal)
    df.temp <- df.temp[list]
    #normality test
    res <- table.tests.normality.inner( df.temp,
                                        shapiro.show = TRUE,
                                        ad.show      = TRUE,
                                        cvm.show     = TRUE,
                                        lillie.show  = TRUE,
                                        sf.show      = TRUE
    )
    return(res)
}




#
#  ПРИМЕР
#

## Проверка нормальности распределений

#```{r}
# N-s numeric columns
# id = c(3,5:7,45:55,57,58,60,61,74,75,76:79,86,88:94,96:98)
# 
# data.1 = data[data$'Группа' == 1, ]
# list.normal.columns(data.1[id])
# # calc res table
# table.tests.normality.full(data.1[id])
# res.table = data.1[id] %>% table.tests.normality.full #%>% df.new.rownames(health.colnames[id.s.1]) 
# print(res.table)
# # save to file
# path.data = paste0(path.dir.out, "normality_check_group_1.csv")
# res.table %>% write.csv2(file=path.data)
# 
# data.0 = data[data$'Группа' == 0, ]
# list.normal.columns(data.0[id])
# # calc res table
# res.table = data.0[id] %>% table.tests.normality.full #%>% df.new.rownames(health.colnames[id.s.1]) 
# print(res.table)
# # save to file
# path.data = paste0(path.dir.out, "normality_check_group_0.csv")
# res.table %>% write.csv2(file=path.data)
# ```
# 
