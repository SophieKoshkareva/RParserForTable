Shapes <- setClass(
  "Shapes",
  slots = c(
    x = "numeric",
    y = "numeric"
  )
  
  #prototype = list()
)

Circle <- setClass(
  "Circle",
  contains = "Shapes",
  slots = c(
    R = "numeric"
  ),
  
  validity = function(object){
    if(object@R <= 0){ 
        return("A negative number for one of the coordinates was given.")
      }
      return(TRUE)
    }
)

Rectangle <- setClass(
  "Rectangle",
  contains = "Shapes",
  slots = c(
    width = "numeric",
    height = "numeric"
  ),
  validity = function(object){
    if((object@width <= 0) || (object@height <= 0)) { 
      return("A negative number is given for one of the sizes.")
    }
    return(TRUE)
  }
)

setGeneric(name = "setCoordinate",
           def = function(theObject, xCoord, yCoord)
             {
                standardGeneric("setCoordinate")
             }
)

setMethod(f = "setCoordinate",
          signature = "Shapes",
          definition = function(theObject, xCoord, yCoord)
          {
            theObject@x <- xCoord
            theObject@y <- yCoord
            return(theObject)
          }
)


setGeneric(name = "getCoordinate",
           def = function(theObject)
             {
             standardGeneric("getCoordinate")
             }
)

setMethod(f = "getCoordinate",
          signature = "Shapes", 
          definition = function(theObject)
          {
            return(c(theObject@x, theObject@y)) 
          }
)
 
setGeneric(name = "setRadius",
           def = function(theObject, RVal)
           {
              standardGeneric("getCoordinate")
           }
)

setMethod(f ="setRadius",
          signature = "Circle",
          definition = function(theObject, RVal)
          {
            theObject@R <- RVal
            validObject(theObject)
            return(theObject)
          }  
)

setGeneric(name = "configureCircle",
           def = function(theObject, xval, yVal, RVal)
           {
              standardGeneric("configureCircle")
           }   
)

setMethod(f = "configureCircle",
          signature = "Circle",
          definition = function(theObject, xval, yVal, RVal)
          {
            theObject <- setCoordinate(theObject, xVal, yVal)
            theObject <- setRadius(theObject, RVal)
            return(theObject)
          }
)

# setGeneric(name = "Draw",
#            def = function(theObject, RVal)
#            {
#              standardGeneric("Draw")
#            }
# )
# setMethod(f = "Draw",
#           signature = "Circle",
#           definition = function(theObject, RVal)
#           {
#             theObject@R <- RVal
#             validObject(theObject)
#             cat("I draw a circle with radius", RVal )
#           } 
# )
 russianCircles <- Circle()
# russianCircles
# bigrectangle <- Rectangle()
# bigrectangle
# setCoordinate(russianCircles, 1, 2, 3)
# setCoordinate(russianCircles, 1, 2, 3)
# 
