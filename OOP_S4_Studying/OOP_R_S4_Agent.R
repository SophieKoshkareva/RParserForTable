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
getVelocity(a)
a <- setVelocity(a, c(1.0, 2.0))
getVelocity(a)
sum(a@velocity^2)
# error
a <- setVelocity(a, c(10.0, 1.0))
getVelocity(a)

#the idea of overloading functions
# create a method to reset the velocity and the activity
setGeneric(name = "resetActivity",
           def = function(theObject, value)
           {
             standardGeneric("resetActivity")
           }
)

setMethod(f = "resetActivity",
          signature = c("Agent", "logical"),
          definition = function(theObject, value)
          {
            theObject <- setActive(theObject, value)
            theObject <- setVelocity(theObject, c(0.0, 0.0))
            return(theObject)
          }
)

setMethod(f = "resetActivity",
          signature = c("Agent", "numeric"),
          definition = function(theObject, value)
          {
            theObject <- setActive(theObject, TRUE)
            theObject <- setVelocity(theObject, value)
            return(theObject)
          }
)
a <- resetActivity(a, FALSE) 
a
a <- resetActivity(a, c(1, 3)) 
a

#Inheritance
######################################################################
# Create the Prey class
#
# This is used to represent a prey animal
Prey <- setClass(
  # Set the name for the class
  "Prey",
  
  # Define the slots - in this case it is empty...
  slots = character(0),
  
  # Set the default values for the slots. (optional)
  prototype = list(),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity = function(object)
  {
    if(sum(object@velocity ^ 2) > 70.0) {
      return("The velocity level is out of bounds.")
    }
    return(TRUE)
  },
  
  # Set the inheritance for this class
  contains = "Agent"
)



######################################################################
# Create the Bobcat class
#
# This is used to represent a smaller predator
Bobcat <- setClass(
  # Set the name for the class
  "Bobcat",
  
  # Define the slots - in this case it is empty...
  slots = character(0),
  
  # Set the default values for the slots. (optional)
  prototype = list(),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity = function(object)
  {
    if(sum(object@velocity ^ 2) > 85.0) {
      return("The velocity level is out of bounds.")
    }
    return(TRUE)
  },
  
  # Set the inheritance for this class
  contains = "Agent"
)


######################################################################
# Create the Lynx class
#
# This is used to represent a larger predator
Lynx <- setClass(
  # Set the name for the class
  "Lynx",
  
  # Define the slots - in this case it is empty...
  slots = character(0),
  
  # Set the default values for the slots. (optional)
  prototype = list(),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity = function(object)
  {
    if(sum(object@velocity ^ 2) > 95.0) {
      return("The velocity level is out of bounds.")
    }
    return(TRUE)
  },
  
  # Set the inheritance for this class
  contains = "Bobcat"
)


# create a method to move the agent.
setGeneric(name = "move",
           def = function(theObject)
           {
             standardGeneric("move")
           }
)

setMethod(f = "move",
          signature = "Agent",
          definition = function(theObject)
          {
            print("Move this Agent dude")
            theObject <- setVelocity(theObject, c(1, 2))
            validObject(theObject)
            return(theObject)
          }
)

setMethod(f = "move",
          signature = "Prey",
          definition = function(theObject)
          {
            print("Check this Prey before moving this dude")
            theObject <- callNextMethod(theObject)
            print("Move this Prey dude")
            validObject(theObject)
            return(theObject)
          }
)

setMethod(f = "move",
          signature = "Bobcat",
          definition = function(theObject)
          {
            print("Check this Bobcat before moving this dude")
            theObject <- setLocation(theObject, c(2, 3))
            theObject <- callNextMethod(theObject)
            print("Move this Bobcat dude")
            validObject(theObject)
            return(theObject)
          }
)

setMethod(f = "move",
          signature = "Lynx",
          definition=function(theObject)
          {
            print("Check this Lynx before moving this dude")
            theObject <- setActive(theObject, FALSE)
            theObject <- callNextMethod(theObject)
            print("Move this Lynx dude")
            validObject(theObject)
            return(theObject)
          }
)

robert <- Bobcat()
robert
robert <- move(robert)
robert

lionel <- Lynx()
lionel
lionel <- move(lionel)
lionel
mirra <- Prey()
