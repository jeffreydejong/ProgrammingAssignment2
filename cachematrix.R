
## This R script was written to complete assignment 2 in the
## coursera course on "Introduction to the R language
##
##  Brief Summary of code : finds the inverse of a predefined matrix 
##
##   Written by : Jeffrey de Jong
##   Written on : 24 May, 2014



## This script consists of 2 functions makeCacheMatrix and cacheSolve (see below for description)
## Example call  >   zz<-makeCacheMatrix(matrix(c(1:4),2,2))  ## creates a matrix and associated list object
##               >   cacheSolve(zz)                           ## finds the inverse of the above matrix
##               output is a matrix object which is the inversion of the original matrix
##               note:  cacheSolve(zz)%*%zz$get() returns the unit matrix (so good does work)

##  makeCacheMatrix : Takes a matrix as input, and outputs a list object containing functions 
##                    to get/set the original matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL           ## set solution equal to 0
        set <- function(y) { ## define the set function 
                x <<- y      ## redefine base matrix
                m <<- NULL   ## matrix has been redefined so we need to set existing solution to NULL
        }
        get <- function() x  ## define get function : return the matrix associated with the list object
        setinverted <- function(inverted) m <<- inverted  # define setinverted function by passing the solution
        getinverted <- function() m                        # define the getinverted function(returns inverse value)
        list(set = set, get = get,                         # return list object
             setinverted = setinverted,
             getinverted = getinverted)
}



##  cacheSolve      : Takes as input the list object generated by makeCacheMatrix
##                    and returns the inverted matrix associated with the list. If
##                    said inversion exists it returns the stored value otherwise
##                    calculates it explicitly and returns the calculated value


cacheSolve <- function(x, ...) {
        m <- x$getinverted()
        if(!is.null(m)) { ## inverted matrix exists, so lets return it
                message("getting cached data")
                return(m)
        }
        ## lets retrieve the matrix currently in the list
        CurrentMatrix <- x$get()
        ## lets find the inversion of the matrix
        m <- solve(CurrentMatrix, ...)
        ## once calculated now we need to set it in the list object
        x$setinverted(m)
        ## return the inverted matrix
        m
}


