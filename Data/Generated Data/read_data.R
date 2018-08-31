library(raster)

hhhh <- raster("hhhh_cv.grd")
<<<<<<< HEAD

# hvhv <- raster("hvhv_cv.grd")
# vvvv <- raster("vvvv_cv.grd")

row_res <- (nrow(hhhh) - 10) / 10
col_res <- (ncol(hhhh) - 10) / 10


result <- array(0, dim = c(row_res, col_res))

row <- 5

for(i in 1:row_res){
  
  col <- 5
  
  for(j in 1:col_res){
    
    block <- getValuesBlock(hhhh, row = row, nrows = 10, col = col, ncols = 10, format = 'matrix')
    
    result[i,j] <- mean(block)
    
    col <- col + 10
    
  }
  
  row <- row + 10
}



#Código Alternativo

parallel_mean <- function(x) localFun(x, x, ngb = 5, fun = function(x){ mean(x) })
beginCluster()
hhhh_mean <- clusterR(hhhh, parallel_mean, filename = "hhhh_mean.grd")
endCluster
=======
hvhv <- raster("hvhv_cv.grd")
vvvv <- raster("vvvv_cv.grd")

nrow <- nrow(hhhh)
ncol <- ncol(hhhh)

bands <- array(0, dim = c(nrow, ncol, 3))

bands[,,1] <- getValuesBlock(hhhh, nrow = 1, nrows = nrow, ncol = 1, ncols = ncol, format = 'matrix')
bands[,,2] <- getValuesBlock(hvhv, nrow = 1, nrows = nrow, ncol = 1, ncols = ncol, format = 'matrix')
bands[,,3] <- getValuesBlock(vvvv, nrow = 1, nrows = nrow, ncol = 1, ncols = ncol, format = 'matrix')
>>>>>>> 8937f9fc7206afa004fd13eb1924496118c0c6dd
