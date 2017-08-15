######################################################################
# Create the base Agent class
#
# This is used to represent the most basic agent in a simulation.
Agent <- setClass(
  # Set the name for the class
  "Agent",
  
  # Define the slots
  slots = c(
    location = "numeric",
    velocity = "numeric",
    active   = "logical"
  ),
  
  # Set the default values for the slots. (optional)
  prototype = list(
    location = c(0.0, 0.0),
    active   = TRUE,
    velocity = c(0.0, 0.0)
  ),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity = function(object)
  {
    if(sum(object@velocity^2) > 100.0) {
      return("The velocity level is out of bounds.")
    }
    return(TRUE)
  }
)

a <- Agent()
a

is.object(a)
isS4(a)

slotNames(a)
slotNames("Agent")

getSlots("Agent")
s <- getSlots("Agent")
s[1]
s[[1]]
names(s)

getClass(a)
getClass("Agent")

slot(a,"location")
slot(a,"location") <- c(1, 5)
a

# create a method to assign the value of the location
setGeneric(name = "setLocation",
           def = function(theObject, position)
           {
             standardGeneric("setLocation")
           }
)

setMethod(f = "setLocation",
          signature = "Agent",
          definition = function(theObject, position)
          {
            theObject@location <- position
            validObject(theObject)
            return(theObject)
          }
)

# create a method to get the value of the location
setGeneric(name = "getLocation",
           def = function(theObject)
           {
             standardGeneric("getLocation")
           }
)

setMethod(f = "getLocation",
          signature = "Agent",
          definition = function(theObject)
          {
            return(theObject@location)
          }
)


# create a method to assign the value of active
setGeneric(name = "setActive",
           def = function(theObject,active)
           {
             standardGeneric("setActive")
           }
)

setMethod(f = "setActive",
          signature = "Agent",
          definition = function(theObject,active)
          {
            theObject@active <- active
            validObject(theObject)
            return(theObject)
          }
)

# create a method to get the value of active
setGeneric(name = "getActive",
           def = function(theObject)
           {
             standardGeneric("getActive")
           }
)

setMethod(f = "getActive",
          signature = "Agent",
          definition = function(theObject)
          {
            return(theObject@active)
          }
)


# create a method to assign the value of velocity
setGeneric(name = "setVelocity",
           def = function(theObject,velocity)
           {
             standardGeneric("setVelocity")
           }
)

setMethod(f = "setVelocity",
          signature = "Agent",
          definition = function(theObject,velocity)
          {
            theObject@velocity <- velocity
            validObject(theObject)
            return(theObject)
          }
)

# create a method to get the value of the velocity
setGeneric(name = "getVelocity",
           def = function(theObject)
           {
             standardGeneric("getVelocity")
           }
)

setMethod(f = "getVelocity",
          signature = "Agent",
          definition = function(theObject)
          {
            return(theObject@velocity)
          }
)
