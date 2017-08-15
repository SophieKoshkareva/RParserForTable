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
  slots = c(
    R = "numeric"
  ),
  
  validity = function(object){
    if(object@R <= 0){ 
        return("A negative number for one of the coordinates was given.")
      }
      return(TRUE)
    },
  contains = "Shapes"
  
)

Rectangle <- setClass(
  "Rectangle",
  slots = c(
    width = "numeric",
    height = "numeric"
  ),
  validity = function(object){
    if((object@width <= 0) || (object@height <= 0)) { 
      return("A negative number is given for one of the sizes.")
    }
    return(TRUE)
  },
  contains = "Shapes"
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
 
setMethod(f ="getCoordinate",
          signature = "Circle",
          definition = function(theObject)
          {
            theObject <- callNextMethod(theObject)
            return(c(theObject@x, theObject@y, theObject@R))
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
# russianCircles <- Circle()
# russianCircles
# bigrectangle <- Rectangle()
# bigrectangle
# setCoordinate(russianCircles, 1, 2, 3)
# setCoordinate(russianCircles, 1, 2, 3)
# 
