## Two functions that will cache the inverse of a special object "matrix"
## The first creates a list that acts as the cache
## The second will populate the cached matrix or return it if already populated

## This function creates a list that can hold the inverse of the given matrix

makeCacheMatrix <- function(x = matrix()) {
  
  inverseMatrix <- NULL
  
  set <- function(y) {
    
    x <<- y
    inverseMatrix <<- NULL
  }
  get <- function()x 
  setInverse <- function(inverse) inverseMatrix <<- inverse
  getInverse <- function()inverseMatrix
  list <- list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
  
}


## This function will return the inverse of the matrix by doing the calculation or returning the cached matrix

cacheSolve <- function(x, ...) {
  
  inverseMatrix<-x$getInverse()
  
  
  if(!is.null(inverseMatrix)) {
    print("Inverted matrix is cached...") 
    return(inverseMatrix)
  }
  
  data <- x$get()
  inverseMatrix <- solve(data)
  x$setInverse(inverseMatrix)
  inverseMatrix
  
}