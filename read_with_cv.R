library(raster)
library(png)

hhhh <- raster("hhhh.grd")
hvhv <- raster("hvhv.grd")
vvvv <- raster("vvvv.grd")
# 
# hhhh <- raster("HHHH.grd")
# hvhv <- raster("HVHV.grd")
# vvvv <- raster("VVVV.grd")

hhhh <- raster(getValuesBlock(hhhh, nrow = 1, nrows = 1000, ncol = 1, ncols = 1000, format = 'matrix'))
hvhv <- raster(getValuesBlock(hvhv, nrow = 1, nrows = 1000, ncol = 1, ncols = 1000, format = 'matrix'))
vvvv <- raster(getValuesBlock(vvvv, nrow = 1, nrows = 1000, ncol = 1, ncols = 1000, format = 'matrix'))


my_cv <- function(x, y) return (sd(x)/mean(x))

# hhhh_cv <- localFun(hhhh, hhhh, ngb = 3, fun = my_cv, filename = "hhhh_cv.grd")
# hvhv_cv <- localFun(hvhv, hvhv, ngb = 3, fun = my_cv, filename = "hvhv_cv.grd")
# vvvv_cv <- localFun(vvvv, vvvv, ngb = 3, fun = my_cv, filename = "vvvv_cv.grd")

hhhh_cv <- localFun(hhhh, hhhh, ngb = 3, fun = my_cv)
hvhv_cv <- localFun(hvhv, hvhv, ngb = 3, fun = my_cv)
vvvv_cv <- localFun(vvvv, vvvv, ngb = 3, fun = my_cv)


nrow <- nrow(hhhh_cv)
ncol <- ncol(hhhh_cv)

nrow <- 1000
ncol <- 1000

matrix_cv <- array(0, dim = c(nrow, ncol, 3))

matrix_cv[,,1] <- getValuesBlock(hhhh_cv, nrow = 1, nrows = nrow, ncol = 1, ncols = ncol, format = 'matrix')
matrix_cv[,,2] <- getValuesBlock(hvhv_cv, nrow = 1, nrows = nrow, ncol = 1, ncols = ncol, format = 'matrix')
matrix_cv[,,3] <- getValuesBlock(vvvv_cv, nrow = 1, nrows = nrow, ncol = 1, ncols = ncol, format = 'matrix')

writePNG(matrix_cv, target = "image.png")
