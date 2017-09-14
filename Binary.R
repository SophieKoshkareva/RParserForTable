Binary <- setClass("Binary", 
                    contains = "Discrete",
                    prototype = prototype (value = list("Zero" = list(0),
                                     "One" = list(1)))
                    
)
#!!!!! contains = "Column"

# setMethod(f = "initialize",
#           signature = "Binary",
#           definition = function(.Object)
#           { 
#             
#             .Object@value[["Zero"]] <- list(0)
#             .Object@value[["One"]]<- list(1)
#             return(.Object)
#           }
# )

setGeneric(name = "FindErrors", 
           def = function(theObject, myfile, misprints)
           {
             standardGeneric("FindErrors")
           }
)

setMethod(f = "FindErrors",
          signature = "Binary",
          definition = function(theObject, myfile, misprints)
          { 
            FindMisprints(misprints, myfile, theObject)
          }
)