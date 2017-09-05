######################################################################
# Create the first quadrant class
#
# This is used to represent a coordinate in the first quadrant.
FirstQuadrant <- setClass(
  # Set the name for the class
  "FirstQuadrant",
  
  # Define the slots
  slots = c(
    x = "numeric",
    y = "numeric"
  ),
  
  # Set the default values for the slots. (optional)
  prototype=list(
    x = 0.0,
    y = 0.0
  ),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity=function(object)
  {
    if((object@x < 0) || (object@y < 0)) {
      return("A negative number for one of the coordinates was given.")
    }
    return(TRUE)
  }
)



x <- FirstQuadrant()
x

y <- FirstQuadrant(x = 5, y = 7)
y

y@x
y@y

x@x
x@y

z <- FirstQuadrant(x = 3, y = -2)

# create a method to assign the value of a coordinate
setGeneric(name = "setCoordinate",
           def = function(theObject, xVal, yVal)
           {
             standardGeneric("setCoordinate")
           }
)

setMethod(f = "setCoordinate",
          signature = "FirstQuadrant",
          definition = function(theObject, xVal, yVal)
          {
            theObject@x <- xVal
            theObject@y <- yVal
            return(theObject)
          }
)

z <- FirstQuadrant(x = 2.5, y = 10)
z 

z <- setCoordinate(z,-3.0,-5.0)
z
