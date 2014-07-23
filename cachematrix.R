## makeVector.R from Programming Assignment 2

## makeVector <- function(x = numeric()) {
## 	m <- NULL
## 	set <- function(y) {
## 		x <<- y
## 		m <<- NULL
## 	}
## 	get <- function() x
## 	setmean <- function(mean) m <<- mean
## 	getmean <- function() m
## 	list(set = set, get = get,
## 		setmean = setmean,
## 		getmean = getmean)
## }

## Similar function to get inverse of a matrix
makeCacheMatrix <- function(x=matrix()) {
	## invrs will stored the cached inverse of matrix
	invrs <- NULL

	## Setter for matrix
	set <- function(y) {
		x <<- y
		invrs <<- NULL
	}

	## Getter for matrix
	get <- function() x

	## Setter for inverse
	setinverse <- function(inverse) invrs <<- inverse

	## Getter for inverse
	getinverse <- function() invrs

	## Return matrix with defined functions
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cachemean.R from Programming Assignment 2

## cachemean <- function(x, ...) {
## 	m <- x$getmean()
## 	if(!is.null(m)) {
## 		message("getting cached data")
## 		return(m)
## 	}
## 	data <- x$get()
## 	m <- mean(data, ...)
## 	x$setmean(m)
## 	m
## }

## Similar function to get cached inverse of a matrix
cacheSolve <- function(x=matrix(), ...) {
	invrs <- x$getinverse()

	## If getter is not null, return data from cache
        if(!is.null(invrs)) {
                message("Cached data available")
                return(invrs)
        }

	## Null data, calculate inverse of matrix
        matrx <- x$get()
        invrs <- solve(matrx, ...)

	## Setter to cache inverse
        x$setinverse(invrs)

	## Return inverse
        invrs
}

