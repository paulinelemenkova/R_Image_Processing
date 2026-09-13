# ============================================================================
# Landsat image classification and NDVI in R, Congo River Basin (Basoko /
# Kisangani), Democratic Republic of the Congo.
# Code from the peer-reviewed article:
#   Lemenkova, P.; Debeir, O. (2022). R Libraries for Remote Sensing Data
#   Classification by k-means Clustering and NDVI Computation in Congo River
#   Basin, DRC. Applied Sciences, 12(24), 12554.
#   DOI:    https://doi.org/10.3390/app122412554
#   Zenodo: https://doi.org/10.5281/zenodo.7426773
#
# Authors: Polina Lemenkova, Olivier Debeir  |  ORCID: 0000-0002-5759-1089
# ============================================================================

library(rgdal)
library(raster)
library(terra)
library(RColorBrewer)
library(viridis)
library("viridisLite")
library(pals)
library(colorspace)
library(RStoolbox)
library(graphics)

#-------------------- 3. Kisangani-2022-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20220217_20220302_02_T1")
# Importing data
Landsat_Kisangani2022 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20220217_20220302_02_T1")
# Printing the list
list.files()

vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}
# plot NDVI. For Landsat NIR = 5, red = 4.
filenames <- paste0('LC08_L1TP_176060_20220217_20220302_02_T1_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat
ndvi <- vi(landsat, 5, 4)
# colors <- jet(100)
colors <- stepped(10)
plot(ndvi, col=colors, font.main = 1, main = "NDVI for Landsat-9 OLI/TIRS C1 image LC08_L1TP_176060_20220217_20220302_02_T1_B: Kissangani, Congo DC (2022)", cex.main=0.95, axes = FALSE, box = FALSE, legend = FALSE)
legend(, x = "topleft", inset = 0.13, legend=c("0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1.0"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- 3. Kisangani-2013-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20130413_20200913_02_T1")
# Importing data
Landsat_Kisangani2022 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20130413_20200913_02_T1")
# Printing the list
list.files()

vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}
# plot NDVI. For Landsat NIR = 5, red = 4.
filenames <- paste0('LC08_L1TP_176060_20130413_20200913_02_T1_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat
ndvi <- vi(landsat, 5, 4)
# colors <- jet(100)
colors <- stepped(10)
plot(ndvi, col=colors, font.main = 1, main = "NDVI for Landsat-9 OLI/TIRS C1 image LC08_L1TP_176060_20130413_20200913_02_T1: Kissangani, Congo DC (2013)", cex.main=0.95, axes = FALSE, box = FALSE, legend = FALSE)
legend(, x = "topleft", inset = 0.13, legend=c("0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1.0"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

# Plotting histogram of the NDVI
#hist(ndvi, font.main = 1, main = "NDVI values for Landsat-8 OLI/TIRS C1 image \n LC08_L1TP_176060_20220217_20220302_02_T1_B, Kissangani, Congo DC (2022)", xlab = "NDVI", ylab= "Frequency",
 #   col = "darkolivegreen1", xlim = c(-0.2, 0.7),  breaks = 30, xaxt = "n")
#axis(side=1, at = seq(-0.6, 1, 0.1), labels = seq(-0.6, 1, 0.1))

#-------------------- 3. Bumba-2013-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20131223_20200912_02_T1")
# Importing data
filenames <- paste0('LC08_L1TP_178058_20131223_20200912_02_T1_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat

vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}
# plot NDVI. For Landsat NIR = 5, red = 4.
ndvi <- vi(landsat, 5, 4)
# colors <- jet(100)
# colors <- kovesi.diverging_gwr_55_95_c38(10)
# colors <- kovesi.linear_gow_65_90_c35(10)
colors <- brewer.pal(10, "Spectral")
# colors <- stepped(10)
plot(ndvi, col=colors, font.main = 1, main = "NDVI for Landsat-9 OLI/TIRS C1 image LC08_L1TP_178058_20131223_20200912_02_T1: Bumba, Congo DC (2013)", cex.main=0.95, axes = FALSE, legend = FALSE)
legend(, x = "topleft", inset = 0.13, legend=c("0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1.0"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- 3. Bumba-2022-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20220130_20220204_02_T1")
# Importing data
filenames <- paste0('LC08_L1TP_178058_20220130_20220204_02_T1_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat

vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}
# plot NDVI. For Landsat NIR = 5, red = 4.
ndvi <- vi(landsat, 5, 4)
# colors <- jet(100)
# colors <- kovesi.diverging_gwr_55_95_c38(10)
# colors <- kovesi.linear_gow_65_90_c35(10)
colors <- brewer.pal(10, "Spectral")
# colors <- stepped(10)
plot(ndvi, col=colors, font.main = 1, main = "NDVI for Landsat-9 OLI/TIRS C1 image LC08_L1TP_178058_20220130_20220204_02_T1: Bumba, Congo DC (2022)", cex.main=0.95, axes = FALSE, legend = FALSE)
legend(, x = "topleft", inset = 0.13, legend=c("0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1.0"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- 3. Basoko-2013-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Importing data
filenames <- paste0('LC08_L1TP_177059_20131216_20200912_02_T1_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat

vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}
# plot NDVI. For Landsat NIR = 5, red = 4.
ndvi <- vi(landsat, 5, 4)
# colors <- jet(100)
# colors <- kovesi.diverging_gwr_55_95_c38(10)
# colors <- kovesi.linear_gow_65_90_c35(10)
colors <- brewer.pal(10, "RdYlGn")
# colors <- stepped(10)
plot(ndvi, col=colors, font.main = 1, main = "NDVI for Landsat-9 OLI/TIRS C1 image LC08_L1TP_177059_20131216_20200912_02_T1: Basoko, Congo DC (2013)", cex.main=0.95, axes = FALSE, legend = FALSE)
legend(, x = "topleft", inset = 0.13, legend=c("0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1.0"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- 3. Basoko-2022-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20220208_20220212_02_T1")
# Importing data
filenames <- paste0('LC08_L1TP_177059_20220208_20220212_02_T1_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat

vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}
# plot NDVI. For Landsat NIR = 5, red = 4.
ndvi <- vi(landsat, 5, 4)
# colors <- jet(100)
# colors <- kovesi.diverging_gwr_55_95_c38(10)
# colors <- kovesi.linear_gow_65_90_c35(10)
colors <- brewer.pal(10, "RdYlGn")
# colors <- stepped(10)
plot(ndvi, col=colors, font.main = 1, main = "NDVI for Landsat-9 OLI/TIRS C1 image LC08_L1TP_177059_20220208_20220212_02_T1_B3.TIF: Basoko, Congo DC (2022)", cex.main=0.95, axes = FALSE, legend = FALSE)
legend(, x = "topleft", inset = 0.13, legend=c("0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1.0"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)
