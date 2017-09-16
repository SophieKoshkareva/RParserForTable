Continuous  <- setClass("Continuous", 
  contains = "Column"
)

setGeneric(name = "FindErrors", 
  def = function(theObject, myfile, outliers, misprints)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Continuous",
  definition = function(theObject, myfile, outliers, misprints)
  { 
    unsolved <- FindMisprints(misprints, myfile, theObject)
    FindOutliers(outliers, myfile, theObject, unsolved)
  }
)