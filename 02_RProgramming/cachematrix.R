## This two function calculates the inverse matrix and caches it if its compute already 
## and return the caches result. In this manner we save computatuional time.

## Function accept an argument, which is matrix, and save it in list under object get.
## Function set new matrix ( manually ), setInverse function which store the inverse matrix,
## and getInverse function which return the inverse if it's calculate already.

makeCacheMatrix <- function(x = matrix()) {
        inverseMatrix <- NULL
        set <- function (y = matrix()){
                x <<- y
                inverseMatrix <<- NULL
        }
        get <- function () {
                x
        }
        setInverse <- function (inverse) {
                inverseMatrix <<- inverse
        }
        getInverse <- function () {
                inverseMatrix
        }
        list (set = set, get = get,
              setInverse = setInverse, 
              getInverse = getInverse)
}


## Function accept more than one argument. Argument x is a list.
## Function examine if inverse is already been computed, if was then return it otherwise
## compute inverse, store it in previous function and return inverse.

cacheSolve <- function(x, ...) {
        inverseMatrix <- x$getInverse() 
        if(!is.null(inverseMatrix)){                    ##check if inverse has been computed
                message('getting cache inverse matrix') ##if was then return computed value
                return(inverseMatrix)                   ##otherwise skip this two line (36,37)
        }
        data <- x$get()                                 ##lines for compute, 
        inverseMatrix <- solve(data, ...)               
        x$setInverse(inverseMatrix)                     ##save and
        inverseMatrix                                   ##return inverse if it has't been computed yet.
        ## Return a matrix that is the inverse of 'x'
}

