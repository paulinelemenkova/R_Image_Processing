library(rgdal)
library(raster)
library(RColorBrewer)
library(RStoolbox)
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Importing data: Landsat OLI/TIRS image for Basoko, Congo (2013):
Landsat_Basoko2013 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Printing the list
list.files()

# Reading in files as SpatialGridDataFrame objects :
Band1 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B1.TIF")
Band2 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B2.TIF")
Band3 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B3.TIF")
Band4 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B4.TIF")
Band5 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B5.TIF")
Band6 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B6.TIF")
Band7 <- readGDAL("LC08_L1TP_177059_20131216_20200912_02_T1_B7.TIF")

# Visualizing and checking the class of randon Band
plot(Band1)
res(Band1)
class(Band5)
## [1] "SpatialGridDataFrame"
## attr(,"package")
## [1] "sp"

slotNames(Band5)
# [1] "data"        "grid"        "bbox"        "proj4string"
summary(Band5@data)
# Min.   : 6637
# 1st Qu.:14955
# Median :15669
# Mean   :15752
# 3rd Qu.:16579
# Max.   :27433
# NA's   :17221239
# Check the topology of the class
str(Band5@grid)
#Formal class 'GridTopology' [package "sp"] with 3 slots
# ..@ cellcentre.offset: Named num [1:2] 696300 43500
#  .. ..- attr(*, "names")= chr [1:2] "x" "y"
#  ..@ cellsize         : num [1:2] 30 30
#  ..@ cells.dim        : int [1:2] 7591 7741
# Check up spatial dimention
Band5@grid@cellcentre.offset
# x      y
# 696300  43500
Band5@grid@cellsize
# [1] 30 30
Band5@bbox
#      min    max
# x 696285 924015
# y 43485 275715
Band5@proj4string

# generating RasterLayers of Landsat bands
B1 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B1.TIF")
B2 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B2.TIF")
B3 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B3.TIF")
B4 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B4.TIF")
B5 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B5.TIF")
B6 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B6.TIF")
B7 <- raster("LC08_L1TP_177059_20131216_20200912_02_T1_B7.TIF")
# Creating a facetted stack from the Landsat OLI-TIRS bands:
image <- stack(B1, B2, B3, B4, B5, B6, B7)
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
