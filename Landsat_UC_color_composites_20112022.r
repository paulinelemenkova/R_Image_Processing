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

#-----------------------------------
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20150113_20200910_02_T1")
# Importing data
Landsat_Kisangani2015 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20150113_20200910_02_T1")
# Printing the list
list.files()

# creating SpatRaster object
landsat <- rast(Landsat_Kisangani2015)
# check properties
landsat
# creating RGB triplets from the SpatRaster object (here: "landsatRGB") to generate a raster data structure with a lon/lat CRS and 1*1 degree cells.

landsatRGB <- landsat[[c(((5+7)/6),(4/1),((6+9)/8))]]
landsatRGB <- landsat[[c((4/3),(2/1),(6/4))]]
landsatRGB <- landsat[[c(((5+2)/3),(3/1),((6+1)/7))]]
landsatRGB <- landsat[[c((3/5),(1/2),(6/3))]]

landsatRGB <- landsat[[c(4,3,2)]]
landsatRGB <- landsat[[c(2,3,4)]]
# check up metadata
landsatRGB
plotRGB(landsatRGB, r=1, g=2, b=3, axes=FALSE, stretch="lin")
# spatial extent is 168285, 393615, -109815, 109215  (xmin, xmax, ymin, ymax)
landsatFCC <- landsat[[c(5,4,3)]]
landsatFCC <- landsat[[c(3,4,5)]]
plotRGB(landsatFCC, r=1, g=2, b=3, axes=FALSE, stretch="lin")
colors <- kovesi.cyclic_mrybm_35_75_c68_s25(100)
plot(landsatRGB, col=colors, font.main = 1, main = "NDVI for Landsat-9 OLI/TIRS C1 image LC08_L1TP_177059_20131216_20200912_02_T1_B: Basoko, central Congo", cex.main=0.9, axes=FALSE)

#-----------------------------------
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20131223_20200912_02_T1")
# Importing data
Landsat_Bumba2013 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20131223_20200912_02_T1")
# Printing the list
list.files()
# creating SpatRaster object
landsat <- rast(Landsat_Bumba2013)
# check properties
landsat
landsatRGB <- landsat[[c(4,3,2)]]
landsatRGB <- landsat[[c(2,3,4)]]
# check up metadata
landsatRGB
plotRGB(landsatRGB, r=1, g=2, b=3, axes=FALSE, stretch="lin")
# spatial extent is 168285, 393615, -109815, 109215  (xmin, xmax, ymin, ymax)
landsatFCC <- landsat[[c(5,4,3)]]
landsatFCC <- landsat[[c(3,4,5)]]
plotRGB(landsatFCC, r=1, g=2, b=3, axes=FALSE, stretch="lin")
colors <- kovesi.cyclic_mrybm_35_75_c68_s25(100)
plot(landsatRGB, col=colors, font.main = 1, main = "NDVI for Landsat-9 OLI/TIRS C1 image LC08_L1TP_177059_20131216_20200912_02_T1_B: Basoko, central Congo", cex.main=0.9, axes=FALSE)
