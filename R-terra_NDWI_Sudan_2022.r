# Computing vegetation indices
library(terra)
library(RColorBrewer)
library(Hmisc)
library(pals)
#
setwd("/Users/polinalemenkova/Documents/R/52_Image_Processing/Sudan_NDWI")
# Normalized Difference Water Index (NDWI) = (Green-NIR) / (Green+NIR)
# Nir = Band 5, Green = Band 3.
vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}
# For Landsat NIR = 5, red = 4.
filenames <- paste0('LC09_L2SP_173049_20221221_20221224_02_T1_SR_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat
ndwi <- vi(landsat, 5, 3)
options(scipen=10000)
colors <- jet(100)
#colors <- kovesi.linear_bmy_10_95_c78(100)
#colors <- brewer.piyg(100)
#colors <- cubicl(100)
#colors <- cols25(25)
#colors <- polychrome(36)
#colors <- glasbey(36)
#colors <- kelly(22)
#plot(ndvi, col=brewer.pal(100, "jet"), font.main = 1, main = "NDVI for Landsat-8 OLI/TIRS C1 image LC08_L2SP_197050_20131110_20200912_02_T1_SR: Inner Niger Delta, Mali (2013)", cex.main=0.9)
plot(ndwi, col=colors, font.main = 1, main = "NDWI for Landsat-8 OLI/TIRS C1 image LC09_L2SP_173049_20221221_20221224_02_T1_SR_B: \nWhite Nile and Blue Nile confluence, Sudan (2022)", cex.main=0.9)
minor.tick(nx = 10, ny = 10, tick.ratio = 0.3)
# Plotting histogram of the NDVI
hist(ndwi, font.main = 1, main = "NDWI values for Landsat-8 OLI/TIRS C1 image \nLC09_L2SP_173049_20221221_20221224_02_T1_SR_B: White Nile and Blue Nile confluence, Sudan (2022)", xlab = "NDWI", ylab= "Frequency",
    col = "mediumpurple1", xlim = c(-0.5, 1),  breaks = 50, xaxt = "n")
axis(side=1, at = seq(-0.6, 1, 0.1), labels = seq(-0.6, 1, 0.1))
minor.tick(nx = 10, ny = 10, tick.ratio = 0.3)
