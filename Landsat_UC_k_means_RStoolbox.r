#library(rgdal)
library(raster)
#library(terra)
library(RColorBrewer)
library(RStoolbox)
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Reading in Landsat OLI/TIRS files for Basoko, Congo
Landsat_Basoko2013 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Printing the list
list.files()

# Creating the object of RasterLayer class for one random band
Basoko2013_B2 <- raster(Landsat_Basoko2013[2])
Basoko2013_B2

# Plotting one randon band
plot(Basoko2013_B2,
     main = "Landsat OLI/TIRS 2013 band 2\nBasoko, central Congo",
     col = gray(0:100 / 100))

# Stacking the data to create a RasterStack. A RasterStack is a collection of RasterLayer objects (layers of selected bands) with the same spatial extent and resolution. A RasterStack can be created from RasterLayer objects, or from raster files
Landsat_Basoko2013_stack <- stack(Landsat_Basoko2013)
# Turning a stack into a brick. RasterBrick is a multi-layer raster object created from the multi-layer file(s) (bands). RasterBrick is similar to a RasterStack (that can be created with stack), but processing time is shorter for RasterBrick. RasterBrick is less flexible as it can only point to a single file.
Landsat_Basoko2013_brick <- brick(Landsat_Basoko2013_stack)
Landsat_Basoko2013_brick <- brick(Basoko2013_B2)
# Viewing brick attributes
Landsat_Basoko2013_brick

# Plotting RGB triplet from RasterBrick
olpar <- par(no.readonly = TRUE) # back-up par
#par(mfrow=c(1,2))
par(mfrow=c(1,1))
plotRGB(Landsat_Basoko2013_brick)

## Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Basoko2013_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC

# Creating color palette, e.g., colors <- rainbow(10)
colors <- brewer.pal(10, "Paired")
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Basoko, Congo  \nLC08_L1TP_177059_20131216_20200912_02_T1 (2013)", font.main=2, cex.main = 0.95, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend("topleft", legend=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)
