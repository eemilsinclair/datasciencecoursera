##########################################################################
## Coursera/JHU - Data Science Specialization
## R Programming
##
## Assignment 02: Lexical Scoping
## Caching the Inverse of a Matrix
##########################################################################

## This function caches the inverse matrix and 
## defines accessors for internal variables.
makeCacheMatrix <- function(x = matrix()) {
 
  #Init inverse matrix as null
  inv <- NULL
  
  #Setter for input matrix
  set <- function(mtx){
    x <<- mtx
    inv <- NULL
  }
  
  #Getter for input matrix
  get <- function() x
  
  #Setter for inverse matrix
  setinv <- function(invMtx) inv <<- invMtx
  
  #Getter for inverse matrix
  getinv <- function() inv
  
  #Create functions matrix
  list(set=set, get=get, setinv=setinv, getinv = getinv)
  
}

## This functions returns the matrix from cache.
## If not cached, calculate the inverse.
cacheSolve <- function(x, ...) {
  
  ## Get a matrix that is the inverse of 'x'.
  invMat <- x$getinv()
  
  #If exists in cache, return cached data.
  if(!is.null(invMat)){
    message("Getting cached data...")
    return(invMat)
  }
  
  #If not in cache, calculate inverse matrix.
  data <- x$get()
  m <- solve(data, ...)
  
  #Set the inverse matrix.
  x$setinv(m)
  
  #return inverse matrix.
  m
        
}
