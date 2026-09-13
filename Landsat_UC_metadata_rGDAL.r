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
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Importing data: Landsat OLI/TIRS image for Basoko, Congo (2013):
Landsat_Basoko2013 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Printing the list
list.files()

# Reading in files as SpatialGridDataFrame objects :
BasokoBand1 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B1.TIF")
BasokoBand2 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B2.TIF")
BasokoBand3 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B3.TIF")
BasokoBand4 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B4.TIF")
BasokoBand5 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B5.TIF")
BasokoBand6 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B6.TIF")
BasokoBand7 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B7.TIF")

# Visualizing and checking the class of randon Band
plot(BasokoBand1)
res(BasokoBand1)
class(BasokoBand5)
## [1] "SpatialGridDataFrame"
## attr(,"package")
## [1] "sp"

slotNames(BasokoBand5)
# [1] "data"        "grid"        "bbox"        "proj4string"
summary(BasokoBand5@data)
# Min.   : 6637
# 1st Qu.:14955
# Median :15669
# Mean   :15752
# 3rd Qu.:16579
# Max.   :27433
# NA's   :17221239
# Check the topology of the class
str(BasokoBand5@grid)
#Formal class 'GridTopology' [package "sp"] with 3 slots
# ..@ cellcentre.offset: Named num [1:2] 696300 43500
#  .. ..- attr(*, "names")= chr [1:2] "x" "y"
#  ..@ cellsize         : num [1:2] 30 30
#  ..@ cells.dim        : int [1:2] 7591 7741
# Check up spatial dimention
BasokoBand5@grid@cellcentre.offset
# x      y
# 696300  43500
BasokoBand5@grid@cellsize
# [1] 30 30
BasokoBand5@bbox
#      min    max
# x 696285 924015
# y 43485 275715
BasokoBand5@proj4string

# generating RasterLayers of Landsat bands
BasokoB1 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B1.TIF")
BasokoB2 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B2.TIF")
BasokoB3 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B3.TIF")
BasokoB4 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B4.TIF")
BasokoB5 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B5.TIF")
BasokoB6 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B6.TIF")
BasokoB7 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B7.TIF")
# Creating a facetted stack from the Landsat OLI-TIRS bands:
image <- stack(BasokoB1, BasokoB2, BasokoB3, BasokoB4, BasokoB5, BasokoB6, BasokoB7)
# Visualizing the image with separated bankds:
plot(image)
# Check metadata:
nlayers(image)
res(image)

# Creating the object of RasterLayer class for one random band (here: Band 2)
Basoko2013_B2 <- raster(Landsat_Basoko2013[2])
Basoko2013_B2

# Plotting one randon band
plot(Basoko2013_B2,
     main = "Landsat OLI/TIRS 2013 band 2\nBasoko, central Congo",
     col = gray(0:100 / 100))
