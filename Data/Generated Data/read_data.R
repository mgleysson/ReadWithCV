library(raster)

hhhh <- raster("hhhh_cv.grd")
hvhv <- raster("hvhv_cv.grd")
vvvv <- raster("vvvv_cv.grd")

nrow <- nrow(hhhh)
ncol <- ncol(hhhh)

bands <- array(0, dim = c(nrow, ncol, 3))

bands[,,1] <- getValuesBlock(hhhh, nrow = 1, nrows = nrow, ncol = 1, ncols = ncol, format = 'matrix')
bands[,,2] <- getValuesBlock(hvhv, nrow = 1, nrows = nrow, ncol = 1, ncols = ncol, format = 'matrix')
bands[,,3] <- getValuesBlock(vvvv, nrow = 1, nrows = nrow, ncol = 1, ncols = ncol, format = 'matrix')
