Shapes <- setClass(
  "Shapes",
  slots = c(
    x = "numeric",
    y = "numeric"),
  prototype = list(
    x = 0.0,
    y = 0.0)
)

Circle <- setClass(
  "Circle",
  contains = "Shapes",
  slots = c(R = "numeric"),
  prototype = list(R = 1),
  
  validity = function(object){
    if(object@R <= 0){ 
        return("A negative number for radius was given.")
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
  prototype = list(
    width = 0.1,
    height = 0.1),
  
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
              standardGeneric("setRadius")
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

setGeneric(name = "getRadius",
           def = function(theObject)
           {
             standardGeneric("getRadius")
           }
)

setMethod(f ="getRadius",
          signature = "Circle",
          definition = function(theObject)
          {
            return(theObject@R)
          }  
)

setGeneric(name = "setConfigureCircle",
           def = function(theObject, xVal, yVal, RVal)
           {
              standardGeneric("setConfigureCircle")
           }   
)

setMethod(f = "setConfigureCircle",
          signature = "Circle",
          definition = function(theObject, xVal, yVal, RVal)
          {
            theObject <- setCoordinate(theObject, xVal, yVal)
            theObject <- setRadius(theObject, RVal)
            return(theObject)
          }
)

setGeneric(name = "getConfigureCircle",
           def = function(theObject)
           {
             standardGeneric("getConfigureCircle")
           }   
)

setMethod(f = "getConfigureCircle",
          signature = "Circle",
          definition = function(theObject)
            {
            coordinates <- getCoordinate(theObject)
            radius <- getRadius(theObject)
            return(c(coordinates, radius))
          }
)

setGeneric(name = "setSizes",
           def = function(theObject, wVal, hVal)
           {
             standardGeneric("setSizes")
           }
)

setMethod(f ="setSizes",
          signature = "Rectangle",
          definition = function(theObject, wVal, hVal)
          {
            theObject@width <- wVal
            theObject@height <- hVal
            validObject(theObject)
            return(theObject)
          }  
)

setGeneric(name = "getSizes",
           def = function(theObject)
           {
             standardGeneric("getSizes")
           }
)

setMethod(f ="getSizes",
          signature = "Rectangle",
          definition = function(theObject)
          {
            return(c(theObject@width, theObject@height))
          }  
)

setGeneric(name = "setConfigureRec",
           def = function(theObject, xVal, yVal, wVal, hVal)
           {
             standardGeneric("setConfigureRec")
           }
)

setMethod(f = "setConfigureRec",
          signature = "Rectangle",
          definition = function(theObject, xVal, yVal, wVal, hVal)
          {
            theObject <- setCoordinate(theObject, xVal, yVal)
            theObject <- setSizes(theObject, wVal, hVal)
            return(theObject)
          }
)

setGeneric(name = "getConfigureRec",
           def = function(theObject)
           {
             standardGeneric("getConfigureRec")
           }
)

setMethod(f = "getConfigureRec",
          signature = "Rectangle",
          definition = function(theObject)
          {
            coordinates <- getCoordinate(theObject)
            sizes <- getSizes(theObject)
            return(c(coordinates,sizes))
          }
)

setGeneric(name = "Draw",
           def = function(theObject)
           {
             standardGeneric("Draw")
           }
)
setMethod(f = "Draw",
          signature = "Shapes",
          definition = function(theObject)
          { coordinates <- getCoordinate(theObject)
            cat("I draw a shape with coordinates x and y: ", coordinates)
          }
)

setMethod(f = "Draw",
          signature = "Circle",
          definition = function(theObject)
          { radius <- getRadius(theObject)
            theObject <- callNextMethod(theObject)
            cat("\n", "This shape is circle with radius: ", radius)
          }
)

setMethod(f = "Draw",
          signature = "Rectangle",
          definition = function(theObject)
          { sizes <- getSizes(theObject)
            theObject <- callNextMethod(theObject)
            cat("\n", "This shape is rectangle with sizes: ", sizes)
          }
)

russianCircles <- Circle()

myrec <- Rectangle()

